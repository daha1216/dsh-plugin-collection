# 🧩 DSH Plugin Collection

> DeepSeek Harness（DSH）第三方插件精选目录与原生更新命令索引。

[![Catalog Version](https://img.shields.io/badge/catalog-v1.31.0-blue.svg)](plugins.json)
[![Plugins Count](https://img.shields.io/badge/plugins-17%20curated-brightgreen.svg)](plugins.json)
[![Target Profile](https://img.shields.io/badge/profile-web-orange.svg)](#)
[![Single Source of Truth](https://img.shields.io/badge/SSOT-plugins.json-blueviolet.svg)](plugins.json)

本仓库**只维护插件索引、安装入口与原生更新命令，不复制或重新发布任何插件源码**。每个条目均严格指向插件作者原仓库或官方发布的 npm 构建包。收录标准聚焦于日常真实使用，只收能切实提升 DSH 体验与效率的插件。

---

## 插件目录

> 快捷跳转：[🧠 模型增强](#-模型与推理增强) · [📊 计量监控](#-计量与状态监控) · [🛠️ 会话效率](#️-会话管理与效率工具) · [🎨 界面与多端](#-界面体验与多端协同) · [🧩 市场生态](#-市场与技能生态)

### 🧠 模型与推理增强

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-better-reasoning-effort` | 0.3.10 | 配置第三方模型的推理强度（Effort）与输入模态 | [HaoyueQin/dsh-better-reasoning-effort](https://github.com/HaoyueQin/dsh-better-reasoning-effort) |
| `dsh-plugin-oauth-subs` | 0.0.89 | 接入 ChatGPT、Grok、Copilot 等官方订阅账号 | [xxww0098/dsh-plugin-oauth-subs](https://github.com/xxww0098/dsh-plugin-oauth-subs) |
| `billion-context-dsh` | 0.2.22 | 动态压缩长会话上下文，防止超出模型窗口 | [Tyan66666/billion-context-dsh](https://github.com/Tyan66666/billion-context-dsh) |
| `deepseek-idesign` | 0.2.2 | iPolloWork 设计工作室：对话生成设计稿并套用精选设计模板 | [Devin-AXIS/iPolloWork](https://github.com/Devin-AXIS/iPolloWork) |
| `deepseek-ippt` | 0.1.2 | iPolloWork PPT 工作室：对话生成幻灯片并套用精选模板 | [Devin-AXIS/iPolloWork](https://github.com/Devin-AXIS/iPolloWork) |
| `deepseek-ivideo` | 0.1.0 | iPolloWork 视频工作室：对话生成可编辑视频（HyperFrames 模板） | [Devin-AXIS/iPolloWork](https://github.com/Devin-AXIS/iPolloWork) |

### 📊 计量与状态监控

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-all-usage` | 1.1.9 | 多维度统计 Token 用量、费用消耗与热力图 | [ParticleLight/dsh-all-usage](https://github.com/ParticleLight/dsh-all-usage) |
| `@xueayi/dsh-opencode-go-usage` | 0.1.6 | 悬浮监控 OpenCode Go 滚动配额与剩余用量 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |
| `dsh-watcher` | 0.4.0-insights.1 | HUD 悬浮球展示会话运行状态与模型实时用量 | [aa2246740/dsh-watcher](https://github.com/aa2246740/dsh-watcher) |

### 🛠️ 会话管理与效率工具

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-retrace` | 0.4.36 | 会话消息撤回重发、分支回溯与产物版本化；撤回操作 UI 归属本插件（对话页软填充胶囊 chips 内联进时间·复制行、列右缘对齐、两步确认，阅读页 DOM 注入器），内联编辑器为浮动卡片（自动聚焦/自动高度/快捷键），液态毛玻璃 + 暖橙扁平按钮与出入场动效 | [daha1216/dsh-retrace](https://github.com/daha1216/dsh-retrace) |
| `@michengai/dsh-archive-manager` | 0.1.40 | 浏览、检索与恢复已归档的历史会话 | [MichengAI/dsh-archive-manager](https://github.com/MichengAI/dsh-archive-manager) |
| `@anysearch/anysearch-dsh` | 0.1.4 | 为 Agent 提供网页实时搜索与正文抓取能力 | [anysearch-team/anysearch-dsh](https://github.com/anysearch-team/anysearch-dsh) |

### 🎨 界面体验与多端协同

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-pocket` | 2.10.3-daha.1 | 手机扫码同步电脑端 DSH，支持移动端操作 | [daha1216/dsh-pocket](https://github.com/daha1216/dsh-pocket) |
| `dsh-font-customizer` | 0.1.0 | 自定义 Web 界面字体、代码字体与字号 | [daha1216/dsh-font-customizer](https://github.com/daha1216/dsh-font-customizer) |
| `dsh-pet` | 0.2.8 | 在页面右下角显示可互动的桌面宠物 | [PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet) |

### 🧩 市场与技能生态

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dshmarket` | 1.46.1 | 官方社区插件市场，支持浏览、搜索与一键安装 | [dsh-market/dsh-market](https://github.com/dsh-market/dsh-market) |
| `dsh-skills` | 0.1.1 | 统一管理全局与项目级 Agent 技能包 | [CocoSgt/dsh-skills](https://github.com/CocoSgt/dsh-skills) |

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
# 列出可选插件
.\install.ps1 -List

# 按名称安装指定插件
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

| 插件名称 | 更新命令（来自各插件 README） |
|---|---|
| `dsh-better-reasoning-effort` | `dsh plugin --profile web add github:HaoyueQin/dsh-better-reasoning-effort` |
| `dshmarket` | `dsh plugin --profile web add dshmarket` |
| `dsh-skills` | `dsh plugin --profile web add dsh-skills` |
| `dsh-pet` | `dsh plugin --profile web add dsh-pet` |
| `dsh-pocket` | `dsh plugin --profile web update dsh-pocket --latest -w` |
| `@michengai/dsh-archive-manager` | `dsh plugin --profile web add @michengai/dsh-archive-manager@latest --registry=https://registry.npmjs.org/` |
| `@xueayi/dsh-opencode-go-usage` | `dsh plugin --profile web update @xueayi/dsh-opencode-go-usage` |
| `dsh-all-usage` | `dsh plugin --profile web add github:ParticleLight/dsh-all-usage` |
| `@anysearch/anysearch-dsh` | `npx -y @deepseek-ai/dsh plugin --profile web update @anysearch/anysearch-dsh` |
| `billion-context-dsh` | `dsh plugin --profile web add billion-context-dsh` |
| `deepseek-idesign` | `dsh plugin --profile web add deepseek-idesign` |
| `deepseek-ippt` | `dsh plugin --profile web add deepseek-ippt` |
| `deepseek-ivideo` | `dsh plugin --profile web add deepseek-ivideo` |
| `dsh-retrace` | `dsh plugin --profile web add dsh-retrace` |
| `dsh-font-customizer` | `dsh plugin --profile web add github:daha1216/dsh-font-customizer` |
| `dsh-watcher` | `dsh plugin --profile web add github:aa2246740/dsh-watcher` |
| `dsh-plugin-oauth-subs` | `dsh plugin --profile web add https://github.com/xxww0098/dsh-plugin-oauth-subs` |

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
