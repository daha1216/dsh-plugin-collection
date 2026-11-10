# Fetch upstream HEAD package.json version + README for the plugin catalog.
# Usage: pwsh -File scripts/fetch-upstream.ps1
$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$out  = Join-Path $root '.upstream'
New-Item -ItemType Directory -Force -Path $out | Out-Null

if (-not $env:https_proxy) {
  try {
    $tcp = New-Object System.Net.Sockets.TcpClient
    $iar = $tcp.BeginConnect('127.0.0.1', 7890, $null, $null)
    if ($iar.AsyncWaitHandle.WaitOne(200, $false)) {
      $tcp.EndConnect($iar)
      $env:https_proxy = 'http://127.0.0.1:7890'
      $env:http_proxy  = 'http://127.0.0.1:7890'
    }
    $tcp.Close()
  } catch { }
}

# id = repo path on GitHub (owner/repo), plus optional subpath inside the repo
$repos = [ordered]@{
  # 与 plugins.json 目录条目一一对应（2026-11-10 对齐 1.59.6 / 13 条）
  # 注意：billion-context 权威发布渠道是 npm，仓库 HEAD 通常同步但可能滞后
  'dsh-better-reasoning-effort' = @{ repo = 'HaoyueQin/dsh-better-reasoning-effort'; path = '' }
  'dsh-pocket'                  = @{ repo = 'daha1216/dsh-pocket';                      path = '' }
  'anysearch-dsh'               = @{ repo = 'anysearch-team/anysearch-dsh';            path = '' }
  'billion-context'             = @{ repo = 'ranxianglei/billion-context';             path = '' }
  'dsh-mnemon'                  = @{ repo = 'omdsh-dev/dsh-mnemon';                     path = '' }
  'dsh-retrace'                 = @{ repo = 'daha1216/dsh-retrace';                    path = '' }
  'dsh-update-checker'          = @{ repo = 'daha1216/dsh-update-checker';              path = '' }
  'dsh-skillhub'                = @{ repo = 'aa2246740/dsh-skillhub';                  path = '' }
  'dsh-deep-ptc-mode'           = @{ repo = 'lishize20040802-rgb/dsh-deep-ptc-mode';     path = '' }
  'dsh-client-auto-continue'    = @{ repo = 'HsiangNianian/dsh-auto-continue';          path = '' }
  'dsh-context'                 = @{ repo = 'bowenliang123/dsh-context';                path = '' }
  'dsh-desktop-notify-win'      = @{ repo = 'xiaotie3088/dsh-desktop-notify-win';      path = '' }
  'dsh-computer-use-win'        = @{ repo = 'Yu-tao-Li/dsh-computer-use-win';          path = '' }
}

$rows = @()
foreach ($id in $repos.Keys) {
  $r = $repos[$id]
  $branch = 'main'
  $pkg = $null
  foreach ($b in @('main','master')) {
    $p = if ($r.path) { "$($r.path)/package.json" } else { 'package.json' }
    $u = "https://raw.githubusercontent.com/$($r.repo)/$b/$p"
    try { $pkg = Invoke-RestMethod -Uri $u -TimeoutSec 15 -ErrorAction Stop; $branch = $b; break } catch { }
  }
  $readme = $null
  foreach ($b in @($branch,'main','master')) {
    foreach ($f in @('README.md','readme.md')) {
      try {
        $readme = Invoke-WebRequest -Uri "https://raw.githubusercontent.com/$($r.repo)/$b/$f" -TimeoutSec 15 -UseBasicParsing -ErrorAction Stop
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
