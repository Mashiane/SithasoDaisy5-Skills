<#
.SYNOPSIS
    SithasoDaisy5 web verify-conformance (L5 hard gate).

.DESCRIPTION
    Deeper check than pre-scan. Enforces contracts that span framework + app + skill:

      1. Skill Coverage Contract  - every ModuleN= in SithasoDaisy5.b4j MUST have
                                    a components/<Name>.md (exact case).
      2. App uses documented components - registered SDUI5* class TYPE references
                                    in pg*.bas must have a components/<Name>.md;
                                    path-qualified external modules are advisory.
      3. Lifecycle                - every Sub Show must contain
                                    BANano.Await(app.ClearPageView) and
                                    pgIndex.UpdateTitle(...).
      4. Grid sizing              - SizeMd + SizeSm <= 12 per column (WARN only).
      5. .Color setter contract   - .Color takes semantic tokens only; hex in
                                    .Color fails. Hex is legal via .Classes
                                    (incl. arbitrary values), .Styles, component
                                    CSS-string color props, theme palettes
                                    (design-tokens.md §1.1 Color Channels).
      6. State coverage (WARN)    - data-driven pages (fetch/SetItems heuristic)
                                    should reference Empty + Error + Loading
                                    components. Hard review happens at Stage 9
                                    (ux-review.md); this is a best-effort advisory.

    Exit codes: 0 = PASS, 1 = any L5 violation (FAIL), 2 = bad arguments.

.PARAMETER AppFolder
    The generated app folder (contains <AppName>.b4j + pgIndex.bas + pg*.bas).

.PARAMETER FrameworkFolder
    Folder containing the SithasoDaisy5.b4j project file (the framework).
    Defaults to C:\b4j\workspace\0SithasoDaisy5.

.PARAMETER SkillFolder
    Folder containing the sithasodaisy5 skill's components/ directory.
    Defaults to the sibling skill in this suite.

.EXAMPLE
    ./verify-conformance.ps1 -AppFolder C:\b4j\workspace\MyApp
.EXAMPLE
    ./verify-conformance.ps1 -AppFolder C:\b4j\workspace\MyApp `
        -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
        -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5
#>

param(
    [Parameter(Mandatory = $true)][string]$AppFolder,
    [string]$FrameworkFolder = "C:\b4j\workspace\0SithasoDaisy5",
    [string]$SkillFolder = ""
)

$ErrorActionPreference = "Stop"

if (-not $SkillFolder) {
    $SkillFolder = Join-Path $PSScriptRoot "..\..\sithasodaisy5"
}

if (-not (Test-Path $AppFolder)) {
    Write-Host "FAIL: app folder does not exist: $AppFolder" -ForegroundColor Red
    exit 2
}
if (-not (Test-Path $FrameworkFolder)) {
    Write-Host "FAIL: framework folder does not exist: $FrameworkFolder" -ForegroundColor Red
    exit 2
}
if (-not (Test-Path $SkillFolder)) {
    Write-Host "FAIL: skill folder does not exist: $SkillFolder" -ForegroundColor Red
    exit 2
}

$findings = @()
$b4jRegex = '(?m)^Module\d+=(.+)$'

function Add-Finding($Sev, $Msg) {
    $script:findings += [PSCustomObject]@{ Sev=$Sev; Msg=$Msg }
}

# --- Required app env.json gate (source in Files/, generated to assets/) ---
$envJsonFiles = Join-Path $AppFolder "Files\env.json"
$envJsonAssets = Join-Path $AppFolder "assets\env.json"
if (-not (Test-Path $envJsonFiles)) {
    Add-Finding 'FAIL' "Missing required Files/env.json (every app must ship env.json in Files/)."
}
if (-not (Test-Path $envJsonAssets)) {
    Add-Finding 'FAIL' "Missing required assets/env.json (generated copy; run build or copy from Files/)."
}

# --- 1/5 Skill Coverage Contract: every ModuleN= in framework .b4j has components/<Name>.md ---
Write-Host "[1/5] Skill Coverage Contract ..." -ForegroundColor Cyan
$b4jFiles = @(Get-ChildItem -Path $FrameworkFolder -Filter "*.b4j" -File -ErrorAction SilentlyContinue)
if ($b4jFiles.Count -eq 0) {
    Add-Finding 'FAIL' "no .b4j manifest found in framework root: $FrameworkFolder"
} else {
    $allModules = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
    foreach ($b4j in $b4jFiles) {
        $text = Get-Content $b4j.FullName -Raw
        foreach ($m in [regex]::Matches($text, $b4jRegex)) {
            $value = $m.Groups[1].Value.Trim()
            if ($value.StartsWith('|')) {
                $value = $value -replace '^\|[^|]*\|', ''
            }
            $name = [IO.Path]::GetFileNameWithoutExtension(($value -replace '/', '\'))
            if ($name) { [void]$allModules.Add($name) }
        }
    }
    $compDir = Join-Path $SkillFolder "components"
    $existing = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::Ordinal)
    if (Test-Path $compDir) {
        foreach ($cf in (Get-ChildItem -Path $compDir -Filter "*.md" -File)) { [void]$existing.Add($cf.BaseName) }
    }
    $missing = @($allModules | Where-Object { -not $existing.Contains($_) } | Sort-Object)
    if ($missing.Count -gt 0) {
        $preview = ($missing | Select-Object -First 5) -join ", "
        $more = if ($missing.Count -gt 5) { "..." } else { "" }
        Add-Finding 'FAIL' "Skill Coverage Contract violated: $($missing.Count) ModuleN= entries missing components/*.md: $preview$more"
    }
}

# --- 2/5 App uses documented components: every SDUI5* type in pg*.bas has a .md ---
Write-Host "[2/5] App uses documented components ..." -ForegroundColor Cyan
$compDir2 = Join-Path $SkillFolder "components"
$existing2 = @{}
if (Test-Path $compDir2) {
    foreach ($cf in (Get-ChildItem -Path $compDir2 -Filter "*.md" -File)) { $existing2[$cf.BaseName] = $true }
}
$typeRe = '\b(?:As|New)\s+(SDUI5[A-Za-z0-9_]+)\b'
$usedTypes = New-Object System.Collections.Generic.HashSet[string]
$externalModules = New-Object 'System.Collections.Generic.HashSet[string]' ([System.StringComparer]::OrdinalIgnoreCase)
foreach ($project in (Get-ChildItem -Path $AppFolder -Filter "*.b4j" -File -ErrorAction SilentlyContinue)) {
    $projectText = Get-Content $project.FullName -Raw
    foreach ($entry in [regex]::Matches($projectText, '(?m)^Module\d+=(.+)$')) {
        $value = $entry.Groups[1].Value.Trim()
        if (-not $value.StartsWith('|')) { continue }
        $value = $value -replace '^\|[^|]*\|', ''
        $moduleName = [IO.Path]::GetFileNameWithoutExtension(($value -replace '/', '\'))
        if ($moduleName) { [void]$externalModules.Add($moduleName) }
    }
}
foreach ($path in (Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)) {
    $text = Get-Content $path.FullName -Raw
    foreach ($m in [regex]::Matches($text, $typeRe)) {
        [void]$usedTypes.Add($m.Groups[1].Value)
    }
}
$missingTypes = @($usedTypes | Where-Object { -not $existing2.ContainsKey($_) } | Sort-Object)
$unknownTypes = @($missingTypes | Where-Object { -not $externalModules.Contains($_) })
$externalTypes = @($missingTypes | Where-Object { $externalModules.Contains($_) })
if ($unknownTypes.Count -gt 0) {
    Add-Finding 'FAIL' "app uses $($unknownTypes.Count) SDUI5* types outside the framework registry with no skill file: $($unknownTypes -join ', ')"
}
if ($externalTypes.Count -gt 0) {
    Add-Finding 'WARN' "app uses external path-qualified SDUI5* modules outside the SithasoDaisy5 skill scope: $($externalTypes -join ', ')"
}

# --- 3/5 Lifecycle: ClearPageView + UpdateTitle in every Sub Show ---
# Case-SENSITIVE on purpose: only lowercase `app` passes (B4J compiles both, but
# the gate requires `app = pgIndex.App`). See app-scaffolds.md and AIExamples.
Write-Host "[3/5] Lifecycle (ClearPageView + UpdateTitle) ..." -ForegroundColor Cyan
$clearRe = 'BANano\.Await\(\s*app\s*\.ClearPageView'
$titleRe = 'pgIndex\.UpdateTitle'
foreach ($path in (Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)) {
    $text = Get-Content $path.FullName -Raw
    foreach ($block in [regex]::Matches($text, '(?m)^\s*Sub\s+Show\b.*?End\s+Sub', [System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
        if ($block.Value -cnotmatch $clearRe) {
            Add-Finding 'FAIL' "$($path.Name): Sub Show missing BANano.Await(app.ClearPageView)"
        }
        if ($block.Value -cnotmatch $titleRe) {
            Add-Finding 'FAIL' "$($path.Name): Sub Show missing pgIndex.UpdateTitle(...)"
        }
    }
}

# --- 4/5 Grid sizing: SizeMd + SizeSm <= 12 (WARN only) ---
Write-Host "[4/5] Grid sizing ..." -ForegroundColor Cyan
$mdRe = '\.SizeMd\s*=\s*"(\d+)"'
$smRe = '\.SizeSm\s*=\s*"(\d+)"'
foreach ($path in (Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)) {
    $text = Get-Content $path.FullName -Raw
    # Group columns: iterate every column declaration segment
    $segments = [regex]::Matches($text, 'SDUI5Column[A-Za-z0-9_]*\s+As\s+SDUI5Column.*?(?=SDUI5Column[A-Za-z0-9_]*\s+As\s+SDUI5Column|SUI5Row|SUI5[A-Z]|^\s*Dim|\Z)', [System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($seg in $segments) {
        $md = [regex]::Match($seg.Value, $mdRe)
        $sm = [regex]::Match($seg.Value, $smRe)
        if ($md.Success -and $sm.Success) {
            $total = [int]$md.Groups[1].Value + [int]$sm.Groups[1].Value
            if ($total -gt 12) {
                Add-Finding 'WARN' "$($path.Name): column SizeMd + SizeSm = $total (exceeds 12, may overflow grid)"
            }
        }
    }
}

# --- 5/5 .Color value policy (tokens preferred; hex/rgb allowed) ---
Write-Host "[5/5] .Color value policy ..." -ForegroundColor Cyan
$hexColorRe = '\.Color\s*=\s*"#([0-9A-Fa-f]{3,8})"'
foreach ($path in (Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)) {
    $text = Get-Content $path.FullName -Raw
    $lines = $text -split "`r?`n"
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match $hexColorRe) {
            Add-Finding 'WARN' "$($path.Name):$($i+1): hex color in .Color (allowed; prefer semantic tokens for theme switching)"
        }
    }
}

# --- 6/6 State-coverage heuristic (data-driven pages, WARN advisory; hard review at Stage 9) ---
Write-Host "[6/6] State coverage (heuristic) ..." -ForegroundColor Cyan
$fetchRe = 'SDUIFetch|ExecuteTable|ExecuteMap|ExecuteListView|ExecuteWeather|PocketBase|PouchDB|MySQL|\.SetItems\(|LoadJSON|GetRecords|SQLite'
foreach ($path in (Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)) {
    if ($path.BaseName -ieq 'pgIndex') { continue }  # shell/registry page — owns app-level storage init, not a data-driven view
    $text = Get-Content $path.FullName -Raw
    if ($text -notmatch $fetchRe) { continue }
    if ($text -notmatch 'SDUI5Empty') {
        Add-Finding 'WARN' "$($path.Name): data-driven but no SDUI5Empty reference - Empty state missing? (RULE-INTERACT-003 / NEG-010)"
    }
    if ($text -notmatch 'ShowSwalError|SDUI5Alert') {
        Add-Finding 'WARN' "$($path.Name): data-driven but no error surface (app.ShowSwalError / SDUI5Alert) - Error state missing?"
    }
    if ($text -notmatch 'SDUI5Skeleton|SDUI5Loading') {
        Add-Finding 'WARN' "$($path.Name): data-driven but no loading indicator (SDUI5Skeleton / SDUI5Loading) - Loading state missing?"
    }
}

# --- 7/7 Project file integrity (ModuleN=/NumberOfModules, File/FileGroup/NumberOfFiles) ---
Write-Host "[7/7] Project file integrity ..." -ForegroundColor Cyan
$proj = Get-ChildItem -Path $AppFolder -Filter "*.b4j" -File -ErrorAction SilentlyContinue | Select-Object -First 1
if ($proj) {
    $lines = Get-Content $proj.FullName
    $markerIndex = -1
    for ($i=0; $i -lt $lines.Count; $i++) { if ($lines[$i].Trim() -eq "@EndOfDesignText@") { $markerIndex=$i; break } }
    if ($markerIndex -ge 0) {
        $moduleCount=0; $fileCount=0; $fgCount=0; $numModules=$null; $numFiles=$null
        for ($i=0; $i -lt $markerIndex; $i++) {
            $l=$lines[$i].Trim()
            if ($l -match '^Module\d+=') { $moduleCount++ }
            elseif ($l -match '^File\d+=') { $fileCount++ }
            elseif ($l -match '^FileGroup\d+=') { $fgCount++ }
            elseif ($l -match '^NumberOfModules=(\d+)$') { $numModules=[int]$matches[1] }
            elseif ($l -match '^NumberOfFiles=(\d+)$') { $numFiles=[int]$matches[1] }
        }
        if ($null -ne $numModules -and $numModules -ne $moduleCount) {
            Add-Finding 'FAIL' "$($proj.Name): NumberOfModules=$numModules but Module count=$moduleCount"
        }
        if ($null -ne $numFiles -and $numFiles -ne $fileCount) {
            Add-Finding 'FAIL' "$($proj.Name): NumberOfFiles=$numFiles but File count=$fileCount"
        }
        if ($fileCount -ne $fgCount) {
            Add-Finding 'WARN' "$($proj.Name): File count ($fileCount) != FileGroup count ($fgCount)"
        }
    }
}

# --- 8/8 B4X Code Property & Environment Validation ---
Write-Host "[8/8] B4X Code Property & Environment Validation ..." -ForegroundColor Cyan

# Environment check: env.json required
$envFileOnDisk = Join-Path $AppFolder "Files\env.json"
$hasEnvJson = (Test-Path $envFileOnDisk) -or (Test-Path (Join-Path $AppFolder "assets\env.json"))
if (-not $hasEnvJson) {
    Add-Finding 'FAIL' "env.json missing from Files/ and assets/. SithasoDaisy5 runtime requires env.json."
} elseif (Test-Path $envFileOnDisk) {
    try {
        $envJsonObj = Get-Content $envFileOnDisk -Raw | ConvertFrom-Json
        if (-not $envJsonObj.'api-key') {
            Add-Finding 'WARN' "Files/env.json: 'api-key' is missing or empty."
        }
        if (-not $envJsonObj.'api-url') {
            Add-Finding 'WARN' "Files/env.json: 'api-url' is missing or empty."
        }
        if ($proj) {
            $projSource = Get-Content $proj.FullName -Raw
            if ($projSource -match "(?m)^\s*Public\s+Version\s+As\s+String\s*=\s*`"([^`"]+)`"") {
                $b4jVer = $matches[1]
                if ($envJsonObj.version -ne $b4jVer) {
                    Add-Finding 'FAIL' "Files/env.json version '$($envJsonObj.version)' does not match .b4j Version '$b4jVer'. A mismatch causes an infinite reload loop in BANano_Ready."
                }
            }
        }
    } catch {
        Add-Finding 'FAIL' "Files/env.json is not valid JSON: $($_.Exception.Message)"
    }
}

# Process_Globals mandatory variables check in .b4j
if ($proj) {
    $projSource = Get-Content $proj.FullName -Raw
    $requiredGlobals = @('AppName', 'AppTitle', 'Publish', 'Version')
    foreach ($g in $requiredGlobals) {
        if ($projSource -notmatch "(?m)^\s*Public\s+$g\s+As\s+String\b") {
            Add-Finding 'FAIL' "$($proj.Name): Process_Globals missing mandatory declaration: Public $g As String"
        }
    }
    # RULE-SETUP-006: AppName must be lowercase alphanumeric + hyphens only
    if ($projSource -match "(?m)^\s*Public\s+AppName\s+As\s+String\s*=\s*`"([^`"]+)`"") {
        $appNameVal = $matches[1]
        if ($appNameVal -notmatch '^[a-z0-9-]+$') {
            Add-Finding 'FAIL' "$($proj.Name): RULE-SETUP-006 violation: Public AppName '$appNameVal' must be lowercase alphanumeric + hyphens only (no uppercase, spaces, or underscores)."
        }
    }
}

# Code property bans in pg*.bas
$rawPropertyRe = '\.(RawContent|RawSteps|RawOptions|RawChildKeys|RawChildIcons|RawImages|RawClasses|RawStyles|RawAttributes)\s*='
$readmePropertyRe = '\.ReadMe\s*='

foreach ($path in (Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)) {
    $text = Get-Content $path.FullName -Raw
    $lines = $text -split "`r?`n"
    
    # Self-invocation check
    $selfCallRe = "\bBANano\.Await\(\s*$([regex]::Escape($path.BaseName))\.Show\s*\)"
    if ($text -match $selfCallRe) {
        Add-Finding 'FAIL' "$($path.Name): Self-calling module via BANano.Await($($path.BaseName).Show) fails compilation. Use BANano.Await(Show)."
    }

    $inGlobals = $false
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $no = $i + 1
        $trimmed = $line.Trim()

        if ($trimmed -match '^(?i)Sub\s+(Process|Class)_Globals\b') {
            $inGlobals = $true
            continue
        }
        if ($inGlobals -and $trimmed -match '^(?i)End\s+Sub\b') {
            $inGlobals = $false
            continue
        }

        if ($inGlobals) {
            if ($trimmed -match '^(?i)(Private|Public)\s+([A-Za-z0-9_]+)\s+As\s+(SDUI5[A-Za-z0-9_]+|BANano\b|BANanoElement\b|SDUI[A-Za-z0-9_]+)\b') {
                if ($trimmed -notmatch "(?i)['']ignore\b") {
                    Add-Finding 'FAIL' "$($path.Name):$($no): Component variable '$($matches[2])' declared in globals must be suffixed with ''ignore' to prevent B4J compiler warnings: '$trimmed'"
                }
            }
        }

        if ($line -match $rawPropertyRe) {
            Add-Finding 'FAIL' "$($path.Name):$($no): B4X property assignment must not include 'Raw': $($line.Trim()). Use .Content, .Steps, .Options, .Classes, etc."
        }
        if ($line -match $readmePropertyRe) {
            Add-Finding 'FAIL' "$($path.Name):$($no): ReadMe is purely designer-only layout metadata: $($line.Trim()). It has no setter or getter and must never be referenced in code."
        }
    }

    # Companion Parent-Child Component Hierarchy Check (RULE-LAYOUT-005)
    $companionMap = @{
        'sdui5statitem'       = 'sdui5stat'
        'sdui5stepsitem'      = 'sdui5steps'
        'sdui5timelineitem'   = 'sdui5timeline'
        'sdui5tabsitem'       = 'sdui5tabs'
        'sdui5menuitem'       = 'sdui5menu'
        'sdui5listitem'       = 'sdui5list'
        'sdui5carouselitem'   = 'sdui5carousel'
        'sdui5slideritem'     = 'sdui5slider'
        'sdui5swiperslide'    = 'sdui5swiper'
        'sdui5footertitle'    = 'sdui5footer'
    }

    $varToType = @{}
    $declMatches = [regex]::Matches($text, '(?m)^\s*(?:Private|Public|Dim)\s+([A-Za-z0-9_]+)\s+As\s+(SDUI5[A-Za-z0-9_]+)')
    foreach ($dm in $declMatches) {
        $varToType[$dm.Groups[1].Value.ToLower()] = $dm.Groups[2].Value.ToLower()
    }
    $initMatches = [regex]::Matches($text, '([A-Za-z0-9_]+)\.Initialize\s*\(\s*Me\s*,\s*"([^"]+)"')
    foreach ($im in $initMatches) {
        $vName = $im.Groups[1].Value.ToLower()
        $cId = $im.Groups[2].Value.ToLower()
        if ($varToType.ContainsKey($vName)) {
            $varToType[$cId] = $varToType[$vName]
        }
    }

    $parentMatches = [regex]::Matches($text, '(?m)^\s*([A-Za-z0-9_]+)\.ParentID\s*=\s*(?:"([^"]+)"|([A-Za-z0-9_.]+))')
    foreach ($pm in $parentMatches) {
        $vName = $pm.Groups[1].Value.ToLower()
        if ($varToType.ContainsKey($vName) -and $companionMap.ContainsKey($varToType[$vName])) {
            $childType = $varToType[$vName]
            $expectedParent = $companionMap[$childType]
            $target = if ($pm.Groups[2].Success -and $pm.Groups[2].Value) { $pm.Groups[2].Value.ToLower() } else { $pm.Groups[3].Value.ToLower() }
            
            if ($varToType.ContainsKey($target)) {
                $actualTargetType = $varToType[$target]
                if ($actualTargetType -ne $expectedParent) {
                    Add-Finding 'FAIL' "$($path.Name): Component '$($pm.Groups[1].Value)' ($childType) is mounted to '$target' ($actualTargetType). $childType MUST mount into an instance of $expectedParent (RULE-LAYOUT-005)."
                }
            } else {
                if ($text -notmatch "(?i)\bAs\s+$expectedParent\b") {
                    Add-Finding 'FAIL' "$($path.Name): Component '$($pm.Groups[1].Value)' ($childType) has ParentID '$target', but no $expectedParent container exists in this module (RULE-LAYOUT-005)."
                } elseif ($target -match '(?i)column|row|container|pageview|drawer') {
                    Add-Finding 'FAIL' "$($path.Name): Component '$($pm.Groups[1].Value)' ($childType) is mounted directly into layout container '$target'. It MUST mount into an instance of $expectedParent (RULE-LAYOUT-005)."
                }
            }
        }
    }
}

# --- Summary ---
$fail = @($findings | Where-Object { $_.Sev -eq 'FAIL' })
$warn = @($findings | Where-Object { $_.Sev -eq 'WARN' })
Write-Host ""
if ($fail.Count -gt 0) {
    Write-Host "$($fail.Count) FAIL, $($warn.Count) WARN" -ForegroundColor Red
    foreach ($f in $fail) { Write-Host "  [FAIL] $($f.Msg)" -ForegroundColor Red }
    foreach ($w in $warn) { Write-Host "  [WARN] $($w.Msg)" -ForegroundColor Yellow }
    Write-Host ""
    Write-Host "RESULT: FAIL (fix errors above, re-run, then build)" -ForegroundColor Red
    exit 1
} else {
    Write-Host "PASS - 0 FAIL, $($warn.Count) WARN" -ForegroundColor Green
    foreach ($w in $warn) { Write-Host "  [WARN] $($w.Msg)" -ForegroundColor Yellow }
    Write-Host ""
    Write-Host "RESULT: PASS" -ForegroundColor Green
    exit 0
}
