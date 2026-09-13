# DSH Plugin Collection

DeepSeek Harness（DSH）第三方插件目录。这里**只维护插件索引和安装入口，不复制或重新发布任何插件源码**；每个条目都指向插件作者自己的 GitHub 仓库，必要时使用作者发布到 npm 的构建包安装。

这里收录的每一款插件都是作者本人精心挑选的：以日常真实使用为标准，只收能切实提升 DSH 使用体验和效率的插件。

## 一键安装全部插件

一键安装会安装目录里**每一个插件的当前最新版**：安装入口默认跟随各插件 GitHub 默认分支；需要完整发布构建产物的插件则使用 npm 发布包。版本见下方「插件目录」表（版本号是快照）。

Windows PowerShell：

```powershell
$tmp = Join-Path $env:TEMP 'dsh-plugin-collection'
if (Test-Path $tmp) { Remove-Item -Recurse -Force $tmp }
git clone https://github.com/daha1216/dsh-plugin-collection.git $tmp
& (Join-Path $tmp 'install.ps1') -All
```

需要审阅脚本时，先下载本仓库，再运行：

```powershell
.\install.ps1 -All
```

macOS / Linux：

```bash
curl -fsSL https://raw.githubusercontent.com/daha1216/dsh-plugin-collection/main/install.sh -o install.sh
bash install.sh --all
```

默认安装到 DSH 的 `web` profile。可以通过 `--profile <name>` 切换 profile。

## 单独安装

先列出插件（`plugins.json` 的 ID 列表）：

```powershell
.\install.ps1 -List
```

然后按目录 ID 安装该插件的当前最新版：

```powershell
.\install.ps1 -Plugin dsh-pocket
```

macOS / Linux：

```bash
bash install.sh --list
bash install.sh --plugin dsh-pocket
```

也可以直接使用 DSH 官方安装命令。下面的安装源都是插件作者的上游 GitHub 仓库或 npm 发布包，不是本集合仓库的副本：

```powershell
npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:PC2005-cloud/dsh-pet
```

安装或更新完成后，重启 DSH Web UI。插件会在用户自己的 `~/.dsh/profiles/<profile>` 中安装。

> 例外：`dsh-pocket` 现在指向本机维护的 fork `daha1216/dsh-pocket`（见下），不再是上游 `shaobeichen/dsh-pocket`。

## 插件目录

版本号是本目录最近一次核对时上游插件的版本快照；一键安装 / 单独安装都默认跟随对应 GitHub 仓库当前默认分支（即安装最新版）。需要固定到某个发布版本时，请在插件原仓库查看对应 tag 或 release，并在安装前自行确认兼容性。

| ID | 名称 | 版本 | 用途 | 来源 |
|---|---|---:|---|---|
| `dsh-better-reasoning-effort` | `dsh-better-reasoning-effort` | 0.3.9 | 为第三方模型提供推理强度与输入模态配置，并在模型页面内提供自动适配。 | [HaoyueQin/dsh-better-reasoning-effort](https://github.com/HaoyueQin/dsh-better-reasoning-effort) |
| `dshmarket` | `dshmarket` | 1.45.1 | DSH 社区插件市场，支持浏览、搜索和一键安装插件。 | [dsh-market/dsh-market](https://github.com/dsh-market/dsh-market) |
| `dsh-skills` | `dsh-skills` | 0.1.1 | 聚合和管理全局、项目及 `.skill-package` 技能。 | [CocoSgt/dsh-skills](https://github.com/CocoSgt/dsh-skills) |
| `dsh-pet` | `dsh-pet` | 0.2.8 | 在 DSH 网页界面显示可活动的桌面宠物。 | [PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet) |
| `dsh-pocket` | `dsh-pocket` | 2.10.3-daha.1 | 通过手机扫码访问并同步电脑上的 DSH，支持局域网和公网。本条目指向自建 fork（含两处安全加固），非上游原仓库。 | [daha1216/dsh-pocket](https://github.com/daha1216/dsh-pocket) |
| `dsh-archive-manager` | `@michengai/dsh-archive-manager` | 0.1.39 | 管理已归档的 DSH 会话。 | [MichengAI/dsh-archive-manager](https://github.com/MichengAI/dsh-archive-manager) |
| `dsh-opencode-go-usage` | `@xueayi/dsh-opencode-go-usage` | 0.1.6 | 在悬浮 Web 面板中实时监控 OpenCode Go 的 5 小时滚动 / 周 / 月配额并展示用量。 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |
| `dsh-all-usage` | `dsh-all-usage` | 1.1.8 | 按模型、供应商、工作区和时间范围分析 Token、缓存与账户余额，并支持热力图和 CSV 导出。 | [ParticleLight/dsh-all-usage](https://github.com/ParticleLight/dsh-all-usage) |
| `anysearch-dsh` | `@anysearch/anysearch-dsh` | 0.1.4 | 为 DSH 提供网页搜索、网页抓取及高级搜索工具。 | [anysearch-team/anysearch-dsh](https://github.com/anysearch-team/anysearch-dsh) |
| `billion-context-dsh` | `billion-context-dsh` | 0.2.21 | 通过模型驱动的上下文裁剪管理 DSH 上下文，作为 CompactionEngine 后端工作。 | [Tyan66666/billion-context-dsh](https://github.com/Tyan66666/billion-context-dsh) |
| `dsh-retrace` | `dsh-retrace` | 0.4.21 | 在会话中撤回、编辑重发与重新生成，并把对话与产物一起版本化，提供时间线、回滚与分叉图。 | [daha1216/dsh-retrace](https://github.com/daha1216/dsh-retrace) |
| `dsh-font-customizer` | `dsh-font-customizer` | 0.1.0 | 自定义 DSH Web 界面字体：界面字体、代码字体与内容字号，设置持久化在宿主机，支持本地字体检测与全量扫描。 | [daha1216/dsh-font-customizer](https://github.com/daha1216/dsh-font-customizer) |
| `dsh-watcher` | `dsh-watcher` | 0.4.0-insights.1 | 只读的会话洞察与本地模型用量统计，给 DSH Web 会话加状态与用量 HUD。 | [aa2246740/dsh-watcher](https://github.com/aa2246740/dsh-watcher) |
| `dsh-plugin-oauth-subs` | `dsh-plugin-oauth-subs` | 0.0.89 | 把 ChatGPT Codex、Grok、GLM、Kiro、Antigravity、Cursor、Ollama Cloud、Kimi、GitHub Copilot 的订阅 OAuth 接入 DSH（PKCE / 设备码 / Google 登录，本地 Responses 代理）。 | [xxww0098/dsh-plugin-oauth-subs](https://github.com/xxww0098/dsh-plugin-oauth-subs) |
| `dsh-auto-review` | `dsh-auto-review` | 0.12.4 | 审批链上的第二模型自动审查：只读 reviewer 子代理给出 allow/deny 结构化判定，默认 fail-closed，全程会话日志可审计。 | [PerryLink/dsh-auto-review](https://github.com/PerryLink/dsh-auto-review) |
| `dsh-permission-rules` | `dsh-permission-rules` | 0.7.2 | 声明式有序 allow/deny/ask 权限规则：匹配工具名、参数（glob/正则）、工作区路径与网络目标（域名/IP/端口/协议），外加 Codex 风格进程级网络策略。 | [PerryLink/dsh-permission-rules](https://github.com/PerryLink/dsh-permission-rules) |
| `dsh-doublecheck` | `dsh-doublecheck` | 0.9.11 | 交付质量门：动笔前审讯需求、红绿测试证据、交付后对抗评审，最终给出 deliverable/rework 放行判定。 | [PerryLink/dsh-doublecheck](https://github.com/PerryLink/dsh-doublecheck) |
| `dsh-memento` | `dsh-memento` | 0.5.12 | 有界、分层、带审批门、可审计的跨会话记忆：ctx.memory 能力缝 + 本地 SQLite 提供者 + memory 工具 + 冻结快照注入。 | [PerryLink/dsh-memento](https://github.com/PerryLink/dsh-memento) |
| `dsh-checkpoint-rewind` | `dsh-checkpoint-rewind` | 0.6.11 | 统一 DSH 检查点：会话/工作区/配置三态快照 + /checkpoint、/rewind 一键回退 + 设置页时间线 diff + 种子回放恢复。 | [PerryLink/dsh-checkpoint-rewind](https://github.com/PerryLink/dsh-checkpoint-rewind) |
| `dsh-mcp-panel` | `dsh-mcp-panel` | 0.6.14 | MCP 服务器管理面板：查看状态、启停、日志、配置与工具试调，带自动备份。 | [PerryLink/dsh-mcp-panel](https://github.com/PerryLink/dsh-mcp-panel) |
| `dsh-composer-history` | `dsh-composer-history` | 0.8.2 | Web 输入框的终端式输入历史：方向键精确恢复草稿与光标、浏览器本地持久化、Ctrl+R 反查、工作区召回、压缩感知。 | [PerryLink/dsh-composer-history](https://github.com/PerryLink/dsh-composer-history) |
| `dsh-session-pin` | `dsh-session-pin` | 0.7.11 | 置顶重要会话：保持可见、排序靠前、避免被清理。 | [PerryLink/dsh-session-pin](https://github.com/PerryLink/dsh-session-pin) |
| `dsh-session-sync` | `dsh-session-sync` | 0.2.14 | 会话日志推送/拉取到远程存储，支持可配置的自动同步。 | [PerryLink/dsh-session-sync](https://github.com/PerryLink/dsh-session-sync) |
| `dsh-output-styles` | `dsh-output-styles` | 0.6.16 | 运行时切换模型输出样式：内置六款样式库、/style 命令、会话级持久化、系统提示词注入与渲染器注册表。 | [PerryLink/dsh-output-styles](https://github.com/PerryLink/dsh-output-styles) |
| `dsh-lsp-actions` | `dsh-lsp-actions` | 0.5.1 | 语言服务器能力暴露给 agent：诊断、定义、引用、补全、code actions 与整仓重命名。 | [PerryLink/dsh-lsp-actions](https://github.com/PerryLink/dsh-lsp-actions) |
| `dsh-background-agents` | `dsh-background-agents` | 0.9.7 | 后台持久子代理：结构化任务板、进度监控、随时消息与中断控制。 | [PerryLink/dsh-background-agents](https://github.com/PerryLink/dsh-background-agents) |
| `dsh-claude-move` | `dsh-claude-move` | 0.4.7 | Claude Code/Codex/OpenCode/Hermes → DSH 迁移：导入 CLAUDE.md/AGENTS.md、斜杠命令与会话历史，审批门 + 幂等。 | [PerryLink/dsh-claude-move](https://github.com/PerryLink/dsh-claude-move) |
| `dsh-translate` | `dsh-translate` | 0.2.10 | 会话内翻译文本与文件并做质量校验；顺带修复模型产出的坏 JSON。 | [PerryLink/dsh-translate](https://github.com/PerryLink/dsh-translate) |
| `dsh-local-ai` | `dsh-local-ai` | 0.2.10 | 把 Ollama / LM Studio / 本地端点变成 DSH 的直接模型路由。 | [PerryLink/dsh-local-ai](https://github.com/PerryLink/dsh-local-ai) |
| `dsh-mask` | `dsh-mask` | 0.2.10 | 敏感值遮蔽：密钥遮蔽规则 + 内存白名单 + 受控揭示流程。 | [PerryLink/dsh-mask](https://github.com/PerryLink/dsh-mask) |
| `dsh-data-quality` | `dsh-data-quality` | 0.3.10 | 确定性数据画像、清洗与核验：DAMA 记分卡、内容哈希去重、指标期望与漂移检查。 | [PerryLink/dsh-data-quality](https://github.com/PerryLink/dsh-data-quality) |
| `dsh-score` | `dsh-score` | 0.2.11 | 插件质量评分：按检查项评估插件并产出证据化合规报告。 | [PerryLink/dsh-score](https://github.com/PerryLink/dsh-score) |
| `dsh-test-drive` | `dsh-test-drive` | 0.3.12 | 在一次性沙箱环境（临时 DSH_HOME）试跑插件并输出 JSON/Markdown 评分。 | [PerryLink/dsh-test-drive](https://github.com/PerryLink/dsh-test-drive) |
| `dsh-defend` | `dsh-defend` | 0.3.10 | 提示注入、越狱与密钥泄露防御：Aho-Corasick 检测 + allow/ask/block 拦截 + 递归删除执行前门。 | [PerryLink/dsh-defend](https://github.com/PerryLink/dsh-defend) |
| `dsh-budget` | `dsh-budget` | 0.4.9 | 成本治理：按模型/会话/天聚合 token 与费用、预算上限与阈值告警、碳足迹估算、/budget 命令。 | [PerryLink/dsh-budget](https://github.com/PerryLink/dsh-budget) |
| `dsh-fast` | `dsh-fast` | 0.2.12 | 只读性能诊断：会话加载/恢复耗时、溢写命中、压缩次数、上下文注入量、LLM 缓存命中率（/fast）。 | [PerryLink/dsh-fast](https://github.com/PerryLink/dsh-fast) |
| `dsh-observe` | `dsh-observe` | 0.2.12 | 可观测性：请求追踪、遥测、日志缓冲与重试可见性。 | [PerryLink/dsh-observe](https://github.com/PerryLink/dsh-observe) |
| `dsh-click` | `dsh-click` | 0.3.10 | 跨平台原生桌面控制（Windows 优先）：截图、读屏、点击/键入/滚动/按键、应用列表与启动——审批门 + 不抢焦点。 | [PerryLink/dsh-click](https://github.com/PerryLink/dsh-click) |
| `dsh-talk` | `dsh-talk` | 0.3.10 | 语音能力：文本转语音与语音转文本，带静音与说即聊控制。 | [PerryLink/dsh-talk](https://github.com/PerryLink/dsh-talk) |
| `dsh-draw` | `dsh-draw` | 0.2.14 | 统一 image_generate 工具：OpenAI Images / Zhipu CogView 路由、健康感知回退、会话配额记账。 | [PerryLink/dsh-draw](https://github.com/PerryLink/dsh-draw) |
| `dsh-industry-research` | `dsh-industry-research` | 0.3.9 | 结构化公司/行业深研：来源捕获 + 可审计研究轨迹。 | [PerryLink/dsh-industry-research](https://github.com/PerryLink/dsh-industry-research) |
| `dsh-research-report` | `dsh-research-report` | 0.3.10 | 证据链研究报告：内容哈希封印来源目录，报告与来源不可分。 | [PerryLink/dsh-research-report](https://github.com/PerryLink/dsh-research-report) |
| `dsh-fund-research` | `dsh-fund-research` | 0.4.11 | 基金分析：收益、持仓与绩效归因。 | [PerryLink/dsh-fund-research](https://github.com/PerryLink/dsh-fund-research) |
| `dsh-library` | `dsh-library` | 0.2.11 | 本地文档知识库：语义+关键词混合检索、引用感知注入、SQLite 索引、本地嵌入零模型下载。 | [PerryLink/dsh-library](https://github.com/PerryLink/dsh-library) |
| `dsh-plugin-guide` | `dsh-plugin-guide` | 0.3.10 | 可安装的 DSH 插件开发指南技能：打包、契约、检查与构建校验器。 | [PerryLink/dsh-plugin-guide](https://github.com/PerryLink/dsh-plugin-guide) |
| `dsh-dsh-github` | `@perrylink/dsh-github` | 0.7.10 | GitHub 集成：PR/issue/仓库/文件工具、评审与 CI 检查——写操作全审批门、token 不落日志。 | [PerryLink/dsh-github](https://github.com/PerryLink/dsh-github) |
| `dsh-dsh-skill-pack-security-provider` | `@perrylink/dsh-skill-pack-security-provider` | 2.2.16 | 预打包安全评审技能 + 风险卡：host 与 client 双端交付。 | [PerryLink/dsh-skill-pack-security](https://github.com/PerryLink/dsh-skill-pack-security) |
| `dsh-dsh-ticktick` | `@perrylink/dsh-ticktick` | 0.1.7 | TickTick（滴答清单）任务桥：会话头任务面板 + 11 个精选 ticktick_* 工具 + 官方 MCP 端点上的设置卡片。 | [PerryLink/dsh-ticktick](https://github.com/PerryLink/dsh-ticktick) |
| `dsh-dsh-cert-mcp` | `@perrylink/dsh-cert-mcp` | 0.1.6 | 只读 MCP 服务器：暴露插件认证等级、快照与五维证据。（bundle 已发版） | [PerryLink/dsh-cert-mcp](https://github.com/PerryLink/dsh-cert-mcp) |
| `dsh-reach` | `dsh-reach` | 0.1.8 | 多通道决策与遥控桥：审批/提问卡片镜像到 IM（微信 iLink、Telegram、飞书），#token 稳定 id，聊天内直接应答。 | [PerryLink/dsh-reach](https://github.com/PerryLink/dsh-reach) |
| `dsh-autotier` | `dsh-autotier` | 0.2.3 | 强/便宜模型分档路由：意图门控落档、计划模式交接（强档规划便宜档执行）、工具/执行前高危守卫、TTL 回退。 | [PerryLink/dsh-autotier](https://github.com/PerryLink/dsh-autotier) |
| `dsh-team-rooms` | `dsh-team-rooms` | 1.0.1 | 连接独立会话与提供者 AI 成员的 DSH 团队房间。 | [PerryLink/dsh-team-rooms](https://github.com/PerryLink/dsh-team-rooms) |
| `dsh-plugin-upgrade-015` | `dsh-plugin-upgrade-015` | 0.1.1 | 0.1.5-alpha.1 → 0.1.5-rc.1 走廊的版本锁定升级技能：版本卡片 + 11 缝零依赖扫描器（npx CLI）。 | [PerryLink/dsh-plugin-upgrade-015](https://github.com/PerryLink/dsh-plugin-upgrade-015) |
| `dsh-dsh-plugin-kit` | `@perrylink/dsh-plugin-kit` | 0.1.9 | 插件工程工具箱：脚手架、生态名册、peer-range 同步与校验。 | [PerryLink/dsh-plugin-kit](https://github.com/PerryLink/dsh-plugin-kit) |
| `dsh-dsh-plugin-doctor` | `@perrylink/dsh-plugin-doctor` | 0.2.3 | 插件体检 CLI：安装/修复/审计。（bundle 已发版） | [PerryLink/dsh-plugin-doctor](https://github.com/PerryLink/dsh-plugin-doctor) |
| `dsh-plugin-upgrade-rc1` | `dsh-plugin-upgrade-rc1` | 0.1.0 | 0.1.5-alpha.1 → 0.1.5-rc.1 走廊的版本卡片 + 11 缝扫描器（015 已覆盖同走廊，本条为历史包） | [PerryLink/dsh-plugin-upgrade-rc1](https://github.com/PerryLink/dsh-plugin-upgrade-rc1) |

机器可读目录见 [`plugins.json`](plugins.json)。安装脚本会从该文件读取插件来源，避免 README 表格和安装命令发生漂移。

## 更新插件

下面的更新命令**逐条取自各插件上游仓库 README 的原生写法**（不是本目录自造的统一命令）。有些仓库写的是专门的 `update` 动词，多数是「重跑安装命令即更新」；`dsh` 命令要求 DSH CLI 已在 PATH，未全局安装时在前面加 `npx --yes -p @deepseek-ai/dsh` 即可。

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
| `dsh-auto-review` | `dsh plugin --profile web add dsh-auto-review` |
| `dsh-permission-rules` | `dsh plugin --profile web add dsh-permission-rules` |
| `dsh-doublecheck` | `dsh plugin --profile web add dsh-doublecheck` |
| `dsh-memento` | `dsh plugin --profile web add dsh-memento` |
| `dsh-checkpoint-rewind` | `dsh plugin --profile web add dsh-checkpoint-rewind` |
| `dsh-mcp-panel` | `dsh plugin --profile web add dsh-mcp-panel` |
| `dsh-composer-history` | `dsh plugin --profile web add dsh-composer-history` |
| `dsh-session-pin` | `dsh plugin --profile web add dsh-session-pin` |
| `dsh-session-sync` | `dsh plugin --profile web add dsh-session-sync` |
| `dsh-output-styles` | `dsh plugin --profile web add dsh-output-styles` |
| `dsh-lsp-actions` | `dsh plugin --profile web add dsh-lsp-actions` |
| `dsh-background-agents` | `dsh plugin --profile web add dsh-background-agents` |
| `dsh-claude-move` | `dsh plugin --profile web add dsh-claude-move` |
| `dsh-translate` | `dsh plugin --profile web add dsh-translate` |
| `dsh-local-ai` | `dsh plugin --profile web add dsh-local-ai` |
| `dsh-mask` | `dsh plugin --profile web add dsh-mask` |
| `dsh-data-quality` | `dsh plugin --profile web add dsh-data-quality` |
| `dsh-score` | `dsh plugin --profile web add dsh-score` |
| `dsh-test-drive` | `dsh plugin --profile web add dsh-test-drive` |
| `dsh-defend` | `dsh plugin --profile web add dsh-defend` |
| `dsh-budget` | `dsh plugin --profile web add dsh-budget` |
| `dsh-fast` | `dsh plugin --profile web add dsh-fast` |
| `dsh-observe` | `dsh plugin --profile web add dsh-observe` |
| `dsh-click` | `dsh plugin --profile web add dsh-click` |
| `dsh-talk` | `dsh plugin --profile web add dsh-talk` |
| `dsh-draw` | `dsh plugin --profile web add dsh-draw` |
| `dsh-industry-research` | `dsh plugin --profile web add dsh-industry-research` |
| `dsh-research-report` | `dsh plugin --profile web add dsh-research-report` |
| `dsh-fund-research` | `dsh plugin --profile web add dsh-fund-research` |
| `dsh-library` | `dsh plugin --profile web add dsh-library` |
| `dsh-plugin-guide` | `dsh plugin --profile web add dsh-plugin-guide` |
| `dsh-dsh-github` | `dsh plugin --profile web add @perrylink/dsh-github` |
| `dsh-dsh-skill-pack-security-provider` | `dsh plugin --profile web add @perrylink/dsh-skill-pack-security-provider` |
| `dsh-dsh-ticktick` | `dsh plugin --profile web add @perrylink/dsh-ticktick` |
| `dsh-dsh-cert-mcp` | `dsh plugin --profile web add @perrylink/dsh-cert-mcp` |
| `dsh-reach` | `dsh plugin --profile web add dsh-reach` |
| `dsh-autotier` | `dsh plugin --profile web add dsh-autotier` |
| `dsh-team-rooms` | `dsh plugin --profile web add dsh-team-rooms` |
| `dsh-plugin-upgrade-015` | `dsh plugin --profile web add dsh-plugin-upgrade-015` |
| `dsh-dsh-plugin-kit` | `dsh plugin --profile web add @perrylink/dsh-plugin-kit` |
| `dsh-dsh-plugin-doctor` | `dsh plugin --profile web add @perrylink/dsh-plugin-doctor` |
| `dsh-plugin-upgrade-rc1` | `dsh plugin --profile web add dsh-plugin-upgrade-rc1` |

> **说明（按各仓库 README 的原文口径）**
> - 多数插件（如 `dshmarket`、`dsh-skills` 等）README 没有单独列 update，更新就是重跑 README 里的 `add` 命令。
> - `dsh-pocket` 需要 `-w`（pnpm workspace 根限制）且跨大版本时 `--latest` 必须（`^0.x` 不会自动升到 1.x）。注意它现在装的是 fork `github:daha1216/dsh-pocket`：重跑形如 `add dsh-pocket -w` 的 npm 名命令会解析到 npm registry 上的**上游**版本，等于装回上游；要更新 fork 请用上表命令或 `add github:daha1216/dsh-pocket -w`。
> - `dshmarket` 本身是插件市场，README 说它**在设置页里自己就能一键更新**（含它自己）。
> - `anysearch-dsh` README 提供专门的 `update` 命令。
> - **registry 滞后提醒**：本机以 `github:` 源安装的插件，若重跑形如 `add <名字>@latest` 的原生命令，会被解析到 npm registry 源并可能拿到落后于 GitHub HEAD 的版本。对这类插件，更新时直接用显式 `github:<owner>/<repo>` spec 重跑 install 更可靠。
> - 一键安装 / 单独安装默认都取各插件上游的最新版；GitHub 插件跟随默认分支，npm 插件使用目录中记录的发布版本。想固定到某发行版时，可在 `plugins.json` 的 `install` 里固定版本或改用命令里的 release tar / tag 地址。
> - `dsh-retrace` README 原生命令是 npm 通道 `dsh plugin --profile web add dsh-retrace`（公开上游为 `yamingmou/dsh-retrace`）；本机安装的是 `github:daha1216/dsh-retrace` 兼容 fork，目录 `install` 跟随该 fork。
> - `dsh-font-customizer` README 原生是 `github:daha1216/dsh-font-customizer`；本机 `link:` 是本地开发态，目录指向其上游公开仓库。
> - `dsh-watcher` README 只给 `add github:aa2246740/dsh-watcher`（无独立 update 动词）；该上游暂无 tag / release，版本号取默认分支 `package.json` 快照，更新即重跑该 `add` 命令。
> - `dsh-plugin-oauth-subs` README 原生命令写的是完整仓库地址 `dsh plugin --profile web add https://github.com/xxww0098/dsh-plugin-oauth-subs`，本目录照抄；README 未给独立 update 命令。
> - 这些是上游 README 的原生命令，与上方 `install`（统一 `github:` 源码安装）可能走不同通道；已安装成源码/指定规范时，按你自己的安装方式重跑 `install` 也能达到同样效果。

## 安全与责任边界

这些插件会运行在用户自己的 DSH 进程中。安装前应阅读对应上游仓库的 README、权限说明、生命周期脚本和许可证。这个目录仅做索引，不代表对第三方插件的维护、担保或安全审计。

本目录的安装脚本使用 DSH 官方 `dsh plugin` 安装机制，不执行本地插件源码，也不会把插件源码上传到本仓库。
