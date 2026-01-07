Param(
    [Parameter(Mandatory = $true)]
    [string]$Destination,

    [switch]$Overwrite
)

$repoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

$items = @(
    @{ Source = "AGENTS.md"; Type = "File" },
    @{ Source = "CLAUDE.md"; Type = "File" },
    @{ Source = "CLAUDE-example.md"; Type = "File" },
    @{ Source = ".claude\mcp.servers.json"; Type = "File" },
    @{ Source = ".claude\commands"; Type = "Directory" },
    @{ Source = "examples"; Type = "Directory" },
    @{ Source = "PRPs"; Type = "Directory" }
)

function Copy-AgentItem {
    param (
        [string]$Source,
        [string]$Target,
        [string]$Type
    )

    if (-not (Test-Path $Source)) {
        Write-Warning "Source not found: $Source"
        return
    }

    if ((Test-Path $Target) -and (-not $Overwrite)) {
        Write-Host "Skipping existing: $Target (use -Overwrite to replace)" -ForegroundColor Yellow
        return
    }

    $targetDir = if ($Type -eq "File") { Split-Path -Parent $Target } else { $Target }
    if (-not (Test-Path $targetDir)) {
        New-Item -ItemType Directory -Path $targetDir | Out-Null
    }

    if ($Type -eq "File") {
        Copy-Item -LiteralPath $Source -Destination $Target -Force:$Overwrite
    } else {
        Copy-Item -LiteralPath $Source -Destination $targetDir -Recurse -Force:$Overwrite
    }

    Write-Host "Copied $Source -> $Target"
}

foreach ($item in $items) {
    $sourcePath = Join-Path $repoRoot $item.Source
    $targetPath = Join-Path $Destination $item.Source
    Copy-AgentItem -Source $sourcePath -Target $targetPath -Type $item.Type
}

Write-Host "Agent kit sync complete."
