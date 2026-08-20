# Changelog

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
