<#
.SYNOPSIS
    Skill Coverage Contract check (L5 hard gate): 1:1 between SithasoDaisy5.b4j
    ModuleN= entries and sithasodaisy5 components/*.md files.

.DESCRIPTION
    Enforces RULE-SETUP-001: every component registered in SithasoDaisy5.b4j
    MUST have a corresponding components/<Name>.md (exact case). Violations =
    exit 1. This is the framework-wide guarantee that the skill documents every
    buildable class - the check b4a's conformance gate does not perform.

    Exit codes: 0 = PASS, 1 = FAIL (missing or extra skill files), 2 = bad arguments.

.PARAMETER FrameworkFolder
    Folder containing SithasoDaisy5.b4j (the framework project file).
    Defaults to C:\b4j\workspace\0SithasoDaisy5.

.PARAMETER SkillFolder
    Folder containing the sithasodaisy5 skill's components/ directory.
    Defaults to the sibling skill in this suite.

.EXAMPLE
    ./check-contract.ps1
.EXAMPLE
    ./check-contract.ps1 -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
        -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5
#>

param(
    [string]$FrameworkFolder = "C:\b4j\workspace\0SithasoDaisy5",
    [string]$SkillFolder = ""
)

$ErrorActionPreference = "Stop"

if (-not $SkillFolder) {
    $SkillFolder = Join-Path $PSScriptRoot "..\..\sithasodaisy5"
}

if (-not (Test-Path $FrameworkFolder)) {
    Write-Host "ERROR: framework folder not found: $FrameworkFolder" -ForegroundColor Red
    exit 2
}
if (-not (Test-Path $SkillFolder)) {
    Write-Host "ERROR: skill folder not found: $SkillFolder" -ForegroundColor Red
    exit 2
}

$b4jPath = Join-Path $FrameworkFolder "SithasoDaisy5.b4j"
if (-not (Test-Path $b4jPath)) {
    Write-Host "ERROR: SithasoDaisy5.b4j not found in $FrameworkFolder" -ForegroundColor Red
    exit 2
}

# --- collect ModuleN= entries (normalize absolute/relative path-qualified modules) ---
$modules = @()
$text = Get-Content $b4jPath -Raw
foreach ($m in [regex]::Matches($text, '(?m)^Module(\d+)=(.+)$')) {
    $value = $m.Groups[2].Value.Trim()
    if ($value.StartsWith('|')) {
        # B4J stores external modules as |relative|path\ModuleName or
        # |absolute|path\ModuleName. The final path segment is the module name.
        $value = $value -replace '^\|[^|]*\|', ''
    }
    $name = [IO.Path]::GetFileNameWithoutExtension(($value -replace '/', '\'))
    if ($name) { $modules += $name }
}
$moduleSet = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
foreach ($module in $modules) { [void]$moduleSet.Add($module) }
$modules = @($moduleSet)

# --- collect components/*.md files ---
$compDir = Join-Path $SkillFolder "components"
$comp = @()
if (Test-Path $compDir) {
    $comp = @(Get-ChildItem -Path $compDir -Filter "*.md" -File | ForEach-Object { $_.BaseName })
}
$compSet = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
foreach ($name in $comp) { [void]$compSet.Add($name) }

$missing = @($modules | Where-Object { -not $compSet.Contains($_) } | Sort-Object)
$extra = @($compSet | Where-Object { -not $moduleSet.Contains($_) } | Sort-Object)

Write-Host "Registered module names:      $($modules.Count)" -ForegroundColor Gray
Write-Host "Registered SDUI5* classes:    $(@($modules | Where-Object { $_ -like 'SDUI5*' }).Count)" -ForegroundColor Gray
Write-Host "Registered support modules:   $(@($modules | Where-Object { $_ -notlike 'SDUI5*' }).Count)" -ForegroundColor Gray
Write-Host ".md files in components/:    $($comp.Count)" -ForegroundColor Gray
Write-Host "Missing skill files:          $($missing.Count)" -ForegroundColor Gray
Write-Host "Extra skill files (orphans):  $($extra.Count)" -ForegroundColor Gray
Write-Host ""

if ($missing.Count -gt 0) {
    Write-Host "FAIL - missing: $($missing -join ', ')" -ForegroundColor Red
    exit 1
}
if ($extra.Count -gt 0) {
    Write-Host "FAIL - extras: $($extra -join ', ')" -ForegroundColor Red
    exit 1
}
Write-Host "PASS - contract satisfied (1:1 normalized ModuleN= <-> components/*.md)" -ForegroundColor Green
exit 0
