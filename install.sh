#!/usr/bin/env bash
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
    --profile) PROFILE="$2"; shift 2 ;;
    --plugin) PLUGIN="$2"; shift 2 ;;
    --all) ALL=1; shift ;;
    --list) LIST=1; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "未知参数: $1" >&2; usage; exit 2 ;;
  esac
done

if [[ "$LIST" == 1 || ( "$ALL" == 0 && -z "$PLUGIN" ) ]]; then
  if command -v jq >/dev/null 2>&1; then
    jq -r '.plugins[] | [.id, .name, .version, .description] | @tsv' plugins.json
  else
    echo '请安装 jq，或在 GitHub 上直接查看 plugins.json。'
  fi
  usage
  exit 0
fi

if ! command -v npx >/dev/null 2>&1; then
  echo '找不到 npx。请先安装 Node.js。' >&2
  exit 1
fi

while IFS=$'\t' read -r id name version source spec; do
  echo "安装 $name v$version <- $source"
  npx --yes -p @deepseek-ai/dsh dsh plugin --profile "$PROFILE" add "$spec"
done < <(python3 - "$PLUGIN" "$ALL" <<'PY'
import json, sys
catalog = json.load(open('plugins.json', encoding='utf-8'))
plugin, install_all = sys.argv[1], sys.argv[2] == '1'
selected = catalog['plugins'] if install_all else [
    p for p in catalog['plugins'] if p['id'] == plugin or p['name'] == plugin
]
if not selected:
    raise SystemExit(f"未找到插件 '{plugin}'。运行 ./install.sh --list 查看可用 ID。")
for p in selected:
    print(f"{p['id']}\t{p['name']}\t{p['version']}\t{p['source']}\t{p['install']}")
PY
)

echo '安装完成。请重启 DSH Web UI 使插件全部生效。'
