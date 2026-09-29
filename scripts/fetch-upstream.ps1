# Fetch upstream HEAD package.json version + README for the plugin catalog.
# Usage: pwsh -File scripts/fetch-upstream.ps1
$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$out  = Join-Path $root '.upstream'
New-Item -ItemType Directory -Force -Path $out | Out-Null

# id = repo path on GitHub (owner/repo), plus optional subpath inside the repo
$repos = [ordered]@{
  # 与 plugins.json 目录条目一一对应（2026-09-29 对齐 1.40.0 / 11 条）
  # 注意：billion-context 权威发布渠道是 npm，仓库 HEAD 通常同步但可能滞后；dsh-pet 是 monorepo 取 dsh-pet/ 子包
  'dsh-better-reasoning-effort' = @{ repo = 'HaoyueQin/dsh-better-reasoning-effort'; path = '' }
  'dsh-pet'                     = @{ repo = 'PC2005-cloud/dsh-pet';                    path = 'dsh-pet' }
  'dsh-pocket'                  = @{ repo = 'daha1216/dsh-pocket';                      path = '' }
  'dsh-opencode-go-usage'       = @{ repo = 'xueayi/dsh-opencode-go-usage';            path = '' }
  'dsh-all-usage'               = @{ repo = 'ParticleLight/dsh-all-usage';             path = '' }
  'anysearch-dsh'               = @{ repo = 'anysearch-team/anysearch-dsh';            path = '' }
  'billion-context'             = @{ repo = 'ranxianglei/billion-context';             path = '' }
  'dsh-retrace'                 = @{ repo = 'daha1216/dsh-retrace';                    path = '' }
  'dsh-font-customizer'         = @{ repo = 'daha1216/dsh-font-customizer';            path = '' }
  'dsh-watcher'                 = @{ repo = 'daha1216/dsh-watcher';                    path = '' }
  'dsh-plugin-oauth-subs'       = @{ repo = 'xxww0098/dsh-plugin-oauth-subs';          path = '' }
}

$rows = @()
foreach ($id in $repos.Keys) {
  $r = $repos[$id]
  $branch = 'main'
  $pkg = $null
  foreach ($b in @('main','master')) {
    $p = if ($r.path) { "$($r.path)/package.json" } else { 'package.json' }
    $u = "https://raw.githubusercontent.com/$($r.repo)/$b/$p"
    try { $pkg = Invoke-RestMethod -Uri $u -TimeoutSec 30 -ErrorAction Stop; $branch = $b; break } catch { }
  }
  $readme = $null
  foreach ($b in @($branch,'main','master')) {
    foreach ($f in @('README.md','readme.md')) {
      try {
        $readme = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$($r.repo)/$b/$f" -TimeoutSec 30 -UseBasicParsing -ErrorAction Stop
        $readme.Content | Set-Content -Path (Join-Path $out "$id.README.md") -Encoding utf8
        break
      } catch { }
    }
    if ($readme) { break }
  }
  $rows += [pscustomobject]@{
    id       = $id
    repo     = $r.repo
    branch   = $branch
    pkg      = if ($r.path) { "$($r.path)/package.json" } else { 'package.json' }
    name     = if ($pkg) { $pkg.name } else { '' }
    version  = if ($pkg) { $pkg.version } else { 'FETCH-FAIL' }
    hasReadme = [bool]$readme
  }
}
$rows | Format-Table -AutoSize
$rows | ConvertTo-Json -Depth 4 | Set-Content -Path (Join-Path $out 'upstream.json') -Encoding utf8
