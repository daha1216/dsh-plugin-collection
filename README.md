# 🧩 DSH Plugin Collection

> DeepSeek Harness（DSH）第三方插件精选目录与原生更新命令索引。

[![Catalog Version](https://img.shields.io/badge/catalog-v1.59.5-blue.svg)](plugins.json)
[![Plugins Count](https://img.shields.io/badge/plugins-12%20curated-brightgreen.svg)](plugins.json)
[![Target Profile](https://img.shields.io/badge/profile-web-orange.svg)](#)
[![Single Source of Truth](https://img.shields.io/badge/SSOT-plugins.json-blueviolet.svg)](plugins.json)

本仓库**只维护插件索引、安装入口与原生更新命令，不复制或重新发布任何插件源码**。每个条目均严格指向插件作者原仓库或官方发布的 npm 构建包。收录标准聚焦于日常真实使用，只收能切实提升 DSH 体验与效率的插件。

---

## 插件目录

> 快捷跳转：[🧠 模型增强](#-模型与推理增强) · [📊 计量监控](#-计量与状态监控) · [🛠️ 会话效率](#️-会话管理与效率工具) · [🎨 界面与多端](#-界面体验与多端协同)

### 🧠 模型与推理增强

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-better-reasoning-effort` | 0.5.4 | 在官方 Models 页内嵌配置第三方模型的推理强度（Effort）、输入模态、请求头与端点兼容项 | [HaoyueQin/dsh-better-reasoning-effort](https://github.com/HaoyueQin/dsh-better-reasoning-effort) |
| `billion-context` | 0.1.213 | 动态压缩长会话上下文：小窗口跑数十亿 token 超长会话，支持消息时间戳、陪伴型 Prompt Pack 与冻结恢复，token 节省约 5 倍；0.1.213 撤回自相矛盾的计费标记改回拆分口径，工具可达性观测读取 Responses 的 additional_tools 前言，上游未签名时重放未签名思考，新增 bili kiro 启动通道与统一公告面，超大直连模型请求直接拒绝 | [ranxianglei/billion-context](https://github.com/ranxianglei/billion-context) |
| `dsh-mnemon` | 0.5.43 | 可组合的视图化记忆系统：可插拔记忆源与策略，开箱即用分层记忆（Memory Spaces / Providers），优化会话切换读取开销与审查生命周期；0.5.43 技能草案/回测中断或超时回到可恢复状态，Runtime 记忆可手动固定并建有界配额，新增默认关闭的技能自动采纳与子 Agent Runtime 继承，Native 召回按语义相似度重排，Windows 下 pnpm/nvm 全局 CLI 发现不再依赖 Desktop PATH | [omdsh-dev/dsh-mnemon](https://github.com/omdsh-dev/dsh-mnemon) |

### 📊 计量与状态监控

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-context` | 0.83.1 | 上下文洞察与管理：0.83 把仪表盘改为宿主侧按需分片（1,158 会话约 27 KB、同内容轮询约 62 B），列表统一有界窗口化并给客户端缓存加 TTL 与作用域键；0.83.1 修 Windows 首次打开 Insights 触发渲染看门狗、Today 统计不随本地日界翻新、旧作用域迟到回包覆盖新数据与 PTC 预置下技能/工具卡为空 | [bowenliang123/dsh-context](https://github.com/bowenliang123/dsh-context) |

### 🛠️ 会话管理与效率工具

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-retrace` | 0.4.83 | 消息撤回、编辑重发与重新生成，同步回退修改过的文件；0.4.83 撤回预检透传宿主消息投影（修复含 image/offload 的会话无法撤回） | [daha1216/dsh-retrace](https://github.com/daha1216/dsh-retrace) |
| `@anysearch/anysearch-dsh` | 0.1.8 | 为 Agent 提供网页实时搜索与正文抓取能力 | [anysearch-team/anysearch-dsh](https://github.com/anysearch-team/anysearch-dsh) |
| `dsh-update-checker` | 0.7.3 | 一键检查已装插件的上游更新，点「一键更新」原生创建对话并预填更新提示词，适配多插件紧凑弹性侧栏 | [daha1216/dsh-update-checker](https://github.com/daha1216/dsh-update-checker) |
| `@aa2246740/dsh-skillhub` | 1.0.9 | 本地技能与 MCP 服务的统一开关面板：自动扫描 ~/.agents/skills 与 $DSH_HOME/skills 及运行中的 MCP 服务，提供全局 / 本项目 / 本对话三层开关与向下传导，纯可见性控制，不改动任何磁盘技能文件 | [aa2246740/dsh-skillhub](https://github.com/aa2246740/dsh-skillhub) |
| `dsh-client-auto-continue` | 0.18.0 | 请求因网络等非人为原因中断时，自动发送本地化的「继续」提示；0.18.0 断网先做在线探测再重试（离线按 15 秒复查、不消耗连续重试预算，pauseWhenOffline 默认开启），新增自主循环轮次上限 loopMaxIterations，重启后可唤醒被中断的子代理/团队会话、重新武装宿主卸下的 goal 并可选恢复手动暂停的 goal | [HsiangNianian/dsh-auto-continue](https://github.com/HsiangNianian/dsh-auto-continue) |
| `dsh-computer-use-win` | 0.5.6 | 让 DSH 看懂并操作 Windows 桌面与网页：原生桌面/浏览器工具，支持 UI 自动化树、OCR、截图、按键输入与窗口管理；0.5.6 修 DSH 0.1.5 上装插件后所有会话「加载更早」失效（每轮多个开始事件），OCR 小字先放大再识别（9–20px 逐字错误率约减半）并可指定识别语言，浮窗跟随 DSH 界面语言 | [Yu-tao-Li/dsh-computer-use-win](https://github.com/Yu-tao-Li/dsh-computer-use-win) |

### 🎨 界面体验与多端协同

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-pocket` | 3.0.12 | 手机扫码同步电脑端 DSH，支持移动端操作；具备完整会话与工具代理、安全限流及 Cloudflare Named Tunnel 支持 | [daha1216/dsh-pocket](https://github.com/daha1216/dsh-pocket) |
| `dsh-desktop-notify-win` | 0.4.0 | Windows 桌面通知：会话空闲、待审批、提问与出错时弹系统通知，带设置页、实时预览与预设 | [xiaotie3088/dsh-desktop-notify-win](https://github.com/xiaotie3088/dsh-desktop-notify-win) |

---

## 安装指南

> 默认安装目标均为 DSH 的 `web` profile（`~/.dsh/profiles/web`）。可通过 `--profile <name>` 切换。

### 1. 单插件安装（官方推荐命令）

在目录中挑选好插件后，直接使用官方 CLI 命令从作者上游安装（以 dsh-retrace 为例）：

```bash
npx --yes -p @deepseek-ai/dsh dsh plugin --profile web add github:daha1216/dsh-retrace
```

### 2. 交互式选择安装

先 clone 本仓库（脚本会读取同目录 `plugins.json`），再通过自带脚本按需选择：

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

**Windows**（单行，cmd / PowerShell 通用）：
```powershell
$tmp = "$env:TEMP\dsh-plugin-collection"; git clone -q --depth 1 https://github.com/daha1216/dsh-plugin-collection.git $tmp; powershell -NoProfile -ExecutionPolicy Bypass -File "$tmp\install.ps1" -All
```

*也可直接双击仓库中的 `install.cmd`（未 clone 时自动 clone 到临时目录后执行）。*

**macOS / Linux**：
```bash
curl -fsSL https://raw.githubusercontent.com/daha1216/dsh-plugin-collection/main/install.sh -o install.sh
bash install.sh --all
```

*提示：安装或更新完成后，刷新页面或重启 DSH Web UI 即可生效。*

---

## 更新插件

下表命令**逐条直接引用自各插件上游 README 的原生写法**（尊重各作者的原生发布通道与生命周期）。若系统环境变量中未包含全局 `dsh` 命令，在前面追加 `npx --yes -p @deepseek-ai/dsh` 即可；`bili update` 行依赖全局 `bili` CLI（`npm install -g billion-context`），未安装时改用该插件的 `add` 命令重装到最新版。

| 插件名称 | 更新命令（来自各插件 README） |
|---|---|
| `dsh-better-reasoning-effort` | `dsh plugin --profile web add dsh-better-reasoning-effort` |
| `dsh-pocket` | `dsh plugin --profile web add github:daha1216/dsh-pocket -w` |
| `@anysearch/anysearch-dsh` | `npx -y @deepseek-ai/dsh plugin --profile web update @anysearch/anysearch-dsh` |
| `billion-context` | `bili update` |
| `dsh-mnemon` | `dsh plugin --profile web add dsh-mnemon` |
| `dsh-retrace` | `dsh plugin --profile web add dsh-retrace` |
| `dsh-update-checker` | `dsh plugin --profile web add github:daha1216/dsh-update-checker` |
| `@aa2246740/dsh-skillhub` | `dsh plugin --profile web add @aa2246740/dsh-skillhub` |
| `dsh-client-auto-continue` | `dsh plugin --profile web add dsh-client-auto-continue@latest` |
| `dsh-context` | `dsh plugin --profile web update dsh-context@latest` |
| `dsh-desktop-notify-win` | `dsh plugin --profile web add github:xiaotie3088/dsh-desktop-notify-win` |
| `dsh-computer-use-win` | `dsh plugin --profile web add dsh-computer-use-win` |

---

## ⚠️ 重要说明与避坑指南

### 1. 更新机制与命令规范
- **重跑 `add` 即更新**：多数插件上游 README 未设立独立的 update 命令，重新执行其 `add` 命令即可拉取该来源的最新版本。
- **原生自更新命令**：`billion-context` 用 `bili update`（上游 README 的 Self-update 与命令行示例），`anysearch-dsh` 用原生 `update` 动词，`dsh-context` 用 `dsh plugin --profile web update dsh-context@latest`，`dsh-pocket` 自 3.0.2 起改为重跑 `add`（上游 README 已删掉 `update --latest` 的说法）。
- **`billion-context` 更新须知**：
  - `bili update` 是全局 CLI 命令（`npm install -g billion-context`），它同时驱动 dsh profile 副本这条 lane；本机没有全局 `bili` 时，用 `dsh plugin --profile web add billion-context` 重装到最新版即可，效果相同。
  - 自动更新是**错峰**的（#3619）：发现新版本后要在 15 分钟–48 小时的随机窗口里抽一个时刻才安装（抽中的时刻会持久化，重启不重抽），所以「刚发布没马上升级」是正常现象；手动 `bili update` 绕过 hold 与错峰，但仍遵守 `blocked` / `pinned`，Web 面板会显示 hold/pinned 横幅。
  - 更新只替换磁盘文件，**宿主进程里的注入代码要重启宿主（DSH）才生效**；运行版本落后于磁盘版本时 Web UI 会挂失效横幅，`--auto-restart-on-update` 可让它在安全点自重启。桌面端尤其要主动重启一次：旧代理在更新后可能自行热重启进新版本，而宿主还在跑旧代码。
  - 清单与磁盘版本漂移（`bili doctor` 报 dep spec / lockfile / bundle 不一致）时，用 `bili doctor --fix` 把 dsh profile 清单收敛到磁盘版本。

### 2. 插件样式与 DSH 主题令牌
- 自绘 UI 的插件请只用宿主 `--dsw-alias-*` / `--ds-*` 令牌，不要写死色值，否则深色模式下必然出问题。三个高频陷阱：
  - **`--dsw-alias-brand-primary` 不是品牌蓝**，它是**单色主按钮的底色**（深色主题下接近白色 `#f9fafb`）。写 `background: var(--dsw-alias-brand-primary); color: #fff` 会得到白底白字。做强调色用 `--dsw-alias-link`（浅色 `#4176e6` / 深色 `#7aaaff`）；做主按钮用配对 `--dsw-alias-button-primary-fill` + `--dsw-alias-label-primary-foreground`，hover 用 `--dsw-alias-button-primary-hover`。
  - **`--dsh-code-font-family` 与 `--dsw-font-mono` 在 DSH 中不存在**（浏览器静默丢弃整条声明）。等宽字体令牌是 `--ds-font-family-code`；注意不是 `--dsh-font-family-code`，后者仅由 ThemePresenter 在用户配置了代码字体时以 body 内联样式写入。
  - **自绘开关要连旋钮一起换令牌**：只改轨道不改旋钮，深色下会失去对比。照抄宿主 `._switch_1ik0f_5` / `._thumb_1ik0f_33` 的配对——未选中轨道 `--dsw-alias-border-l3` + 旋钮 `--dsw-alias-switch-thumb`，选中轨道 `--dsw-alias-button-primary-fill` + 旋钮 `--dsw-alias-label-primary-foreground`。
  - 阴影用 `--dsw-shadow-lv1` / `--dsw-shadow-lv2`，不要写 `rgba(0,0,0,…)`。

### 3. Registry 缓存滞后警示
- 本机若通过 `github:` 源安装插件，后续更新时**切勿改跑不带 spec 的 `add <pkg>@latest`**，否则会被 npm registry 解析，可能拉取到落后于 GitHub HEAD 的历史旧包。更新请始终沿用显式 `github:<owner>/<repo>` 或上表对应的原生指令。

### 4. 特殊插件与自维护 Fork
- **`dsh-pocket`**：
  - 本条目指向安全加固版 Fork（`github:daha1216/dsh-pocket`），非上游原仓库。
  - 更新方式为重跑同一条 `add` 命令（GitHub 地址不带 tag 时装默认分支最新提交），必须保留 `-w` 参数（解决 pnpm workspace 根目录限制）；要锁版本写成 `github:daha1216/dsh-pocket#vX.Y.Z`。
  - **3.0.0 起为破坏性变更**：移除随机域名（Quick Tunnel）公网，公网访问需要用户自行配置 Cloudflare 固定域名与 Tunnel Token（设置 → 手机访问 → 公网配置）；局域网扫码不受影响。2.x 升级后旧随机隧道的自动恢复标记会被安全清除。
- **`dsh-retrace`**：
  - 上游原生命令为 npm 通道 `dsh plugin --profile web add dsh-retrace`。
  - 本机实装与本目录均跟随自建兼容 Fork `github:daha1216/dsh-retrace`。
- **`@aa2246740/dsh-skillhub`**：
  - npm 与 GitHub 同包名，装时不要设 npm 别名（别名会导致前端注册名对不上，表现为「装了但设置里没有 skill&mcp 入口」）；升级同样重跑 `add` 到最新版。
  - 版本与宿主强绑定：DSH `0.2.0-rc.x` 需插件 `1.0.4` 及以上，`0.1.7-rc.x` 只能装 `1.0.2`，`0.1.5` 只能装 `1.0.1`；版本不匹配宿主会在启动时整条拒绝该插件。
  - 开关状态存于 `$DSH_HOME/skillhub/`，开关只控制模型可见性，不增删改磁盘上的技能文件。
- **`dsh-computer-use-win`**：
  - Windows 原生桌面自动化插件（`Yu-tao-Li/dsh-computer-use-win`），通过 MCP stdio 桥接与 PowerShell 5.1 UIA 后端操作真实桌面应用与后台网页。
  - 安装或更新后必须在托盘菜单右键彻底「退出」DSH Desktop 再重新打开（仅关窗口无效）；默认提供 Esc 全局安全中断热键。

---

## 🛠️ 维护机制与健康检查

本仓库推行“配置即代码”与“自动化验证”机制：

1. **单一数据源**：[`plugins.json`](plugins.json) 记录所有插件的规范元数据。
2. **自动化对账**：通过 `pwsh scripts/verify.ps1` 校验目录一致性：
   - 验证 `plugins.json` 结构与格式；
   - 保证 README 目录表与更新命令表严格对应；
   - 保证仓库目录与当前环境 profile 实装插件完全对齐（差集为零）。
   - 如遇「目录有、本机刻意不装」的临时情形（换机、试用、与宿主冲突），可在仓库根目录新建 `verify.ignore.json` 登记名字与原因，脚本会跳过对应条目并在输出中注明；当前目录 12 条均为本机实装，无需该文件。
3. **版本日志**：每次目录更新与插件升级记录统一沉淀在 [`CHANGELOG.md`](CHANGELOG.md)。

---

## 🛡️ 安全与责任边界

- **系统权限**：插件运行在用户本地的 DSH 进程中。安装前请务必自行审阅各上游仓库的源码、依赖项及生命周期脚本。
- **免责声明**：本仓库仅提供检索与索引服务，不对第三方插件的安全性、稳定性提供任何担保。
- **原生接口**：所有安装与更新操作均使用 DSH 官方标准 CLI 接口完成。
