# Changelog

## 2026-10-23 dsh-client-auto-continue 0.17.0（catalog 1.55.0）

- **`dsh-client-auto-continue` 0.16.0 → 0.17.0**（npm 通道，[HsiangNianian/dsh-auto-continue](https://github.com/HsiangNianian/dsh-auto-continue)，[v0.17.0](https://github.com/HsiangNianian/dsh-auto-continue/releases/tag/v0.17.0) 于 2026-10-23 09:17 UTC 发布）：
  - **紧凑开关 + 原生模式菜单**（#67/#68）：0.16 的宽选择器换成紧凑开关并搭配宿主 Menu 原语——开关负责当前会话的开/关（重新打开回到 Follow default），旁边菜单列出 Follow default / Off / Recovery only / Autonomous loop 并勾选当前项；无 Menu 原语的旧宿主退回原生 `<select>`；键盘可达、即时保存与跨标签同步保留；
  - **手机端适配**：标签折叠为图标、菜单折叠为箭头，跟随 composer 行的同一 container query，窄屏不换行；
  - **Toast 反馈**：会话模式保存失败改显宿主 toast（无 Toast 原语的宿主退回内联文本），保存中/断连时控件禁用并以 tooltip 说明；
  - **设置页原生化**：字段、开关与默认模式选择器改用 DSH 的 SettingsForm / SettingsValueField / Switch / SegmentedControl 原语，与插件管理器整体一致；插件名与描述经 locale 本地化（中文显示「自动继续」）；移除深色头横幅；修复 composer 隐形 select 拉伸 Default session mode、导致整页误弹选择器的样式泄漏；
  - **兼容性**：在 DSH 0.1.7-rc.2 / 0.2.0-rc.1 / 0.2.1-alpha.1 / 0.2.1-rc.2 上回归。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-client-auto-continue` `0.16.0`→`0.17.0`（`install` 钉版同步），catalogVersion `1.54.0` → `1.55.0`，核对日期 `2026-10-23`（README 徽章同步）；`update` 维持上游原生写法 `dsh plugin --profile web add dsh-client-auto-continue@latest`。
- 本机更新动作：desktop profile 内用 DSH 自带 pnpm 11.28.5 执行等价命令 `add -E dsh-client-auto-continue@0.17.0 --registry=https://registry.npmjs.org`，`node_modules` 实装与 `package.json` 钉版均到 0.17.0（lockfile 供应链校验通过，pnpm 已将该包纳入 `minimumReleaseAgeExclude`）；改前 `package.json` + `pnpm-lock.yaml` 备份在 `backups/plugin-update-20261023-180259/`。按上游建议更新后完全重启 DSH 桌面端并刷新页面；已有配置、会话模式与暂停状态保留。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop`。

## 2026-10-23 dsh-client-auto-continue 0.16.0（catalog 1.54.0）

- **`dsh-client-auto-continue` 0.15.0 → 0.16.0**（npm 通道，[HsiangNianian/dsh-auto-continue](https://github.com/HsiangNianian/dsh-auto-continue)，[v0.16.0](https://github.com/HsiangNianian/dsh-auto-continue/releases/tag/v0.16.0) 于 2026-10-23 04:28 UTC 发布）：
  - **每会话独立继续模式**（#67/#68）：消息输入框旁新增会话级控制——Follow default（跟随 profile 默认）/ Off（停止自动续发并退出循环守卫）/ Recovery only（只恢复失败与静默回合）/ Autonomous loop（正常完成后也继续）；选择保存在宿主侧，重启后保留、跨标签页同步；全局「启用自动继续」与「默认会话模式」（初始默认 Recovery only）留在插件设置；切 Off 会取消排队中的宽限/冷却/循环守卫重试但不打断进行中回合，重新打开不会复活已取消的发送；
  - **设置保存与迁移修复**（#64/#65）：新旧两套设置 API 并存的宿主上不再重复注册导致 `settings/conflict` 拒绝保存；profile 设置成为唯一属主，需要时从 `$DSH_HOME/settings-legacy.yaml` 一次性导入旧 auto-continue 段且不覆盖显式值；导入挂起或失败时自动恢复与循环守卫等待；YAML 诊断不再带出无关设置片段；
  - **依赖更新**（#66）：DSH 开发包对齐 0.1.2-rc.1、Cordis 4.0.2、Schemastery 3.18.2；仓库新增 CHANGELOG.md，发布工作流从该文件生成 release body；
  - **兼容性**：在 DSH 0.1.7-rc.2 / 0.2.0-rc.1 / 0.2.1-alpha.1 / 0.2.1-rc.2 上完成回归；上游注明 Windows 桌面端未直接测试、#64 待报告者确认。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-client-auto-continue` `0.15.0`→`0.16.0`（`install` 钉版同步），catalogVersion `1.53.0` → `1.54.0`，核对日期 `2026-10-23`（README 徽章同步）；`update` 维持上游原生写法 `dsh plugin --profile web add dsh-client-auto-continue@latest`。另：`verify.ps1` 的「已安装但目录缺失」排除规则从仅 `link:` 扩到 `file:` 相对路径（解析到 `~/.dsh/plugins` 私有 lane 的本机私有安装，无公开来源，不进公开目录）；绝对路径 `file:` 安装（dsh-pocket、dsh-watcher 等公开插件本地副本）仍参与对账。
- 本机更新动作：desktop profile 原装 0.15.0（`dsh.profile.bundles` 已含，未改动）；本机无全局 `dsh` CLI，在 profile 目录用 DSH 自带 pnpm 11.28.5 执行等价命令 `add -E dsh-client-auto-continue@0.16.0 --registry=https://registry.npmjs.org`，`node_modules` 实装与 `package.json` 钉版均到 0.16.0（lockfile 供应链校验通过，pnpm 自动将 `dsh-client-auto-continue@0.16.0` 加入 `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`）；改前 `package.json` + `pnpm-lock.yaml` 备份在 `backups/plugin-update-20261023-143039/`。按上游建议：更新前让进行中工作收尾，更新后完全重启 DSH 桌面端并刷新页面以加载新的会话控制；旧设置保留，合格 legacy 设置自动导入。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop`。

## 2026-10-22 billion-context 0.1.204（catalog 1.53.0）

- **`billion-context` 0.1.203 → 0.1.204**（npm 通道，[ranxianglei/billion-context](https://github.com/ranxianglei/billion-context)，[v0.1.204](https://github.com/ranxianglei/billion-context/releases/tag/v0.1.204) 于 2026-10-21 18:37 UTC 发布）：
  - **Prompt-cache Keepalive**：新增针对 Anthropic wire 的空闲 prompt-cache keepalive 特性，支持各模型层级保活配置及状态透出（acp_status 与 Web UI，#3376）；
  - **中间 System/Developer 消息处理修复**：历史会话中的中间 system 消息在各通道保持逐字传输（verbatim），仅 bili 自带 carrier 重新发声（#4166、#4159、#4165）；drop-warn 检测器不再误报中间 system/developer 消息（#4171）；
  - **预设与兼容性修复**：压缩覆盖层结构化覆盖自定义预设（#4147/#3962/#4002）；在禁用 bili-native 时保持 DSH 预设可启动（#3662）；
  - **内核升级**：升级 acp-kernel 至 0.0.149。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.203`→`0.1.204`（`install` 钉版同步），catalogVersion `1.52.0` → `1.53.0`，核对日期 `2026-10-22`（README 徽章同步）；`update` 维持上游原生写法 `bili update`。
- 本机更新动作：运行原生更新命令 `bili update`，全局 CLI 与 desktop profile 副本同步从 0.1.203 升级至 0.1.204；随后使用宿主 pnpm 运行 `--lockfile-only` 对齐 `pnpm-lock.yaml` 完整依赖解析（`billion-context@0.1.204`，integrity `sha512-LE53dy65Nmqi66Bonksiz9KhpPQTq2K4PeJ+Lg5BeJBVudCYy7AGL33srlhi8zKhQBqIBNBIl1tzpJuj+rfyJg==`）；保留嵌套依赖并加入 `minimumReleaseAgeExclude`；profile 改前文件已备份至 `backups/plugin-update-20261022-025500/`；冒烟测试通过。**重启 DSH 桌面端以加载新插件与代理**。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop`。

## 2026-10-21 dsh-context 0.74.0 / billion-context 0.1.203（catalog 1.52.0）

- **`dsh-context` 0.73.3 → 0.74.0**（npm 通道，[bowenliang123/dsh-context](https://github.com/bowenliang123/dsh-context)，[v0.74.0](https://github.com/bowenliang123/dsh-context/releases/tag/v0.74.0) 于 2026-10-21 06:37 UTC 发布）：长会话趋势图在 200+ 步自动切到 Overview 汇总带（新偏好 Trend Chart · Auto Overview：100/200/300 步或关闭，默认 200，每会话只触发一次；Overview 带支持悬停追踪类别、点击定位步骤并打开 Context browser）；Context Insights 改为**按请求发出当日记账**（跨午夜步骤记在开始日、每回合只记一次，KPI/构成/会话准入/热力图共用同一日账本，KPI 新增工具运行数与活跃时长，热力图新增 Tokens 指标并设为默认，升级后活动缓存冷折叠 `contextActivity` stateVersion 5，账本保留 400 天）；新增 **Default range** 偏好（Today/7 天/30 天/All，默认 30 天，页面选定预设回写为默认）；File Activity 布局收拢（文件数/行数差/类型 chips 上移标题行）；修复 DeepSeek 计价、余额胶囊与大型 agent 家族显示。
- **`billion-context` 0.1.202 → 0.1.203**（npm 通道，[ranxianglei/billion-context](https://github.com/ranxianglei/billion-context)，[v0.1.203](https://github.com/ranxianglei/billion-context/releases/tag/v0.1.203) 于 2026-10-21 08:52 UTC 发布）：修复 dsh 重启换 ID 后误报「客户端自带压缩已落地」横幅（#3806 家族）；诊断 blob 对外粘贴前**掩蔽私有中转主机**（#3811）；快照渲染接缝加固——重复短文本不再被静默截断（#3812）；dsh 压缩禁用 overlay 锁不上时改为大声告警（#3806）；同 lane 代理配置漂移时降级 ladder 而非启动失败（#3801）；高成本插件横幅不再对 cordis.patch.yml 显式禁用条目告警（#3838）；pi 子代理 fleet 检查器可跳到转录开头/结尾；dsh 设置面板引导远程用户到 security.adminRelay（#3816）；SQLite 引导冷却到期与强制重试杠杆进入存储诊断；另有 zcode watchdog 热重试等 0.1.202 复审收尾。**注意：0.1.203 新增依赖 `mysql2`（动态 import 懒加载，仅配置 MySQL 存储时使用）。**
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-context` `0.73.3`→`0.74.0`、`billion-context` `0.1.202`→`0.1.203`（`install` 钉版同步），catalogVersion `1.51.1` → `1.52.0`，核对日期 `2026-10-21`（README 徽章同步）；`update` 字段维持上游 README 原生写法（`dsh plugin --profile web update dsh-context@latest` / `bili update`）。
- 本机更新动作：桌面端运行中，未执行会重建 modules 的 pnpm 命令；两包均按 npm 官方 tarball 校验（`dsh-context@0.74.0` `sha512-BfqdeRBvZw+AgBMrTXp4SE8Iky6n5LRqVRUttwBZZ27sYW6jaJX2bjrFybO3QGddHioqA2rHZcc2Bb9q5vYPnw==`、`billion-context@0.1.203` `sha512-VGKNb31BZMALPES2XamiSYfFkKhNetubKzOS/IuPCuMS0rsfhyCZG2IFsUaX80dz9v+UxqaFw8h0ZZuhiEqJRw==`，与 lockfile 记录一致）后手动替换 `node_modules/` 目录，保留各自嵌套 `node_modules/zod`（dsh-context 4.6.5 / billion-context 4.1.8），并为 billion-context 补齐新依赖 `mysql2@3.24.6` 及锁文件解析的传递依赖（`@types/node` 16.9.1、`aws-ssl-profiles` 1.1.2、`generate-function` 2.3.1、`iconv-lite` 0.7.3、`long` 5.3.2、`lru.min` 1.1.5、`named-placeholders` 1.1.6、`sql-escaper` 1.5.2，及 npm 解析带入的 `is-property`、`safer-buffer`）到其嵌套 node_modules；profile `package.json` 依赖改为精确 `0.74.0` / `0.1.203`，宿主 pnpm `add --lockfile-only` 对齐 lockfile（pnpm 自动把两包加入 `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`）；旧目录移至 profile `node_modules/.replaced-20261021/`，改前 `package.json` + `pnpm-lock.yaml` 备份在本仓库 `backups/plugin-update-20261021-202207/`；全局 `bili` CLI 经原生命令 `bili update` 0.1.202 → 0.1.203。冒烟：新 dist `--help` 自报 0.1.203、mysql2 依赖树完整可加载、dsh-context lib/locale 结构完整。**重启 DSH 桌面端后加载新代理与插件**。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop`。

## 2026-10-21 dsh-mnemon 0.5.34（catalog 1.51.1）

- **`dsh-mnemon` 0.5.33 → 0.5.34**（npm 通道，[v0.5.34](https://github.com/omdsh-dev/dsh-mnemon/releases/tag/v0.5.34) 于 2026-10-21 01:14 UTC 发布）：新增实验性组件**技能管理（Skills）**，可列出并管理 DSH 从项目与用户目录加载的每个 `SKILL.md`——可对模型或 `/` 菜单单独关闭、一键在对话中使用、直接编辑并回到任意历史版本；开启**自进化**后对话结束会在后台复盘纠正、“以后都这样做”的指示、工具失败与可复用流程，建议须标出依据步骤、草案先与当前版本在技能测试用例上回测，且只有用户点**采纳**才改动技能（默认关闭）；**评测**保存测试用例与回测，复盘对话留作证据可转成用例；**市场**支持边输入边搜索 skills.sh、从任意 GitHub 仓库或 Agent Skills 发现索引安装技能并展示安全审核；回合下方新增「本回合技能」行。插件自述同步改为「面向 DeepSeek Harness 的可组合视图上下文，开箱即用提供分层记忆与自进化技能」。Starter 升至 0.5.34 并固定新包 `dsh-mnemon-source-skills` 0.5.1，其余 17 个组件版本不变，已有记忆无需迁移；Skills 数据放在存储根目录新增的 `skills/` 文件夹，不进备份与 Git 同步。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-mnemon` `0.5.33`→`0.5.34`（`install` 钉版同步，描述补充技能管理），catalogVersion `1.51.0` → `1.51.1`，核对日期 `2026-10-21`（README 徽章同步）；`update` 字段维持上游 README 的原生写法 `dsh plugin --profile web add dsh-mnemon`。上游 README 同时给出桌面端在插件页卸载后以 `dsh-mnemon@0.5.34` 重装并完全退出重开、或经「记忆系统 → 状态 → 检查版本 → 更新」升级再重启；本目录继续按原生 `add` 命令记录。
- 本机更新动作：桌面端运行中，未执行会重建 modules 的 pnpm 命令；按 npm 官方 tarball 校验（核心 `sha512-g70C2MdVJATtukOfcVdN8uLJfB7hCa70Qz24wDUGZu2y8rTvH30E48W4J9LukXgHb03mNcP3VjaZxJQoK2qOVA==`、新增 `dsh-mnemon-source-skills@0.5.1` 的 `sha512-urMMV/Ec1ZV/gUrkdYQD/t9OdPPaxES7FWbWKPmIUEcEO6KY6t17YYB7FORVTRySu2/zknVj/60atb7QG/9tIg==`）后手动替换 `node_modules/dsh-mnemon`（66 个非嵌套文件与解包树 sha256 全等，保留嵌套 `node_modules/zod` 4.6.5）并新增 `node_modules/dsh-mnemon-source-skills`（28 个文件全等）；`package.json` 依赖改为 `0.5.34`，用宿主的 `pnpm install --lockfile-only` 对齐 lockfile（仅 mnemon 相关条目变化，pnpm 自动把两者加入 `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`）。profile 已备份到 `~/.dsh/profiles/desktop/backups/plugin-update-dsh-mnemon-20261021-101514/`（含 0.5.33 旧树）并已 `--frozen-lockfile` 复核一致。**重启 DSH 桌面后加载 0.5.34 与技能管理页**。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop`。

## 2026-10-21 dsh-context 重新收录（catalog 1.51.0）

- **新增条目 `dsh-context` 0.73.3**（npm 通道，[bowenliang123/dsh-context](https://github.com/bowenliang123/dsh-context)，[v0.73.3](https://github.com/bowenliang123/dsh-context/releases/tag/v0.73.3)）：本机 2026-10-21 重新装入 desktop profile（依赖 `dsh-context@^0.73.3`，实装 0.73.3）。该条目在 2026-08 下旬随插件卸载从目录移除，本次按「目录反映实装」重新收录；`update` 取上游 README 的原生写法 `dsh plugin --profile web update dsh-context@latest`，`install` 走 npm 钉版 `dsh-context@0.73.3`。功能：跨会话 **Context Insights** 页面（KPI 带、7 天 token/费用图、活跃热力图、会话卡片）、每个会话的 **Context tab** 与右侧 **Context 面板**（上下文组成、趋势、事件、文件活动）、**Fleet** 子 Agent 网络页、`/context` 斜杠命令与偏好卡片；README 明确「No build step, no restart」。
- **`dsh-our-free-model` 2.5.5 → 2.5.7**（GitHub Release tarball 通道）：补记此前漏掉的 2.5.6（[2026-10-19 16:48 UTC](https://github.com/Ebony-Vinyl/dsh-our-free-model/releases/tag/v2.5.6)）与本次 2.5.7（[2026-10-20 14:07 UTC](https://github.com/Ebony-Vinyl/dsh-our-free-model/releases/tag/v2.5.7)，插件 tarball `dsh-our-free-model-2.5.7.tgz` 已 HEAD 校验 200）。上游要点：免费模型与 EAC 页统一为紧凑的北辰 API 赞助卡片、优惠文案改为「邀请可获百分之十返现」、移除广告导航/详情路由但保留卡片链接（2.5.6）；CodeArts 改用独立签名传输避免全局 fetch 被改写破坏签名、识别字符串与数字形式的 4004 后去掉 benefit 头重签重试一次、托管安装下禁用插件内升级/热重载并提示走原安装方式、手动测速须收到非空正文且正常结束（后台 300s / 前端 330s）并保存成败结果、移除低性能模式、修正多模态请求被上游夸大的用量统计（2.5.7）。`install` 与「更新插件」表的固定直链同步改为 `v2.5.7`。本机实装仍为 2.5.5，尚未在应用内升级；目录按上游最新插件制品记录。
- 其余条目核对无变化：npm 通道 `dsh-better-reasoning-effort` 0.5.4、`billion-context` 0.1.202、`dsh-mnemon` 0.5.33、`@anysearch/anysearch-dsh` 0.1.8、`dsh-ops` 0.4.1、`dsh-client-auto-continue` 0.15.0 与 registry 一致；自维护/GitHub 通道 `dsh-pocket` HEAD 2.11.2（tag v2.11.2）、`dsh-retrace` HEAD 0.4.56（tag v0.4.56，本机实装 0.4.55）、`dsh-watcher` HEAD 0.7.0、`dsh-update-checker` HEAD 0.3.5、`dsh-skills-manager` 0.3.2 无变化。注意 npm 上存在与上述自维护插件同名的包（如 `dsh-retrace@0.4.134`、`dsh-update-checker@1.7.2`），与仓库通道不是同一制品，目录继续按各条目 `install` 指定的通道取版本。
- 目录快照同步：`plugins.json` 增补 `dsh-context` 并刷新 `dsh-our-free-model`；README 目录表（监控分类）、更新命令表、原生自更新命令说明、徽章版本与插件数（12→13）同步；`scripts/fetch-upstream.ps1` 仓库清单对齐当前 13 条（移除 dsh-pet / dsh-opencode-go-usage / dsh-all-usage / dsh-font-customizer / dsh-plugin-oauth-subs，补入 dsh-client-auto-continue、dsh-context）。catalogVersion `1.50.1` → `1.51.0`，核对日期 `2026-10-21`。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 13）。

## 2026-10-20 dsh-retrace 0.4.56（会话短码回归纯展示 + 历史标题自动还原）

- **`dsh-retrace` 0.4.55 → 0.4.56**（自维护仓库 `github:daha1216/dsh-retrace`，[v0.4.56](https://github.com/daha1216/dsh-retrace/releases/tag/v0.4.56)）：
  - **会话短码回归纯展示**：此前打开 Retrace / 分叉视图或改名时会把 `[短码] ` 写进会话标题（写 user source title，永久停掉自动标题）。现在短码只用于显示，改名只写名称本身；host 侧所有标题写回路径（`setBadgeTitle` / `initBadgeTitles` / `bootPin` / `ensureBadgeTitle`，以及 `setUserTitle` 的短码拼接）全部删除。
  - **历史标题自动还原**：升级后首次启动经官方 `sessionController.rename` 把旧版本写入的 `[短码] ` 前缀逐条剥掉，写回会话日志与投影缓存；正则只匹配 retrace 短码形态（不误伤 `[ClaudeProtect]` 这类合法方括号标题），失败只告警、下次启动重试，`DSH_RETRACE_NO_BADGE_CLEANUP=1` 可关。还原冷会话时会短暂 resume 一次。
  - **本机部署**：桌面端运行期间以「仓库文件 → 临时文件 + rename 覆盖」更新 `profiles/desktop/node_modules/dsh-retrace` 的 5 个运行时文件，避开 pnpm 硬链接共享 inode；备份在 `D:\dsh work\.tmp-dsh-internals\backup-desktop-dsh-retrace-0.4.55\`；完整重启桌面端后生效。
- 目录快照同步：plugins.json 与 README 目录表 `dsh-retrace` `0.4.55`→`0.4.56`；catalogVersion `1.50.0` → `1.50.1`，核对日期 `2026-10-20`。
- 改后跑 `pwsh scripts/verify.ps1 -Profile desktop`。
## 2026-10-20 dsh-watcher 0.7.0 / dsh-ops 0.4.1（catalog 1.50.0）

- **`dsh-watcher` 0.6.3 → 0.7.0**（自维护仓库 `github:daha1216/dsh-watcher`，[v0.7.0](https://github.com/daha1216/dsh-watcher/releases/tag/v0.7.0) 于 2026-10-20 12:49 UTC 发布）：面板改成「状态条 + 用量读数主窗口 + 可折叠执行路径」——44px 状态条只做读数（圆点、状态、实时动作、搜索与视图菜单），不再整行可点；模型 / 上下文 / Token / 估算费用改为标签加数值的网格，耗时区从带边框卡片收成 8px 发丝分布条，告警改发丝行；执行路径回到读数下方独立一行，带已载入轮次 / 步数 / 执行次数，默认收起，收起后面板回到内容高度。时间线行压到 33 / 30 / 26px 单行，只有一条记录且无模型阶段的 Step 直接摊平成记录行。客户端拆成 `src/client/panel/` 模块（`panel-model.ts` 承载纯投影，外壳拆成 `PanelHeader` / `SearchRow` / `ViewMenu` / `PathTimeline` / `TurnSection` / `PhaseSection` / `OccurrenceRow` / `PathToggle`），样式统一走 `--ui-*` 别名层；契约测试新增「组件引用的每个 `css.<name>` 必须在它导入的样式表里有定义」的守卫。修复宽面板阶段行溢出、sticky 轮次头半透明透出内容、窄面板耗时头碰撞。
- **`dsh-ops` 0.4.0 → 0.4.1**（npm 通道，[v0.4.1](https://github.com/T-Auto/dsh-ops/releases/tag/v0.4.1) 于 2026-10-20 09:15 UTC 发布、npm 12:40 UTC 上架）：`ops_*` 写入时放在目标旁的 `.dsh-ops-update-<sha256>.lock` 不再永久残留——持锁者发布前重新绑定 `(device, inode)`，释放时仍持锁且名字仍指向自己 inode 才 unlink；成功写入、锁后被拒、整目录 `replace` 都不留文件，只有被 SIGKILL 的写者会留一个，并会被下一次同名写入复用后清掉。同时收回三个没进 main 的 0.4.0 提交：`ops_bash` 后台任务因 Cordis 服务每次读取返回新代理、身份比较必然失败而报 `EXECUTOR_UNAVAILABLE` 的修复，凭据拒绝用例的 fixture，以及 release publish job 缺 `checkout` 导致 Release 资产传不上去的修复。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-watcher` `0.6.3`→`0.7.0`、`dsh-ops` `0.4.0`→`0.4.1`（`install` 钉版同步），catalogVersion `1.49.9` → `1.50.0`，核对日期 `2026-10-20`，README 徽章同步。其余条目经 npm registry / GitHub API 核对无变化（`dsh-better-reasoning-effort` 0.5.4、`billion-context` 0.1.202、`dsh-mnemon` 0.5.33、`@anysearch/anysearch-dsh` 0.1.8、`dsh-client-auto-continue` 0.15.0；`dsh-pocket` HEAD 2.11.2、`dsh-retrace` HEAD 0.4.55、`dsh-update-checker` HEAD 0.3.5、`dsh-skills-manager` v0.3.2；`dsh-our-free-model` 插件 tgz 仍 v2.5.5，`v2.5.6-macos-unofficial` 是 macOS 专用包不计入）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 12）。
- 本机状态：`dsh-watcher` 走本地开发路径 `file:D:/dsh work/dsh-watcher`，桌面端 profile 已部署 0.7.0 构建产物；`dsh-ops` 经用户确认已从 0.4.0 升到 0.4.1——按 npm 官方 tarball 的 sha512（`TBG6jsMCrMowoHTBCgOcAZ2p/4GLeJi0Pbpq6irqbCBQNumPmYq1WIACDlEheg9XMQcDOkcnNs7XZgVmU2dkYA==`）校验后手动替换 `node_modules/dsh-ops`（315 个文件，与解包树 `diff -r` 全等），`package.json` 依赖改为 `0.4.1`，用宿主的 `pnpm install --lockfile-only` 对齐 lockfile（integrity 已同步，pnpm 自动把 `dsh-ops@0.4.1` 加入 `minimumReleaseAgeExclude`）；桌面运行中未执行会重建 modules 的安装命令。profile 已备份到 `~/.dsh/profiles/desktop/backups/plugin-update-20261020-213325/`（含 0.4.0 旧树）。**重启 DSH 桌面后加载 0.4.1**；本次修的是更新锁残留，重启前宿主仍是 0.4.0 行为。

## 2026-10-20 dsh-ops 0.4.0（catalog 1.49.9）

- **`dsh-ops` 0.3.2 → 0.4.0**（npm 通道，[v0.4.0](https://github.com/T-Auto/dsh-ops/releases/tag/v0.4.0) 于 2026-10-20 05:54 UTC 发布、npm 06:00 UTC 上架）：工具名统一为 verb_noun——`read_many`→`read_files`、`table_read`→`read_table`、`doc_read`→`read_docx`、`pdf_read`→`read_pdf`、`sdk`→`load_sdk`、`discover`→`discover_tools`，`edit_many` 并入 `edit_file`（旧名静默迁移，已有配置无需改）。Native 默认常驻 `ops_read_files` 与 `ops_discover_tools`，单文件 / hex、搜索、修改、引用分页等按需发现；新增有界 CSV/TSV、DOCX 正文段落与受限 PDF 文本层读取。bundle 行新增 `discovery`（默认启用，`maxResults` 3、禁读凭据），`panel` / `tui` / `hide-official` 默认关闭（`hide-official` 改为 `replaceTools` 逐项选择）。shell 行三平台默认开启：Windows 固定使用随包 GNU bash 5.3.15（`@dsh-ops/bash-win32-x64@0.2.1`，PortableGit v2.56.0.windows.2，可用 `bashPath` 覆盖），Linux/macOS 用系统 bash；PowerShell 改由宿主管理，npm 的 `@dsh-ops/pwsh-win32-x64` 载荷依赖已移除（新增 `upgrade-host-pwsh` 预览命令）。其他：严格 TypeScript 迁移完成，`ops_bash` 无效参数返回结构化失败值，持久 0 字节 `.dsh-ops-update-<sha256>.lock` sidecar 属声明行为；上游基准称 BM-01 相比 0.3.x 输出减少 ≥40%（启动 schema 242 tokens，仅文件与发现面；含 Bash 的完整面 660 tokens），不声称净 token 节省。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-ops` `0.3.2`→`0.4.0`（`install` 钉版同步），描述按新工具集更新（0.4.0 不再随包 PowerShell）；catalogVersion `1.49.8` → `1.49.9`，核对日期 `2026-10-20`，README 徽章同步；避坑段补充 desktop profile 的实际命令与桌面自带 CLI / `--dsh-cli` 说明，并改为「0.4.0 起 npm 只随包 bash」。其余 11 条上游版本经 npm registry / GitHub release tag 核对无变化（`dsh-watcher` 的 HEAD `package.json` 已是未发布的 `0.7.0`，最新 release 仍 `v0.6.3`，目录按发布版保持 `0.6.3`；`dsh-our-free-model` 的最新 release 仍是 macOS 专用包 `v2.5.6-macos-unofficial`，插件 tgz 仍为 `v2.5.5`）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 12）。
- 本机更新动作：DSH 桌面运行中，未执行会重建 modules 的 pnpm 命令；按官方 npm tarball 的 sha512（`5+7w4sxpDxdF30iWMgFR9+BrT4cWy08aB/mMdiDKTLW80Yd5KQx67T/tUNgIkutRAm/OzHFjGEPdu4IpDA5UcQ==`）校验后手动替换 `node_modules/dsh-ops`（与 tarball 解包树 `diff -r` 全等，314 个文件；`runtime/win32-x64/dsh-ops-worker.exe` 的 sha256 与随包 provenance 一致），`package.json` 依赖改为 `0.4.0`，再用 `pnpm install --lockfile-only` 对齐 lockfile（pnpm 自动把 `dsh-ops@0.4.0` 追加进 `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`，因发布不足 24 小时）；移除不再被依赖的 `@dsh-ops/pwsh-win32-x64@0.2.1`（约 245MB）。profile 已备份到 `~/.dsh/profiles/desktop/backups/plugin-update-20261020-161159/`；profile 的 `cordis.patch.yml` 旧 `dsh-ops/shell`、`dsh-ops/file` 覆盖继续匹配，`discovery` 行按新 patch 默认启用注入。**重启 DSH 桌面后加载 0.4.0**（工具名与默认工具面变化，重启前宿主仍是 0.3.2 行为）。

## 2026-10-20 dsh-mnemon 0.5.33（catalog 1.49.8）

- **`dsh-mnemon` 0.5.32 → 0.5.33**（npm 通道，[v0.5.33](https://github.com/omdsh-dev/dsh-mnemon/releases/tag/v0.5.33) 发布于 2026-10-19 19:53 UTC，PR [#437](https://github.com/omdsh-dev/dsh-mnemon/pull/437)–[#441](https://github.com/omdsh-dev/dsh-mnemon/pull/441)）：修两个已报告的问题——① Git 同步在「Git 配置为某个 host 指定了用户名」或「开启 `credential.useHttpPath`」（Git Credential Manager 常见配置）的机器上找不到令牌，此前即使已登录也会误报「需要凭据」；现在按 host 规则取令牌：gitee.com 用 `oauth2`，其余 host 保持 `x-access-token`，需要在地址里写其他用户名时也支持；host 拒绝凭据时页面会说明被拒绝的是哪一个（#441、#408）。② 不在会话里运行的记忆任务不再在 DSH 侧栏「未分组」或 ACP 会话列表里留下空的「未命名」会话（#438、#435）。文档补充桌面端从 0.5.30 及更早版本、在 DSH 0.2.1 上的更新路径（在插件页卸载后以 `dsh-mnemon@<版本>` 重新添加，记忆与设置保留，#437、#433、#436）；两份 README 结尾补上 Star 历史与 License 段（#439、#440）。Starter 升到 0.5.33，其余 17 个组件版本不变，已有记忆无需迁移。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-mnemon` `0.5.32`→`0.5.33`（`install` 钉版同步）；catalogVersion `1.49.7` → `1.49.8`，核对日期 `2026-10-20`，README 徽章同步，并把此前新增 `dsh-client-auto-continue` 后未更新的插件数徽章 `plugins-11` 修正为 `plugins-12`。其余 11 条经 npm registry / GitHub API（自维护仓库取 HEAD `package.json`）核对无变化（`dsh-our-free-model` 的 `releases/latest` 仍是 macOS 专用包 `v2.5.6-macos-unofficial`，插件 tgz 仍为 `v2.5.5`，按插件包版本保持不动）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 12）。
- 本机更新动作：DSH 桌面运行中，未执行会重建 modules 的 pnpm 命令；按官方 npm tarball 的 sha512（`tP7EcI91e0yg4/A4CXsBFH7+HPPS8IrXElIE1Le2THKrPEI3ljoVbCvx6qg4fRpzPhsPGf7EPWsXFO6f9rcOvQ==`）校验后手动替换 `node_modules/dsh-mnemon`（66 个文件全量哈希一致，嵌套依赖保留），`package.json` 依赖改为 `0.5.33`，再用 `pnpm install --lockfile-only` 对齐 lockfile（pnpm 自动把 `dsh-mnemon@0.5.33` 加入 `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`，因发布不足 24 小时）。profile 已备份到 `~/.dsh/profiles/desktop/backups/plugin-update-20261020-041841/`；**重启 DSH 桌面后加载 0.5.33**。

## 2026-10-20 dsh-pocket 2.11.2（catalog 1.49.7）

- **`dsh-pocket` 2.11.1 → 2.11.2**（自维护 Fork `github:daha1216/dsh-pocket`，非上游原仓库）：设置页视觉重做，已 push 到 Fork `main`（`8c93aba..cdd0e71`，附注 tag `v2.11.2`）。要点：此前 2.11.1 只重构了结构、没有做视觉验收，用户反馈「按钮不清晰、界面不够好看」后按真实渲染重做——宿主浅色主题下卡片底色与页面同为白色（`--dsw-alias-bg-layer-1/2/3` 全为 `#fff`），导致整页发平；现改为页面浅灰底 + 卡片白面 + 细边 + 轻阴影，并新增 `.dshp-page` 语义 token 层（深浅色各自成立）；按钮统一为主/次/静默/危险四态，都有可见边界与 30px 点击高度，「复制链接」「刷新」「自定义」「修改」不再看起来像纯文字；页头加状态胶囊（已开启/已连接/已关闭），每张卡片补图标、标题、副题；局域网与公网关闭时给出「开启局域网访问 / 开启公网访问」主按钮；修掉「固定域名模式下仍显示随机域名黄色警告」的逻辑错，摘要面板与提示收敛；横幅去重 emoji、浅底上的次要按钮改描边样式；窄屏控件可换行、深色对比度核对、桌面内容限宽 760 居中。验收方式：把真实设置页组件渲染成 HTML，用 Chrome 无头 + CDP 真机视口（390×844）与桌面宽度逐状态截图（正常/公网运行/局域网关闭/错误/更新/重启/编辑/加载，明暗各一套）。验证：`npm test` 210 个测试、207 通过、0 失败、3 跳过（Windows 跳过 POSIX-only 用例）；`client/client.js` 已重建；部署树 88 个发行文件 0 差异；`client/repro-activate.mjs` 冒烟 42 个 effect。**客户端 bundle 改动需刷新设置页生效，仍显示旧界面则重启 DSH 桌面端**。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-pocket` `2.11.1`→`2.11.2`；catalogVersion `1.49.6` → `1.49.7`，核对日期 `2026-10-20`，README 徽章同步。其余 10 条上游版本经 npm registry / GitHub API 核对无变化（`dsh-our-free-model` 的 `releases/latest` 是 macOS 专用包 `v2.5.6-macos-unofficial`，插件 tgz 仍为 `v2.5.5`，按插件包版本保持不动）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。

## 2026-10-19 dsh-pocket 2.11.1 / dsh-update-checker 0.3.5（catalog 1.49.6）

- **`dsh-pocket` 2.11.0 → 2.11.1**（自维护 Fork `github:daha1216/dsh-pocket`，非上游原仓库）：设置页 UI 重构，已 push 到 Fork `main`（`498b4d4..8c93aba`，附注 tag `v2.11.1`）。要点：设置页改为「页头 + 状态胶囊 + 四张卡片（局域网访问 / 公网访问 / 手机端偏好 / 维护）」结构，样式改为注入一张 `.dshp-*` 样式表（颜色全走宿主 `--dsw-alias-*` token，深色自动适配，含手机宽度响应式）；图标复用宿主 `@deepseek-ai/dsh-client-ui-primitives` 的两代命名（`IconXxxOutlineRegular` / `IconXxxOutline16`，运行时探测、缺失降级空组件），旧宿主不会因缺组件崩页。交互与健壮性修掉 10 项：补上三个此前缺失的样式类（公网模式表单/高级地址下拉/免责声明勾选框是无样式裸控件）；首帧 status 未到时显示「正在读取状态…」而非空白卡；新增单项操作锁（开关/刷新/保存/重启/更新防连点与请求乱序）；轮询回来的快照比本地修改旧时丢弃（开关不会自己弹回去）；错误提示挪到页头且可关闭；三个弹窗支持点遮罩/Esc 关闭、打开时焦点落在「取消」，Toast 加 `role=status`；更新失败显示标题并给「稍后」（只隐藏横幅，15 分钟后或回到前台会再提示）；隧道开启 60 秒未就绪给明确错误；隧道/更新进行中显示已等待秒数且仅在有活跃操作时才挂每秒 tick。验证：`npm test` 210 项 / 207 通过 / 0 失败 / 3 跳过（Windows 跳过 POSIX 用例）；用 fake-react 把设置页渲染成元素树跑 6 个场景（首帧空、局域网就绪、命名隧道、隧道异常+更新失败、离线+重启提示、桌面端）全部通过；`client/client.js` 重建；部署树 88 个文件全量硬链校验 0 差异；`client/repro-activate.mjs` 冒烟 42 effects。**客户端改动刷新页面或重启 DSH 生效**。
- **`dsh-update-checker` 0.3.2 → 0.3.5**（自维护仓库 `github:daha1216/dsh-update-checker`，本机 desktop profile 实装已是 0.3.5）：0.3.3 修 cordis 4 下的宿主崩溃（ctx 私有状态、定时器清理顺序、失效上下文守卫）并新增生命周期回归测试；0.3.4 修待更新列表读回丢失、补提醒功能测试、设置页调整；0.3.5 运行逻辑收尾（单定时器不变量、状态写入串行化、RPC 回退降级、自定义间隔显示）；随后 README/关于页改版（真实截图、后台调度说明、AI 更新流程）。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-pocket` `2.11.0`→`2.11.1`、`dsh-update-checker` `0.3.2`→`0.3.5`；catalogVersion `1.49.5` → `1.49.6`，核对日期 `2026-10-19`，README 徽章同步。其余 9 条上游版本经 npm / GitHub API 核对无变化（`dsh-our-free-model` 最新插件包仍 v2.5.5）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。

## 2026-10-19 dsh-ops 0.3.2 / dsh-our-free-model 2.5.5（catalog 1.49.5）

`dsh-ops` 0.3.0 → 0.3.2（0.3.1 只发 GitHub、未发布 npm），`dsh-our-free-model` 2.5.3 → 2.5.5；本机 desktop profile 已同步实装。

- **dsh-ops 0.3.2**：完成 #151 拆分——11 个原生文件工具（#167）、安全与原子性层（#168）、可选 `hide-official`（#169）、PTC 分页、平台默认值（#170）以及可选的只读 panel/TUI 组件。原生 worker 改为随包分发（`runtime/<target>/`，含 provenance 回执），不再依赖 `@dsh-ops/fastctx-win32-x64` 这个 optional 包。
- **dsh-ops 行为修复**：`ops_bash` 参数错误恢复为带字段名的 typed refusal（#235，此前被折叠成不符合输出 schema 的值）；相对 `workdir` 锚定到会话工作区（#237，此前按 helper 进程自己的 cwd 执行）；`ops_glob` 的 `modified` 改回真实 mtime（#236，此前返回字节数、`sort: "modified"` 实际是大小排序）；凭据围栏的文档、拒绝文案与真实作用范围对齐（#240）。`hide-official` 的 `strict` 不再因官方工具缺少 OPS 替代而阻塞会话就绪（#238）。
- **dsh-our-free-model 2.5.5**：删除赞助说明中的交流群、群号与「复制群号」按钮；关闭 DSH 桌面插件启动时自动弹出的赞助开屏广告；保留赞助页入口与邀请码。独立本地服务与桌面壳不随本版更新。
- 目录快照同步：`plugins.json` 与 `README.md` 的 `dsh-ops`（0.3.2）、`dsh-our-free-model`（2.5.5，`install`/`update` 指向 v2.5.5 tarball）刷新；catalogVersion `1.49.4` → `1.49.5`；`pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。
- 本机更新动作：DSH 桌面运行中，未执行会重建 modules 的 pnpm 命令；改为校验官方 tarball（dsh-ops 走 npm sha512、our-free-model 走 release asset sha256）后手动替换两个 `node_modules` 目录，再用 `pnpm install --lockfile-only` 对齐 lockfile，并移除不再需要的 `@dsh-ops/fastctx-win32-x64`；**重启 DSH 桌面后生效**。

## 2026-10-19 billion-context 0.1.202（catalog 1.49.4）

`billion-context` 0.1.201 → 0.1.202（本机 desktop profile 实装同步到 0.1.202）。0.1.202 是 0.1.201 之后约 9 小时的修复/加固版，用户能感知的变化集中在传输、缓存与计费：

- **WS 超大请求不再直接 1009 断连**：WS lane 增加出站字节预算并对图片做降载（image shedding），超限请求走 HTTP/SSE 回退；超限拒绝的 422 提示改为「重启宿主」而不是「重试」（#3701 / #3589）。
- **prompt_cache_key 改为探测-记忆（probe-and-remember）**：openai chat 线默认打标 + A/B 探测，遇到不可消费该字段的传输（pi lane 等）就不打标，提升上游前缀缓存命中率（#2218 / #2645 / #3556）。
- **健康探针三态化**：忙代理不再被误判为死，overlay-busy 场景减少误重启（#3654）；busy-episode 日志每个 episode 只报一次。
- **计费与图片**：不透明片段按比例字节计价（两种计费模式一致），响应控制项不再计价（#3398）；图片消息 id 改为按 payload 寻址的指纹（#3751）；snapshot render 接入 google lane 并改为 server-authoritative outbound prefix（#3756）。
- **其他**：web 编辑器与启动审计接受 JSONC 配置（#3572 / #3488）；fork 前缀漂移改为 advisory 分类告警并收养漂移的 fork 子会话（#3741 / #3740）；claude / zcode 的 MCP 看门狗可在会话中途自愈代理（#1821）；pck 横幅对会话 id 做 HTML 转义（#2645）；自动诊断上报内容更丰富且继续脱敏（#3611）；dist 不再输出 sourcemap；kernel 升到 acp-kernel 0.0.136。

- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.201` → `0.1.202`，`install` 同步；catalogVersion `1.49.3` → `1.49.4`，核对日期 `2026-10-19`，README 徽章同步。其余条目本次未动（其中 `dsh-ops` 上游 npm 已到 0.3.2、`dsh-our-free-model` 已到 2.5.5，待后续更新）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。
- 本机更新动作：desktop profile 的 `package.json` 依赖、`pnpm-lock.yaml` 记录与 `node_modules/billion-context` 三处已收敛到 0.1.202；运行中的代理仍是 0.1.201（pid 10244），已写 `~/.cache/billion-context/.auto-restart` 抑制标记避免旧代理热重启打断会话，**重启 DSH 桌面后加载 0.1.202**。

## 2026-10-19 dsh-pocket 2.11.0（catalog 1.49.3）

- **`dsh-pocket` 2.10.9 → 2.11.0**（自维护 Fork `github:daha1216/dsh-pocket`，非上游原仓库）：吸收上游 `shaobeichen/dsh-pocket` 2.12.0 的 6 项修复 + 移动端移植层整体升级到 `dsh-web-mobile` v3.2.0，已 push 到 Fork `main`（`ba2f53d..498b4d4`，附注 tag `v2.11.0`）。要点：
  - **公网隧道不再被本机代理劫持**：启动 cloudflared 前剥离 `HTTP_PROXY`/`HTTPS_PROXY`/`ALL_PROXY`/`NO_PROXY` 及小写共 8 个变量，quick 与命名隧道都生效（此前 Clash 等代理环境下手机访问会 error 1033）。
  - **Windows 移动热点/ICS 下二维码不再指向不可达地址**：局域网 IP 评分排除 `本地连接*`、承载网络、Wi-Fi Direct 虚拟适配器，同分时不选 `192.168.137.x` 热点网段。
  - **深色主题下设置页开关可见**：开关圆钮不再硬编码白色，改用主题 token 并按上游改为 36×20 尺寸。
  - **桌面宿主判定修正**：改用 Electron 运行时特征识别桌面端；`restart.js` 增加桌面宿主守卫，返回 `desktop-host-restart-not-supported` 而不是误杀宿主。
  - **自定义密码可清空**：传空串会恢复随机 PIN 并落盘，用户能从固定密码退回随机。
  - **手机登录体验**：登录页按凭据类型设置 `autocomplete`（持久密码可被密码管理器识别/自动填充，一次性口令关闭），新增密码可见性切换按钮，光标位置不丢。
  - **移动端镜像 v3.1.0 → v3.2.0**（三方合并：v3.1.0 变换 + 14 条手工补丁 cherry-pick 到 v3.2.0，仅 `styles/base.css.ts` 一处冲突已解决）：Chrome Android 键盘弹起不再把整页顶上去（viewport `interactive-widget=resizes-content`）；iOS 边缘上下滑动不再滚不动（只拦横向轴锁定后的触摸）；抽屉「导出会话」改为品牌行 28×28 图标、会话列表多出 40px；宿主 0.2.1 统计行/后台任务 chip 适配（两档候选 + `locateRing`、形状锚替代失效 hash 类名）；壁纸插件下顶栏/抽屉补回底色；退休 `reasoning-defaults`（宿主已有内置按模型推理编辑器，避免语义打架）。
  - 验证：`npm test` 208 个测试、205 通过、0 失败、3 跳过（Windows 跳过 POSIX-only 用例）；`client/client.js` 重建 511436 字节；部署树 87 个文件全量硬链校验 0 差异；`client/repro-activate.mjs` 冒烟通过（42 effects）。重启 DSH 后已实测新代码加载（登录页出现 `pin-field`/`pin-toggle`，超长请求体仍回 413）。**宿主 `lib/` 与客户端 bundle 均有改动，需重启 DSH 桌面端生效**。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-pocket` `2.10.9`→`2.11.0`；catalogVersion `1.49.2` → `1.49.3`，核对日期 `2026-10-19`，README 徽章同步。其余条目沿用今日 1.49.2 快照的核对结果（`dsh-update-checker` 目录仍为 0.3.2、上游仓库已到 0.3.5，属另一会话维护范围，本次未动）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。

## 2026-10-19 @local/skills-manager 0.3.2（catalog 1.49.2）

本机 desktop profile 以 `link:` 方式加载 `D:\dsh work\skills-manager`，目录快照 `0.3.1` → `0.3.2`。这次是打包修复，没有运行时代码变更。

- **问题**：`package.json` 的 `dsh.bundle.patch` 指向 `./cordis.patch.yml`，但 `files` 白名单遗漏了该文件。GitHub 方式安装（`dsh plugin --profile web add github:daha1216/dsh-skills-manager`）时 pnpm 按 `files` 打包，tarball 里没有 overlay；DSH 启动校验报 `dsh: failed to read overlay ...\cordis.patch.yml: ENOENT`，插件在插件页显示红色「异常」，`settings.section`（id=`skills`）注册不上，设置里没有「技能」页。本地 `link:` / `file:` 安装因为整棵树都在，不受影响。
- **修复**：合并社区 PR #3（作者 @lanslot4n93r，commit `198a577`），把 `cordis.patch.yml` 加入 `files` 白名单；发布 commit `ea8d4b5`、tag `v0.3.2`、Release https://github.com/daha1216/dsh-skills-manager/releases/tag/v0.3.2 。`npm pack` 产物现为 12 个文件，包含 `cordis.patch.yml`；`node --test "test/*.test.mjs"` 21 项全通过。
- **升级**：之前 GitHub 安装失败或显示异常的用户重跑一次安装 / 更新命令即可（可钉版 `github:daha1216/dsh-skills-manager#v0.3.2`）；本地 `link:` 开发环境无需处理。重装后需重启 DSH 让插件重新校验加载。
- **目录快照同步**：`plugins.json` 与 `README.md` 目录表 `@local/skills-manager` `0.3.1` → `0.3.2`；`install` / `update` 字段不变（沿用目录的 GitHub 不钉版约定）；catalogVersion `1.49.1` → `1.49.2`，核对日期 `2026-10-19`，README 徽章同步。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。

## 2026-10-19 dsh-better-reasoning-effort 0.5.4（catalog 1.49.1）

本机 desktop profile `dsh-better-reasoning-effort` `0.5.3` → `0.5.4`（npm 通道，v0.5.4 发布于 2026-10-18 17:40 UTC / 北京时间 10-19 01:40，安装时发布约 7 小时，仍在 pnpm 默认 24 小时 release-age 窗口内）。本机内核 `0.2.1-rc.2` 正是该版本验证过的内核。

- **上游 v0.5.4 变更（官方 release 摘要）**：
  - 手写 pi-ai 路由上的思考等级编辑交给 `0.2.1` 线新增的官方「推理等级（Reasoning levels）」控件：出现官方块的行上插件收起自己的档位控件，保留默认档位选择、端点兼容与「自动适配」；此后所有写入携带 `efforts: 'keep'`，「自动适配」只以文本报告建议档位、不再写回，也不再覆盖官方声明。没有官方块的行（已安装目录路由、旧内核）保持插件自己的档位编辑不变。
  - 修复 Issue #24：在没有 `[data-composer-card]` 的界面上，模型菜单查找不再退回全文档扫描，设置页头部的重启下拉保留原有三项，不再被思考强度滑块替换。
  - 修复：在 `0.2.1-rc.2` 的模型页保存自定义模型后，未修改的行不再显示为已修改——只有编辑器实际渲染的 compat 字段参与判断，官方写入的空 `compat` 包裹对象被忽略。
  - 已知问题（0.5.3 起）：首次导入设置文件的那次启动中，若 `llm-pi-ai` 命名空间注册晚于约 61 秒重试窗口，宿主侧自动填充会被静默跳过；页面打开后由浏览器半部的空闲填充补上，重启立即填充。
- 更新流程沿用「桌面端运行中零 modules 重建」清洁法：备份至 `backups/plugin-update-20261019-084325/`（package.json / pnpm-lock.yaml / pnpm-workspace.yaml）；`pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude` 豁免联合体追加 `0.5.4`；宿主 pnpm 现为 11.28.5（runtime 布局已改为 `resources/runtime/primary-runtime/dependencies/pnpm`，经同目录 node 24.21.0 直跑 `pnpm.mjs`）执行 `pnpm install --lockfile-only --registry=https://registry.npmjs.org`（144 条目通过供应链策略校验，2.7s）；npm 官方 tarball 经 sha512（`6eoLwXO+…81Pg==`）与 lockfile integrity、官方 registry dist 三方比对一致后解压替换 `node_modules/dsh-better-reasoning-effort`（53 个文件，预构建产物，无构建审批），旧 0.5.3 目录删除。
- 顺带收敛锁文件滞后：`billion-context` 锁文件记录仍为 `0.1.200`（manifest 与 node_modules 已是 `0.1.201`），本次 `--lockfile-only` 对齐为 `0.1.201`，pnpm 同时把 `billion-context@0.1.201` 自动并入 `minimumReleaseAgeExclude`；插件 peer `@deepseek-ai/schemastery` 的解析由 `3.18.4` 落到 `3.18.5`（node_modules 本来就是 3.18.5）。实装 manifest / lockfile / node_modules 三处齐平 `0.5.4`；profile 顶层 `cordis.patch.yml` 无该插件相关条目，无需联动。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-better-reasoning-effort` `0.5.3` → `0.5.4`（`install` 钉版 `@0.5.4`）；`update` 字段不变——上游 README 当前原生命令仍是 `dsh plugin --profile web add dsh-better-reasoning-effort`；catalogVersion `1.49.0` → `1.49.1`，核对日期 `2026-10-19`，README 徽章同步。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。
- 升级后需重启 DSH 桌面端加载新代码。

## 2026-10-19 billion-context 0.1.201（catalog 1.49.0）

`billion-context` 从目录快照的 0.1.199 升到 0.1.201（本机 desktop profile 实装 0.1.200 → 0.1.201）。跨过的两个上游版本里，用户能感知的变化主要是四类：

- **错峰升级 + 远程更新策略（#3619，0.1.200 引入）**：自动更新发现新版本后不再立即安装，而是按实例在一个 15 分钟–48 小时的窗口里随机抽一个时刻执行，抽中的时刻持久化、重启不重抽；公共策略文件（`auto-update-policy.json`）可 `hold` 全线冻结、`blocked` 跳过指定版本、`pinned` 设升级上限，fail-open。手动 `bili update` 绕过 hold 与错峰，但仍遵守 blocked/pinned；`ACP_AUTO_UPDATE=0` 可整体关闭。Web 面板对 hold/pinned 状态显示横幅。
- **原生 lane 复用共享代理（#3436）**：同一客户端上的多个原生实例不再各自 spawn 一个代理进程，减少重复进程与端口占用；attach 兼容性改由子进程记录判定，避免 superseded recovery flight 回滚已注册的 origin（#3616）。
- **压缩与会话稳定性**：fold 锚定改为「顺序优先于哈希」（#3641，修 #3588 / #3640，解决长会话折叠漂移）；协议层引入稳定的 canonical core 身份（#3642）；kernel 升到 acp-kernel 0.0.132，容忍 OpenAI 非数组 content、保留尾部不透明片段（#3658），冷加载诊断不再静默（#3573）。
- **设置面板与图像**：设置页新增 `compress.absorb` 开关与出站图片降采样快速项，`read_original_image` 更名为 `acp_read_original_image`（#3546）；图片恢复转换失败改为按签名只 WARN 一次（#2824 类可见性）。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.199` → `0.1.201`，`install` 同步为 `billion-context@0.1.201`；`update` 从「重跑 add」换为上游 README 的原生自更新命令 `bili update`，更新表引导语与避坑区第 1 节补记全局 CLI 依赖、错峰窗口、重启宿主生效、`bili doctor --fix` 收敛清单四条；catalogVersion `1.48.0` → `1.49.0`，核对日期 `2026-10-19`，README 徽章同步。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。
- 本机更新动作：desktop profile 的 `package.json` 依赖、`pnpm-lock.yaml` 记录与 `node_modules/billion-context` 三处已收敛到 0.1.201；旧代理进程的自动热重启用 `~/.cache/billion-context/.auto-restart` 抑制标记压住（避免宿主仍跑旧代码时代理先热重启，造成接管中断），**重启 DSH 桌面后加载新代码**。

## 2026-10-18 dsh-retrace 0.4.55 / dsh-update-checker 0.3.2 / @local/skills-manager 0.3.1（catalog 1.48.0）

三个自维护插件同批发布**深色模式视觉修复**。三个插件的设置页在 DSH 深色主题下都有同一类问题，根因分三种：令牌语义用错、令牌在 DSH 中根本不存在、开关旋钮与轨道的令牌配对错误。

- **`dsh-retrace` 0.4.54 → 0.4.55**（自维护兼容 Fork `github:daha1216/dsh-retrace`，已 push `c0a71bd..0da8a53`）：6 个不存在的令牌全部替换——`--dsw-alias-bg-elevated`→`--dsw-alias-bg-layer-3`（撤回编辑器、标记胶囊、引用块的毛玻璃底）、`--dsw-alias-fill-l2`→`--dsw-alias-interactive-bg-hover`、`--dsw-alias-state-warning-primary`→`--dsw-alias-state-warn-primary`（少个 `ing`，标记提示文字此前一直是继承色）、`--dsw-alias-state-info-primary`→`--dsw-alias-state-business-primary`、`--dsw-alias-state-success-bg`→`--dsw-alias-state-success-tertiary`、`--dsw-font-mono`→`--ds-font-family-code`。橙色「发送」按钮白字在橙底对比度仅 2.26:1，改深色字 `#20160b` 后 7.86:1；复用它样式的错误确认按钮单独恢复 `--dsw-alias-label-primary-foreground` 前景。设置页开关按宿主 `._switch_1ik0f_5` / `._thumb_1ik0f_33` 的令牌配对重写（未选中 `border-l3` + `switch-thumb`，选中 `button-primary-fill` + `label-primary-foreground`），深色下旋钮对比度约 2:1 → 18:1。多处 `rgba(0,0,0,…)` 硬编码阴影改 `--dsw-shadow-lv1` / `--dsw-shadow-lv2`。橙色系配色是插件自身设计语言，保持不变。`lib/client.js` 与 `lib/client.bundle.js` 双文件同步改，各自 `node --check` 通过（该仓库无测试目录）。
- **`dsh-update-checker` 0.3.1 → 0.3.2**（自维护仓库 `github:daha1216/dsh-update-checker`，已 push `1d05fef..8626ed1`）：主按钮 `.dsh-uc-btn-primary` 原用 `--dsw-alias-brand-primary` 配 `color:#ffffff`，而该令牌是宿主**单色**主按钮底色（深色下近白 `#f9fafb`），实际渲染成白底白字；改用宿主自己的配对 `--dsw-alias-button-primary-fill` + `--dsw-alias-label-primary-foreground`，hover 由 `filter: brightness(1.06)` 改为 `--dsw-alias-button-primary-hover`。14 处 `--dsw-alias-brand-primary` 统一改 `--dsw-alias-link`（浅色 `#4176e6` / 深色 `#7aaaff`），覆盖状态色、筛选 chip 选中态、徽章、待更新卡片边框、图标底、版本号与链接、焦点轮廓。7 处 `--dsh-code-font-family` 在 DSH 中从未定义（浏览器静默丢弃），改 `--ds-font-family-code`。展开卡片与主按钮的硬编码黑阴影改 `--dsw-shadow-lv1` / `--dsw-shadow-lv2`。`npm test` 63 PASS。
- **`@local/skills-manager` 0.3.0 → 0.3.1**（自维护仓库 `github:daha1216/dsh-skills-manager`，已 push `695f4d6..b688de0`）：同一套修复——主按钮改配对令牌、危险按钮文字改 `label-primary-foreground`、13 处 `--dsw-alias-brand-primary` 改 `--dsw-alias-link`、4 处 `--dsh-code-font-family` 改 `--ds-font-family-code`、3 处 `--dsw-alias-state-warning-primary`（拼写错误）改 `--dsw-alias-state-warn-primary`。开关按宿主令牌配对重写并合并了原先重复的两条选中态选择器，深色下旋钮对比度由约 2:1 提升到 18:1。硬编码黑阴影改 `--dsw-shadow-lv2`。`npm test` 21 pass / 0 fail。
- 避坑区补记三条共用结论：① `--dsw-alias-brand-primary` 是**单色主按钮底色**，不是品牌蓝，配白色文字会在深色下变白底白字；要做强调色请用 `--dsw-alias-link`，要做主按钮请用 `button-primary-fill` + `label-primary-foreground` 配对。② `--dsh-code-font-family` / `--dsw-font-mono` 在 DSH 里**不存在**，等宽字体令牌是 `--ds-font-family-code`（注意不是 `--dsh-font-family-code`，后者只由 ThemePresenter 在用户配置了代码字体时以 body 内联样式写入）。③ 自绘开关必须照抄宿主 `._switch_1ik0f_5` / `._thumb_1ik0f_33` 的令牌配对，只改轨道不改旋钮会在深色下失去对比。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-retrace` `0.4.54`→`0.4.55`、`dsh-update-checker` `0.3.1`→`0.3.2`、`@local/skills-manager` `0.3.0`→`0.3.1`；catalogVersion `1.47.0` → `1.48.0`，核对日期 `2026-10-18`，README 徽章同步。其余 8 条上游版本沿用今日 1.47.0 快照的核对结果。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。

## 2026-10-18 新增 dsh-ops 0.3.0 / dsh-our-free-model 2.5.3（catalog 1.47.0）

- **`dsh-ops` 0.3.0 首次收录**（上游 `T-Auto/dsh-ops`，npm 通道，本机 desktop profile 实装 0.3.0）：Rust 原生文件工具套件——`ops_grep` / `ops_glob` / `ops_replace` / `ops_inspect_local_file`（含 hex 视图），以及随包的 MSYS bash 与 PowerShell 7 执行器，用于替掉 Windows 上反复失败的宿主原生 shell 调用，省 token 与往返时间。目录 `install` 写 `dsh-ops@0.3.0`，`update` 引用其 README 原生写法 `npx --yes dsh-ops@latest install --profile web`（会同时对齐随包二进制）。**收录注意**：仓库 HEAD 的 `package.json` 已是 `0.3.1` 但尚未发布 npm（`registry.npmjs.org/dsh-ops` latest 仍为 0.3.0），故目录版本取可安装的 0.3.0；本机安装时必须显式 `--registry=https://registry.npmjs.org`，因 `@dsh-ops/*-win32-x64` 三个 optionalDependencies 在 npmmirror 缺 0.2.1 版本，pnpm 全量重解析会报 `ERR_PNPM_NO_MATCHING_VERSION`（本次已在 README 避坑区记录该命令与原因）。
- **`dsh-our-free-model` 2.5.3 首次收录**（上游 `Ebony-Vinyl/dsh-our-free-model`，GitHub Release tarball 通道，本机 desktop profile 实装 2.5.3）：免费模型接入插件——无需登录 / 注册 / API Key 即可用 DeepSeek V4.1 Flash、Kimi K3 等前沿模型，2.0 起接入十三家账号渠道，附数据看板、运行日志、本地 OpenAI 网关与局域网转发。**目录 install/update 固定指向官方 Release 的 tarball 直链**（`.../releases/download/v2.5.3/dsh-our-free-model-2.5.3.tgz`，1,324,199 B，sha256 `ae61cc2b…a87952`，与发布方 SHA256SUMS.txt 一致）。选直链而非 `github:` 的理由：本机实测 `github:` 源经 codeload 打包 11.8 MB 耗时约 79 s，pnpm 的 git 解析超时报 `ERR_PNPM_PACKAGE_MANAGER_ADD_RESOLVE_GIT`，而同一个 tarball 直链 35.9 s 装成、81 个文件齐全且无第三方 npm 包多出的 `src/channel-visibility.js`。安装后置 `distribution: managed`（bundle config 层覆盖），应用内升级 / 公告 feed / 热重载停用，模型 lane 不受影响。
- 避坑区新增两条：`dsh-our-free-model` **禁用 npm 同名包**（第三方重打包，`index.js`/`client.js` 被改）、安装后须设 `managed`；`dsh-ops` 的官方源与原生更新命令。
- 目录快照同步：`plugins.json` 新增 2 条（共 9 → **11 条**，catalogVersion `1.46.2` → `1.47.0`，核对日期 `2026-10-18`）；`README.md` 目录表按现有分组归入（`dsh-our-free-model` → 模型与推理增强，`dsh-ops` → 会话管理与效率工具）、更新表两条、徽章 `catalog-v1.47.0` 与 `plugins-11 curated`、避坑区两条；`scripts/fetch-upstream.ps1` 映射补齐 `dsh-ops`、`dsh-our-free-model`、`dsh-mnemon`、`dsh-update-checker`、`dsh-skills-manager` 五个此前缺口的 id。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 11）。

## 2026-10-18 dsh-pocket 2.10.9（catalog 1.46.2）

- **`dsh-pocket` 2.10.8 → 2.10.9**（自维护 Fork `github:daha1216/dsh-pocket`，非上游原仓库）：第三轮「性能与运行问题」专项修复 + 新功能，已 push 到 Fork `main`（`d12de5f..ba2f53d`，附注 tag `v2.10.9`）。要点：新增「手机端字号」——手机端可独立把会话正文调到 12–22px，默认「跟随桌面」；实现为只在手机布局覆盖宿主的 `--dsh-content-font-size` 轴（delta / secondary / markdown 字号 token 联动），桌面布局不命中，桌面「字号大小」也不再影响手机，代码字号轴不动；哈希资产（`/assets/<名>-<哈希>.<ext>`）与带 `?rev=` 的插件包新增进程内 LRU 转码缓存（16 条 / 32MB），重复请求不再重算 brotli——实测 940KB 资产每次约 157ms 宿主 CPU、命中后约 0；上游中途断开时不再把错误文案拼进已发出的响应（此前会污染流式 HTML/JSON 尾部）；更新检查跳过隐藏标签页、周期 5→15 分钟、回到前台立即复检（手机后台不再每 5 分钟打一次外网）；fileGuard 对纯文本流式更新不再逐帧重扫父元素；回收站过期条目改为启动后清理（此前只在删除会话时顺带清理）。验证：`npm test` 205 个测试、202 通过、0 失败、3 跳过（Windows 跳过 POSIX-only 用例）；`client/client.js` 已重建；部署树 85 个文件全量硬链校验 0 差异；`client/repro-activate.mjs` 冒烟 43 个 effect 通过。**宿主 `lib/` 与客户端 bundle 均有改动，需重启 DSH 桌面端生效**。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-pocket` `2.10.8`→`2.10.9`；catalogVersion `1.46.1` → `1.46.2`，核对日期 `2026-10-18`，README 徽章同步。其余 8 条上游版本经 npm / GitHub API 核对无变化。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-18 dsh-retrace 0.4.54（catalog 1.46.1）

- **`dsh-retrace` 0.4.49 → 0.4.54**（自维护兼容 Fork `github:daha1216/dsh-retrace`，已 push `36aff0a..4571579`）：按审计报告修复数据安全与体验问题（0.4.50 审计发现项、0.4.51 遗留项、0.4.52 设置同步/错误响应/死代码清理），并修复 `git init` 相关缺陷——0.4.53 纠正 fs target 误用与 `.gitignore` 覆盖，0.4.54 为 `git init` 传入会话沙箱策略、修复 `.gitignore` 写入被拒。GitHub 仓库 About 描述更新为「适配 DSH 0.2.x 与插件服务机制」，标签 `dsh-0-1-5` 替换为 `dsh-0-2-0`。本机 desktop profile 实装内容已是 0.4.54（与仓库 main 一致）；宿主侧改动需重启 DSH 桌面端生效。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-retrace` `0.4.49`→`0.4.54`；catalogVersion `1.46.0` → `1.46.1`，核对日期 `2026-10-18`，README 徽章同步。其余条目沿用今日 1.46.0 快照的核对结果。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-18 @local/skills-manager 0.3.0（catalog 1.46.0）

- **`@local/skills-manager` 0.2.0 → 0.3.0**（自维护仓库 `github:daha1216/dsh-skills-manager`，已 push `127083d..0f87cf3`，附注 tag `v0.3.0`，GitHub Release 已发布）：新增「一键打开技能安装目录」——设置页工具栏「打开目录」直达 `~/.dsh/skills`，每个技能卡片「打开目录」定位到该技能目录（单文件型技能落到根目录）；Windows 用 `explorer.exe` + file-URL 编码（非 ASCII 路径、逗号/等号安全转义，与 DSH 内置打开方式一致），macOS 用 `open`、Linux 用 `xdg-open`；新增端点 `POST /skills-manager/api/open`，仅接受 POST，沿用 Host/Origin 信任围栏与 `application/json` 校验，目标限定在技能根目录内、spawn 仅传 argv 不拼 shell，根目录不存在时自动创建；新增 3 项测试（共 21 项通过），README 补 `/open` API 与安全边界。**宿主与客户端改动需重启 DSH 桌面端生效**（重启后已实测线上 `/open` 路由与客户端 bundle 均加载新版）。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `@local/skills-manager` `0.2.0`→`0.3.0`（描述补「一键打开技能目录」）；catalogVersion `1.45.0` → `1.46.0`，核对日期 `2026-10-18`，README 徽章同步。其余 8 条上游版本经 GitHub API 核对无变化。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-18 @local/skills-manager 0.2.0（catalog 1.45.0）

- **`@local/skills-manager` 0.1.0 → 0.2.0**（自维护仓库 `github:daha1216/dsh-skills-manager`，已 push `2790bfd..127083d`，附注 tag `v0.2.0`，GitHub Release 已发布）：按审查报告完成 P0→P2 修复。要点：frontmatter 改为分段解析/序列化，块标量、注释、未知键原样保留，修复切换调用策略时 `description: >` 被写空、导致官方 provider 静默忽略整个技能的数据丢失，并修掉 `---` 后空行每次保存递增；API 增加与 DSH `/api` 一致的信任围栏（Host / Origin / `sec-fetch-site` / `content-type` / 1MB 上限），原子写 + `.backups` 备份，删除改为移入 `.trash`，save/policy 支持 `expectedMtimeMs` 冲突检测；符号链接技能可发现，flat 技能保存不再产生重复条目，单文件读取失败降级为 problem；客户端补上保存后预览回填、未保存确认、busy/notice、a11y、`ctx.locale` 双语与窄屏响应式；新增 `node:test` 18 项。验证：`node --test "test/*.test.mjs"` 18 pass / 0 fail；真实技能目录只读扫描 13 个技能、0 异常，块标量描述完整。**宿主 `index.js` 改动需重启 DSH 桌面端生效**，设置页客户端刷新页面即可。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `@local/skills-manager` `0.1.0`→`0.2.0`；catalogVersion `1.44.5` → `1.45.0`，核对日期 `2026-10-18`，README 徽章同步。其余 8 条上游版本核对无变化。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-18 dsh-pocket 2.10.8（catalog 1.44.5）

- **`dsh-pocket` 2.10.7 → 2.10.8**（自维护 Fork `github:daha1216/dsh-pocket`，非上游原仓库）：第二轮深度审查修复，已 push 到 Fork `main`（`ed3e0b7..d12de5f`，附注 tag `v2.10.8`）。要点：隧道（cloudflared）意外退出后不再残留「运行中」假状态——退出回调清空隧道句柄与 pid，重新开启即可恢复（此前必须手动关再开）；访问 PIN 落盘失败时改用进程内值兜底，避免「密码怎么输都不对」；设置读取与 PIN 读取加 2 秒进程内缓存（按路径失效，测试隔离不受影响），消除每个代理请求 3~4 次同步读盘；`update` 端点的 `profile` 参数加白名单校验（此前在 Windows `shell:true` 下可拼命令）；CLI 二维码改用与插件一致的网卡评分，不再指向 Docker/WSL 虚拟网卡；`fileRead` 相对路径解析失败时回退到各工作区根，修复「复制文件内容」误报「仅允许工作区」；回收站目录名按 200 字符预算截断，修复深路径删会话必然 500；认证改为 fail-closed（受保护请求取不到 PIN 时回 503，而非跳过认证透传）；超长登录请求体改回 413 并给出文案（此前直接断连）；403 门禁缓冲改累计字节（去掉 O(n²)）；`maybeSeedAuthCookie` 兼容三参 `writeHead`；隧道复用下载时不再回跳状态；批量 detach 改 `Promise.allSettled`；`desktopAdvanced` 改为按配置块整块匹配。验证：`npm test` 196 个测试、193 通过、0 失败、3 跳过（Windows 跳过 POSIX-only 用例），部署树 85 个文件全量硬链校验 0 差异，`client/repro-activate.mjs` 冒烟通过。**宿主侧 `lib/` 改动需重启 DSH 桌面端生效**；客户端本轮无改动，无需重建 `client.js`。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-pocket` `2.10.7`→`2.10.8`；catalogVersion `1.44.4` → `1.44.5`，核对日期 `2026-10-18`，README 徽章同步。其余 8 条上游版本核对无变化。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-18 dsh-pocket 2.10.7 / billion-context 0.1.199 / dsh-mnemon 0.5.32（catalog 1.44.4）

- **`dsh-pocket` 2.10.6 → 2.10.7**（自维护 Fork `github:daha1216/dsh-pocket`，非上游原仓库）：按审计报告落地 15 条修复，已 push 到 Fork `main`（`ad0034d..ed3e0b7`）。要点：`fileRead` 增加凭据/密钥路径拒绝与工作区白名单（此前持有 PIN 即可读整机敏感文件）；全局限速锁豁免成功登录过的来源，攻击者刷失败不再连带锁死合法设备；普通 HTTP 转发共享 keep-alive Agent（WebSocket upgrade 保留 `agent:false`）；`isLoopbackHost` 接受整个 `127.0.0.0/8`；`lanIPv4()` 加 30s 缓存、二维码缓存改 LRU、设置页轮询 3s→10s；重启后轮询等待宿主可用再刷新（30s 上限 + 手动刷新按钮）；403 溢出丢缓冲、`/pocket-login` 前缀匹配、IPv6 Host 解析等确定性 bug 一并修掉；新增 `test/audit-fixes.test.js` 四条回归测试。验证：`npm test` 192 个测试、189 通过、0 失败、3 跳过（Windows 跳过两个 POSIX-only 用例），`client/repro-activate.mjs` 冒烟通过。**宿主侧 `lib/` 改动需重启 DSH 桌面端生效**（本次未重启），客户端改动刷新页面即生效。
- **`billion-context` 0.1.196 → 0.1.199**（npm 通道，v0.1.199 发布于 2026-10-17 17:18）。上游变更：0.1.197 引入会话身份 order-primary resolver v2 与身份管线 R2（namespace + origin 列）、SQLite 引擎自举（builtin → host → cached → self-download）、四条 wire 的统一入站标记剥离引擎；0.1.198 让 MCP compress 走 consumed-call 清理、最近区保护改为 pair-aware（防孤立 function_call）、启动器探活失败报真实原因（端口占用分类 + win32 整树 kill）、支持下载完整会话报告（Markdown + PNG）、修复 dsh 设置面板嵌入路由预检；0.1.199 让 dsh PTC `run_code` omnibus 被识别为 compress-reachable、takeover 归因失败可见、`giveUp` 后失效在途 attach 链以防晚到探测复活已清理的 base、并修复 WS 热重导入时拦截状态跟随。
- **`dsh-mnemon` 0.5.28 → 0.5.32**（npm 通道，v0.5.32 发布于 2026-10-17 19:40）。上游变更：0.5.29 Git 同步不再使记忆空间成倍增加（按记忆比较合并）、支持 base64 >4.4 MB 的记忆包与表单编码的 GitHub 登录、设置保存后新建的 Provider 命名空间可进入记忆空间；0.5.30 记忆写入目标严格化（未指定空间则不写、不自行激活空间）、测试状态可列出并补齐向量、Git 同步多项修复；0.5.31 支持 DSH 0.2.1-rc.1、恢复记忆子 Agent 与「检查版本 → 更新」、任务 Agent 模型支持跟随全局/跟随会话/自定义；0.5.32 未生成向量的存入回执改为中性说明、记忆空间自带设置（可不随 dsh-mnemon 发布修改）、开发与 CI 迁移到 DSH 0.2.1-rc.2。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-pocket` `2.10.6`→`2.10.7`、`billion-context` `0.1.196`→`0.1.199`（install 钉版同步）、`dsh-mnemon` `0.5.28`→`0.5.32`（install 钉版同步）；catalogVersion `1.44.3` → `1.44.4`，核对日期 `2026-10-18`，README 徽章同步。本机 desktop profile 中 `dsh-pocket` 为 `file:` 部署（已硬链同步），`billion-context` 实装 0.1.199，`dsh-mnemon` 实装 0.5.31（落后目录快照 0.5.32 一个补丁版，未在本次更新范围内）。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-18 dsh-update-checker 升级 0.3.1（catalog 1.44.3）

- 上游 `daha1216/dsh-update-checker` 发布 v0.3.1（commit `f4b2a8a`，2026-10-18）；本机 desktop profile 为 `link:` 部署，源码即生效，无需重装。宿主端（`lib/`、`index.js`）改动需重启 DSH 桌面端，设置页（`client/client.js`）改动刷新一次 GUI 页面即可。
- 上游 v0.3.0 → v0.3.1 变更：
  - 缓存按 profile 隔离：`check.last` 的文件回退校验文件内 `profileDir` 与当前 profile 一致，多 profile 宿主不再串台。
  - 新增 `local-ahead` 状态：本地版本高于上游时显示「本地领先上游」，不再与「本地一致」混淆；本地安装行同样区分一致/落后/领先。
  - 非 semver 引用（分支 / commit sha）判为「跟踪分支」，不再永久挂「无法比较」。
  - `releasesAfterTag` 改用版本比较确定停止点，上游 tag 无 `v` 前缀时不再混入更旧版本的 release。
  - 支持 `GITHUB_TOKEN` / `GH_TOKEN`（Bearer 头）提升 GitHub API 配额，未设置时保持匿名。
  - 可访问性：折叠行改为真正的展开按钮（`aria-expanded`/`aria-controls`/`aria-label`，键盘可操作）；更新正文首次展开才解析渲染；无正文的 release 行不再显示空折叠区。
  - 结果页底部显示本次扫描的请求数与缓存命中数（`stats` 页脚）。
  - `prefers-reduced-motion` 规则收窄到插件页面，不再影响整个 DSH UI；宿主与客户端状态排序表统一。
  - 测试：离线 101 断言 + 渲染冒烟；E2E 17 项（缓存读写改用临时 home，不污染真实安装）。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `dsh-update-checker` `0.3.0`→`0.3.1`；catalogVersion `1.44.2` → `1.44.3`，核对日期 `2026-10-18`，README 徽章同步。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-14 billion-context 升级 0.1.196（catalog 1.44.2）

- 本机 desktop profile `billion-context` `0.1.195` → `0.1.196`（npm 通道，v0.1.196 发布于 2026-10-13 03:29）。插件后台自更新已先行将 node_modules 与 8790 代理守护实例推到 0.1.196，manifest 钉版/豁免/锁文件滞后在 `0.1.195`。对齐流程：备份至 `backups/plugin-update-20261014-060605/`，`pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude` 豁免联合体追加 `0.1.196`，`package.json` 钉版改 `0.1.196`，宿主 pnpm 11.7.0 执行 `pnpm install --lockfile-only --registry=https://registry.npmjs.org`（93 条目通过供应链策略校验），锁文件两处条目更新至 `0.1.196`。实装 node_modules/manifest/lockfile/守护实例四处齐平 0.1.196，无需重启。
- 上游 `v0.1.195...v0.1.196` 变更（官方 release 摘要，[compare](https://github.com/ranxianglei/billion-context/compare/v0.1.195...v0.1.196)）：
  - Web UI：已知宿主计量插件（如 dsh-context）报告压缩前上下文时给出提示（#2865）；`acp_status` 实例级端点指针改按数据行读取（#2863/#2869）。
  - 归因与诊断：代理模式/投影开关与宿主 prompt 改写在账本中区分归因（#2867/#2873）；pfa-* 匿名账本可归因——mint 时刻记录 producer 溯源 + 唯一标签（#2879/#2885）；default-direct 失败诊断点名被跳过的 env/system 代理（#2809/#2860）。
  - 内核修复：压缩结果/blocksCreated 经宿主转发 lane 传播（#2752）；内部循环保留已接受的 overflow Prepared 视图（#2786）；封界 #2864 的三条观测噪声路径（#2871）。
  - 其他：hermes MITM 域名发现在无 PyYAML 时回退 ruamel.yaml（#2838/#2842）；宿主插件 effective-context 文档面（#2855）；CI 16min→11m43s（#2816/#2848）。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.195`→`0.1.196`（install 钉版 `@0.1.196`）；catalogVersion `1.44.1` → `1.44.2`，核对日期 `2026-10-14`，README 徽章同步。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。
## 2026-10-14 dsh-better-reasoning-effort 升级 0.5.3（catalog 1.44.1）

- 本机 desktop profile `dsh-better-reasoning-effort` `0.5.2` → `0.5.3`（npm 通道，v0.5.3 发布于 2026-10-13 18:04，npm 同步 18:10）。安装源经用户确认由 `github:HaoyueQin/dsh-better-reasoning-effort#v0.5.2` 换为 npm 钉版 `0.5.3`（与目录 install 字段、上游 README 首选通道一致）。流程沿用清洁法（桌面端运行中零 modules 重建）：备份至 `backups/plugin-update-20261014-031700/`，`pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude` 豁免联合体追加 `0.5.3`（发布约 9 小时），宿主 pnpm 11.7.0（`D:\deepseek harness\resources\runtime\pnpm`，经 node 24 直跑 pnpm.mjs）执行 `pnpm install --lockfile-only --registry=https://registry.npmjs.org`（93 条目通过供应链策略校验；锁文件条目由 github tarball 换为 npm `dsh-better-reasoning-effort@0.5.3` + integrity），npm 官方 tarball 经 sha512 与锁文件比对一致后解压替换 `node_modules\dsh-better-reasoning-effort`（预构建产物，无构建审批），旧 0.5.2 目录删除。实装 manifest/lockfile/node_modules 三处齐平 0.5.3；profile 顶层 `cordis.patch.yml` 无该插件相关条目，无需联动。升级后需重启 DSH 桌面端生效。
- 上游 `v0.5.2...v0.5.3`（20 commits，官方 release 摘要）：
  - 目录模型路由改走官方 `modelOverrides` 存储读写：编辑落成一条模型覆盖项，而不再用 `models` 数组替换整个目录；目录中任一模型的首个覆盖项不再被当作 model-not-found 拒绝。
  - 请求头区域会报告默认档兜底的活动：检查过多少无档位调用、改写了多少、最近一次改写的模型，同一报告由 `/dsh-better-reasoning-effort/headers-config` 提供；移除请求头编辑器与兜底的提案未被采纳，二者保留。
  - 支持 `0.2.1-alpha` 内核线（与 `0.2.0-rc.2` 并行）；经 OpenRouter/Together/Baseten 聚合网关的模型改带网关自身推理方言；自动填充收窄为仅命中内置知识库条目的模型，未命中模型保持原样直至接受「自动适配」建议。
  - 修复：composer 思考强度滑块不再为每档画定位点、预览与提交档位不一致（拖动预览小数位置而提交吸附整档）；卡片上刚修改的兼容字段可能提交旧值（处理器读到未被刚触发输入更新的 React state）；乱序选择响应覆盖更新选择、被拒恢复丢弃仍有效记忆的会话档位记忆损坏；停用或热重载插件时官方菜单被臆造值还原、抹掉宿主自设的 class/内联样式。
  - 已知问题：首次导入设置文件的那次启动中，若 `llm-pi-ai` 命名空间注册晚于约 61 秒重试窗口，宿主侧自动填充被静默跳过（页面打开后由浏览器半部空闲填充补上，重启立即填充）。
- 目录快照同步：plugins.json 与 README 目录表 `dsh-better-reasoning-effort` `0.5.2`→`0.5.3`（install 钉版 `@0.5.3`）；catalogVersion `1.44.0` → `1.44.1`，核对日期 `2026-10-14`，README 徽章同步。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过（条目 9）。

## 2026-10-13 billion-context 升级 0.1.195 + 新收录 dsh-mnemon（catalog 1.44.0）

- 本机 desktop profile `billion-context` `0.1.192` → `0.1.195`（npm 通道）。插件后台自更新已先行将 node_modules 与 8790 代理实例推到 0.1.195（DSH lane 实例 18788 亦自更新至 0.1.195，stale=False），manifest/lockfile/目录快照滞后在 `0.1.192`。对齐流程：备份至 `backups/plugin-update-20261013-004142/`，`pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude` 豁免联合体追加 `0.1.193 || 0.1.194 || 0.1.195`，`package.json` 钉版改 `0.1.195`，宿主 pnpm 11.7.0 执行 `pnpm install --lockfile-only`（93 条目通过供应链策略校验），锁文件两处条目更新至 `0.1.195`。实装 node_modules/manifest/lockfile 三处齐平 0.1.195。
- 上游 `v0.1.192...v0.1.193`（2026-10-11 发布，70+ PR 大版本）变更（官方 release 摘要）：
  - 统一 SQLite 存储引擎取代分文件状态（#2690/#2768/#2781），损坏索引自动降级（#2772）与 Windows EBUSY 重试（#2788）。
  - archive-then-fold 取代 compress.stripImages：可归档媒体默认折叠归档（#2640/#2688/#2702）；MCP 前缀工具硬保护（#2584）。
  - 模型切换血缘与 fork 继承、协议中立身份域（#2719/#2727/#2807）；Threads continue 指纹会话亲和（#2718）。
  - DSH 原生压缩守卫与僵尸折叠块回收（#2707）、未归属透传守卫（#2722/#2715）；外部摘要预算联动 compress 等待（#2654）；客户端断开后阻止 preflight 继续转发（#2541）；配置面守护 CI（#2651）。
- 上游 `v0.1.193...v0.1.194` 变更：external-summary 整合包（#2806：新预算、并发批次、池旋钮、Go 会话头）；发布说明截断修复（#2818）；跨协议切换 e2e 覆盖（#2819）；移除 better-sqlite3 可选依赖（#2823/#2825）。
- 上游 `v0.1.194...v0.1.195` 变更：DSH 原生压缩拒绝改报 422 而非 403（#2844）；preflight 将 normal-stop 零文本摘要归类为确定性（#2832）；跨协议会话亲和投影至中立身份域修复协议切换分裂（#2791/#2839）；探针子进程 stderr 不再泄漏宿主终端（#2834/#2836）；pi lane 探测真实 npm 目录（#2850）；bugfix-release 分支走 PR 发布流程（#2851）；CI version-guard 放行 carve-out 分支。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.192`→`0.1.195`（install 钉版 `@0.1.195`）；catalogVersion `1.43.4` → `1.44.0`，README 徽章同步。
- 新收录 `dsh-mnemon` `0.5.28`（npm 通道，[omdsh-dev/dsh-mnemon](https://github.com/omdsh-dev/dsh-mnemon)）：profile 已装且列入 bundles 激活清单但目录缺条目（本次 verify 对账发现）。上游 HEAD 与本地实装同为 0.5.28。条目 8 → 9，归入「模型与推理增强」分组；更新命令取自其 README 原生写法 `dsh plugin --profile web add dsh-mnemon`。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过。

## 2026-10-11 anysearch-dsh 升级 0.1.8（追平 npm latest，catalog 1.43.4）

- 本机 desktop profile `@anysearch/anysearch-dsh` `0.1.7` → `0.1.8`（npm 通道）。v0.1.8 发布于 2026-10-10 08:54 UTC，更新重点为放宽宿主版本限制。实装更新流程：备份至 `backups/plugin-update-20261011-062734/`，在 `pnpm-workspace.yaml` 中的 `minimumReleaseAgeExclude` 追加 `@anysearch/anysearch-dsh@0.1.8`，更新 `package.json` 钉版为 `0.1.8`，宿主 pnpm 执行 `pnpm install --lockfile-only` 对齐锁文件，将 npm 官方 0.1.8 发布包解压同步至 `node_modules/@anysearch/anysearch-dsh`（桌面端运行中执行无文件锁定冲突）。实装 node_modules/manifest/lockfile 三处齐平 0.1.8；按用户指示暂不重启桌面端。
- 上游 `v0.1.7...v0.1.8` 变更（官方 release 摘要）：
  - 放宽 DSH 宿主版本限制：将 5 个核心组件（credentials/system-prompt/tool-web/tools/web）的 peerDependencies 声明由离散版本串改为 `*`，默认放行包括 alpha、rc 在内的新版 DSH 安装，避免 DSH `0.2.1-alpha.2` 等新版因声明截止在 `0.2.1-alpha.1` 而报错拦截。
  - 分离测试矩阵与准入规则：已测试版本矩阵不再作为安装白名单；保留每周自动化测试持续追踪底层 API 变化。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `@anysearch/anysearch-dsh` `0.1.7`→`0.1.8`；catalogVersion `1.43.3` → `1.43.4`，README 徽章同步；条目 8 不变。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过。

## 2026-10-11 billion-context 升级 0.1.192（追平 npm latest，catalog 1.43.3）

- 本机 desktop profile `billion-context` `0.1.191` → `0.1.192`（npm 通道）。v0.1.192 发布于 2026-10-10 15:30 UTC（北京时间约 23:30），插件后台自更新已先行将 node_modules 推到 0.1.192，manifest/lockfile 滞后在 `0.1.191`。对齐沿用清洁法：备份至 `backups/plugin-update-20261011-010500/`，在 `pnpm-workspace.yaml` 中的 `minimumReleaseAgeExclude` 追加 `0.1.192`，更新 `package.json` 钉版，宿主 pnpm 11.7.0 执行 `pnpm install --lockfile-only`（桌面端运行中执行无冲突，node_modules 零触碰），锁文件两处条目更新至 `0.1.192`。实装 node_modules/manifest/lockfile 三处齐平 0.1.192。
- 上游 `v0.1.191...v0.1.192` 变更（官方 release 摘要）：fix(#2658 / PR #2664) DSH 原生压缩改写的双信号检测与 ACP 状态平滑重基（rebase）自愈机制移植至 Anthropic（Claude）与 Google（Gemini）通道。此前该自愈机制仅部署在 OpenAI 与 Responses 通道，遗漏了 Anthropic 与 Google 通道，导致长会话触发 DSH 原生压缩后陷入“无法锚定”状态死亡循环、Prompt Cache 持续击穿并永久失去压缩能力；本次修复在 `prepare-anthropic.ts` 与 `prepare-google.ts` 中补齐判定与自愈重基，平滑重建折叠引用与原生压缩边界。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.191`→`0.1.192`（install 钉版 `@0.1.192`）；catalogVersion `1.43.2` → `1.43.3`，README 徽章同步；条目 8 不变。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过。

## 2026-10-10 billion-context 升级 0.1.191（追平 npm latest，catalog 1.43.2）

- 本机 desktop profile `billion-context` `0.1.190` → `0.1.191`（npm 通道）。v0.1.191 发布于当日 09:14 UTC，插件后台自更新已先行将 node_modules 推到 0.1.191，manifest/lockfile 滞后在 `0.1.190`。对齐沿用清洁法：备份至 `backups/plugin-update-20261010-191500/`，合并 `pnpm-workspace.yaml` 中的 `minimumReleaseAgeExclude` 联合体加入 `0.1.191`（修复多行同包名规则被 pnpm 策略评估短路覆盖的问题），更新 `package.json` 钉版，宿主 pnpm 11.7.0 执行 `pnpm install --lockfile-only`（桌面端运行中执行无冲突，node_modules 零触碰），锁文件两处条目更新至 `0.1.191`。实装 node_modules/manifest/lockfile 三处齐平 0.1.191。
- 上游 `v0.1.190...v0.1.191` 变更（官方 release 摘要）：fix(#2503) DSH 0.2.1-alpha.2 上标题生成（title-gen）请求改走 side lane 侧向通道；feat(#2412) debug dump 目录支持按大小/保留期自动滚动清理；fix(#2472) Pi fork adoption 有界快照诊断与前置网络拦截闸门；fix(#2544) 压缩收据指纹携带完整摘要，引导 decompress 前优先执行 search_context 检索；fix(#2565) 剔除所有出站请求体中未配对的孤立代理项编码（unpaired surrogate escapes）；feat(#2283) 为上下文窗口、计费与对齐决策增加离线审计行；fix(#2585) 逐项 agent-providers 上报摄入，单个拒绝条目不再丢弃整份报告；fix(#2594) 用 Codex 当前可用窗口替代过期的 272K 对齐回退；fix(#2605) 在 DSH 内置 DeepSeek 路由上自动重试 MALFORMED_RESPONSE；fix(#2621) 将 DSH 压缩帧检测器严格限制在用户文本消息；fix(#2631) 锁定 dsh.bundle.patch.yml 采用 LF 并在字节级包含前规范化 CRLF。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.190`→`0.1.191`（install 钉版 `@0.1.191`）；catalogVersion `1.43.1` → `1.43.2`，README 徽章同步；条目 8 不变。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过。

## 2026-10-10 billion-context 升级 0.1.190（追平 npm latest，catalog 1.43.1）

- 本机 desktop profile `billion-context` `0.1.189` → `0.1.190`（npm 通道）。自更新先行六连：v0.1.190 发布于当日 06:08 UTC，插件后台自更新已先把 node_modules 推到 0.1.190，manifest/lockfile 仍钉 `0.1.189`。对齐沿用清洁法：备份至 `backups/plugin-update-20261010-151000/`，更新 `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude` 加入 `0.1.190`，手改 `package.json` 钉版，宿主 pnpm 11.7.0 `pnpm install --lockfile-only`（桌面端运行中执行无冲突，node_modules 零触碰），锁文件两处条目 `0.1.189`→`0.1.190`、integrity 换新。实装 node_modules/manifest/lockfile 三处齐平 0.1.190。
- 上游 `v0.1.189...v0.1.190` 变更（官方 release 摘要）：feat(PR#2571) external-summary autoFold 外部摘要自动折叠（零大模型介入增长折叠+可观测外部块）；feat(#2480/#2488/#2540) 位置折叠标识与存储结构规范化（Pass 0 位置+规范内容指纹，按 ID 复用快速路径）；feat(#2428/#2419/#2447/#2547) 消息级保护钩子与 DSH 持久状态守卫（保护技能目录、工作区指令与 mcp_catalog）；fix(#2437) 单次批量 compress 调用消除初见历史积压；fix/docs(dsh #1772/#2474/#2477/#2476) 修正 DSH 原生压缩开关结论（提供 Web profile 彻底禁用原生自动压缩的 patch 配方）；fix(#2475/#2564) Web 画布与嵌入面绑定色彩方案适配深色模式，跟随 DSH 宿主主题与增加边框呼吸间距；fix(#2505) 支持 Windows ProxyOverride 通配符（127.*, 192.168.*）；fix(#2516/#2515) 截断重拉剔除未签名思考块、Anthropic 代理模式第 2 轮保留 cache_control；fix(#2562/#2577) 输出预算排除图片 Token 重复计算，根据 DSH 原始台账规划预算并熔断失败探针；fix(#2495/#2508) Google wire 协议识别，Claude Code WebSearch 侧向透传；fix(#2457/#2498/#2497/#2486) x-bili-plugin-model 非 ASCII 防护、同源恢复原地重试、400 形状判定 stream、5xx 溢出标记识别加固。
- 目录快照同步：`plugins.json` 与 `README.md` 目录表 `billion-context` `0.1.189`→`0.1.190`（install 钉版 `@0.1.190`）；catalogVersion `1.43.0` → `1.43.1`，README 徽章同步；条目 8 不变。改后跑 `pwsh scripts/verify.ps1 -Profile desktop` 通过。

## 2026-10-10 卸载 dsh-gateway-provider（9→8，catalog 1.43.0）

- 按用户指示卸载 `dsh-gateway-provider`：desktop profile 执行 `pnpm remove dsh-gateway-provider` 移除依赖与 node_modules，清理 `pnpm-workspace.yaml` 中的构建授权规则及 `compatibility.json` 中的版本豁免。
- 清理配置残留：从 `cordis.patch.yml` 与 `cordis.yml` 中移除 `subagent-model-selection-settings` 的 `gateway:cpa-gemini` 候选，删除 patch 中的 `llm-newapi`（dsh-gateway-provider）插件配置块。
- 目录同步：`plugins.json` 撤出 `dsh-gateway-provider`，`README.md` 目录表、更新命令表和特殊说明区同步清理；catalogVersion `1.42.1` → `1.43.0`，README 徽章同步；`pwsh scripts/verify.ps1 -Profile desktop` 校验通过（8 条）。

## 2026-10-09 补录两条实装插件：gateway-provider 首录 + skills-manager 首发开源（7→9，catalog 1.42.1）

- 上轮按「目录=本机实装镜像」撤条后，用户指出还有装了没进的——实装差集补齐：desktop profile 9 项依赖 vs 目录 7 条，缺 `dsh-gateway-provider` 与 `@local/skills-manager`。
- `dsh-gateway-provider` `1.1.1` 首录：仓库本已存在（自建 Fork `daha1216/dsh-gateway-provider`，保留上游 `Luck9Star` 提交史，1.1.1 = 上游 1.1.0 + /v1beta 发现正则修复 + 推理档后缀修复），desktop 实装为 GitHub SHA 钉 `0fcfe57`。入 🧠 模型与推理增强分区，install/update 走无钉 `github:daha1216/dsh-gateway-provider`（与 retrace/watcher 同款）；特殊说明区补 Fork 出处条。
- `@local/skills-manager` `0.1.0` **首发开源**：原为桌面端会话自研的本地插件（`link:D:/dsh work/skills-manager`，`private:true`、无 git 历史——「没上传」的字面主），本轮按发布流程建仓推送 `github:daha1216/dsh-skills-manager`（main 单分支，初始提交 2790bfd）：package.json 摘 `private`、补 repository/homepage/bugs；README 头部补安装节；新增 MIT LICENSE（2026 daha1216，同 update-checker 款）与 .gitignore；源码零改动（发布前敏感扫描仅命中标准 URL 解析 base）。入 🛠️ 会话管理与效率工具分区；特殊说明区补「本地 link 开发态以本地代码优先」条（同原 font-customizer 惯例）。
- 命名说明：包名保留 scoped `@local/skills-manager` 未改——插件 id 三处硬编码（package.json / index.js `export const name` / cordis.patch.yml），改名需停机窗口联动（profile 依赖键 + pnpm 重链接 + 重启），留待后续；scoped github 安装有 `@xueayi/dsh-opencode-go-usage` 先例可装。catalogVersion `1.42.0` → `1.42.1`（收录类 patch +0.0.1，先例 1.40.5/1.41.0），README 徽章两行同步。改后 `pwsh scripts/verify.ps1` 通过（9 条）。

## 2026-10-09 精简为本机实装集：撤 5 条未装插件（12→7，catalog 1.42.0）

- 按用户指示「从目录中删除我本机没有的插件」，以 desktop profile 实装 dependencies 为唯一判据，撤下 5 条：`dsh-pet`（0.3.6）、`@xueayi/dsh-opencode-go-usage`（0.1.6）、`dsh-all-usage`（1.1.18）、`dsh-font-customizer`（0.1.0）、`dsh-plugin-oauth-subs`（0.0.117）。`~/.dsh` 顶层的 `dsh-pet/`（main-config.json）与 `dsh-font-customizer/`（config.json）仅为旧 web profile 的配置残留，不构成实装，一并计入撤除。目录自此收敛为本机 7 插件镜像：bre、pocket、anysearch、billion、retrace、watcher、update-checker。
- 清理范围：plugins.json 五对象、README 目录表/更新命令表各 5 行、徽章计数 12→7、说明区引用三处（「重跑 add 即更新」示例改 `billion-context`、「独立 update 动词」列表摘 `dsh-opencode-go-usage`、删 `dsh-font-customizer` 开发态专条）；改后 grep 两文件对 5 名零残留。四个分区均仍有条目，无需并区。
- 附注：`dsh-gateway-provider`（desktop 实装 github 钉 0fcfe57）本机有装但未入目录，系另一维护线工作流，本轮不动。`~/.dsh/profiles/web` 仍不存在，verify 差集核对照旧跳过（警告非失败）。catalogVersion `1.41.6` → `1.42.0`（条目数变化按惯例升 minor，先例 1.37.0/1.38.0），README 徽章两行同步。改后 `pwsh scripts/verify.ps1` 通过（7 条）。

## 2026-10-09 三插件版本同步：dsh-pet 0.3.6 / dsh-all-usage 1.1.18 / dsh-plugin-oauth-subs 0.0.117（catalog 1.41.6）

- `dsh-pet` `0.2.12` → `0.3.6`（npm 通道，`install` 钉版同步 `dsh-pet@0.3.6`）。**⚠️ 0.3.0 起为破坏性升级：peerDependencies 由 `^0.1.1-rc.2` 提升到 `^0.2.0-rc.1`，dsh 0.1.x 不再适配**——仍在 0.1.x 运行时的用户请继续使用 0.2.12；`@deepseek-ai/dsh` npm `latest` 已是 `0.2.0-rc.2`，本目录安装命令 `npx -p @deepseek-ai/dsh` 拉到的运行时原生满足，故跟进。0.3.x 系列要点（官方 release 摘要）：适配 DSH 0.2.0-rc.1（移除 `@deepseek-ai/dsh-client-runtime` 注入与 peer 声明、消息 source 改 `{ kind: 'user' }`）；余额查询新增 Command Code（含 GOAT 套餐，显示 5 小时/周/月最紧张窗口）与 DeepSeek 账户两个服务商；通知防刷屏（子代理/委派会话完成不再弹通知）；修复安装插件或热重载后桌宠与配置页不出现、需刷新或重开 DSH 的问题；修「深度思考碎碎念」气泡错字。
- `dsh-all-usage` `1.1.15` → `1.1.18`（GitHub 通道，无钉版只动 version 快照）。1.1.16 宣告支持 dsh `0.2.0-rc.2` 运行时（`dsh.compatibility.runtime` 扩到 `>=0.2.0-rc.2 <0.2.1-0`，CI 冒烟矩阵扩到六个运行时版本）；1.1.17 修桌面端无法保存（写路由原先要求 loopback `Origin`，而桌面壳 `dsh-app://` 方案经 Electron 转发会剥掉 `Origin`——改为按进程能力授权，`usageBacked` 缺失改三态不误判「无账本用量」，写能力轮换 403 自愈重试）；1.1.18 新增「最近 7 天」预设范围、热力图跨度可切换 30 天/90 天/12 个月（网格列数跟随、单元格保持 1:1）、仪表盘标题旁版本指示器（宿主侧 GET npm 最新版对比，6 小时缓存、不可达时优雅降级）。
- `dsh-plugin-oauth-subs` `0.0.110` → `0.0.117`（GitHub 通道，无钉版只动 version 快照）。`v0.0.110...v0.0.117` 要点（compare 摘要）：**移除 Claude（Anthropic）家族**；家族注册表化重构（`families.ts` 接管代理体缓存分发、配额抓取、登录/导入/粘贴派发，新增家族不再改分支链）；模型页价格徽章+目录费率、ChatGPT 家族与按家族账户/配额拆分；GLM bigmodel 改走铸造 api key（旧 oauth bearer 快照时重铸）；Kiro 修复链（`login_option=awsidc` 转 IdC 设备流、5xx 对宿主可重试、credit 费率显示、文本增量保持完整）；修 zstd 撕裂帧未闭合尾行导致的解析残留（Node 22 zlib 不抛错的片段）；代理关闭前排空出站、配额读数持久化。
- 目录快照同步：plugins.json 三条 version（pet 连 `install` 钉版）与 README 目录表对应行更新；catalogVersion `1.41.5` → `1.41.6`，README 徽章同步；条目 12 不变（其余 9 条对账 npm/GitHub 上游均无新版）。本轮为目录先行：三个插件原属 `web` profile，本机该 profile 已不存在（现仅 `desktop`，未装此三者），无本机升级动作；`pwsh scripts/verify.ps1` 通过（installed 差集核对因 `~/.dsh/profiles/web/package.json` 缺失自动跳过，警告非失败）。

## 2026-10-09 anysearch-dsh 升级 0.1.7（追平 npm latest）

- 本机 desktop profile `@anysearch/anysearch-dsh` `0.1.6` → `0.1.7`（npm 通道，install 无钉版只动 manifest version 快照）。0.1.7 为纯兼容版：peer 扩到 28 个宿主版本（原生覆盖 `0.2.0-rc.2`，无需配置变更）；git 安装内置编译产物不再需要 pnpm 构建审批；dev 基线升至 0.2.1-alpha.1。**升级后 peer 原生过审，已删 profile compatibility.json 的 `@anysearch/anysearch-dsh@0.1.6` 豁免键**（gateway-provider 键保留不动）。
- 安装走完整链（真装包非 lockfile-only）：经用户拍板中断在跑会话→关桌面端→Stop-Process 清孤儿 bili→改钉版+删豁免→宿主 pnpm install（首轮撞「锁文件校验层不认 exclude」复现 bre 0.5.1 轮坑，`--config.minimum-release-age=0` 单次放行过；`+2 -27` 为首轮部分态清理，九插件终检全员在位版本正确）→重启桌面端（5 进程+bili 代理 25256 新拉起）。
- 目录快照同步：plugins.json version 与 README 目录表 `0.1.6`→`0.1.7`（install 本为裸名无钉版）；catalogVersion `1.41.4` → `1.41.5`，README 徽章同步；条目 12 不变（`dsh-opencode-go-usage` 恰也 0.1.6，属其自身版本未动）。改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-09 billion-context 升级 0.1.189（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.188` → `0.1.189`（npm 通道）。日更漂移第五连：v0.1.189 发布于当日 05:13 UTC，插件自更新先把 node_modules 推到 0.1.189 而 pin/lock 仍钉 0.1.188。对齐沿用清洁法：手改 package.json 钉版 + 宿主 pnpm 11.7.0 `pnpm install --lockfile-only`（桌面端运行中执行无冲突），锁文件三处条目 `0.1.188`→`0.1.189`、integrity 换新、零残留，exclude 合并为 `0.1.185 || … || 0.1.189` 一行。依赖无变化（zod 4.1.8）。实装三处齐平 0.1.189。
- 上游 `v0.1.188...v0.1.189` 变更（官方 release 摘要）：feat(#2243) 模型决定压缩时机（compress.nudgeModelDecided）；feat(#2378) 分层压缩触发阈值 compress.tierNudgeTokens（T1/T2/T3 独立）；feat(#2384) pi-subagents 收编进仓；fix(#2381) dsh 插件 model/window 头改钉会话实际模型；fix(#2335) promptPack=lean 真正到达代理系统提示；fix(#2334) fold-anchor 上限构建期强制（不再算后丢弃 16K 覆盖 id）；fix(#2348) scale-gate 假完成检测+剥自闭合渲染标签；fix(#2346) 失控枚举内在终止闸；fix(#2366/#2407) acp_status 暴露计费输入+k̂ 校准计入思考质量；fix(#2324) 冲突告警排除纯展示插件、疑似与确诊分离。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.188`→`0.1.189`（install 钉版 `@0.1.189`）；catalogVersion `1.41.3` → `1.41.4`，README 徽章同步；条目 12 不变。改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-08 billion-context 升级 0.1.188（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.187` → `0.1.188`（npm 通道）。日更漂移第四连：v0.1.188 发布于当日 05:05 UTC，插件自更新先把 node_modules 推到 0.1.188 而 pin/lock 仍钉 0.1.187。对齐沿用清洁法：手改 package.json 钉版 + 宿主 pnpm 11.7.0 `pnpm install --lockfile-only`（桌面端运行中执行无冲突；本轮锁文件因并行会话新装 dsh-gateway-provider 而扩到 164 条解析，bili 三处条目 0.1.187→0.1.188、integrity 换新、零残留），exclude 合并为 `0.1.185 || … || 0.1.188` 一行。依赖无变化（zod 4.1.8）。实装三处齐平 0.1.188。
- 上游 `v0.1.187...v0.1.188` 变更（官方 release 摘要）：feat(PR#2167) 统一外部摘要模型、顺序故障转移与多客户端压缩接线；fix(#2288) dsh 设置面板跟随活代理 origin 而非冻结启动快照；fix(#2203) dsh persona 指纹 Responses 线路对齐；fix(#2308/#2309) preflight Responses 摘要排除 reasoning 项/拒收不完整摘要；fix(#2303) 终末轮以压缩草稿闭合标签结尾时重试；fix(#2286) deriveTitle 跳过 dsh 注入通知；feat(#2325) `bili plugin list` 显示每 lane 实装版本；feat(#2312) Claude Code 插件市场条目；feat(#2268) pi 子代理能力感知 ACP 通道。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.187`→`0.1.188`（install 钉版 `@0.1.188`）；catalogVersion `1.41.2` → `1.41.3`，README 徽章同步；条目 12 不变。改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-07 billion-context 升级 0.1.187（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.186` → `0.1.187`（npm 通道）。自更新先行三连：v0.1.187 发布于当日 07:31 UTC，插件自更新已把 node_modules 推到 0.1.187 而 pin/lock 仍钉 0.1.186。对齐沿用清洁法：手改 package.json 钉版 + 宿主 pnpm 11.7.0 `pnpm install --lockfile-only`（零 modules 操作；本轮桌面端运行中执行，实测与运行态无冲突），锁文件三处 `0.1.186`→`0.1.187`、integrity 换新；exclude 合并为 `0.1.185 || 0.1.186 || 0.1.187` 一行。依赖无变化（zod 4.1.8）。实装三处齐平 0.1.187。
- 上游 `v0.1.186...v0.1.187` 变更（官方 release 摘要）：fix(#2241) dsh persona anchor 连续性感知——模型切换迁移锚点而非分叉主 lane；session 自愈（#2155）僵尸插件 lane 降级为代理工具+空闲 nudge 抑制；fix 冲突告警不再把一方兄弟误标为第三方压缩器；fix(#2260) 0.1.186 评审跟进（dsh spawn 泄漏、惰性 resign 键命名、codex arg/TOML、web pristine root）；fix(#2122) 输出钳制的输入估计按学习到的分路由 k̂ 校准；ACP tag-echo 四不变量统一治理（#2023/#2066/#2190/#2248，流式+整文双路剥离退化和残留）；fix(#2192) 属主管理的更新 lane 走 InstallBackoff；feat(#2265) 匿名 affinity 采用 simhash 链对齐；website 文档面板化+全参数参考。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.186`→`0.1.187`（install 钉版 `@0.1.187`）；catalogVersion `1.41.1` → `1.41.2`，README 徽章同步；条目 12 不变。改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-06 billion-context 升级 0.1.186（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.185` → `0.1.186`（npm 通道）。仍是自更新先行：插件已把 node_modules 推到 0.1.186（v0.1.186 发布于今日 11:17 UTC），manifest/lockfile 仍钉 `0.1.185`。本轮对齐沿用清洁法：手改 package.json 钉版 + 宿主 pnpm 11.7.0 `pnpm install --lockfile-only`（零 modules 操作；桌面端未运行，另有一个 claude lane 的 bili MCP 活进程与锁文件操作无冲突），锁文件三处 `0.1.185`→`0.1.186`、integrity 换新；pnpm 自动并入 `minimumReleaseAgeExclude` 后手工整理为 `0.1.185 || 0.1.186` 合并行。依赖无变化（zod 4.1.8）。实装 node_modules/manifest/lockfile 三处齐平 0.1.186。
- 上游 `v0.1.185...v0.1.186` 变更（官方 release 摘要）：fix(#2090) 签名请求二元契约（重签+压缩或拒绝，web UI 启动提醒）；fix(#2187) 慢启动 live-child 代理等待 + DSH spawn-mode 启动失败进程内自愈；fix(#2196) Windows 启动器用户 argv 不再进 cmd.exe；fix(#2171) 插件流零可见上游截断时重发一次；fix(#2162) search_context 能命中单词关键词（去掉失准相关性下限）；fix(#2180) web 全新安装空索引不再 500；feat(#2127) dsh 插件详情页挂 bili 面板（plugins.bundle.config）；feat(#2115) antigravity launcher lane；web admin 会话加载分页限界（PR#1939）；codex overlay SQLite 合并改溯源优先胜者（PR#2207）；ACP_PORT 钉端口精确生效（PR#2178）。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.185`→`0.1.186`（install 钉版 `@0.1.186`）；catalogVersion `1.41.0` → `1.41.1`，README 徽章同步；条目 12 不变。改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-05 dsh-update-checker 0.3.0 完整重构版发布

- `dsh-update-checker` `0.2.3` → `0.3.0`（自研插件；本机 link 实装同步）。核心：新增统一出站层 `lib/http.js`（全局限流 6 并发 / URL 单飞 / 5min TTL+ETag 条件缓存——GitHub 304 不占匿名配额 / 403-429 主机熔断）；npm 检查改走 ~200B dist-tags 快路径（过期的才拉 MB 级 packument）；预发布判定标记+标签形态双保险；持久化原子写；客户端 useMemo 化。修复：jsDelivr 回退不过滤预发布、check.last 内存缓存跨 profile 泄漏、`AbortSignal.timeout` 不保活事件循环导致裸环境超时永不触发。
- 测试从「2 套」扩到「4+1 套」：新增出站层单测 19 例 + runCheck 集成 16 例（脚本化网络零外联），离线全家桶 `npm test`（58 例级）+ 活网络 E2E `npm run test:e2e`（17 项）全绿；含 fiber dispose/HMR 重载、协议负例、跨站围栏回归。
- 目录版本 `1.40.9` → `1.41.0`，条目 12 不变；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-05 billion-context 升级 0.1.185（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.184` → `0.1.185`（npm 通道）。又是目录外自更新开场：今晨 1.40.8 轮重建后，18:41 插件自更新（#2095 起 win32 自重启替换可脱离父进程存活）已把 node_modules 推到 0.1.185，manifest/lockfile 仍钉 `0.1.184`。本轮对齐只动清单不动模块：手改 package.json 钉版 + 宿主 pnpm 11.7.0（`D:\deepseek harness
esources
untime\pnpm`）`pnpm install --lockfile-only` 重写锁文件（billion 三处条目 0.1.184→0.1.185、integrity 换新，diff 零越界），node_modules 未触碰——规避 1.40.8 轮 `pnpm add` 在桌面端运行中被锁删模块的坑。pnpm 自动并入 `minimumReleaseAgeExclude`（`billion-context@0.1.185`）。备份 `package.json.bak-bili-0105` / `pnpm-lock.yaml.bak-bili-0105`（profile 目录内）。
- 上游 `v0.1.184...v0.1.185` 变更（摘自官方 release notes，约 30 项择要）：fix(#2095) win32 自重启替换脱离父进程存活；fix 宿主原生 agent 工具转发打 nativeCaller 标（#2072 后续）；feat(PR#2034) dsh 原生压缩开关 `allowDshCompaction`（web 可配）；feat(#2111) pi 原生模式 Codex Responses WebSocket 走 bili；fix Responses WS 背压暂停而非交换失败（PR#2093）；fix 插件 fork 快照 O(1) 稳态维护+惰性持久化（#2077）；cache-ledger 系列（出站 body 稳定性证明 #2131、key-switch 归因 PR#2150、Z3 机检稳定性定理 PR#2159）；fix 冲突台账 active/historical 分拆（#2102）；fix 更新临时路径唯一化终结 cacheDir 竞争（#2106）；fix 状态读取共享溯源感知基线（#2029）；fix 测量态统计被 buildSession 丢弃（#2129）。
- 实装状态：node_modules/manifest/lockfile 三处齐平 0.1.185；5 个 billion 进程（4×mcp.js + 1×index.js 代理）在跑，早于 18:41 拉起的仍持 0.1.184 内存码，下次 DSH 桌面端重启后全量切到 0.1.185。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.184`→`0.1.185`（install 钉版 `@0.1.185`）；catalogVersion 顺延至 `1.40.9`；README 徽章 v1.40.7→v1.40.9（顺带修 1.40.8 轮漏更）。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-05 billion-context 升级 0.1.184（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.182` → `0.1.184`（npm 通道，备份 `backups/plugin-update-20261005-035139/`）。动手前又是目录外自更新：node_modules 已到 0.1.184 而 manifest/lockfile 仍钉 `0.1.182`。本轮第一次 `pnpm add billion-context@0.1.184` 因 DSH 桌面端运行中锁文件而失败（`ERR_PNPM_PACKAGE_MANAGER_REMOVE_MODULES_DIR`，拒绝访问 os error 5），且失败前**已删除大部分插件包**（8 个依赖仅剩 2 个）；改用 `pnpm add --lockfile-only` 对齐 manifest/lockfile，随后 `pnpm install` 按 lockfile 完整重建并逐一核对：billion-context 0.1.184、@anysearch/anysearch-dsh 0.1.6、@local/skills-manager 0.1.0（link）、dsh-better-reasoning-effort 0.5.2、dsh-pocket 2.10.6、dsh-retrace 0.4.49、dsh-update-checker 0.2.7（link 本地开发版，目录快照 0.2.3 系上游 HEAD）、dsh-watcher 0.6.3，全部恢复。0.1.184 仍在 release-age 窗口内，pnpm 自动并入 `minimumReleaseAgeExclude`（现为 `0.1.180 || 0.1.181 || 0.1.182 || 0.1.184`）。教训：**DSH 桌面端运行期间不要在 profile 里跑会重建 modules 目录的 pnpm 命令**（`pnpm add` 会先清空再装，失败即半删状态）。
- 上游 `v0.1.182...v0.1.184` 变更（摘自官方 release notes）：
  - v0.1.184（官方标注 critical）：fix(#2082) **dsh 插件工具消失**——工具注册卡死自愈 + 桌面副本 boot smoke 门；fix(#2072) 宿主原生 ACP 工具调用标记为 native caller（修 Pi 子代理跨会话误路由）；feat 合入 master 的构建发布为 `billion-context@master` npm 通道；docs(#2073) pi 原生模式传输覆盖说明与 WS 绕行配置；官网移入 website/ + GitHub Pages 部署。
  - v0.1.183（约 40 项，择要）：feat(#1844/#1467) ACP-aware OpenCode V2 Responses WebSocket 代理 + 通用 WS 桥；feat(#1909) 平铺 provider `protocol` 字段按路径声明 wire 协议；feat(#2030) 行为旋钮统一解析顺序 env > config file > default（src/knobs.ts）；fix(#1952) 共享 overlay 活跃时拒绝并发启动而非覆写；fix(#1965) codex overlay 干净退出后写回真实 home；fix(#1960) Anthropic 线保留 redacted_thinking 块；fix(#1930) fold-reconcile 质量缺口（护栏测试、锚点复用、8K 性能钉）；fix(#1994/#1987) preflight 传输韧性 + shrink-retry 硬 400/413；fix(#2017) 插件层暴露隔离 fork 与归因上下文观测；fix(#1603) 安装失败重试有界 + /acp 面板暴露过期安装。
- 升级后需重启 DSH 桌面端生效；本轮 node_modules 经历过删除重建，**务必重启并确认插件全量注册**（0.1.184 的 #2082 修复正是"桌面端插件工具消失"自愈）。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.182`→`0.1.184`（install 钉版 `@0.1.184`）；catalogVersion 顺延至 `1.40.8`，核对日期 `2026-10-05`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-04 billion-context 升级 0.1.182（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.181` → `0.1.182`（npm 通道，备份 `backups/plugin-update-20261004-050652/`）。0.1.182 于 10-03 17:14 UTC 发布，安装时仍在 release-age 窗口内，已并入 profile `pnpm-workspace.yaml` `minimumReleaseAgeExclude`（现为 `0.1.180 || 0.1.181 || 0.1.182`）。背景：动手前发现 node_modules 已被目录外更新到 0.1.182 而 manifest 仍钉 `0.1.181`（lockfile 处于混合状态），本轮 `pnpm add` 将 manifest/lockfile/node_modules 三者一并对齐；npmmirror 该 tarball 尚未同步（`UND_ERR_DESTROYED` 重试耗尽），改用 `--registry=https://registry.npmjs.org` 完成。
- 上游 `v0.1.181...v0.1.182` 变更（小修复版）：fix(#2011) output-budget 封顶值向下取整——`max_tokens` 恒为整数（此前分数上限可能透传给 provider 报错）；ci(#2011) 新增专用 bugfix 发布通道（carve-out publisher）；docs(#1870) release notes 补录。
- 升级后需重启 DSH 桌面端生效。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.181`→`0.1.182`（install 钉版 `@0.1.182`）；catalogVersion 顺延至 `1.40.7`，核对日期 `2026-10-04`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-03 billion-context 升级 0.1.181（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.180` → `0.1.181`（npm 通道，备份 `backups/plugin-update-20261003-235301/`）。0.1.181 安装时仍在 release-age 窗口内，pnpm 自动把 `billion-context@0.1.181` 并入 profile `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`（现为含 `0.1.180`、`0.1.181` 等）。背景：本机 0.1.180 系目录外安装（目录快照停在 0.1.179），本轮一并追平。
- 上游 `v0.1.180...v0.1.181` 变更（99 commits，摘自官方 release notes，按主题归段）：
  - 压缩核心：fold-state 重整——客户端侧历史抖动后折叠状态仍可存活（#1921）；压缩收缩按 live view 度量并标记退化重置（#1911）；preflight 本地估算按 provider 实际用量校准、基线来源门控、fold 预算缩放（#1933）；估计级基线不再进入 `stats.lastInputTokens`（#1911）。
  - Windows：launcher 把 node re-exec wrapper 解析到真实 Node 再启动代理（#1887）；Claude SessionStart hook 改为 shell 可移植 + PATHEXT 感知的 CLI 解析（#1902）。
  - Anthropic 通道：压缩提示作为尾部 system block 追加，不再合并客户端 system 块（#1876）。
  - DSH 集成：`llm.resolveModelInfo` 绑定 service receiver——此前每次窗口 resolve 抛错、剥离 `x-bili-plugin-context-window`（#1943，社区首贡献）；web 设置面板 protectedTools 行正确指向 `compress.protectedTools`（#1948）；persona fingerprint——session id 与 system hash 分离，适配共享 id 的宿主（#1916/#1307/#1314）。
  - 计量：文/图双通道核算——图片默认按像素先验计费并按路由学习真实成本（#1843）。
  - 缓存账本：invalidation 分桶与切换归因加固（#1847）；seam 检测器不再误报无基线首账单（#1891）。
  - 稳定性：sqlite overlay 私有 set 改拷贝而非共享文件链接（#1917）、二次启动保留 overlay 建立的 SQLite 库（#1951）、重启后过期健康判定失效（#1957）、launcher 快速子进程死亡后延迟发布实例可重新附着（#1903）。
  - 其他：SDK-HMAC-SHA256 出站重签名 arm（`resign` 配置块，#1884）；zcode 零可路由 provider 时给出解释而非裸 Connection closed（#1892）；pi 虚拟模型选择的压缩归属修复（#1961）；泄漏的 bili 工具侧请求降级为 passthrough（#1897）；ACP 渲染标签剥离加固（#1881）。
- 升级后需重启 DSH 桌面端生效。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.179`→`0.1.181`（install 钉版 `@0.1.181`）；catalogVersion 顺延至 `1.40.6`（远端 10-02 已将 `1.40.5` 用于收录 dsh-update-checker），核对日期 `2026-10-03`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-02 新收录 dsh-update-checker 0.2.3（自研插件首发开源）

- 新建公开仓库 [daha1216/dsh-update-checker](https://github.com/daha1216/dsh-update-checker) 并开源 v0.2.3：DSH 插件更新检查器——在设置的「插件更新」页一键检查本机已装第三方插件的上游更新（**只检查不更新**），展示当前版本→最新版本之间的 Release 更新内容。按安装来源分类检查（npm dist-tag / GitHub Releases / file: 本地），GitHub API 限流自动降级 jsDelivr tag 列表；宿主端自有 webServer 路由复刻官方 RPC 信封；清理全部经 `ctx.effect` 接线（HMR 热换已验证）；测试：宿主端 harness 17 项 + 设置页 markdown 解析器 23 项。
- 发布前公开化清理：`package.json` 移除 `private`、补 MIT License / repository / author；`test/harness.mjs` 机器路径参数化（`DSH_CORDIS_PATH`/`DSH_PROFILE_DIR` 环境变量，默认值可移植）。
- GitHub 安装通道端到端验证：`dsh plugin --profile _repoprobe add github:daha1216/dsh-update-checker`（一次性探针 profile，验证后已删除）装包成功，tarball 内容与 `files` 声明一致（测试文件正确排除），无构建脚本问题。
- 目录快照同步：plugins.json 新增条目（install `github:daha1216/dsh-update-checker`），README 目录表（🛠️ 会话管理与效率工具）与更新插件表各加一行；catalogVersion `1.40.4` → `1.40.5`，核对日期 `2026-10-02`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-01 billion-context 升级 0.1.179（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.178` → `0.1.179`（npm 通道，备份 `backups/plugin-update-20261001-195506/`）。0.1.179 于 10-01 11:20 UTC 发布，安装时仍在 release-age 窗口内，显式钉 `@0.1.179` 并按提示并入 `minimumReleaseAgeExclude`（现为 `billion-context@0.1.167 || 0.1.168 || 0.1.171 || 0.1.172 || 0.1.174 || 0.1.175 || 0.1.178 || 0.1.179`）。
- 上游 `v0.1.178...v0.1.179` 变更（62 commits）：Web 配置页快捷控制卡片——快速配置控件、protectedTools 行防「话痨工具」警告、exclude-from-recent 行、多语言链接 CONFIGURATION 文档（#1748）；图片单独超窗时折叠可压缩文本的仲裁压缩（#1800）；DSH 集成——设置入口等 proxy origin 已知后自愈（#1809）、代理门拒绝 dsh 原生压缩调用（#1729）、模型窗口解析失败重试——启动竞态不再永久丢失 `x-bili-plugin-context-window`（#1836，`BILI_MODEL_INFO_RETRY_MS` 入档）；输出预算恢复按已知模型输出上限托底并一次性告警（#1840）；CA——OS 信任库并入 combined-ca.pem、按源降级而非全有全无（#1807）；codex overlay 用生成的 .env 钉路由并防真实 home 污染（#1802）；resume 分支默认继承父压缩块、前缀亲和快照 500ms 静默/5s 上限（#1834）；Responses 侧请求压缩交接规范化；冲突横幅点名冲突插件而非裸计数；CI 发布金丝雀自更新验证（#1811）；pi/omp 原生泳道把 preset `BILLION_CONTEXT_PROXY` 路由到 attach（#1795）。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.178`→`0.1.179`（install 钉版 `@0.1.179`）；catalogVersion `1.40.3` → `1.40.4`，核对日期 `2026-10-01`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-10-01 billion-context 升级 0.1.178（追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.175` → `0.1.178`（npm 通道，备份 `backups/plugin-update-20261001-142716/`）。0.1.178 于 10-01 02:40 UTC 发布，安装时仍在 release-age 窗口内，显式钉 `@0.1.178` 并按提示并入 profile `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`（现为 `billion-context@0.1.167 || 0.1.168 || 0.1.171 || 0.1.172 || 0.1.174 || 0.1.175 || 0.1.178`）。
- 上游 `v0.1.175...v0.1.178` 变更（104 commits，三个版本，按 tag 界碑归段）：
  - `0.1.176`：CJK 与摘录正确性——模型摘录全边界 surrogate 代理对钳制（#1615）、CJK 单行可见轮次修复（#1764）；DSH 集成——web profile 设置页新增 bili Web UI 入口（#1590）、web 预设保留原生自动压缩时启动警告（#1772）、只读 `context-*` 工具不再误判为疑似压缩器（#1736）；Windows——dsh 二进制解析脱离裸 PATH 名、GBK 子进程解码（#1732）；配置——命名 provider 泳道/别名绑定（#1469）、非 http(s) baseUrl provider 可选接入（#1392）；稳定性——preflight 瞬时空摘要重试（#1767）、OMP 长预检首事件看门狗协调（#1774）、launcher 端口梯队等待同泳道前任（#1723）与 pid 身份校验（#1753）、多实例 store 加固与前缀亲和链永久化（#1724）、端口重启竞态修复（#1726）、CCR 检索原件改由 tool result 交付并升 acp-kernel 0.0.99（#1738）。
  - `0.1.177`：自愈寄存器不再被迟到的 verifyAttachAndRecover 落地覆盖（#1787）。
  - `0.1.178`：bili 插件更新命令如实报告实际刷新数量、跳过感知（#1803/#1804）。
  - 更正：0.1.174 轮说明把 acp-kernel 0.0.99 / CCR 检索原件 tool result 交付（#1738）/ #1724 多实例加固 / #1726 端口竞态计入 0.1.174——按 tag 对比实际随 0.1.176 发布。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.175`→`0.1.178`（install 钉版 `@0.1.178`）；catalogVersion `1.40.2` → `1.40.3`，核对日期 `2026-10-01`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-30 补升 billion-context 0.1.175（发布当日追平 npm latest）

- 本机 desktop profile `billion-context` `0.1.174` → `0.1.175`（npm 通道，备份 `backups/plugin-update-20260930-204748/`）。0.1.175 于 09-30 12:30 UTC 发布，安装时仍在 release-age 窗口内，显式钉 `@0.1.175` 并按提示并入 profile `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude`（现为 `billion-context@0.1.167 || 0.1.168 || 0.1.171 || 0.1.172 || 0.1.174 || 0.1.175`）。
- 上游 `v0.1.174...v0.1.175` 变更（27 commits）：日志隐私——凭据形状字符串从日志清除、非回环 IP 字面量打码、会话派生文本不再写入 bili.log（改长度指纹 + 按进程加盐消息 id，#1718）；主模型请求路径 fail-fast 传输失败的有界透明重试（#1688）；原生 fetch 链对并存重包装插件的有界防护（#1662）；未路由端点直发仅对 POST 报告（#1657）；opencode v2 标题生成按宿主声明意图分类（#1699）与子代理 session id 经结构化 sidecar 在折叠后保留（#1702）；CCR 解压空白 range 字段视为省略、不可武装时不再广播 range 参数（#1712）；tag-echo 过滤器保留成对渲染标签之间的正文（#1720）。更正：上一条把 #1731（剥离大小写漂移渲染标签与未封顶 open-side 属性）计入 0.1.174，按 tag 对比实际随 0.1.175 发布。
- 目录快照同步：plugins.json 与 README 目录表 `billion-context` `0.1.174`→`0.1.175`（install 钉版 `@0.1.175`）；catalogVersion `1.40.1` → `1.40.2`，核对日期 `2026-09-30`。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-30 本机插件升级 bre 0.5.2 / billion-context 0.1.174 + 目录快照同步

- 本机 desktop profile 升级两个插件（备份 `backups/plugin-update-20260930-203130/`，含 package.json + pnpm-lock.yaml）：
  - `dsh-better-reasoning-effort` `0.5.1` → `0.5.2`：profile 安装源由 `github:HaoyueQin/dsh-better-reasoning-effort#v0.5.1` 换 tag 到 `#v0.5.2`。上游 v0.5.1..v0.5.2 变更：适配 DSH 0.2.0-rc.2 模型列表面板 popover 定位（fix）；移除内置 composer 模型搜索（breaking）；输入类型控件改由 Auto-adapt 驱动；kernel 依赖升 0.2.0-rc.2；CI 把打包 tarball 附到 release；安装文档按通道排序并说明 release-age hold。
  - `billion-context` `0.1.172` → `0.1.174`（npm 通道）：0.1.173/0.1.174 均为 24h 内发布，首次 `@latest` 解析被 pnpm `minimumReleaseAge` 供应链保护回落到 0.1.172；显式钉 `@0.1.174` 后按提示将 `billion-context@0.1.174` 写入 profile `pnpm-workspace.yaml` 的 `minimumReleaseAgeExclude` 装成。上游变更（0.1.172→0.1.174）：acp-kernel 升 0.0.99（v2 retrieval contract 上 npm）；CCR 检索原件改由 tool result 交付；shared-state-dir 多实例安全边界（声明 + affinity union 写入限 store 自身 caps、磁盘条目校验，#1724）；自重启前先刷盘（#1724）；tag-echo 过滤修复 case 漂移 render 标签与未封顶 open-side 属性（#1731）；端口重启竞态修复（#1726）。
- 目录快照同步：plugins.json 与 README 目录表 `dsh-better-reasoning-effort` `0.5.1`→`0.5.2`（install 钉版 `@0.5.2`）、`billion-context` `0.1.172`→`0.1.174`（install 钉版 `@0.1.174`，与本机实装一致）；catalogVersion `1.40.0` → `1.40.1`，核对日期 `2026-09-30`。
- 备注：npm 在本轮安装约 1 小时后又发布 billion-context `0.1.175`（09-30 12:30 UTC），仍在 release-age 窗口内，留待下轮同步；两个插件升级后需重启 DSH 桌面端生效。
- 改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-29 billion-context 切换至官方上游仓库

- `billion-context-dsh`（Tyan 分支，`Tyan66666/billion-context-dsh`，`0.2.x` 线）整体替换为官方上游 `billion-context`（`ranxianglei/billion-context`）：id/name、`install`（`billion-context@0.1.171`，npm latest）、`update`（`dsh plugin --profile web add billion-context`，上游 README 原生 DSH 装法）与来源链接同步切换；描述更新为「动态压缩长会话上下文：小窗口跑数十亿 token 超长会话，token 节省约 5 倍」（取自上游定位）。
- 版本快照口径随之从 `0.2.26` 切到官方 npm 线 `0.1.171`；本机 desktop profile 实装同为 `billion-context@0.1.171`，目录与实装包名就此对齐。
- 目录版本 `1.38.0` → `1.39.0`，条目数不变（11）；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-29 移除 dshmarket / dsh-skills 两条目录

- 应用户要求下架：`dshmarket` `1.65.1`（来源 `dsh-market/dsh-market`）、`dsh-skills` `0.1.1`（来源 `CocoSgt/dsh-skills`）。plugins.json 与 README 两表同步删除；「市场与技能生态」分区仅含这两条，整个分区连同顶部快捷跳转链接一并移除；「重要说明」中涉及 dshmarket 的两处表述（更新机制示例、「市场内置更新」条目）同步清理。
- 本机各 profile 均未实装这两个插件，无卸载动作。
- 目录版本 `1.37.0` → `1.38.0`，条目 `13` → `11`，徽章同步；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-29 移除 deepseek-idesign / deepseek-ippt / deepseek-ivideo 三条目录

- 应用户要求下架 iPolloWork 三件套：`deepseek-idesign` `0.2.2`、`deepseek-ippt` `0.1.2`、`deepseek-ivideo` `0.5.0`（来源均为 `Devin-AXIS/iPolloWork`），plugins.json 与 README 两表同步删除。
- 本机各 profile（desktop）均未实装这三个插件，无卸载动作；web profile 已不存在，实装差集核对自动跳过。
- 目录版本 `1.36.0` → `1.37.0`，条目 `16` → `13`，核对日期 `2026-09-29`；README 徽章随本次对齐（顺带修正 1.36.0 轮漏更的徽章版本号）；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-28 dsh-watcher 来源切换为自有仓库（0.6.2）

- `dsh-watcher` 来源 `aa2246740/dsh-watcher` → 自有仓库 `daha1216/dsh-watcher`（`v0.6.2`，单提交干净历史）。版本快照 `0.6.0` → `0.6.2`，描述更新为「会话工作路径观测面板 · 跨会话模型耗时与费用统计」，`install`/`update` 同步指向 `github:daha1216/dsh-watcher`。
- 该版本含：上游 0.6.2 写时复制折叠与压缩客户端包，以及 fork 侧修复与优化（扫描按最近排序并提示截断、本轮/全会话口径纠偏、实时 t/s 接通、毛玻璃面板、面板尺寸记忆与双击复位）。
- 目录版本 `1.35.0` → `1.36.0`，核对日期 `2026-09-28`；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-25 dsh-pocket 同步上游与移动端优化 / 目录快照刷新

- `dsh-pocket` `2.10.6`（来源 fork `daha1216/dsh-pocket` main HEAD `eb50554`）：① 同步移动端顶栏精简与状态胶囊、隐藏手机端桌宠与悬浮用量药丸、运行指标换行展示（`b385bc4`）；② 合并上游 `shaobeichen/dsh-pocket` 最新提交（`cab1e24` 修复插件模式公网隧道自动恢复状态路径为 DSH 主目录、`230039f` 支持 8–64 位自定义访问密码并在读取请求体后二次校验登录限速、`d2e0b46` 新增「手机端右边栏」开关并修正窄屏右边栏入口外边距）。
- 刷新 6 个插件上游 HEAD 版本快照：`dshmarket` `1.55.0` → `1.65.1`、`dsh-pet` `0.2.11` → `0.2.12`、`dsh-all-usage` `1.1.10` → `1.1.12`、`billion-context-dsh` `0.2.25` → `0.2.26`（`install` 同步为 `billion-context-dsh@0.2.26`）、`dsh-watcher` `0.5.0` → `0.6.0`、`dsh-plugin-oauth-subs` `0.0.99` → `0.0.103`。
- 目录版本 `1.34.0` → `1.35.0`，核对日期 `2026-09-25`；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-23 bre 更新/安装命令回归上游 README 原生 npm 写法

本轮只维护目录索引，未安装、升级或卸载本机插件（bre 0.4.1 本机升级与撤止血开关已于同日另行完成）。

- `dsh-better-reasoning-effort`：`install` 由 `github:HaoyueQin/dsh-better-reasoning-effort` 改为 `dsh-better-reasoning-effort@0.4.1`（npm 首选通道，与本机实装 0.4.1 一致，与其余注册表条目 `dsh-pet@0.2.8` 等样式统一），`update` 与 README 更新命令表行逐字改为 `dsh plugin --profile web add dsh-better-reasoning-effort`（上游 README「From npm」原生写法；github 源码装法需 `allowBuilds` 跑 `prepare` 构建，是上游 README 标注的次选通道）。`source` 保持上游仓库 URL 不变。改后 `pwsh scripts/verify.ps1` 通过（条目=16，README 两表与实装一致）。

## 2026-09-22 插件目录快照批量刷新 / 移除 dsh-archive-manager

本轮只维护目录索引与版本快照，未安装、升级或卸载本机插件；版本取各条目 `source` 上游 HEAD（`scripts/fetch-upstream.ps1` + 三件套 / pocket fork 手工补抓）。

- `dsh-retrace` `0.4.40` → `0.4.43`（来源 `daha1216/dsh-retrace`，上游 HEAD `fbcbebb`，本机 profile 实装 pin 同 commit）。上游变更：0.4.41 引用卡改暖橙统一视觉；0.4.42 渐变撤回分隔线与助手动作图标打磨；0.4.43 修 0.1.7 两个兼容洞——①0.1.7 新增 turn-process 分组会把插件伪节点卷进折叠组（祖先 `hidden="until-found"` 的 content-visibility 后代不可覆盖、兄弟显隐与锚点链同时失效），伪节点 location 钉 `unresolved` 改为独立根行渲染，悬停撤回按钮免展开直接可点；②0.1.7 新增 V4 admission 拒绝 `kind:'plugin'`，marker 写盘失败导致「召回后下一轮 turn 崩 format v4 message requires a producer-owned source kind」，marker source 改写官方迁移规范形状 `plugin:retrace`（读侧新旧双形状兼容，compact 检测 4 处双形状）。两洞修复后仓库自带 E2E 24/24 全绿。描述与 `update` 命令未变。
- `dsh-better-reasoning-effort` `0.3.10` → `0.4.1`（来源 `HaoyueQin/dsh-better-reasoning-effort` master HEAD）。README 现状能力面：官方 Models 页**内嵌编辑器**（Reasoning effort / Input modalities 随卡片 Save 一起提交，编辑期零写入的 pending 语义）、端点兼容控件（thinking budget 字段名、vLLM priority、Responses 的 max_output_tokens 按需省略）、composer 模型搜索框、每模型默认 effort（issue #4）、Models 页底部开关移位；**0.4.1 对 `0.1.7-alpha.1` 全量门禁**——peer 范围补 `^0.1.7-alpha.1`，typecheck / 测试 / 构建均对其官方发布包执行。本机 profile 现装 0.4.0，仍靠 `cordis.patch.yml` 关 `autofill`/`defaultGuard` 止血 0.1.7 崩溃；升级 0.4.1 验证后可撤除两开关（属插件安装操作，本轮未执行）。描述改为「在官方 Models 页内嵌配置第三方模型的推理强度（Effort）、输入模态与端点兼容项」。
- `dshmarket` `1.46.1` → `1.55.0`（`dsh-market/dsh-market` HEAD；README 未列版本说明，仅快照刷新）。
- `dsh-pet` `0.2.8` → `0.2.11`（`PC2005-cloud/dsh-pet` master，子包路径实为 `dsh-pet/package.json`——fetch 脚本原 `packages/dsh-pet` 路径有误，本轮一并修正）。
- `dsh-pocket` `2.10.3-daha.1` → `2.10.6`（来源 fork `daha1216/dsh-pocket` main HEAD，与本机实装 2.10.6 一致）。
- `dsh-all-usage` `1.1.9` → `1.1.10`（README「最近更新」原文：恢复账本 revision 快路径——兼容 DSH 0.1.5 的 `listSnapshots()`→`list()` 更名，未变化会话从账本复用；扫描期间的工作区变更不再被丢弃并有每 30 秒注册表轮询兜底；升级首启仍全量读一次）。
- `@anysearch/anysearch-dsh` `0.1.4` → `0.1.6`（README 版本矩阵推进至 `0.1.6-alpha.2`）。
- `billion-context-dsh` `0.2.22` → `0.2.25`（README 标注 v0.2.25，安装锚点同步 `#v0.2.25`）。
- `deepseek-ivideo` `0.1.0` → `0.5.0`（来源 `Devin-AXIS/iPolloWork` 子包 `external-plugins/deepseek-harness/video-studio` HEAD；npm `latest` 仍仅 `0.1.0` 未发布——按「快照 = 上游 HEAD」口径记录，npm 通道实装以 npm 为准。同仓 `design-studio` 0.2.2、`ppt-studio` 0.1.2 与 npm 一致不动）。
- `dsh-watcher` `0.4.0-insights.1` → `0.5.0`（README「本次更新（0.5.0）」原文：面板可拖大——右/下/右下把手，位置不动、最小缩回默认尺寸；HUD 可折叠成一行——`▾` 收起留顶栏统计、选择被记住；「定位现场」直达告警对应的失败步骤并打开检视器；连续失败同卡合并、标题带「第 N 轮」。另含 0.4.5 一批修复：检视器返回不再抢跟随、首次选范围不重复扫会话、投影状态不再存一份自身视图、计价面板文案改为「终端以外的工具」）。
- `dsh-plugin-oauth-subs` `0.0.89` → `0.0.99`（`xxww0098/dsh-plugin-oauth-subs` HEAD；快照刷新）。
- 移除 `@michengai/dsh-archive-manager` `0.1.40` 条目（`plugins.json` + README 两表同步，插件计数徽章 `17` → `16`）：已不在本机 web profile `dependencies`、`node_modules` 无残留，`verify.ps1` 差集红项，按「目录只反映实际安装」撤条目。
- `scripts/fetch-upstream.ps1` 数据源修正：`dsh-pet` 子包路径 `packages/dsh-pet` → `dsh-pet`、`dsh-pocket` 改指条目实际来源 fork `daha1216/dsh-pocket`、删除 archive-manager、补 iPolloWork 三件套（`design-studio` / `ppt-studio` / `video-studio` 子包）。
- 目录版本 `1.33.0` → `1.34.0`（09-17 的 Windows 安装入口修复已先行占用 1.33.0，本轮快照刷新在其之上再 bump），核对日期 `2026-09-22`；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-17 Windows 安装入口修复（编码 + 单行命令 + install.cmd）

本轮只修安装路径与文档，未安装、升级或卸载任何本机插件。

- 根因：`install.ps1` 与 `plugins.json` 是**无 BOM 的 UTF-8**。Windows PowerShell 5.1 会按 ANSI 代码页读脚本，中文串变乱码并把引号闭合破坏，报 `Unexpected token '瀹夎'`；`plugins.json` 同因此 `ConvertFrom-Json` 报 `Invalid object passed in, ':' or '}' expected. (540)`。PowerShell 7 默认按 UTF-8 读，所以作者侧一直没暴露。最小复现：同一句 `Write-Host '安装完成。'` 放进无 BOM 的 ps1，5.1 直接语法报错。
- 修复：`install.ps1`、`plugins.json` 改为带 UTF-8 BOM；`plugins.schema.json` 的 `install` 段新增可选 `windowsEntry` 字段，并在 `plugins.json` 中登记 `install.cmd`。
- 新增 `install.cmd`（可双击）：与脚本同目录时直接转发给 `install.ps1`；不同目录时自动 `git clone --depth 1` 到 `%TEMP%\dsh-plugin-collection` 再执行；找不到 git 时给明确提示。shell 选型 `pwsh` 优先、回退 `powershell`，并带 `-ExecutionPolicy Bypass`（不改本机策略，可双击运行）。
- README「安装指南」：第 3 节 Windows 由多行 PowerShell 块改为单行命令 `$tmp = "$env:TEMP\dsh-plugin-collection"; git clone -q --depth 1 <repo> $tmp; powershell -NoProfile -ExecutionPolicy Bypass -File "$tmp\install.ps1" -All`，并补充双击 `install.cmd` 说明；第 2 节补「先 clone（脚本读同目录 `plugins.json`）」；第 1 节示例由 `github:PC2005-cloud/dsh-pet` 改为本机验证可装的 `github:daha1216/dsh-retrace`（`dsh-pet` 需走 npm 通道 `dsh plugin --profile web add dsh-pet`，`install.cmd -Plugin dsh-pet` 走 `plugins.json` 的 npm spec 正常）。
- 新增 `.gitattributes`（`* text=auto eol=lf`、`*.cmd` 为 `eol=crlf`）。此前仓库无该文件而本机 `core.autocrlf=true`，clone 出的 README 是 CRLF，`scripts/verify.ps1` 的 `^| §id§ | ... |$` 行锚正则匹配不到 CRLF 行，Windows 上恒报「README 更新插件表缺/命令不符」17 项；脚本本身在 CRLF 检出下不可用（需先前置于 LF 检出，本仓库已 `core.autocrlf=false`）。
- 验证：`powershell -File install.ps1 -List`（5.1.26100.9352）与 `pwsh -File install.ps1 -List`（7.6.6）均正常输出 17 条且中文无乱码；`-Plugin nope` 在 5.1 下给出正确中文报错；`install.cmd` 的 run-in-place 与自动 clone 两条分支实测跑通；`pwsh scripts/verify.ps1` 除本机未装 `@michengai/dsh-archive-manager` 这一环境差集外全绿。
- 排除项：曾试「单行 `irm <install.ps1> | iex` 免克隆」，实测 `$PSScriptRoot` 为空、`Join-Path` 抛 `Cannot bind argument to parameter 'Path' because it is an empty string.`，无法就地定位 `plugins.json`，故不采用。
- 目录版本 `1.32.0` → `1.33.0`，核对日期 `2026-09-17`。

## 2026-09-14 dsh-retrace 0.4.40 版本快照刷新

本轮只维护目录索引与版本快照，未安装、升级或卸载本机插件。

- `dsh-retrace` `0.4.36` → `0.4.40`（来源 `daha1216/dsh-retrace`，上游 HEAD `2a9bd0e`，本机 profile 实装 pin 同 commit）。上游变更：0.4.37 修编辑卡遮挡「时间·复制」行；0.4.38 删除阅读页 DOM 注入器（better-display 卸载后锚点不存在）等死代码、observer 收敛、内建 E2E 布局校验（`scripts/e2e-layout.cjs`，24 断言）；0.4.39 编辑/撤回 chips 常驻（编辑框弹出时按钮不再被换走，编辑卡改流内兄弟节点，注册入口加 null-props 防御）；0.4.40 修「撤回一次后所有消息的编辑/撤回按钮永久消失」（根因：组件在 hook 序列中间提前 return 触发 React #300、槽位永久弃权；改为全部 hook 跑完再早退）。描述删去「阅读页 DOM 注入器」，把「内联编辑器为浮动卡片」改为「流内兄弟卡片（编辑/撤回 chips 常驻不消失，编辑卡在时间·复制行下方流内展开）」；`update` 命令 `dsh plugin --profile web add dsh-retrace` 未变。
- 目录版本 `1.31.0` → `1.32.0`，核对日期 `2026-09-14`；改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-14 dsh-retrace 0.4.36 版本快照刷新 / 新增 iPolloWork 三插件

本轮维护目录索引与版本快照，并收录本机新装的 iPolloWork 三件套；未安装、升级或卸载任何本机插件。

- `dsh-retrace` `0.4.34` → `0.4.36`（来源 `daha1216/dsh-retrace`，上游 HEAD `1e6b21f`，本机 profile 实装 pin 同 commit）。上游变更：0.4.35 修思考折叠后 chips 凭空消失（harness 把锚在用户消息 seq 上的 seat 计入 turn-process 组，折叠时 `hidden="until-found"` 触发 content-visibility:hidden 停止绘制，改 CSS 强制 visible + observer 补 attributes/characterData 监听）；0.4.36 对话页 chips 从列外页边空档改为列内整行内联——官方「时间 · 复制」行整体左移让位，chips 紧跟复制按钮、行末右缘对齐消息列右缘，编辑器换入/seat 隐藏时复制按钮回位。描述改为「chips 内联进时间·复制行、列右缘对齐」；`update` 命令 `dsh plugin --profile web add dsh-retrace` 未变。
- 新增 `deepseek-idesign` `0.2.2`、`deepseek-ippt` `0.1.2`、`deepseek-ivideo` `0.1.0`（均来源 `Devin-AXIS/iPolloWork` monorepo 的 `external-plugins/deepseek-harness/*` 子包，npm 通道发布，今日目录上一轮核对后新装于 web profile；README 插件计数徽章 `14` → `17`）。三者分别为设计 / PPT / 视频生成工作室（对话生成设计稿、幻灯片与可编辑视频）；原生 README 命令均为 `dsh plugin --profile web add <npm 包名>`，无独立 update 动词，更新即重跑 add；npm dist-tag 与实装版本一致。
- 目录版本 `1.30.0` → `1.31.0`，核对日期 `2026-09-14`。
- 流程偏差：手册提到的 `scripts/sync-catalog.ps1` 本仓库实际不存在，按仓库现状手工改 `plugins.json` + README（版本徽章 + 目录表行），改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-14 dsh-retrace 0.4.34 版本快照刷新 / 移除 dsh-better-display

本轮维护目录索引与版本快照，并同步移除本机已卸载的条目；未安装、升级或卸载任何本机插件。

- `dsh-retrace` `0.4.23` → `0.4.34`（来源 `daha1216/dsh-retrace`，上游 HEAD `2e0d31d`，本机 profile 实装 pin 同 commit）。上游变更：0.4.24~0.4.33 视觉重设计（chips 改软填充胶囊、内联编辑器现代化为浮动卡片 + 自动聚焦 / 自动高度 / 快捷键、Apple 液态毛玻璃、暖橙扁平按钮、入场 / 退场动画与 armed 脉冲）；0.4.34 对话页 chips 与复制按钮同行（收零高 + 贴附 meta 行，hover 显隐跟随原生规则）。描述补注新视觉形态（胶囊 chips 与复制按钮同行、浮动卡片编辑器、毛玻璃 + 暖橙扁平按钮与动效），保留「会话消息撤回重发、分支回溯与产物版本化」核心表述；`update` 命令 `dsh plugin --profile web add dsh-retrace` 未变。
- 移除 `dsh-better-display` `0.2.0` 条目（README 两表 + `plugins.json`）：该插件已从本机 web profile 卸载，`verify.ps1` 差集核对报「目录有但本机未装」，遂按实装状态撤条目；README 插件计数徽章 `15` → `14`。
- 目录版本 `1.29.0` → `1.30.0`，核对日期 `2026-09-14`。
- 流程偏差：手册提到的 `scripts/sync-catalog.ps1`、`scripts/extract-update-cmds.ps1` 本仓库实际不存在，遂按仓库现状手工改 `plugins.json` + README（版本徽章 + 目录表行 + 计数徽章），改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-14 dsh-better-display 0.2.0 版本快照刷新

本轮只维护目录索引与版本快照，未安装、升级或卸载本机插件。

- `dsh-better-display` `0.1.5` → `0.2.0`（来源 `daha1216/dsh-better-display`，上游 HEAD `c197898`，本机 profile 实装 pin 同 commit）。上游变更：长会话性能（`content-visibility` + IntersectionObserver scroll spy）、撤回标记可展开列出被撤记录（seq + 时间 + 文本）、原文引用块可折叠、阅读设置 popover（字号 / 行宽 / 密度 / 撤回展示 / 动效）、移动端时间轴精简模式、状态色局部 token 化；测试 75 → 92。描述补注「阅读偏好设置（字号/行宽/密度/动效）」，保留「纯展示层…不含操作 UI」定位；`update` 命令未变。
- 目录版本 `1.28.0` → `1.29.0`，核对日期 `2026-09-14`。
- 流程偏差：手册提到的 `scripts/sync-catalog.ps1`、`scripts/extract-update-cmds.ps1` 本仓库实际不存在，遂按仓库现状手工改 `plugins.json` + README（版本徽章 + 目录表行），改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-14 dsh-retrace / dsh-better-display 版本快照刷新

本轮只维护目录索引与版本快照，未安装、升级或卸载本机插件。

- `dsh-retrace` `0.4.21` → `0.4.23`（来源 `daha1216/dsh-retrace`，上游 HEAD `7cdd3c8`，本机 profile 实装 pin 同 commit）。上游变更：0.4.22 把撤回操作 UI 全面迁入本插件（对话页 ghost chips + 两步确认、阅读页 DOM 注入器），0.4.23 修注入器 store 路径（改用官方 conversation chat target + activate）。描述补注「撤回操作 UI 归属本插件（对话页 + 阅读页注入）」；`update` 命令 `dsh plugin --profile web add dsh-retrace` 未变。
- `dsh-better-display` `0.1.1`（README 记录）→ `0.1.5`（来源 `daha1216/dsh-better-display`，上游 HEAD `a365173`）。上游变更：0.1.3 曾并入 retrace chips（已废弃），0.1.4 移除全部操作 UI 转纯展示（shadow 隐藏、撤回标记、原文引用块，锚点契约），0.1.5 修引用块文本来源（取 edit marker `data.text`）。描述由「自动折叠执行步骤…」改为「纯展示层…不含编辑/撤回操作 UI」；`update` 命令未变。
- 目录版本 `1.27.0` → `1.28.0`，核对日期 `2026-09-14`。
- 流程偏差：手册提到的 `scripts/sync-catalog.ps1`、`scripts/extract-update-cmds.ps1` 本仓库实际不存在，遂按仓库现状手工改 `plugins.json` + README 两表（版本 + 描述），改后跑 `pwsh scripts/verify.ps1` 通过。

## 2026-09-14 本机插件更新（dsh-plugin-oauth-subs 0.0.76 → 0.0.89）

本轮实际更新 1 个本机插件；其余 14 个经 commit 级核对（lockfile codeload commit vs 上游 HEAD、npm dist-tag）均已在最新，未动。目录索引无变化（快照昨天一轮已是 0.0.89），catalogVersion 不变。

- `dsh-plugin-oauth-subs` `0.0.76` → `0.0.89`（79 个提交，来源 `xxww0098/dsh-plugin-oauth-subs`）。按其 README 原生命令 `dsh plugin --profile web add https://github.com/xxww0098/dsh-plugin-oauth-subs` 更新；package.json 里的旧 commit pin `#69bdf60` 随重装解除，lockfile 解析到 HEAD `25892f6`。主要变更：Cursor 不再提供已退役模型并透出上游错误；「关于」页新增插件 / DSH 自动更新卡片（DSH 版本选择器、回滚、自动重启），并修复 dsh web 重启循环；账户生命周期与 provider 流边界加固、上游静默断流 read-idle 看门狗、Completions `cache_read` 映射 DSH `cached_tokens`；新增 OpenCode Go API key 通道（多账户、deepseek-flash 补充路由、用量/配额/账单解析）与 Cursor Run tools、Grok prefix park、Ollama Cloud `deepseek-v4.1-flash`。
- 更新前备份：`~/.dsh/profiles/web/backups/plugin-update-20260914-055701/`（package.json + pnpm-lock.yaml）。
- 可用性验证：补丁完好（dsh-pocket 手机端层 `sidebar-swipe`/`gesture-guard` 在 client.js、dsh-pet `isMobile` 守卫在 lib/client.js，lockfile patch_hash 不变）；重启 dsh web 后启动日志无报错，`dsh plugin --profile web list` 15 个插件版本全部核对一致，页面带 token 正常响应。

## 2026-09-14 插件目录与实装同步（新增 dsh-better-display）

本次按当前 `web` profile 的实装清单重新对账，只维护目录索引，本机插件未安装、未升级、未卸载。

- 新增本机已装但目录未收录的 `dsh-better-display` `0.1.0`（来源 `aa2246740/dsh-better-display`，「阅读」页签：执行时展示步骤、思考与进度，整轮结束后收起过程只留最终回答，mcp-app 代码块挂成沙箱 iframe 交互卡片）。其 README 只给 `add github:aa2246740/dsh-better-display`，无独立 update 动词，更新即重跑该命令。
- 刷新上游版本快照（5 项）：`dsh-better-reasoning-effort` `0.3.9` → `0.3.10`、`dshmarket` `1.45.1` → `1.46.1`、`@michengai/dsh-archive-manager` `0.1.39` → `0.1.40`、`dsh-all-usage` `1.1.8` → `1.1.9`、`billion-context-dsh` `0.2.21` → `0.2.22`。
- 随快照同步 `install` 里的固定版本 spec：`billion-context-dsh@0.2.22`。
- 其余 9 条快照与上游 HEAD 一致未动；`dsh-pet` 上游为 monorepo，版本取 `dsh-pet/` 子包 `package.json`（npm `latest` 同为 `0.2.8`）。
- 目录版本 `1.26.1` → `1.27.0`，核对日期 `2026-09-14`。

## 2026-09-12 dsh-pocket 条目改指自建 fork（daha1216/dsh-pocket）

只改目录索引的一条来源，本机插件未安装、未升级、未卸载，`web` profile 的 `package.json` 未改（本机仍指向 `github:shaobeichen/dsh-pocket`）。

- `dsh-pocket` 的 `source` / `install` 从 `shaobeichen/dsh-pocket` 改为 `daha1216/dsh-pocket`（本机自维护 fork，由本机已安装的 2.10.3 产物发布，含两处安全加固：限速身份键不再无条件信任 `cf-connecting-ip`、`POST /pocket-login` 改常量时间比较）。fork 仓库地址 https://github.com/daha1216/dsh-pocket ，改动说明见其 `SECURITY-NOTES.md`，回归脚本 `node verify-security.mjs`（8/8 通过）。
- `version` 快照 `2.10.6`（上游）→ `2.10.3-daha.1`（fork 当前发布版本，取自 fork `package.json`）。**注意这是相对本机实装 2.10.3 的同版下进；fork 不跟随上游 2.10.4~2.10.6 的功能修复**，若哪天用 `--latest` 更新，会把本机从 2.10.6 降到 2.10.3-daha.1。
- `update` 命令保持 `dsh plugin --profile web update dsh-pocket --latest -w` 不变；README 补了一条提醒：重跑 `add dsh-pocket -w`（npm 名）会解析到 npm registry 上的上游版本，等于装回上游。
- 目录版本 `1.26.0` → `1.26.1`，核对日期 `2026-09-12`。

## 2026-09-12 插件目录与实装同步（补回 dsh-plugin-oauth-subs、新增 dsh-watcher）

本次按当前 `web` profile 的实装清单重新对账，只维护目录索引，本机插件未安装、未升级、未卸载，也未改动任何插件配置。

- 新增本机已装但目录未收录的两条：`dsh-watcher` `0.4.0-insights.1`（来源 `aa2246740/dsh-watcher`，只读会话洞察 + 本地模型用量 HUD；上游暂无 tag / release，版本号取默认分支 `package.json`，README 只给 `add github:aa2246740/dsh-watcher`）；`dsh-plugin-oauth-subs` `0.0.89`（来源 `xxww0098/dsh-plugin-oauth-subs`）。后者与 2026-09-10 的移除记录冲突，以本次实装为准重新收录——本机装的是它的 `github:` 改动源，需要维护更新入口。
- 刷新上游版本快照（`updatedAt` 当天重新抓取，6 项）：`dsh-better-reasoning-effort` `0.3.8` → `0.3.9`、`dshmarket` `1.45.1`（不变）、`dsh-pet` `0.2.7` → `0.2.8`、`dsh-pocket` `2.10.4` → `2.10.6`、`@michengai/dsh-archive-manager` `0.1.34` → `0.1.39`、`dsh-all-usage` `1.1.5` → `1.1.8`。
- 随快照同步 `install` 里的固定版本 spec：`dsh-pet@0.2.8`。其余 npm 固定版本 spec（`billion-context-dsh@0.2.21`、`@anysearch/anysearch-dsh`、`@michengai/dsh-archive-manager@latest`）分别与 npm `latest`、上游 HEAD 一致，未改。
- 按上游 README 原文复核全部 14 条 `update` 命令，均与 README 原生写法一致；新增条目说明两处口径：`dsh-watcher` 无独立 `update` 动词、`dsh-plugin-oauth-subs` README 写的是完整仓库地址而非 `github:` 简写。
- 新增 `scripts/fetch-upstream.ps1`（抓各插件上游默认分支 `package.json` 版本 + README）、`scripts/fetch-releases.ps1`（抓 GitHub releases 变更点）、`scripts/verify.ps1`（校验 JSON 结构、README 两表行数与命令一致、与 profile 实装差集为空）。`.upstream/` 为脚本临时产物，已加入 `.gitignore`。
- 目录版本 `1.25.0` → `1.26.0`，核对日期 `2026-09-12`。

## 2026-09-10 从目录移除 dsh-better-sidebar 与 dsh-plugin-oauth-subs

- 按用户指定，从目录移除 `dsh-better-sidebar` 与 `dsh-plugin-oauth-subs`；README 两表与说明同步删掉对应条目。
- 目录版本 `1.24.0` → `1.25.0`，核对日期 `2026-09-10`。本轮只改目录索引，没有卸载本机已装插件。

## 2026-09-10 插件目录与实装同步

- 按当前 `web` profile 实装：新增本机已装的 `dsh-retrace` `0.4.21`（来源 `daha1216/dsh-retrace`，DSH 0.1.5 兼容 fork；README 原生更新命令为 `dsh plugin --profile web add dsh-retrace`）；移除已卸载的 `archify-dsh` 与 `dsh-recall-plugin`。
- 刷新上游版本快照（8 项）：`dsh-better-sidebar` `0.18.0` → `0.19.0`、`dsh-better-reasoning-effort` `0.3.6` → `0.3.8`、`dshmarket` `1.44.0` → `1.45.1`、`dsh-pet` `0.2.6` → `0.2.7`、`dsh-pocket` `2.10.3` → `2.10.4`、`@michengai/dsh-archive-manager` `0.1.30` → `0.1.34`、`dsh-all-usage` `1.1.4` → `1.1.5`、`dsh-plugin-oauth-subs` `0.0.79` → `0.0.85`。
- 随快照同步 `install` 里的固定版本 spec：`dsh-pet@0.2.7`。
- 按上游 README 原文校正 `dsh-plugin-oauth-subs` 更新命令：README 已改为重跑 `add https://github.com/xxww0098/dsh-plugin-oauth-subs`，不再使用独立 `update` 动词；并按 README 补上 Ollama Cloud / Kimi / GitHub Copilot 接入说明。
- 目录版本 `1.23.0` → `1.24.0`，核对日期 `2026-09-10`。本轮只维护目录，没有安装、升级或卸载本机插件。

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
