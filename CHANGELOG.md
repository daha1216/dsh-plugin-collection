# Changelog

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
