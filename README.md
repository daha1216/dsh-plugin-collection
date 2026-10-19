# 🧩 DSH Plugin Collection

> DeepSeek Harness（DSH）第三方插件精选目录与原生更新命令索引。

[![Catalog Version](https://img.shields.io/badge/catalog-v1.49.0-blue.svg)](plugins.json)
[![Plugins Count](https://img.shields.io/badge/plugins-11%20curated-brightgreen.svg)](plugins.json)
[![Target Profile](https://img.shields.io/badge/profile-web-orange.svg)](#)
[![Single Source of Truth](https://img.shields.io/badge/SSOT-plugins.json-blueviolet.svg)](plugins.json)

本仓库**只维护插件索引、安装入口与原生更新命令，不复制或重新发布任何插件源码**。每个条目均严格指向插件作者原仓库或官方发布的 npm 构建包。收录标准聚焦于日常真实使用，只收能切实提升 DSH 体验与效率的插件。

---

## 插件目录

> 快捷跳转：[🧠 模型增强](#-模型与推理增强) · [📊 计量监控](#-计量与状态监控) · [🛠️ 会话效率](#️-会话管理与效率工具) · [🎨 界面与多端](#-界面体验与多端协同)

### 🧠 模型与推理增强

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-better-reasoning-effort` | 0.5.3 | 在官方 Models 页内嵌配置第三方模型的推理强度（Effort）、输入模态、请求头与端点兼容项 | [HaoyueQin/dsh-better-reasoning-effort](https://github.com/HaoyueQin/dsh-better-reasoning-effort) |
| `billion-context` | 0.1.201 | 动态压缩长会话上下文：小窗口跑数十亿 token 超长会话，token 节省约 5 倍 | [ranxianglei/billion-context](https://github.com/ranxianglei/billion-context) |
| `dsh-mnemon` | 0.5.32 | 可组合的视图化记忆系统：可插拔记忆源与策略，开箱即用分层记忆（Memory Spaces / Providers） | [omdsh-dev/dsh-mnemon](https://github.com/omdsh-dev/dsh-mnemon) |
| `dsh-our-free-model` | 2.5.3 | 免费模型接入：无需登录或 API Key 即可用 DeepSeek V4.1 Flash、Kimi K3 等前沿模型，另有十三个账号渠道、数据看板与本地网关 | [Ebony-Vinyl/dsh-our-free-model](https://github.com/Ebony-Vinyl/dsh-our-free-model) |

### 📊 计量与状态监控

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-watcher` | 0.6.3 | 会话工作路径观测面板 · 跨会话模型耗时与费用统计 | [daha1216/dsh-watcher](https://github.com/daha1216/dsh-watcher) |

### 🛠️ 会话管理与效率工具

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-retrace` | 0.4.55 | 消息撤回、编辑重发与重新生成，同步回退修改过的文件 | [daha1216/dsh-retrace](https://github.com/daha1216/dsh-retrace) |
| `@anysearch/anysearch-dsh` | 0.1.8 | 为 Agent 提供网页实时搜索与正文抓取能力 | [anysearch-team/anysearch-dsh](https://github.com/anysearch-team/anysearch-dsh) |
| `dsh-update-checker` | 0.3.2 | 一键检查已装插件的上游更新（只检查不更新），展示更新内容 | [daha1216/dsh-update-checker](https://github.com/daha1216/dsh-update-checker) |
| `@local/skills-manager` | 0.3.1 | 在设置页新增「技能」管理页：列出 / 查看 / 新建 / 编辑 / 删除本地技能，切换调用策略，一键打开技能目录 | [daha1216/dsh-skills-manager](https://github.com/daha1216/dsh-skills-manager) |
| `dsh-ops` | 0.3.0 | Rust 原生文件工具（grep / glob / replace / hex 查看）与随包 MSYS bash、PowerShell 7，替掉 Windows 下反复失败的原生 shell 调用，省 token 省时间 | [T-Auto/dsh-ops](https://github.com/T-Auto/dsh-ops) |

### 🎨 界面体验与多端协同

| 插件名称 | 版本 | 用途 | 来源 |
|---|---:|---|---|
| `dsh-pocket` | 2.10.9 | 手机扫码同步电脑端 DSH，支持移动端操作 | [daha1216/dsh-pocket](https://github.com/daha1216/dsh-pocket) |

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
| `dsh-pocket` | `dsh plugin --profile web update dsh-pocket --latest -w` |
| `@anysearch/anysearch-dsh` | `npx -y @deepseek-ai/dsh plugin --profile web update @anysearch/anysearch-dsh` |
| `billion-context` | `bili update` |
| `dsh-mnemon` | `dsh plugin --profile web add dsh-mnemon` |
| `dsh-our-free-model` | `dsh plugin --profile web add https://github.com/Ebony-Vinyl/dsh-our-free-model/releases/download/v2.5.3/dsh-our-free-model-2.5.3.tgz` |
| `dsh-retrace` | `dsh plugin --profile web add dsh-retrace` |
| `dsh-watcher` | `dsh plugin --profile web add github:daha1216/dsh-watcher` |
| `dsh-update-checker` | `dsh plugin --profile web add github:daha1216/dsh-update-checker` |
| `@local/skills-manager` | `dsh plugin --profile web add github:daha1216/dsh-skills-manager` |
| `dsh-ops` | `npx --yes dsh-ops@latest install --profile web` |

---

## ⚠️ 重要说明与避坑指南

### 1. 更新机制与命令规范
- **重跑 `add` 即更新**：多数插件上游 README 未设立独立的 update 命令，重新执行其 `add` 命令即可拉取该来源的最新版本。
- **原生自更新命令**：`billion-context` 用 `bili update`（上游 README 的 Self-update 与命令行示例），`dsh-ops` 用 `npx --yes dsh-ops@latest install --profile web`，`anysearch-dsh`、`dsh-pocket` 用原生 `update` 动词。
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
  - 更新时必须保留 `-w` 参数（解决 pnpm workspace 根目录限制）；跨大版本升级时 `--latest` 必选。
- **`dsh-retrace`**：
  - 上游原生命令为 npm 通道 `dsh plugin --profile web add dsh-retrace`。
  - 本机实装与本目录均跟随自建兼容 Fork `github:daha1216/dsh-retrace`。
- **`@local/skills-manager`**：
  - 目录收录公开仓库 `github:daha1216/dsh-skills-manager`；本地若处于开发态（`link:`），以本地代码优先。
- **`dsh-our-free-model`**：
  - **不要用 `npm` 安装同名包**——npm 上那个由第三方打包，`index.js`、`client.js` 被改且多出 `src/channel-visibility.js`，拿不到上游的签名清单校验与应用内升级。
  - 本目录固定指向官方 Release 的 tarball 直链（文件名带版本号，升级时同步改 URL），这是 README 认可的安装制品。
  - 装完后把 `distribution` 设为 `managed`（bundle config 或插件 `settings.json`）：包管理器拥有字节时，应用内升级、公告 feed 与热重载会停用，模型功能保留。
- **`dsh-ops`**：
  - npm 通道，更新用自带的 `npx --yes dsh-ops@latest install --profile ...`，会同时对齐随包 bash / pwsh 二进制；官方 CLI 的 `add dsh-ops@latest` 是等价替代。
  - 装/升时务必显式指定官方源 `--registry=https://registry.npmjs.org`：其 `@dsh-ops/*-win32-x64` optionalDependencies 在 npmmirror 上缺版本，pnpm 重解析会报 `ERR_PNPM_NO_MATCHING_VERSION`。

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
