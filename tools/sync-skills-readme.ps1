<#
.SYNOPSIS
    Synchronizes README.md with skills-registry.json, intent-to-skill.md, and the physical skill inventory.
.DESCRIPTION
    Ensures that README.md always accurately reflects:
    1. Exact component count (skills/sithasodaisy5/components/*.md)
    2. Exact reference count (skills/sithasodaisy5/references/*.md)
    3. Exact skill suite registry matrix (skills-registry.json)
    4. Deterministic intent routing table (intent-to-skill.md)
    5. Badges and version strings
.EXAMPLE
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File tools/sync-skills-readme.ps1
#>
[CmdletBinding()]
param(
    [string]$RepoRoot = '',
    [string]$Version = ''
)

$ErrorActionPreference = 'Stop'
if (-not $RepoRoot) { $RepoRoot = Split-Path -Parent $PSScriptRoot }
if (-not $RepoRoot) { $RepoRoot = (Get-Location).Path }

$readmePath = Join-Path $RepoRoot 'README.md'
$regPath = Join-Path $RepoRoot 'skills-registry.json'
$pluginPath = Join-Path $RepoRoot 'plugin.json'
$intentPath = Join-Path $RepoRoot 'skills\sithasodaisy5\references\intent-to-skill.md'

if (-not (Test-Path $readmePath)) { throw "README.md not found at $readmePath" }
if (-not (Test-Path $regPath)) { throw "skills-registry.json not found at $regPath" }

# 1. Gather Metrics from File System
$components = Get-ChildItem -Path (Join-Path $RepoRoot 'skills\sithasodaisy5\components\*.md') -File
$references = Get-ChildItem -Path (Join-Path $RepoRoot 'skills\sithasodaisy5\references\*.md') -File

$componentCount = $components.Count
$referenceCount = $references.Count

$reg = Get-Content -LiteralPath $regPath -Raw -Encoding UTF8 | ConvertFrom-Json
$publicSkills = @($reg.skills | Where-Object { $_.id -ne 'sd5-book-to-skill' })
$skillsCount = $publicSkills.Count

# Determine Version
if ([string]::IsNullOrWhiteSpace($Version)) {
    if (Test-Path $pluginPath) {
        $pObj = Get-Content -LiteralPath $pluginPath -Raw -Encoding UTF8 | ConvertFrom-Json
        $Version = $pObj.version
    } else {
        $Version = $reg.skills[0].version
    }
}
$Version = $Version.TrimStart('v')

Write-Host "==> Synchronizing README.md metrics:" -ForegroundColor Cyan
Write-Host "    Version:     $Version" -ForegroundColor Gray
Write-Host "    Skills:      $skillsCount modules" -ForegroundColor Gray
Write-Host "    Components:  $componentCount component specifications" -ForegroundColor Gray
Write-Host "    References:  $referenceCount doctrine references" -ForegroundColor Gray

# 2. Build Skills Registry Matrix Markdown
$matrixSb = New-Object System.Text.StringBuilder
[void]$matrixSb.AppendLine('| Skill | Authority | Category | When to Use (Triggers) | Core Objective & Output |')
[void]$matrixSb.AppendLine('| :--- | :---: | :---: | :--- | :--- |')

foreach ($s in $publicSkills) {
    $authStr = "L$($s.authority)"
    $triggers = ($s.keywords[0..4] -join ', ')
    if ($s.keywords.Count -gt 5) { $triggers += '...' }
    $desc = $s.description -replace '\|', '/'
    $lineText = "| **`{0}`** | `{1}` | `{2}` | {3} | {4} |" -f $s.id, $authStr, $s.category, $triggers, $desc
    [void]$matrixSb.AppendLine($lineText)
}
$skillsMatrixMarkdown = $matrixSb.ToString().TrimEnd()

# 3. Build Intent & Task Router Table from intent-to-skill.md
$routerSb = New-Object System.Text.StringBuilder
[void]$routerSb.AppendLine('| User Intent / Task Keywords | Recommended Starting Skills | Why This Order? | Rejected / Why Not? |')
[void]$routerSb.AppendLine('| :--- | :--- | :--- | :--- |')

if (Test-Path $intentPath) {
    foreach ($line in (Get-Content -LiteralPath $intentPath -Encoding UTF8)) {
        if ($line -match '^\|(.+)\|$') {
            $cells = ($line.Trim('|') -split '\|').ForEach({ $_.Trim() })
            if ($cells[0] -eq 'Task keywords' -or $cells[0] -match '^:?-+:?$') { continue }
            if ($cells.Count -ge 4) {
                $terms = $cells[0]
                $sel   = $cells[1]
                $why   = $cells[2]
                $rej   = $cells[3]
                if ($sel -match 'sd5-book-to-skill') { continue }
                [void]$routerSb.AppendLine("| **$terms** | $sel | $why | $rej |")
            }
        }
    }
}
$routerMatrixMarkdown = $routerSb.ToString().TrimEnd()

# 4. Inject into README.md
$content = Get-Content -LiteralPath $readmePath -Raw -Encoding UTF8

# Replace Router Table
$routerPattern = '(?s)<!-- AUTOGEN_ROUTER_START -->.*?<!-- AUTOGEN_ROUTER_END -->'
if ($content -match $routerPattern) {
    $routerReplacement = "<!-- AUTOGEN_ROUTER_START -->`n$routerMatrixMarkdown`n<!-- AUTOGEN_ROUTER_END -->"
    $content = $content -replace $routerPattern, $routerReplacement
}

# Replace Skills Table
$skillsPattern = '(?s)<!-- AUTOGEN_SKILLS_START -->.*?<!-- AUTOGEN_SKILLS_END -->'
if ($content -match $skillsPattern) {
    $skillsReplacement = "<!-- AUTOGEN_SKILLS_START -->`n$skillsMatrixMarkdown`n<!-- AUTOGEN_SKILLS_END -->"
    $content = $content -replace $skillsPattern, $skillsReplacement
}

# Replace Version Badges & Numbers
$content = [regex]::Replace($content, 'Release-v\d+\.\d+\.\d+', "Release-v$Version")
$content = [regex]::Replace($content, 'Skills-\d+_Modules', "Skills-${skillsCount}_Modules")
$content = [regex]::Replace($content, 'Components-\d+_Classes', "Components-${componentCount}_Classes")

Set-Content -LiteralPath $readmePath -Value $content -Encoding UTF8
Write-Host "==> README.md updated successfully." -ForegroundColor Green
