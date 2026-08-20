# DSH Plugin Collection

DeepSeek Harness（DSH）第三方插件目录。这里**只维护插件索引和安装入口，不复制或重新发布任何插件源码**；每个条目都指向插件作者自己的 GitHub 仓库。

## 一键安装全部插件

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

先列出插件：

```powershell
.\install.ps1 -List
```

然后按目录 ID 安装：

```powershell
.\install.ps1 -Plugin dsh-recall-plugin
```

macOS / Linux：

```bash
bash install.sh --list
bash install.sh --plugin dsh-recall-plugin
```

也可以直接使用 DSH 官方安装命令。下面的安装源都是上游 GitHub 仓库，不是本集合仓库的副本：

```powershell
npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:limbo947/dsh-recall-plugin
```

安装或更新完成后，重启 DSH Web UI。插件会在用户自己的 `~/.dsh/profiles/<profile>` 中安装。

## 插件目录

版本号是本目录最近一次核对时上游插件的版本快照；安装脚本默认跟随对应 GitHub 仓库当前默认分支。需要固定到某个发布版本时，请在插件原仓库查看对应 tag 或 release，并在安装前自行确认兼容性。

| ID | 名称 | 版本 | 用途 | 来源 |
|---|---|---:|---|---|
| `dsh-better-sidebar` | `dsh-better-sidebar` | 0.14.0 | VS Code 风格右侧边栏，提供文件浏览、编辑器、终端、Git 和浏览器面板。 | [omdsh-dev/DSH-better-sidebar](https://github.com/omdsh-dev/DSH-better-sidebar) |
| `modlens` | `@liustack/modlens` | 3.22.0 | 为纯文本模型提供图片读取和视觉分析能力。 | [liustack/modlens](https://github.com/liustack/modlens) |
| `dshmarket` | `dshmarket` | 1.15.0 | DSH 社区插件市场，支持浏览、搜索和一键安装插件。 | [dsh-market/dsh-market](https://github.com/dsh-market/dsh-market) |
| `dsh-super-injector` | `@dsh-external/dsh-super-injector` | 0.3.3 | 运行时注入、热重载、卸载本地 DSH 插件，并提供插件管理界面。 | [yjh051108/dsh-super-injector](https://github.com/yjh051108/dsh-super-injector) |
| `dsh-notification` | `dsh-notification` | 0.1.3 | 请求完成后的浏览器桌面通知，支持结果和关键词过滤。 | [omdsh-dev/dsh-notification](https://github.com/omdsh-dev/dsh-notification) |
| `dsh-context` | `dsh-context` | 0.17.0 | 查看上下文的组成、用量和演变情况。 | [bowenliang123/dsh-context](https://github.com/bowenliang123/dsh-context) |
| `dsh-at-file` | `dsh-at-file` | 0.6.5 | 支持 Codex 风格的 `@path` 工作区路径引用。 | [omdsh-dev/dsh-at-file](https://github.com/omdsh-dev/dsh-at-file) |
| `dsh-skills` | `dsh-skills` | 0.1.1 | 聚合和管理全局、项目及 `.skill-package` 技能。 | [CocoSgt/dsh-skills](https://github.com/CocoSgt/dsh-skills) |
| `merge-tool-calls` | `@huanlin/dsh-plugin-merge-tool-calls` | 0.2.0 | 合并工具调用，减少多个工具调用造成的交互噪声。 | [HuanLinOTO/dsh-plugin-merge-tool-calls](https://github.com/HuanLinOTO/dsh-plugin-merge-tool-calls) |
| `dsh-pet` | `dsh-pet` | 0.1.4 | 在 DSH 网页界面显示可活动的桌面宠物。 | [PC2005-cloud/dsh-pet](https://github.com/PC2005-cloud/dsh-pet) |
| `dsh-pocket` | `dsh-pocket` | 1.8.3 | 通过手机扫码访问并同步电脑上的 DSH，支持局域网和公网。 | [shaobeichen/dsh-pocket](https://github.com/shaobeichen/dsh-pocket) |
| `dsh-usage-stats` | `dsh-usage-stats` | 1.0.0 | 提供 Token、缓存命中、账户余额和工作区别名统计看板。 | [Make0209/dsh-usage-stats](https://github.com/Make0209/dsh-usage-stats) |
| `dsh-drag-and-drop` | `@omdsh-dev/dsh-drag-and-drop` | 0.1.5 | 将本地文件拖入 DSH Web UI，并插入原始文件路径。 | [omdsh-dev/dsh-drag-and-drop](https://github.com/omdsh-dev/dsh-drag-and-drop) |
| `dsh-recall-plugin` | `dsh-recall-plugin` | 1.4.0 | 撤回消息，并将项目文件和对话历史回退到指定消息之前。 | [limbo947/dsh-recall-plugin](https://github.com/limbo947/dsh-recall-plugin) |
| `dsh-custom-provider-settings` | `dsh-custom-provider-settings` | 0.4.0 | 为自定义 Provider 增加请求头、图片输入和推理设置。 | [supersealwqas/dsh-custom-provider-settings](https://github.com/supersealwqas/dsh-custom-provider-settings) |
| `dsh-opencode-go-usage` | `@xueayi/dsh-opencode-go-usage` | 0.1.5 | 在悬浮 Web 面板中实时监控 OpenCode Go 的 5 小时滚动 / 周 / 月配额并展示用量。 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |

机器可读目录见 [`plugins.json`](plugins.json)。安装脚本会从该文件读取插件来源，避免 README 表格和安装命令发生漂移。

## 更新插件

下面每个插件的更新命令直接取自它的 GitHub 来源（`dsh plugin --profile web update github:<owner>/<repo>`，等价于在该 Web profile 内按上游默认分支重新拉取最新版本）。命令前统一带 `npx --yes -p @deepseek-ai/dsh`，与上方安装命令保持一致。

| ID | 更新命令 |
|---|---|
| `dsh-better-sidebar` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:omdsh-dev/DSH-better-sidebar` |
| `modlens` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:liustack/modlens` |
| `dshmarket` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:dsh-market/dsh-market` |
| `dsh-super-injector` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:yjh051108/dsh-super-injector` |
| `dsh-notification` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:omdsh-dev/dsh-notification` |
| `dsh-context` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:bowenliang123/dsh-context` |
| `dsh-at-file` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:omdsh-dev/dsh-at-file` |
| `dsh-skills` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:CocoSgt/dsh-skills` |
| `merge-tool-calls` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:HuanLinOTO/dsh-plugin-merge-tool-calls` |
| `dsh-pet` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:PC2005-cloud/dsh-pet#path:dsh-pet` |
| `dsh-pocket` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:shaobeichen/dsh-pocket` |
| `dsh-usage-stats` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:Make0209/dsh-usage-stats` |
| `dsh-drag-and-drop` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:omdsh-dev/dsh-drag-and-drop` |
| `dsh-recall-plugin` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:limbo947/dsh-recall-plugin` |
| `dsh-custom-provider-settings` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:supersealwqas/dsh-custom-provider-settings` |
| `dsh-opencode-go-usage` | `npx --yes -p @deepseek-ai/dsh dsh plugin --profile web update github:xueayi/dsh-opencode-go-usage` |

> **说明**
> - `dsh-context` 与 `dsh-usage-stats` 在本目录里固定（pin）到发布 tag（见 `plugins.json` 的 `install`）。上面的更新命令跟随上游默认分支拉取最新；若想继续固定到某个发行版，按新 tag 手动改回对应 `install` 即可。
> - `dsh-pet` 是 monorepo，更新命令保留 `#path:dsh-pet` 指向子包路径，不能省略。
> - 部分上游仓库在 README 里给出的是 npm registry 形式的命令（例如 `dsh plugin --profile web update dsh-context@latest`、`dsh plugin --profile web add dsh-better-sidebar@latest`、`npx -y @deepseek-ai/dsh plugin --profile web add @liustack/modlens@<版本>`、`dsh plugin --profile web add dsh-pocket -w`，以及 `dsh-notification` / `dsh-at-file` 的 release tar 包地址）。本目录统一采用 `github:` 形式，和 `install` 同源、不漂移。

## 安全与责任边界

这些插件会运行在用户自己的 DSH 进程中。安装前应阅读对应上游仓库的 README、权限说明、生命周期脚本和许可证。这个目录仅做索引，不代表对第三方插件的维护、担保或安全审计。

本目录的安装脚本使用 DSH 官方 `dsh plugin` 安装机制，不执行本地插件源码，也不会把插件源码上传到本仓库。
