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
| `dsh-client-auto-continue` | `dsh-client-auto-continue` | 0.7.1 | 网络错误或非人为中断后自动发送“继续”。 | [HsiangNianian/dsh-auto-continue](https://github.com/HsiangNianian/dsh-auto-continue) |
| `dsh-usage-stats` | `dsh-usage-stats` | 1.0.0 | 提供 Token、缓存命中、账户余额和工作区别名统计看板。 | [Make0209/dsh-usage-stats](https://github.com/Make0209/dsh-usage-stats) |
| `dsh-drag-and-drop` | `@omdsh-dev/dsh-drag-and-drop` | 0.1.5 | 将本地文件拖入 DSH Web UI，并插入原始文件路径。 | [omdsh-dev/dsh-drag-and-drop](https://github.com/omdsh-dev/dsh-drag-and-drop) |
| `dsh-recall-plugin` | `dsh-recall-plugin` | 1.4.0 | 撤回消息，并将项目文件和对话历史回退到指定消息之前。 | [limbo947/dsh-recall-plugin](https://github.com/limbo947/dsh-recall-plugin) |
| `dsh-share` | `dsh-share` | 0.3.1 | 将问答或选定对话组导出为 PNG 或 Markdown。 | [hellodigua/dsh-share](https://github.com/hellodigua/dsh-share) |
| `dsh-custom-provider-settings` | `dsh-custom-provider-settings` | 0.4.0 | 为自定义 Provider 增加请求头、图片输入和推理设置。 | [supersealwqas/dsh-custom-provider-settings](https://github.com/supersealwqas/dsh-custom-provider-settings) |
| `dsh-opencode-go-usage` | `@xueayi/dsh-opencode-go-usage` | 0.1.5 | 在悬浮 Web 面板中实时监控 OpenCode Go 的 5 小时滚动 / 周 / 月配额并展示用量。 | [xueayi/dsh-opencode-go-usage](https://github.com/xueayi/dsh-opencode-go-usage) |

机器可读目录见 [`plugins.json`](plugins.json)。安装脚本会从该文件读取插件来源，避免 README 表格和安装命令发生漂移。

## 安全与责任边界

这些插件会运行在用户自己的 DSH 进程中。安装前应阅读对应上游仓库的 README、权限说明、生命周期脚本和许可证。这个目录仅做索引，不代表对第三方插件的维护、担保或安全审计。

本目录的安装脚本使用 DSH 官方 `dsh plugin` 安装机制，不执行本地插件源码，也不会把插件源码上传到本仓库。
