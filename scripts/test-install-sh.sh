#!/usr/bin/env bash
# 回归测试：install.sh 的 JSON 解析器选择与失败传播
#
# 背景：Windows 上 python3 常是 Microsoft Store 的占位程序，它忽略所有参数、
# 把 "Python was not found..." 打到 stdout 并以 exit 0 结束。旧版 install.sh
# 依赖 python3 解析 plugins.json，在这种环境下会静默失败、以空 spec 调用
# `dsh plugin add`，然后仍然打印「安装完成」并 exit 0。
#
# 本测试不需要网络，也不会真的安装插件（用假的 npx 拦截）。
#
# 用法：bash scripts/test-install-sh.sh
set -uo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
INSTALL_SH="$REPO_ROOT/install.sh"
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

PASS=0
FAIL=0
check() { # $1=name $2=actual $3=expected
  if [[ "$2" == "$3" ]]; then
    echo "  ok   $1"
    PASS=$(( PASS + 1 ))
  else
    echo "  FAIL $1: expected [$3], got [$2]"
    FAIL=$(( FAIL + 1 ))
  fi
}

# --- 准备沙箱 -------------------------------------------------------------
cp "$INSTALL_SH" "$WORK/install.sh"
cp "$REPO_ROOT/plugins.json" "$WORK/plugins.json"
mkdir -p "$WORK/fakebin"

export NPX_LOG="$WORK/npx.log"
: > "$NPX_LOG"
cat > "$WORK/fakebin/npx" <<'FAKE'
#!/usr/bin/env bash
printf '%s\n' "$*" >> "$NPX_LOG"
exit 0
FAKE
chmod +x "$WORK/fakebin/npx"

# Microsoft Store 的 python3 占位程序（打印消息，exit 0，忽略参数）
mkdir -p "$WORK/storestub"
cat > "$WORK/storestub/python3" <<'STUB'
#!/usr/bin/env bash
echo "Python was not found; run without arguments to install from the Microsoft Store, or disable this shortcut from Settings > Manage App Execution Aliases."
exit 0
STUB
chmod +x "$WORK/storestub/python3"
cp "$WORK/fakebin/npx" "$WORK/storestub/npx"

run_install() { # $1=PATH  ...其余为 install.sh 参数
  local path="$1"; shift
  ( cd "$WORK" && PATH="$path" bash ./install.sh "$@" )
}

expected_count="$(node -e 'process.stdout.write(String(require(process.argv[1]).plugins.length))' "$WORK/plugins.json" 2>/dev/null || echo 13)"

# --- 用例 ---------------------------------------------------------------
echo "== --list 在没有 jq 的机器上也能工作 =="
out="$(run_install "$WORK/fakebin:$PATH" --list 2>&1)"; rc=$?
check "--list 退出码" "$rc" "0"
check "--list 输出不含「请安装 jq」" "$(grep -c '请安装 jq' <<< "$out")" "0"

echo "== --all 为每个插件各调用一次 npx =="
: > "$NPX_LOG"
run_install "$WORK/fakebin:$PATH" --all >/dev/null 2>&1; rc=$?
check "--all 退出码" "$rc" "0"
check "--all npx 调用次数" "$(wc -l < "$NPX_LOG" | tr -d ' ')" "$expected_count"

echo "== --plugin 只装一个 =="
: > "$NPX_LOG"
run_install "$WORK/fakebin:$PATH" --plugin dsh-pocket >/dev/null 2>&1; rc=$?
check "--plugin 退出码" "$rc" "0"
check "--plugin npx 调用次数" "$(wc -l < "$NPX_LOG" | tr -d ' ')" "1"
check "--plugin 传对 spec" "$(grep -c 'add github:daha1216/dsh-pocket' "$NPX_LOG")" "1"

echo "== 不存在的插件必须失败且不调用 npx =="
: > "$NPX_LOG"
run_install "$WORK/fakebin:$PATH" --plugin no-such-plugin >/dev/null 2>&1; rc=$?
check "未知插件退出码" "$rc" "1"
check "未知插件 npx 调用次数" "$(wc -l < "$NPX_LOG" | tr -d ' ')" "0"

echo "== 关键回归：python3 是 Store 占位程序、且没有 node 时必须报错退出 =="
: > "$NPX_LOG"
run_install "$WORK/storestub:/usr/bin:/bin" --all >/dev/null 2>&1; rc=$?
check "恶劣环境退出码" "$rc" "1"
check "恶劣环境 npx 调用次数" "$(wc -l < "$NPX_LOG" | tr -d ' ')" "0"

echo "== plugins.json 损坏时报错退出 =="
echo '{ broken' > "$WORK/plugins.json"
run_install "$WORK/fakebin:$PATH" --all >/dev/null 2>&1
check "损坏 JSON 退出码" "$?" "1"
cp "$REPO_ROOT/plugins.json" "$WORK/plugins.json"

echo "== 单个插件安装失败时整体非 0 =="
cat > "$WORK/fakebin/npx" <<'FAKE'
#!/usr/bin/env bash
printf '%s\n' "$*" >> "$NPX_LOG"
case "$*" in *dsh-mnemon*) exit 7;; esac
exit 0
FAKE
chmod +x "$WORK/fakebin/npx"
: > "$NPX_LOG"
run_install "$WORK/fakebin:$PATH" --all >/dev/null 2>&1; rc=$?
check "部分失败退出码" "$rc" "1"

echo
echo "PASS=$PASS FAIL=$FAIL"
(( FAIL == 0 ))
