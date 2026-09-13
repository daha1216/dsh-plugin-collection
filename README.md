# 🧩 DSH Plugin Collection

> DeepSeek Harness（DSH）第三方插件精选目录与原生更新命令索引。

[![Catalog Version](https://img.shields.io/badge/catalog-v1.27.0-blue.svg)](plugins.json)
[![Plugins Count](https://img.shields.io/badge/plugins-15%20curated-brightgreen.svg)](plugins.json)
[![Target Profile](https://img.shields.io/badge/profile-web-orange.svg)](#)
[![Single Source of Truth](https://img.shields.io/badge/SSOT-plugins.json-blueviolet.svg)](plugins.json)

本仓库**只维护插件索引、安装入口与原生更新命令，不复制或重新发布任何插件源码**。每个条目均严格指向插件作者原仓库或官方发布的 npm 构建包。收录标准聚焦于日常真实使用，只收能切实提升 DSH 体验与效率的插件。

---

## 插件目录

版本号为本目录最近一次核对时上游插件的版本快照；一键安装与单独安装均默认跟随 GitHub 默认分支（安装最新版）。机器可读目录见 [`plugins.json`](plugins.json)。

| ID | 名称 | 版本 | 用途 | 来源 |
|---|---|---:|---|---|
| `dsh-better-reasoning-effort` | `dsh-better-reasoning-effort` | 0.3.10 | 为第三方模型提供推理强度与输入模态配置，并在模型页面内提供自动适配。 | [HaoyueQin/dsh-better-reasoning-effort](https://github.com/HaoyueQin/dsh-better-reasoning-effort) |
| `dshmarket` | `dshmarket` | 1.46.1 | DSH 社区插件市场，支持浏览、搜索和一键安装插件。 | [dsh-market/dsh-market](https://github.com/dsh-market/dsh-market) |
| `dsh-skills` | `dsh-skills` | 0.1.1 | 聚合和管理全局、项目及 .skill-package 技能。 | [CocoSgt/dsh-skills](https://github.com/CocoSgt/dsh-skills) |
| `dsh-pet` | `dsh-pet` | 0.2.8 | 在 DSH 网页界面显示可活动的桌面宠物。 | [PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet) |
| `dsh-pocket` | `dsh-pocket` | 2.10.3-daha.1 | 通过手机扫码访问并同步电脑上的 DSH，支持局域网和公网。本条目指向自建 fork（含两处安全加固），非上游原仓库。 | [daha1216/dsh-pocket](https://github.com/daha1216/dsh-pocket) |
| `dsh-archive-manager` | `@michengai/dsh-archive-manager` | 0.1.40 | 管理已归档的 DSH 会话。 | [MichengAI/dsh-archive-manager](https://github.com/MichengAI/dsh-archive-manager) |
| `dsh-opencode-go-usage` | `@xueayi/dsh-opencode-go-usage` | 0.1.6 | 在悬浮 Web 面板中实时监控 OpenCode Go 的 5 小时滚动 / 周 / 月配额并展示用量。 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |
| `dsh-all-usage` | `dsh-all-usage` | 1.1.9 | 按模型、供应商、工作区和时间范围分析 Token、缓存与账户余额，并支持热力图和 CSV 导出。 | [ParticleLight/dsh-all-usage](https://github.com/ParticleLight/dsh-all-usage) |
| `anysearch-dsh` | `@anysearch/anysearch-dsh` | 0.1.4 | 为 DSH 提供网页搜索、网页抓取及高级搜索工具。 | [anysearch-team/anysearch-dsh](https://github.com/anysearch-team/anysearch-dsh) |
| `billion-context-dsh` | `billion-context-dsh` | 0.2.22 | 通过模型驱动的上下文裁剪管理 DSH 上下文，作为 CompactionEngine 后端工作。 | [Tyan66666/billion-context-dsh](https://github.com/Tyan66666/billion-context-dsh) |
| `dsh-retrace` | `dsh-retrace` | 0.4.21 | 在会话中撤回、编辑重发与重新生成，并把对话与产物一起版本化，提供时间线、回滚与分叉图。 | [daha1216/dsh-retrace](https://github.com/daha1216/dsh-retrace) |
| `dsh-font-customizer` | `dsh-font-customizer` | 0.1.0 | 自定义 DSH Web 界面字体：界面字体、代码字体与内容字号，设置持久化在宿主机，支持本地字体检测与全量扫描。 | [daha1216/dsh-font-customizer](https://github.com/daha1216/dsh-font-customizer) |
| `dsh-watcher` | `dsh-watcher` | 0.4.0-insights.1 | 只读的会话洞察与本地模型用量统计，给 DSH Web 会话加状态与用量 HUD。 | [aa2246740/dsh-watcher](https://github.com/aa2246740/dsh-watcher) |
| `dsh-plugin-oauth-subs` | `dsh-plugin-oauth-subs` | 0.0.89 | 把 ChatGPT Codex、Grok、GLM、Kiro、Antigravity、Cursor、Ollama Cloud、Kimi、GitHub Copilot 的订阅 OAuth 接入 DSH（PKCE / 设备码 / Google 登录，本地 Responses 代理）。 | [xxww0098/dsh-plugin-oauth-subs](https://github.com/xxww0098/dsh-plugin-oauth-subs) |
| `dsh-better-display` | `dsh-better-display` | 0.1.0 | 给 DSH Web 加「阅读」页签：执行时展示步骤、思考与进度，整轮结束后收起过程只留最终回答，并把 mcp-app 代码块挂成沙箱 iframe 交互卡片。 | [aa2246740/dsh-better-display](https://github.com/aa2246740/dsh-better-display) |

---

## 安装指南

> 默认安装目标均为 DSH 的 `web` profile（`~/.dsh/profiles/web`）。可通过 `--profile <name>` 切换。

### 1. 单插件安装（官方推荐命令）

在目录中挑选好插件后，直接使用官方 CLI 命令从作者上游安装（以桌面宠物为例）：

```bash
npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:PC2005-cloud/dsh-pet
```

### 2. 交互式选择安装

通过本仓库自带脚本按需选择：

```powershell
# 列出可选插件 ID
.\install.ps1 -List

# 按 ID 安装指定插件
.\install.ps1 -Plugin dsh-pocket
```

*macOS / Linux：*
```bash
bash install.sh --list
bash install.sh --plugin dsh-pocket
```

### 3. 一键全量安装

一键安装本目录收录的全部插件当前最新版：

**Windows PowerShell**：
```powershell
$tmp = Join-Path $env:TEMP 'dsh-plugin-collection'
if (Test-Path $tmp) { Remove-Item -Recurse -Force $tmp }
git clone https://github.com/daha1216/dsh-plugin-collection.git $tmp
& (Join-Path $tmp 'install.ps1') -All
```

**macOS / Linux**：
```bash
curl -fsSL https://raw.githubusercontent.com/daha1216/dsh-plugin-collection/main/install.sh -o install.sh
bash install.sh --all
```

*提示：安装或更新完成后，刷新页面或重启 DSH Web UI 即可生效。*

---

## 更新插件

下表命令**逐条直接引用自各插件上游 README 的原生写法**（尊重各作者的原生发布通道与生命周期）。若系统环境变量中未包含全局 `dsh` 命令，在前面追加 `npx --yes -p @deepseek-ai/dsh` 即可。

| ID | 更新命令（来自各插件 README） |
|---|---|
| `dsh-better-reasoning-effort` | `dsh plugin --profile web add github:HaoyueQin/dsh-better-reasoning-effort` |
| `dshmarket` | `dsh plugin --profile web add dshmarket` |
| `dsh-skills` | `dsh plugin --profile web add dsh-skills` |
| `dsh-pet` | `dsh plugin --profile web add dsh-pet` |
| `dsh-pocket` | `dsh plugin --profile web update dsh-pocket --latest -w` |
| `dsh-archive-manager` | `dsh plugin --profile web add @michengai/dsh-archive-manager@latest --registry=https://registry.npmjs.org/` |
| `dsh-opencode-go-usage` | `dsh plugin --profile web update @xueayi/dsh-opencode-go-usage` |
| `dsh-all-usage` | `dsh plugin --profile web add github:ParticleLight/dsh-all-usage` |
| `anysearch-dsh` | `npx -y @deepseek-ai/dsh plugin --profile web update @anysearch/anysearch-dsh` |
| `billion-context-dsh` | `dsh plugin --profile web add billion-context-dsh` |
| `dsh-retrace` | `dsh plugin --profile web add dsh-retrace` |
| `dsh-font-customizer` | `dsh plugin --profile web add github:daha1216/dsh-font-customizer` |
| `dsh-watcher` | `dsh plugin --profile web add github:aa2246740/dsh-watcher` |
| `dsh-plugin-oauth-subs` | `dsh plugin --profile web add https://github.com/xxww0098/dsh-plugin-oauth-subs` |
| `dsh-better-display` | `dsh plugin --profile web add github:aa2246740/dsh-better-display` |

---

## ⚠️ 重要说明与避坑指南

### 1. 更新机制与命令规范
- **重跑 `add` 即更新**：多数插件（如 `dshmarket`、`dsh-skills`、`dsh-pet` 等）上游 README 未设立独立的 update 命令，重新执行其 `add` 命令即可拉取最新提交或发布版。
- **独立 `update` 动词**：部分插件（`anysearch-dsh`、`dsh-opencode-go-usage`、`dsh-pocket`）支持并推荐使用原生的 `update` 动词。
- **市场内置更新**：`dshmarket` 自身作为插件市场，在 DSH Web 设置页面支持一键自更及更新其它插件。

### 2. Registry 缓存滞后警示
- 本机若通过 `github:` 源安装插件，后续更新时**切勿改跑不带 spec 的 `add <pkg>@latest`**，否则会被 npm registry 解析，可能拉取到落后于 GitHub HEAD 的历史旧包。更新请始终沿用显式 `github:<owner>/<repo>` 或上表对应的原生指令。

### 3. 特殊插件与自维护 Fork
- **`dsh-pocket`**：
  - 本条目指向安全加固版 Fork（`github:daha1216/dsh-pocket`），非上游原仓库。
  - 更新时必须保留 `-w` 参数（解决 pnpm workspace 根目录限制）；跨大版本升级时 `--latest` 必选。
- **`dsh-retrace`**：
  - 上游原生命令为 npm 通道 `dsh plugin --profile web add dsh-retrace`。
  - 本机实装与本目录均跟随自建兼容 Fork `github:daha1216/dsh-retrace`。
- **`dsh-font-customizer`**：
  - 目录收录公开仓库 `github:daha1216/dsh-font-customizer`；本地若处于开发态（`link:`），以本地代码优先。

---

## 🛠️ 维护机制与健康检查

本仓库推行“配置即代码”与“自动化验证”机制：

1. **单一数据源**：[`plugins.json`](plugins.json) 记录所有插件的规范元数据。
2. **自动化对账**：通过 `pwsh scripts/verify.ps1` 校验目录一致性：
   - 验证 `plugins.json` 结构与格式；
   - 保证 README 目录表与更新命令表严格对应；
   - 保证仓库目录与当前环境 profile 实装插件完全对齐（差集为零）。
3. **版本日志**：每次目录更新与插件升级记录统一沉淀在 [`CHANGELOG.md`](CHANGELOG.md)。

---

## 🛡️ 安全与责任边界

- **系统权限**：插件运行在用户本地的 DSH 进程中。安装前请务必自行审阅各上游仓库的源码、依赖项及生命周期脚本。
- **免责声明**：本仓库仅提供检索与索引服务，不对第三方插件的安全性、稳定性提供任何担保。
- **原生接口**：所有安装与更新操作均使用 DSH 官方标准 CLI 接口完成。
