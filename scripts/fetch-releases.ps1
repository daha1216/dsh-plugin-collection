# Fetch upstream release notes for the catalog's drifted plugins.
# Usage: pwsh -File scripts/fetch-releases.ps1 [-Repo owner/repo]...
param([string[]]$Repo)
$ErrorActionPreference = 'Continue'
$root = Split-Path -Parent $PSScriptRoot
$out  = Join-Path $root '.upstream'
New-Item -ItemType Directory -Force -Path $out | Out-Null
$h = @{ 'User-Agent' = 'dsh-plugin-collection'; 'Accept' = 'application/vnd.github+json' }

if (-not $Repo -or $Repo.Count -eq 0) {
  $Repo = @(
    'HaoyueQin/dsh-better-reasoning-effort',
    'dsh-market/dsh-market',
    'PC2005-cloud/dsh-pet',
    'shaobeichen/dsh-pocket',
    'MichengAI/dsh-archive-manager',
    'ParticleLight/dsh-all-usage'
  )
}

$all = @{}
foreach ($r in $Repo) {
  $key = $r -replace '[/\\]', '__'
  $releases = $null
  try { $releases = Invoke-RestMethod "https://api.github.com/repos/$r/releases?per_page=12" -Headers $h -TimeoutSec 40 } catch { Write-Warning "releases FAIL ${r}: $($_.Exception.Message)" }
  $commits = $null
  if (-not $releases) {
    try { $commits = Invoke-RestMethod "https://api.github.com/repos/$r/commits?per_page=25" -Headers $h -TimeoutSec 40 } catch { Write-Warning "commits FAIL ${r}: $($_.Exception.Message)" }
  }
  $all[$r] = [pscustomobject]@{ repo = $r; releases = $releases; commits = $commits }
  $n = if ($releases) { $releases.Count } else { 0 }
  Write-Host "[$r] releases=$n commits=$($commits.Count)"
}
$all | ConvertTo-Json -Depth 8 | Set-Content -Path (Join-Path $out 'releases.json') -Encoding utf8
Write-Host "wrote $out\releases.json"
