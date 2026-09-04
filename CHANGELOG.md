# Changelog

## 2026-09-04 插件目录与实装同步（第三轮）

- 新增本机已安装但目录未收录的 `dsh-plugin-oauth-subs` `0.0.70`，来源为 `xxww0098/dsh-plugin-oauth-subs`（ChatGPT Codex / xAI Grok / 智谱 GLM / AWS Kiro / Google Antigravity / Cursor 订阅 OAuth 接入）；更新命令取自其 README 原生 `update` 动词 `dsh plugin --profile web update dsh-plugin-oauth-subs`。
- 刷新上游版本快照（8 项）：`dsh-better-sidebar` `0.18.0-alpha.0` → `0.18.0`（npm `latest` 已由正式版接管）、`dsh-better-reasoning-effort` `0.3.3` → `0.3.5`、`dshmarket` `1.38.1` → `1.42.0`、`dsh-pet` `0.2.3` → `0.2.5`、`dsh-pocket` `2.10.0` → `2.10.3`、`@michengai/dsh-archive-manager` `0.1.21` → `0.1.30`、`dsh-all-usage` `1.1.2` → `1.1.4`、`billion-context-dsh` `0.2.15` → `0.2.19`。
- 随快照同步 `install` 里的固定版本 spec：`dsh-pet@0.2.5`、`billion-context-dsh@0.2.19`。
- 复核了本轮全部有版本变化插件的上游 README，各条 `update` 命令与原生写法一致，无需改动；schema 本就允许 `update` 可选字段。
- 目录版本 `1.21.0` → `1.22.0`，核对日期 `2026-09-04`。本轮只维护目录，没有安装、升级或卸载本机插件。

## 2026-08-31 插件目录与实装同步（第二轮）

- 按当前 `web` profile 的实际安装清单，将目录收敛为 13 个插件；移除已卸载的 `dsh-custom-provider-settings`、`dsh-provider-model-configurator` 和 `dsh-recall-plugin`。
- 新增本机已安装但目录未收录的 `dsh-better-reasoning-effort` `0.3.3`，来源为 `HaoyueQin/dsh-better-reasoning-effort`。
- 刷新上游版本快照：`@michengai/dsh-archive-manager` `0.1.19` → `0.1.21`，`billion-context-dsh` `0.2.13` → `0.2.15`。
- 按上游 README 原文校正 `dsh-pet` 更新命令，并补齐 `dsh-better-reasoning-effort` 的 GitHub 更新命令。
- 本轮只维护目录仓库，没有安装、升级或卸载本机插件；用户对本机插件的自定义配置未被触碰。

## 2026-08-31 dsh-pet v0.2.3 安全更新

- 更新 `dsh-pet`：`0.2.2` → `0.2.3`，按上游发布说明执行 `dsh plugin --profile web add dsh-pet@0.2.3`。
- 新增点击宠物进行 AI 多轮对话、持久化记忆、`/chat` 与 `/pet` 命令，并为宠物配置新增 `name`。
- 修复 DSH Desktop 2.0.3+ 高级模式下因 403 导致桌宠不显示的问题，以及 macOS Electron 下载问题；同时补充 Linux 支持。
- 旧版配置可直接兼容；本机旧配置中的宠物 `main` 暂无 `name`，运行时已自动按 `id` 处理。
- 更新前已完整备份 web profile 配置、数据、补丁和旧插件目录；重启后服务正常监听 `0.0.0.0:3080`，未发现插件加载错误。

## 2026-08-31 插件目录与实装同步

- 新增本机已安装但目录尚未收录的 `@anysearch/anysearch-dsh` `0.1.4`、`@tt-a1i/archify-dsh` `0.1.0`、`dsh-provider-model-configurator` `0.3.9` 和 `dsh-recall-plugin` `2.3.0`。
- 移除本机已卸载的 `dsh-notification` 与 `dsh-font` 目录条目。
- 刷新上游版本快照：`dsh-better-sidebar` `0.17.1` → `0.18.0-alpha.0`、`dshmarket` `1.36.0` → `1.38.1`、`dsh-pocket` `2.8.0` → `2.10.0`。
- 补齐新增插件 README 原生更新命令；本次只维护目录，没有升级、安装或卸载本机插件。

## 2026-08-30 dsh-all-usage 安装

- 安装 `dsh-all-usage`：`1.1.2`，来源为 `ParticleLight/dsh-all-usage`，锁定提交 `ff20ec5cd5a321e1e1465d731b315b618328e450`。
- 插件提供按模型、供应商、工作区和时间范围分析 Token、缓存与账户余额的用量看板，并支持热力图和 CSV 导出。
- 安装前已备份 web profile、用户数据、锁文件和自定义补丁；供应链锁文件校验通过，重启 DSH 后服务正常监听 `3080`。

## 2026-08-30 EasyRewrite 安装与 DSH Archive Manager 更新

- 安装 `dsh-easyrewrite`：未安装 → `2.3.1`，来源为 `Renzic-Stone/DSH-EasyRewrite`，锁定 GitHub 提交 `47ebb656216c634001a4f73f0de71bc63e017951`。
- 更新 `@michengai/dsh-archive-manager`：`0.1.18` → `0.1.19`，按用户指定的官方发布版本安装。
- Archive Manager `0.1.19` 修复工作区行 `+` 操作，运行时解析 `uiWorkspace`，移除对已废弃 `startSession` API 的依赖。
- EasyRewrite 当前提供消息撤回、气泡内联编辑、重发、版本翻页和草稿备份；GitHub 包的 `prepare` 构建仅对白名单中的精确提交放行。
- 更新前已备份 web profile、用户数据、锁文件和自定义补丁；重启 DSH 后两个插件均已加载，网页返回 HTTP 200。

## 2026-08-29 活动插件更新与停用插件清理

- 更新 `dshmarket`：`1.29.2` → `1.36.0`，锁定 GitHub 提交 `61ccc2dce42d7785bbc02c3a662b1e3008dca335`。
- 更新 `dsh-pet`：`0.1.8` → `0.2.2`，锁定 GitHub 提交 `1684514b0f17dde5f2559cfd3298b291ae015a3b`。
- 更新 `dsh-pocket`：`1.14.5` → `2.8.0`，锁定 GitHub 提交 `e108b817dfde9d815af9fee45dc594afa8cc0674`。
- 卸载已停用的 `dsh-at-file`、`dsh-context`、`dsh-docs-panel`、`@omdsh-dev/dsh-drag-and-drop` 和 `@huanlin/dsh-plugin-merge-tool-calls`，并同步从目录中移除。
- 更新前已备份 web profile 配置、锁文件和插件目录；仅为本轮实际构建提交加入 `allowBuilds` 白名单。`cordis.patch.yml` 等用户自定义配置保持不变。

## 2026-08-28 dsh-better-sidebar 与 DSH Archive Manager 安全更新

- `dsh-better-sidebar`：`0.16.1` → `0.17.1`。上游近期变更包含子代理页批量实时预览、拖拽状态稳定性改进、DSH rc.1/rc.2 适配，以及上传链路和 workspace 路径边界安全加固。
- `@michengai/dsh-archive-manager`：`0.1.16` → `0.1.18`。按上游 npm 官方发布包更新；该插件继续提供归档会话搜索、恢复和确认后永久删除能力。
- 更新前已备份 web profile：`backups/plugin-update-20260829-003704/`。两项更新均通过官方 npm registry 完成；侧边栏需要硬刷新，Archive Manager 建议重启 DSH Web 后再硬刷新。

## 2026-08-26 dsh-easyrewrite 安全更新

- 版本：`2.1.0` → `2.3.0`
- 来源：`Renzic-Stone/DSH-EasyRewrite`，锁文件固定到提交 `1172ca10f6c1d595ad231f9a2a72af290682507d`。
- 新增编辑气泡时切换模型与推理等级，选择只对本次重发生效；长模型名会自动省略，避免挤压操作按钮。
- 新增编辑态拖入图片和刷新后恢复编辑进度；修复撤回或编辑重发时丢失原模型与思考挡位，以及部分自动重发未执行的问题。
- 安装前已备份 web profile；仅放行上述精确提交的 `prepare` 构建脚本。重启 `dsh web` 后生效。

## 2026-08-26 插件更新（第五轮：web profile 安全更新）

本轮先备份 `web` profile 的 `package.json` 和 `pnpm-lock.yaml`，再按各插件原生命令串行更新。7 个有上游更新的插件均已安装成功；pnpm 只放行了本轮实际解析出的插件构建脚本，未放开任意依赖脚本。

| 插件 | 版本变化 |
|---|---:|
| `@xueayi/dsh-opencode-go-usage` | 0.1.5 → 0.1.6 |
| `billion-context-dsh` | 0.2.12 → 0.2.13 |
| `dsh-context` | 0.29.0 → 0.31.0 |
| `dsh-better-sidebar` | 0.16.0 → 0.16.1 |
| `dsh-custom-provider-settings` | 0.4.0 → 0.5.0 |
| `dsh-pocket` | 1.13.4 → 1.14.5 |
| `dshmarket` | 1.22.0 → 1.29.2 |

- `@xueayi/dsh-opencode-go-usage`：新增可拖动用量浮窗、视口边界自适应和只显示 5 小时额度环的极简模式。
- `billion-context-dsh`：补充 `coreOverrides.nudge` 配置优先级和合并顺序说明；`0.3.0` 仍不是 npm `latest`，未安装。
- `dsh-context`：工具结果状态/行数/Raw-Markdown 切换、失败状态点、Delta 签名、单步缓存命中率和 Step brief；本机 `latest` 实际解析为 `0.31.0`。
- `dsh-better-sidebar`：提高 Git 探测超时，限制仓库发现和状态返回数量，加入缓存、截断提示与 sidebar reset 逃生入口。
- `dsh-custom-provider-settings`：新增全局请求头、User-Agent 预设及 `supportsDeveloperRole` 兼容设置。
- `dsh-pocket`：修复 Windows 启动、WebSocket 半开连接、WSL/LAN 设置问题，增加局域网访问开关并改善 tunnel 错误信息。
- `dshmarket`：新增命名插件预设、profile 快照/回滚、缺失依赖诊断、卸载保护、多分类及构建脚本处理改进。

profile 备份：`backups/plugin-update-20260826-023625/`。更新后建议重启 `dsh web` 并硬刷新浏览器。

## 2026-08-22 插件更新（第三轮：web profile 全量核对）

本轮按已安装的 `web` profile 逐项执行上游 README 原生命令，完成 15 个远程插件的更新核对；本地 link 插件 `@dsh-external/dsh-super-injector` 保持不变。

### 版本变化

| 插件 | 版本 |
|---|---|
| `dsh-better-sidebar` | 0.15.0 → 0.15.1 |
| `dshmarket` | 1.17.1 → 1.18.0 |
| `dsh-context` | 0.22.2 → 0.24.1 |
| `dsh-pet` | 0.1.6 → 0.1.7 |
| `dsh-pocket` | 1.9.2 → 1.12.3 |
| `dsh-recall-plugin` | 1.5.1 → 1.6.0 |

其余已核对插件的版本快照保持不变：`dsh-notification` 0.1.3、`dsh-at-file` 0.6.7、`dsh-skills` 0.1.1、`@huanlin/dsh-plugin-merge-tool-calls` 0.2.0、`dsh-usage-stats` 1.0.0、`@omdsh-dev/dsh-drag-and-drop` 0.1.6、`dsh-custom-provider-settings` 0.4.0、`@xueayi/dsh-opencode-go-usage` 0.1.5、`@nanmicoder/dsh-agent-teams` 0.1.11。

### dsh-context 安装源修正

- `dsh-context@0.24.1` 改用 npm 发布包安装。
- 原因：GitHub 源快照只有 `package.json`、补丁和文档，没有发布后的 `lib/client.js`；DSH 启动清单虽会登记插件，但浏览器请求会返回 404。
- npm `0.24.1` 包含完整 `lib/client.js` 与 `lib/index.js`，重启后已验证客户端资源返回 HTTP 200。

### 验证

- `pnpm install` 成功，锁文件通过供应链策略检查。
- 正式启动脚本重启成功，`http://127.0.0.1:3080/` 返回 HTTP 200。
- 当前页面共登记 58 个客户端 bundle，逐个 GET 检查全部返回 HTTP 200。
- `@nanmicoder/dsh-agent-teams` 客户端资源返回 HTTP 200。
- 保留的历史 `cordis.patch.yml` 警告：`context-vista`、`dsh-usage-plugin`、`smooth-stream`；它们不是本轮更新引入的问题，未修改。

## 2026-08-21 插件更新（第二轮：检查并更新 + 新装 dsh-context）

本次检查全部 16 个目录条目：3 个插件有更新、1 个按需新装、1 处版本快照修正；其余 11 个已与上游 HEAD 一致。**本轮应用户要求未重启 `dsh web`，新版本在下次重启后加载（之后硬刷新浏览器）。**

### dsh-better-sidebar
- 版本：0.14.0 → 0.14.2
- 来源：[omdsh-dev/DSH-better-sidebar](https://github.com/omdsh-dev/DSH-better-sidebar)
- 变更：侧边卡片设置页 UI/UX 现代化——卡片底部设置条替代隐形齿轮 (#300)；子代理页实时预览改为批量接口，避免 O(N²) history 请求风暴 (#298)；侧边对话——每对话一 Tab（Codex 对齐）+ 完整上下文继承 (#286)；文件树支持上传文件进工作区 (#239)。
- 注意：README 原生命令 `add dsh-better-sidebar@latest` 会解析到 npm registry 源（当前仅 0.14.0）并把 spec 从 `github:` 改写为 `^0.14.0`；本次实际用 `add github:omdsh-dev/DSH-better-sidebar` 完成升级并恢复源。
- 生效：重启 `dsh web` 后硬刷新。

### dshmarket
- 版本：1.16.2 → 1.17.1
- 来源：[dsh-market/dsh-market](https://github.com/dsh-market/dsh-market)
- 变更：安装失败时显示 pnpm 自己的报错并分类 store 不匹配 (#252)；卡片网格改瀑布流布局不再留空洞 (#251)；捕获停止解析的 client bundle 并提示还原路径中的机器相关路径 (#248)。
- 生效：重启后硬刷新。

### dsh-pet
- 版本：0.1.4 → 0.1.6
- 来源：[PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet)
- 变更：宠物多开——支持配置多个独立大小位置的桌宠；新增「桌宠配置」设置页；91 个动作素材全量改用 PR 手工抠像素材并重新生成缩略图/预览；修复单元素动画池排除自身导致选中 undefined。
- 过程：tarball 约 98MB，默认 60s 拉取超时反复中断；已在 profile 的 pnpm-workspace.yaml 设 `fetchTimeout: 900000` / `fetchRetries: 5` 后一次拉成。裸名 `add dsh-pet` 对 `github:` 源依赖是 no-op，实际用 `add github:PC2005-cloud/dsh-pet#path:dsh-pet`。
- 生效：必须重启 `dsh web`。提醒：iOS Safari 无法解码其 VP9 WebM，手机端如不显示可按 pet-mobile 流程禁用移动端挂载。

### dsh-context（新安装）
- 版本：0.19.2（原目录快照）→ 0.21.0
- 来源：[bowenliang123/dsh-context](https://github.com/bowenliang123/dsh-context)
- 说明：该条目此前一直在目录中但本机未装，本轮应用户选择装入 web profile（`add github:bowenliang123/dsh-context`），纳入日常更新范围。

### 目录快照修正
- `dsh-drag-and-drop`：0.1.5 → 0.1.6（仅快照刷新；本机与上游 HEAD 均已是 0.1.6，无实际更新）。

### 过程记录
- modlens@3.22.1 发布未满 24h 触发 pnpm 锁文件供应链校验失败（minimumReleaseAge）；等待至发布满 24h 自然出窗，未放宽任何安全策略。
- allowBuilds 新增精确键：dshmarket(f2172056)、dsh-pet(52b313c)、dsh-context(0a028ac)、dsh-better-sidebar(f268d35)；并将 CLI 留下的两处占位值 `set this to true or false` 修正为 `true`。
- 其余 11 个插件核对结果：modlens 3.22.1、super-injector 0.3.3（本地 link）、notification v0.1.3 / at-file v0.6.7（均为最新 tag）、skills 0.1.1、merge-tool-calls 0.2.0、pocket 1.9.2、usage-stats 1.0.0、recall-plugin 1.5.1、custom-provider-settings 0.4.0、opencode-go-usage 0.1.5 —— 全部与上游一致。

## 2026-08-21 插件更新

本次更新 4 个已安装插件（web profile）：

### @liustack/modlens
- 版本：3.22.0 → 3.22.1
- 来源：[liustack/modlens](https://github.com/liustack/modlens)
- 变更：设置页里的 modlens 卡片现在跟随 DSH 当前语言显示（不再受构建时冻结的 `<html lang>` 影响），并订阅 dsh 的 locale 服务实时切换；加载/保存失败时的兜底文案也改用卡片语言。
- 生效：更新后重启 `dsh web` 并硬刷新浏览器。

### dshmarket
- 版本：1.15.0 → 1.16.2
- 来源：[dsh-market/dsh-market](https://github.com/dsh-market/dsh-market)
- 变更：修复代理环境下达 pnpm 的问题；CRLF 行尾的 workspace 文件保持有效；长 tag 不再让表格行换行。
- 生效：硬刷新浏览器即可；如界面未更新则重启 `dsh web`。

### dsh-at-file
- 版本：0.6.5 → 0.6.7
- 来源：[omdsh-dev/dsh-at-file](https://github.com/omdsh-dev/dsh-at-file)
- 变更：修复跟随 workspace 符号链接的问题；让 `@path` 候选在重名时更可区分。
- 生效：上游 README 要求重启 `dsh web`，之后硬刷新浏览器。

### dsh-pocket
- 版本：1.8.3 → 1.9.2
- 来源：[shaobeichen/dsh-pocket](https://github.com/shaobeichen/dsh-pocket)
- 变更：设置页局域网区块布局微调——「局域网访问密码 | LAN access PIN」开关行移到「手机连接同一 WiFi 后扫码即可打开」文案之后。
- 生效：必须重启 `dsh web`（插件内更新/重启按钮在桌面版自动停用），再硬刷新浏览器。

### 说明
- `dsh-context` 在目录中但本机未安装，本次未更新。
- `@dsh-external/dsh-super-injector` 保持本地 link 安装，本次未动。
- `dshmarket` 因本机是 `github:dsh-market/dsh-market` 安装，重跑目录里 README 原生命令 `add dshmarket` 不会改 GitHub 源依赖，本次实际用安装源 `add github:dsh-market/dsh-market` 完成升级。
- pnpm 更新期间已按提示把新 tarball 加入 `allowBuilds`，并把 `@liustack/modlens@3.22.1` 加入 `minimumReleaseAgeExclude`。
## 2026-08-24 插件更新（第四轮：web profile 安全更新）

本轮按上游 README 原生命令更新 8 个已安装插件，并使用 GitHub 源复核了 npm 镜像可能滞后的插件。profile 已备份到 `~/.dsh/profiles/web/backups/plugin-update-20260824-184222/`。

| 插件 | 版本 |
|---|---:|
| `dsh-better-sidebar` | 0.15.1 → 0.16.0 |
| `dshmarket` | 1.18.0 → 1.22.0 |
| `dsh-context` | 0.24.1 → 0.30.3 |
| `dsh-at-file` | 0.6.7 → 0.6.8 |
| `@huanlin/dsh-plugin-merge-tool-calls` | 0.2.0 → 0.2.2 |
| `dsh-pet` | 0.1.7 → 0.1.8 |
| `dsh-pocket` | 1.12.3 → 1.13.4 |
| `@nanmicoder/dsh-agent-teams` | 0.1.12 → 0.1.13 |

- `dshmarket`：上游 1.22.0 的构建与 preflight 检查通过。
- `dsh-context`：更新到 0.30.3；README 说明无需构建步骤或重启。
- `dsh-at-file`：更新到 v0.6.8；README 提醒新安装可优先使用 DSH 官方内置 `@file`/`@session`。
- `merge-tool-calls`：更新到 0.2.2；保留连续工具调用合并、工具族和分组配置能力。
- `dsh-pet`：更新到 0.1.8；上游 typecheck、lint、格式检查、bundle 和 prepack 检查全部通过。
- `dsh-pocket`：更新到 1.13.4；继续使用上游 GitHub 构建源。
- `dsh-better-sidebar` 与 `dsh-agent-teams`：分别更新到 0.16.0 和 0.1.13。
- pnpm 仅批准了本轮实际解析出的精确 Git/tarball 构建项；未放开任意依赖脚本。更新后建议重启 `dsh web`，再硬刷新浏览器。
