# Verify the plugin catalog: JSON shape, README table parity, installed-vs-catalog diff.
# Usage: pwsh -File scripts/verify.ps1 [-Profile web]
param([string]$Profile = 'web')
$ErrorActionPreference = 'Stop'

$root    = Split-Path -Parent $PSScriptRoot
$catalog = Get-Content -Raw -LiteralPath (Join-Path $root 'plugins.json') | ConvertFrom-Json
$readme  = Get-Content -Raw -LiteralPath (Join-Path $root 'README.md')
$errors  = @()

# --- JSON shape -------------------------------------------------------------
foreach ($f in 'catalogVersion','updatedAt','install','plugins') {
  if (-not $catalog.PSObject.Properties.Name.Contains($f)) { $errors += "plugins.json 缺字段: $f" }
}
if ($catalog.install.sourcePolicy -ne 'github-or-npm') { $errors += "install.sourcePolicy 必须为 github-or-npm" }
$ids = @($catalog.plugins | ForEach-Object { $_.id })
if (($ids | Select-Object -Unique).Count -ne $ids.Count) { $errors += 'plugins.json 存在重复 id' }

foreach ($p in $catalog.plugins) {
  foreach ($f in 'id','name','version','description','source','install','update') {
    if (-not $p.PSObject.Properties.Name.Contains($f) -or [string]::IsNullOrWhiteSpace($p.$f)) {
      $errors += "条目 $($p.id) 缺字段或为空: $f"
    }
  }
  if ($p.source -notmatch '^https://github\.com/[^/]+/[^/]+$') { $errors += "条目 $($p.id) source 不是仓库地址: $($p.source)" }
  if ($p.id -ne $p.name -and $p.name -notmatch '/') { $errors += "条目 $($p.id) name 异常: $($p.name)" }
}

# --- README table parity ----------------------------------------------------
$dirSection = ($readme -split '(?m)^## 插件目录')[1] -split '(?m)^## 更新插件' | Select-Object -First 1
$updSection = ($readme -split '(?m)^## 更新插件')[1]
$dirRows = @([regex]::Matches($dirSection, '(?m)^\| `[^`]+` \|') | ForEach-Object { $_.Value })
$updRows = @([regex]::Matches($updSection, '(?m)^\| `[^`]+` \|') | ForEach-Object { $_.Value })

if ($dirRows.Count -ne $catalog.plugins.Count) { $errors += "README 目录表 $($dirRows.Count) 行 != plugins.json $($catalog.plugins.Count) 条" }
if ($updRows.Count -ne $catalog.plugins.Count) { $errors += "README 更新插件表 $($updRows.Count) 行 != plugins.json $($catalog.plugins.Count) 条" }

foreach ($p in $catalog.plugins) {
  $idNamePattern = "^\| ``$([regex]::Escape($p.id))`` \| ``$([regex]::Escape($p.name))`` \| $([regex]::Escape($p.version)) \|"
  $namePattern   = "^\| ``$([regex]::Escape($p.name))`` \| $([regex]::Escape($p.version)) \|"
  if ($readme -notmatch "(?m)($idNamePattern|$namePattern)") {
    $errors += "README 目录表缺/版本不符: $($p.name) $($p.version)"
  }
  $esc = [regex]::Escape($p.update)
  $updIdPattern   = "^\| ``$([regex]::Escape($p.id))`` \| ``$esc`` \|$"
  $updNamePattern = "^\| ``$([regex]::Escape($p.name))`` \| ``$esc`` \|$"
  if ($readme -notmatch "(?m)($updIdPattern|$updNamePattern)") {
    $errors += "README 更新插件表缺/命令不符: $($p.name)"
  }
}

# --- installed vs catalog ---------------------------------------------------
$profilePkg = Join-Path $HOME ".dsh\profiles\$Profile\package.json"
if (Test-Path $profilePkg) {
  $deps = (Get-Content -Raw -LiteralPath $profilePkg | ConvertFrom-Json).dependencies
  $installedNames = @($deps.PSObject.Properties.Name)
  $catalogNames   = @($catalog.plugins | ForEach-Object { $_.name })
  $missing = @($installedNames | Where-Object { $_ -notin $catalogNames -and $_ -notlike '@deepseek-ai/*' })
  if ($missing.Count) { $errors += "已安装但目录缺失: $($missing -join ', ')" }
  $ghost = @($catalogNames | Where-Object { $_ -notin $installedNames })
  if ($ghost.Count) { $errors += "目录有但本机未装: $($ghost -join ', ')" }
} else {
  Write-Warning "找不到 profile package.json: $profilePkg（跳过差集核对）"
}

# --- report -----------------------------------------------------------------
if ($errors.Count) {
  Write-Host "校验未通过（$($errors.Count) 项）：" -ForegroundColor Red
  $errors | ForEach-Object { Write-Host "  - $_" -ForegroundColor Red }
  exit 1
}
Write-Host "校验通过：catalogVersion=$($catalog.catalogVersion) updatedAt=$($catalog.updatedAt) 条目=$($catalog.plugins.Count)，README 两表与实装一致。" -ForegroundColor Green
