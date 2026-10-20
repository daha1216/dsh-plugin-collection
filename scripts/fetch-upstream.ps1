# Fetch upstream HEAD package.json version + README for the plugin catalog.
# Usage: pwsh -File scripts/fetch-upstream.ps1
$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$out  = Join-Path $root '.upstream'
New-Item -ItemType Directory -Force -Path $out | Out-Null

# id = repo path on GitHub (owner/repo), plus optional subpath inside the repo
$repos = [ordered]@{
  # 与 plugins.json 目录条目一一对应（2026-10-21 对齐 1.51.0 / 13 条）
  # 注意：billion-context 权威发布渠道是 npm，仓库 HEAD 通常同步但可能滞后
  # dsh-ops 权威渠道是 npm（仓库 HEAD 可能已领先未发布版本）；dsh-our-free-model 权威渠道是 GitHub Release 的 tarball
  'dsh-better-reasoning-effort' = @{ repo = 'HaoyueQin/dsh-better-reasoning-effort'; path = '' }
  'dsh-pocket'                  = @{ repo = 'daha1216/dsh-pocket';                      path = '' }
  'anysearch-dsh'               = @{ repo = 'anysearch-team/anysearch-dsh';            path = '' }
  'billion-context'             = @{ repo = 'ranxianglei/billion-context';             path = '' }
  'dsh-mnemon'                  = @{ repo = 'omdsh-dev/dsh-mnemon';                     path = '' }
  'dsh-our-free-model'          = @{ repo = 'Ebony-Vinyl/dsh-our-free-model';           path = '' }
  'dsh-retrace'                 = @{ repo = 'daha1216/dsh-retrace';                    path = '' }
  'dsh-watcher'                 = @{ repo = 'daha1216/dsh-watcher';                    path = '' }
  'dsh-update-checker'          = @{ repo = 'daha1216/dsh-update-checker';              path = '' }
  'dsh-skills-manager'          = @{ repo = 'daha1216/dsh-skills-manager';              path = '' }
  'dsh-ops'                     = @{ repo = 'T-Auto/dsh-ops';                          path = '' }
  'dsh-client-auto-continue'    = @{ repo = 'HsiangNianian/dsh-auto-continue';          path = '' }
  'dsh-context'                 = @{ repo = 'bowenliang123/dsh-context';                path = '' }
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
