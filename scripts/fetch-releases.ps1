# Fetch upstream release notes for the catalog's drifted plugins.
# Usage: pwsh -File scripts/fetch-releases.ps1 [-Repo owner/repo]...
param([string[]]$Repo)
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

$h = @{ 'User-Agent' = 'dsh-plugin-collection'; 'Accept' = 'application/vnd.github+json' }

if (-not $Repo -or $Repo.Count -eq 0) {
  $Repo = @(
    'HaoyueQin/dsh-better-reasoning-effort',
    'daha1216/dsh-pocket',
    'anysearch-team/anysearch-dsh',
    'ranxianglei/billion-context',
    'omdsh-dev/dsh-mnemon',
    'Ebony-Vinyl/dsh-our-free-model',
    'daha1216/dsh-retrace',
    'daha1216/dsh-update-checker',
    'daha1216/dsh-skills-manager',
    'T-Auto/dsh-ops',
    'HsiangNianian/dsh-auto-continue',
    'bowenliang123/dsh-context',
    'xiaotie3088/dsh-desktop-notify-win',
    'Yu-tao-Li/dsh-computer-use-win'
  )
}

$all = @{}
foreach ($r in $Repo) {
  $key = $r -replace '[/\\]', '__'
  $releases = $null
  try { $releases = Invoke-RestMethod "https://api.github.com/repos/$r/releases?per_page=12" -Headers $h -TimeoutSec 20 } catch { Write-Warning "releases FAIL ${r}: $($_.Exception.Message)" }
  $commits = $null
  if (-not $releases) {
    try { $commits = Invoke-RestMethod "https://api.github.com/repos/$r/commits?per_page=25" -Headers $h -TimeoutSec 20 } catch { Write-Warning "commits FAIL ${r}: $($_.Exception.Message)" }
  }
  $all[$r] = [pscustomobject]@{ repo = $r; releases = $releases; commits = $commits }
  $n = if ($releases) { $releases.Count } else { 0 }
  Write-Host "[$r] releases=$n commits=$($commits.Count)"
}
$all | ConvertTo-Json -Depth 8 | Set-Content -Path (Join-Path $out 'releases.json') -Encoding utf8
Write-Host "wrote $out\releases.json"
