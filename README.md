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
npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:Renzic-Stone/DSH-EasyRewrite
```

安装或更新完成后，重启 DSH Web UI。插件会在用户自己的 `~/.dsh/profiles/<profile>` 中安装。

## 插件目录

版本号是本目录最近一次核对时上游插件的版本快照；一键安装 / 单独安装都默认跟随对应 GitHub 仓库当前默认分支（即安装最新版）。需要固定到某个发布版本时，请在插件原仓库查看对应 tag 或 release，并在安装前自行确认兼容性。

| ID | 名称 | 版本 | 用途 | 来源 |
|---|---|---:|---|---|
| `dsh-better-sidebar` | `dsh-better-sidebar` | 0.18.0-alpha.0 | VS Code 风格右侧边栏，提供文件浏览、编辑器、终端、Git 和浏览器面板。 | [omdsh-dev/DSH-better-sidebar](https://github.com/omdsh-dev/DSH-better-sidebar) |
| `dshmarket` | `dshmarket` | 1.38.1 | DSH 社区插件市场，支持浏览、搜索和一键安装插件。 | [dsh-market/dsh-market](https://github.com/dsh-market/dsh-market) |
| `dsh-skills` | `dsh-skills` | 0.1.1 | 聚合和管理全局、项目及 `.skill-package` 技能。 | [CocoSgt/dsh-skills](https://github.com/CocoSgt/dsh-skills) |
| `dsh-pet` | `dsh-pet` | 0.2.2 | 在 DSH 网页界面显示可活动的桌面宠物。 | [PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet) |
| `dsh-pocket` | `dsh-pocket` | 2.10.0 | 通过手机扫码访问并同步电脑上的 DSH，支持局域网和公网。 | [shaobeichen/dsh-pocket](https://github.com/shaobeichen/dsh-pocket) |
| `dsh-archive-manager` | `@michengai/dsh-archive-manager` | 0.1.19 | 管理已归档的 DSH 会话。 | [MichengAI/dsh-archive-manager](https://github.com/MichengAI/dsh-archive-manager) |
| `dsh-custom-provider-settings` | `dsh-custom-provider-settings` | 0.5.0 | 为自定义 Provider 增加请求头、图片输入和推理设置。 | [supersealwqas/dsh-custom-provider-settings](https://github.com/supersealwqas/dsh-custom-provider-settings) |
| `dsh-opencode-go-usage` | `@xueayi/dsh-opencode-go-usage` | 0.1.6 | 在悬浮 Web 面板中实时监控 OpenCode Go 的 5 小时滚动 / 周 / 月配额并展示用量。 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |
| `dsh-easyrewrite` | `dsh-easyrewrite` | 2.3.1 | 在 Web 里内联编辑与撤回自己的消息：气泡原位编辑、无痕替换、版本翻页器。 | [Renzic-Stone/DSH-EasyRewrite](https://github.com/Renzic-Stone/DSH-EasyRewrite) |
| `dsh-all-usage` | `dsh-all-usage` | 1.1.2 | 按模型、供应商、工作区和时间范围分析 Token、缓存与账户余额，并支持热力图和 CSV 导出。 | [ParticleLight/dsh-all-usage](https://github.com/ParticleLight/dsh-all-usage) |
| `anysearch-dsh` | `@anysearch/anysearch-dsh` | 0.1.4 | 为 DSH 提供网页搜索、网页抓取及高级搜索工具。 | [anysearch-team/anysearch-dsh](https://github.com/anysearch-team/anysearch-dsh) |
| `archify-dsh` | `@tt-a1i/archify-dsh` | 0.1.0 | 为 DSH 提供 Archify 架构图 Skill 的纯 Skill Bundle。 | [tt-a1i/archify](https://github.com/tt-a1i/archify) |
| `dsh-provider-model-configurator` | `dsh-provider-model-configurator` | 0.3.9 | 在各 Provider 中查看、新建、编辑、复制和删除模型配置。 | [LiangYin233/dsh-provider-model-configurator](https://github.com/LiangYin233/dsh-provider-model-configurator) |
| `dsh-recall-plugin` | `dsh-recall-plugin` | 2.3.0 | 将项目文件快照与对话历史一并撤回到指定用户消息发送之前。 | [limbo947/dsh-recall-plugin](https://github.com/limbo947/dsh-recall-plugin) |
| `billion-context-dsh` | `billion-context-dsh` | 0.2.13 | 通过模型驱动的上下文裁剪管理 DSH 上下文，作为 CompactionEngine 后端工作。 | [Tyan66666/billion-context-dsh](https://github.com/Tyan66666/billion-context-dsh) |

机器可读目录见 [`plugins.json`](plugins.json)。安装脚本会从该文件读取插件来源，避免 README 表格和安装命令发生漂移。

## 更新插件

下面的更新命令**逐条取自各插件上游仓库 README 的原生写法**（不是本目录自造的统一命令）。有些仓库写的是专门的 `update` 动词，多数是「重跑安装命令即更新」；`dsh` 命令要求 DSH CLI 已在 PATH，未全局安装时在前面加 `npx --yes -p @deepseek-ai/dsh` 即可。

| ID | 更新命令（来自各插件 README） |
|---|---|
| `dsh-better-sidebar` | `dsh plugin --profile web add dsh-better-sidebar@latest` |
| `dshmarket` | `dsh plugin --profile web add dshmarket` |
| `dsh-skills` | `dsh plugin --profile web add dsh-skills` |
| `dsh-pet` | `dsh plugin --profile web add dsh-pet` |
| `dsh-pocket` | `dsh plugin --profile web update dsh-pocket --latest -w` |
| `dsh-archive-manager` | `dsh plugin --profile web add @michengai/dsh-archive-manager@latest --registry=https://registry.npmjs.org/` |
| `dsh-custom-provider-settings` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:supersealwqas/dsh-custom-provider-settings` |
| `dsh-opencode-go-usage` | `dsh plugin --profile web update @xueayi/dsh-opencode-go-usage` |
| `dsh-easyrewrite` | `dsh plugin --profile web add github:Renzic-Stone/DSH-EasyRewrite` |
| `dsh-all-usage` | `dsh plugin --profile web add github:ParticleLight/dsh-all-usage` |
| `anysearch-dsh` | `npx -y @deepseek-ai/dsh plugin --profile web update @anysearch/anysearch-dsh` |
| `archify-dsh` | `dsh plugin --profile web add @tt-a1i/archify-dsh@0.1.0` |
| `dsh-provider-model-configurator` | `dsh plugin --profile web add github:LiangYin233/dsh-provider-model-configurator#v0.3.9` |
| `dsh-recall-plugin` | `dsh plugin --profile web add github:limbo947/dsh-recall-plugin` |
| `billion-context-dsh` | `dsh plugin --profile web add billion-context-dsh` |

> **说明（按各仓库 README 的原文口径）**
> - 多数插件（如 `dsh-better-sidebar`、`dshmarket`、`dsh-skills` 等）README 没有单独列 update，更新就是重跑 README 里的 `add` 命令。
> - `dsh-pocket` 需要 `-w`（pnpm workspace 根限制）且跨大版本时 `--latest` 必须（`^0.x` 不会自动升到 1.x）。
> - `dshmarket` 本身是插件市场，README 说它**在设置页里自己就能一键更新**（含它自己）。
> - `anysearch-dsh` README 提供专门的 `update` 命令；`archify-dsh` 要求使用预构建 npm 包并固定精确版本，不应从 Git 源安装。
> - `dsh-provider-model-configurator` README 使用版本 tag 安装；`dsh-recall-plugin` 没有单独的 update 命令，更新时重跑其 GitHub 安装命令。
> - **registry 滞后提醒**：本机以 `github:` 源安装的插件，若重跑形如 `add <名字>@latest` 的原生命令，会被解析到 npm registry 源并可能拿到落后于 GitHub HEAD 的版本。对这类插件，更新时直接用显式 `github:<owner>/<repo>` spec 重跑 install 更可靠。
> - 一键安装 / 单独安装默认都取各插件上游的最新版；GitHub 插件跟随默认分支，npm 插件使用目录中记录的发布版本。想固定到某发行版时，可在 `plugins.json` 的 `install` 里固定版本或改用命令里的 release tar / tag 地址。
> - `dsh-easyrewrite` README 原生给的是 `add` 命令，重跑即更新。
> - 这些是上游 README 的原生命令，与上方 `install`（统一 `github:` 源码安装）可能走不同通道；已安装成源码/指定规范时，按你自己的安装方式重跑 `install` 也能达到同样效果。

## 安全与责任边界

这些插件会运行在用户自己的 DSH 进程中。安装前应阅读对应上游仓库的 README、权限说明、生命周期脚本和许可证。这个目录仅做索引，不代表对第三方插件的维护、担保或安全审计。

本目录的安装脚本使用 DSH 官方 `dsh plugin` 安装机制，不执行本地插件源码，也不会把插件源码上传到本仓库。
