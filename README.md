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
.\install.ps1 -Plugin dsh-recall-plugin
```

macOS / Linux：

```bash
bash install.sh --list
bash install.sh --plugin dsh-recall-plugin
```

也可以直接使用 DSH 官方安装命令。下面的安装源都是插件作者的上游 GitHub 仓库或 npm 发布包，不是本集合仓库的副本：

```powershell
npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:limbo947/dsh-recall-plugin
```

安装或更新完成后，重启 DSH Web UI。插件会在用户自己的 `~/.dsh/profiles/<profile>` 中安装。

## 插件目录

版本号是本目录最近一次核对时上游插件的版本快照；一键安装 / 单独安装都默认跟随对应 GitHub 仓库当前默认分支（即安装最新版）。需要固定到某个发布版本时，请在插件原仓库查看对应 tag 或 release，并在安装前自行确认兼容性。

| ID | 名称 | 版本 | 用途 | 来源 |
|---|---|---:|---|---|
| `dsh-better-sidebar` | `dsh-better-sidebar` | 0.15.1 | VS Code 风格右侧边栏，提供文件浏览、编辑器、终端、Git 和浏览器面板。 | [omdsh-dev/DSH-better-sidebar](https://github.com/omdsh-dev/DSH-better-sidebar) |
| `dshmarket` | `dshmarket` | 1.18.0 | DSH 社区插件市场，支持浏览、搜索和一键安装插件。 | [dsh-market/dsh-market](https://github.com/dsh-market/dsh-market) |
| `dsh-super-injector` | `@dsh-external/dsh-super-injector` | 0.3.3 | 运行时注入、热重载、卸载本地 DSH 插件，并提供插件管理界面。 | [yjh051108/dsh-super-injector](https://github.com/yjh051108/dsh-super-injector) |
| `dsh-notification` | `dsh-notification` | 0.1.3 | 请求完成后的浏览器桌面通知，支持结果和关键词过滤。 | [omdsh-dev/dsh-notification](https://github.com/omdsh-dev/dsh-notification) |
| `dsh-context` | `dsh-context` | 0.24.1 | 查看上下文的组成、用量和演变情况。 | [bowenliang123/dsh-context](https://github.com/bowenliang123/dsh-context) |
| `dsh-at-file` | `dsh-at-file` | 0.6.7 | 支持 Codex 风格的 `@path` 工作区路径引用。 | [omdsh-dev/dsh-at-file](https://github.com/omdsh-dev/dsh-at-file) |
| `dsh-skills` | `dsh-skills` | 0.1.1 | 聚合和管理全局、项目及 `.skill-package` 技能。 | [CocoSgt/dsh-skills](https://github.com/CocoSgt/dsh-skills) |
| `merge-tool-calls` | `@huanlin/dsh-plugin-merge-tool-calls` | 0.2.0 | 合并工具调用，减少多个工具调用造成的交互噪声。 | [HuanLinOTO/dsh-plugin-merge-tool-calls](https://github.com/HuanLinOTO/dsh-plugin-merge-tool-calls) |
| `dsh-pet` | `dsh-pet` | 0.1.7 | 在 DSH 网页界面显示可活动的桌面宠物。 | [PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet) |
| `dsh-pocket` | `dsh-pocket` | 1.12.3 | 通过手机扫码访问并同步电脑上的 DSH，支持局域网和公网。 | [shaobeichen/dsh-pocket](https://github.com/shaobeichen/dsh-pocket) |
| `dsh-usage-stats` | `dsh-usage-stats` | 1.0.0 | 提供 Token、缓存命中、账户余额和工作区别名统计看板。 | [Make0209/dsh-usage-stats](https://github.com/Make0209/dsh-usage-stats) |
| `dsh-drag-and-drop` | `@omdsh-dev/dsh-drag-and-drop` | 0.1.6 | 将本地文件拖入 DSH Web UI，并插入原始文件路径。 | [omdsh-dev/dsh-drag-and-drop](https://github.com/omdsh-dev/dsh-drag-and-drop) |
| `dsh-recall-plugin` | `dsh-recall-plugin` | 1.6.0 | 撤回消息，并将项目文件和对话历史回退到指定消息之前。 | [limbo947/dsh-recall-plugin](https://github.com/limbo947/dsh-recall-plugin) |
| `dsh-custom-provider-settings` | `dsh-custom-provider-settings` | 0.4.0 | 为自定义 Provider 增加请求头、图片输入和推理设置。 | [supersealwqas/dsh-custom-provider-settings](https://github.com/supersealwqas/dsh-custom-provider-settings) |
| `dsh-opencode-go-usage` | `@xueayi/dsh-opencode-go-usage` | 0.1.5 | 在悬浮 Web 面板中实时监控 OpenCode Go 的 5 小时滚动 / 周 / 月配额并展示用量。 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |
| `dsh-agent-teams` | `@nanmicoder/dsh-agent-teams` | 0.1.11 | 多智能体团队协作：队长、成员、带依赖的任务与消息传递，Web 界面提供树状监控。 | [NanmiCoder/dsh-agent-teams](https://github.com/NanmiCoder/dsh-agent-teams) |

机器可读目录见 [`plugins.json`](plugins.json)。安装脚本会从该文件读取插件来源，避免 README 表格和安装命令发生漂移。

## 更新插件

下面的更新命令**逐条取自各插件上游仓库 README 的原生写法**（不是本目录自造的统一命令）。有些仓库写的是专门的 `update` 动词，多数是「重跑安装命令即更新」；`dsh` 命令要求 DSH CLI 已在 PATH，未全局安装时在前面加 `npx --yes -p @deepseek-ai/dsh` 即可。

| ID | 更新命令（来自各插件 README） |
|---|---|
| `dsh-better-sidebar` | `dsh plugin --profile web add dsh-better-sidebar@latest` |
| `dshmarket` | `dsh plugin --profile web add dshmarket` |
| `dsh-super-injector` | `dsh plugin --profile web add github:yjh051108/dsh-super-injector` |
| `dsh-notification` | `dsh plugin --profile web add https://github.com/omdsh-dev/dsh-notification/archive/refs/tags/v0.1.3.tar.gz` |
| `dsh-context` | `dsh plugin --profile web add dsh-context@latest` |
| `dsh-at-file` | `dsh plugin --profile web add https://github.com/omdsh-dev/dsh-at-file/archive/refs/tags/v0.6.7.tar.gz` |
| `dsh-skills` | `dsh plugin --profile web add dsh-skills` |
| `merge-tool-calls` | `dsh plugin --profile web add "github:huanlinoto/dsh-plugin-merge-tool-calls"` |
| `dsh-pet` | `dsh plugin --profile web add dsh-pet` |
| `dsh-pocket` | `dsh plugin --profile web update dsh-pocket --latest -w` |
| `dsh-usage-stats` | `dsh plugin --profile web add dsh-usage-stats` |
| `dsh-drag-and-drop` | `dsh plugin --profile web update github:omdsh-dev/dsh-drag-and-drop` |
| `dsh-recall-plugin` | `dsh plugin --profile web add dsh-recall-plugin` |
| `dsh-custom-provider-settings` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:supersealwqas/dsh-custom-provider-settings` |
| `dsh-opencode-go-usage` | `dsh plugin --profile web update @xueayi/dsh-opencode-go-usage` |
| `dsh-agent-teams` | `dsh plugin --profile web add @nanmicoder/dsh-agent-teams` |

> **说明（按各仓库 README 的原文口径）**
> - 多数插件（如 `dsh-better-sidebar`、`merge-tool-calls`、`dsh-market`、`dsh-skills` 等）README 没有单独列 update，更新就是重跑 README 里的 `add` 命令。
> - `dsh-notification` / `dsh-at-file` 走 release tar 包：升级时把链接里的 tag `v0.1.3` / `v0.6.7` 换成上游最新 tag。
> - `dsh-pocket` 需要 `-w`（pnpm workspace 根限制）且跨大版本时 `--latest` 必须（`^0.x` 不会自动升到 1.x）。
> - `dshmarket` 本身是插件市场，README 说它**在设置页里自己就能一键更新**（含它自己）。
> - **registry 滞后提醒**：本机以 `github:` 源安装的插件，若重跑形如 `add <名字>@latest` 的原生命令，会被解析到 npm registry 源并可能拿到落后于 GitHub HEAD 的版本（实测 `dsh-notification` 在 registry 上只有 0.1.1，GitHub 已是 0.1.3；`@omdsh-dev/dsh-drag-and-drop` 甚至未发布到 registry）。对这类插件，更新时直接用显式 `github:<owner>/<repo>` spec 重跑 install 更可靠。
> - 一键安装 / 单独安装默认都取各插件上游的最新版；GitHub 插件跟随默认分支，npm 插件使用目录中记录的发布版本。想固定到某发行版时，可在 `plugins.json` 的 `install` 里固定版本或改用命令里的 release tar / tag 地址。
> - `dsh-context` 当前固定使用 npm `0.24.1`：其 GitHub 源快照不包含发布后的 `lib/client.js`，直接按 GitHub 源安装会导致 Web bundle 返回 404；npm 发布包包含完整构建产物。
> - 这些是上游 README 的原生命令，与上方 `install`（统一 `github:` 源码安装）可能走不同通道；已安装成源码/指定规范时，按你自己的安装方式重跑 `install` 也能达到同样效果。

## 安全与责任边界

这些插件会运行在用户自己的 DSH 进程中。安装前应阅读对应上游仓库的 README、权限说明、生命周期脚本和许可证。这个目录仅做索引，不代表对第三方插件的维护、担保或安全审计。

本目录的安装脚本使用 DSH 官方 `dsh plugin` 安装机制，不执行本地插件源码，也不会把插件源码上传到本仓库。
