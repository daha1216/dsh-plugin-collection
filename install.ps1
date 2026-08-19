[CmdletBinding()]
param(
    [string]$Plugin,
    [string]$Profile = 'web',
    [switch]$All,
    [switch]$List
)

$ErrorActionPreference = 'Stop'
$catalogPath = Join-Path $PSScriptRoot 'plugins.json'
$catalog = Get-Content -Raw -LiteralPath $catalogPath | ConvertFrom-Json

if ($List -or (-not $All -and [string]::IsNullOrWhiteSpace($Plugin))) {
    $catalog.plugins | Format-Table id, name, version, description -AutoSize
    Write-Host "`n单个安装: .\install.ps1 -Plugin <id>"
    Write-Host "全部安装: .\install.ps1 -All"
    exit 0
}

$selected = if ($All) {
    @($catalog.plugins)
} else {
    @($catalog.plugins | Where-Object { $_.id -eq $Plugin -or $_.name -eq $Plugin })
}

if ($selected.Count -eq 0) {
    throw "未找到插件 '$Plugin'。运行 .\install.ps1 -List 查看可用 ID。"
}

$npx = Get-Command npx -ErrorAction SilentlyContinue
if (-not $npx) {
    throw '找不到 npx。请先安装 Node.js。'
}

foreach ($item in $selected) {
    Write-Host "安装 $($item.name) v$($item.version) <- $($item.source)"
    & npx --yes -p @deepseek-ai/dsh dsh plugin --profile $Profile add $item.install
    if ($LASTEXITCODE -ne 0) {
        throw "安装失败: $($item.id)"
    }
}

Write-Host "安装完成。请重启 DSH Web UI 使插件全部生效。"
