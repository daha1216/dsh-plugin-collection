#!/usr/bin/env bash
# install.sh — 从 plugins.json 安装 DSH 插件
#
# 设计要点（相对旧版）：
#   1. JSON 解析优先用 node（DSH 用户必然有 node），python3/python 仅作后备。
#      旧版直接用 python3，在 Windows 上 python3 常是 Microsoft Store 的占位程序：
#      它打印 "Python was not found..." 并以 exit 0 结束，导致解析静默失败。
#   2. 解析结果先落到变量里，校验退出码 + 非空 + 条目数，再开始安装。
#      bash 的 set -e 不会传播进程替换 <(...) 内部的失败，因此必须显式校验。
#   3. 一条都没装时以非 0 退出，不再无条件打印「安装完成」。
set -euo pipefail

PROFILE="web"
PLUGIN=""
ALL=0
LIST=0

usage() {
  cat <<'EOF'
用法:
  ./install.sh --list
  ./install.sh --plugin <id>
  ./install.sh --all [--profile web]
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --profile) PROFILE="${2:?--profile 需要一个值}"; shift 2 ;;
    --plugin) PLUGIN="${2:?--plugin 需要一个值}"; shift 2 ;;
    --all) ALL=1; shift ;;
    --list) LIST=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知参数: $1" >&2; usage; exit 2 ;;
  esac
done

if [[ ! -f plugins.json ]]; then
  echo "找不到 plugins.json。请在仓库根目录运行本脚本。" >&2
  exit 1
fi

# ---------------------------------------------------------------- 选择解析器
# 输出 TSV：id \t name \t version \t source \t install
read -r -d '' NODE_PARSER <<'JS' || true
const fs = require('fs')
// 注意：node -e 的 argv[0] 是 node 可执行文件，argv[1] 才是第一个用户参数
const [plugin, installAll] = process.argv.slice(1)
let catalog
try {
  catalog = JSON.parse(fs.readFileSync('plugins.json', 'utf8'))
} catch (err) {
  console.error(`plugins.json 解析失败：${err.message}`)
  process.exit(3)
}
if (!catalog || !Array.isArray(catalog.plugins)) {
  console.error('plugins.json 缺少 plugins 数组')
  process.exit(3)
}
const selected = installAll === '1'
  ? catalog.plugins
  : catalog.plugins.filter(p => p.id === plugin || p.name === plugin)
if (selected.length === 0) {
  console.error(`未找到插件 '${plugin}'。运行 ./install.sh --list 查看可用 ID。`)
  process.exit(4)
}
for (const p of selected) {
  for (const k of ['id', 'name', 'version', 'source', 'install']) {
    if (typeof p[k] !== 'string' || p[k] === '') {
      console.error(`plugins.json 中条目 ${p.id ?? '?'} 的 ${k} 字段缺失或非字符串`)
      process.exit(5)
    }
  }
  process.stdout.write([p.id, p.name, p.version, p.source, p.install].join('\t') + '\n')
}
JS

read -r -d '' PY_PARSER <<'PY' || true
import json, sys
catalog = json.load(open('plugins.json', encoding='utf-8'))
plugin, install_all = sys.argv[1], sys.argv[2] == '1'
if not isinstance(catalog.get('plugins'), list):
    sys.exit('plugins.json 缺少 plugins 数组')
selected = catalog['plugins'] if install_all else [
    p for p in catalog['plugins'] if p.get('id') == plugin or p.get('name') == plugin
]
if not selected:
    sys.exit(f"未找到插件 '{plugin}'。运行 ./install.sh --list 查看可用 ID。")
for p in selected:
    print("\t".join(str(p[k]) for k in ('id', 'name', 'version', 'source', 'install')))
PY

# 探测可用的解析器。
#
# 关键：Microsoft Store 的 python3 占位程序会忽略所有参数、把 "Python was not
# found..." 打到 stdout 并 **以 exit 0 结束**。所以既不能只看退出码，也不能只看
# command -v。这里要求它真的执行一段 JSON 代码并输出约定的哨兵字符串。
PROBE_SENTINEL='DSH_PLUGIN_CATALOG_PARSER_OK'

pick_parser() {
  if command -v node >/dev/null 2>&1; then
    if [[ "$(node -e 'process.stdout.write("'"$PROBE_SENTINEL"'")' 2>/dev/null)" == "$PROBE_SENTINEL" ]]; then
      echo "node"; return 0
    fi
  fi
  local py
  for py in python3 python; do
    command -v "$py" >/dev/null 2>&1 || continue
    if [[ "$("$py" -c 'import json,sys; sys.stdout.write("'"$PROBE_SENTINEL"'")' 2>/dev/null)" == "$PROBE_SENTINEL" ]]; then
      echo "$py"; return 0
    fi
  done
  return 1
}

run_parser() { # $1=parser  $2=plugin  $3=all
  case "$1" in
    node) node -e "$NODE_PARSER" "$2" "$3" ;;
    *)    "$1" -c "$PY_PARSER" "$2" "$3" ;;
  esac
}

if ! PARSER="$(pick_parser)"; then
  cat >&2 <<'EOF'
找不到可用的 JSON 解析器。
本脚本需要 Node.js（推荐，DSH 本身就需要它），或一个可用的 python3 / python。
注意：Windows 上从 Microsoft Store 安装的 "python3" 占位程序不能用来解析 JSON。
EOF
  exit 1
fi

# -------------------------------------------------------------------- --list
if [[ "$LIST" == 1 || ( "$ALL" == 0 && -z "$PLUGIN" ) ]]; then
  if ! listing="$(run_parser "$PARSER" "" 1)"; then
    echo "读取 plugins.json 失败。" >&2
    exit 1
  fi
  printf '%-30s %-10s %s\n' "ID" "VERSION" "SOURCE"
  while IFS=$'\t' read -r id _name version source _install; do
    printf '%-30s %-10s %s\n' "$id" "$version" "$source"
  done <<< "$listing"
  echo
  usage
  exit 0
fi

if ! command -v npx >/dev/null 2>&1; then
  echo '找不到 npx。请先安装 Node.js。' >&2
  exit 1
fi

# --------------------------------------------------------------- 解析待装项
if ! selection="$(run_parser "$PARSER" "$PLUGIN" "$ALL")"; then
  echo '解析 plugins.json 失败，未安装任何插件。' >&2
  exit 1
fi
if [[ -z "${selection//[$'\t\r\n ']/}" ]]; then
  echo '解析 plugins.json 得到 0 个待安装插件，未安装任何插件。' >&2
  exit 1
fi

# --------------------------------------------------------------- 执行安装
total=0
ok=0
failed=()
while IFS=$'\t' read -r id name version source spec; do
  [[ -z "$id" ]] && continue
  total=$(( total + 1 ))
  echo "安装 $name v$version <- $source"
  if npx --yes -p @deepseek-ai/dsh dsh plugin --profile "$PROFILE" add "$spec"; then
    ok=$(( ok + 1 ))
  else
    echo "  ✗ $name 安装失败" >&2
    failed+=("$name")
  fi
done <<< "$selection"

# 双保险：循环体一次都没执行说明输入解析有问题，不能报成功
if (( total == 0 )); then
  echo '内部错误：没有解析出任何待安装插件，未安装任何插件。' >&2
  exit 1
fi

echo
if (( ${#failed[@]} > 0 )); then
  echo "安装完成：成功 $ok / $total，失败 ${#failed[@]}（${failed[*]}）。" >&2
  echo '请检查上面的错误输出。' >&2
  exit 1
fi

echo "安装完成：成功 $ok / $total。请重启 DSH Web UI 使插件全部生效。"
