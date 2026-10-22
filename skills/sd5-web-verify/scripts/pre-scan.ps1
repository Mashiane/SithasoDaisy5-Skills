<#
.SYNOPSIS
    Fast negative-knowledge pre-scan for generated SithasoDaisy5 pg*.bas files (L4 hard gate).

.DESCRIPTION
    Runs BEFORE verify-conformance.ps1. Catches the bans that the conformance
    gate does NOT check, so they are fixed before the authoritative gate runs.
    Walks pg*.bas files in the app folder and emits WARN/FAIL for banned
    patterns:

      FAIL (exit 1) = hard gate violations:
        1. Sub Show missing pgIndex.UpdateTitle(...) before End Sub

      WARN (exit 0, advisory) = likely issues to review:
        2. Tailwind arbitrary values in .Classes (bg-[#..], text-[12px]) — ALLOWED, but
           flagged when applied to themed components where tokens would preserve theme switching
        3. Inline <style> blocks — use .Classes / .Styles / app-level CSS instead (advisory only)
        4. Numeric pixel dimensions on .Width / .Height
        6. Raw HTML tags (<html>, <div>, <button class=, etc.)
        7. Possibly-invented setters (.setX where X isn't documented)
        8. Sub Show missing pgIndex.App + ClearPageView in first 3 statements

    This is advisory shift-left. verify-conformance.ps1 remains the L5 gate.

    Exit codes: 0 = clean, 1 = any FAIL, 2 = bad arguments.

.PARAMETER AppFolder
    The generated app folder (contains <AppName>.b4j + pgIndex.bas + pg*.bas).

.EXAMPLE
    ./pre-scan.ps1 -AppFolder C:\b4j\workspace\MyApp
#>

param(
    [Parameter(Mandatory = $true)][string]$AppFolder
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path $AppFolder)) {
    Write-Host "ERROR: app folder not found: $AppFolder" -ForegroundColor Red
    exit 2
}

$pgFiles = @(Get-ChildItem -Path $AppFolder -Filter "pg*.bas" -File -ErrorAction SilentlyContinue)
if ($pgFiles.Count -eq 0) {
    Write-Host "WARN: no pg*.bas files in $AppFolder - nothing to scan" -ForegroundColor Yellow
}

$findings = @()
# --- BOM check (B4J requires UTF-8 without BOM) ---
foreach ($f in $pgFiles) {
    $bytes = [System.IO.File]::ReadAllBytes($f.FullName)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        $findings += [PSCustomObject]@{ Sev='WARN'; Line=1; Msg="UTF-8 BOM present in $($f.Name) (B4J prefers UTF-8 without BOM)" }
    }
}

# --- Regexes (case-insensitive; B4J is case-insensitive) ---
$hexColorRe    = '\.Color\s*=\s*"#([0-9A-Fa-f]{3,8})"'
$hexTwRe       = '(bg|text|border|fill|stroke)-\[#[0-9A-Fa-f]{3,8}\]'
$rawHtmlRe     = '<\s*(html|head|body|div|span|button|input|select|textarea|form|p|a|img|table|tr|td|th|ul|ol|li|h[1-6]|section|article|main|header|footer|nav|aside|style)\b'
$inlineStyleRe = '<\s*style\b'
$numericWidthRe = '\.(Width|Height)\s*=\s*\d+(\.\d+)?\s*$'
$setterRe      = '\.set([A-Z][A-Za-z0-9_]*)\s*\('
# --- Documented setters allowlist (source of truth: components.json props + setter lines) ---
$docSetters = @(
    'AddComponent','AddItem','AddToParent','AddHomeTab','AddSearchTab','AddProfileTab','AddTab',
    'AddAsForm','AddButton','AddJavaScriptModuleURL','AddAsPage','AddCard',
    'setRequired','setValidator','setLabel','setTitle','setText','setColor',
    'setSize','setVisible','setEnabled','setWidth','setHeight','setParentID',
    'setMargin','setPadding','setClasses','setStyles','setAttributes',
    'setBackgroundColor','setTextColor','setBorderColor','setRounded','setShadow',
    'setActive','setDisabled','setLoading','setTag','setPlaceholder','setHint',
    'setIcon','setImage','setVariant','setStyle','setDirection','setSoft',
    'setOutline','setDash','setGhost','setLink','setType','setMin','setMax',
    'setStep','setValue','setChecked','setSelected','setOn','setOff','setTextOn',
    'setTextOff','setLanguage','setURL','setFormat','setMode','setAccept',
    'setItems','setPageSize','setItemsPerPage','setPage',
    'setGridCols','setGridColsMd','setGridColsSm','setSizeMd','setSizeSm',
    'setChooseText','setUploadText','setMultiple','setSearchEnabled',
    'setLegend','setItemsSpec','setBorder'
)

function Scan-File([System.IO.FileInfo]$File) {
    $findings = @()
    $src = Get-Content $File.FullName -Raw -ErrorAction Stop
    $lines = $src -split "`r?`n"

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $no = $i + 1

        if ($line -match $hexColorRe) {
            $findings += [PSCustomObject]@{ Sev='WARN'; Line=$no; Msg="hex color in .Color (allowed; prefer semantic tokens for theme switching): $($line.Trim().Substring(0, [Math]::Min(100, $line.Trim().Length)))" }
        }
        if ($line -match $hexTwRe) {
            $findings += [PSCustomObject]@{ Sev='WARN'; Line=$no; Msg="tailwind arbitrary hex value in .Classes (allowed; on themed components prefer tokens to preserve theme switching): $($line.Trim().Substring(0, [Math]::Min(100, $line.Trim().Length)))" }
        }
        if ($line -match $rawHtmlRe) {
            $tag = $Matches[1].ToLower()
            $findings += [PSCustomObject]@{ Sev='WARN'; Line=$no; Msg="raw HTML <$tag> in .bas (B4J shouldn't emit raw HTML - use SDUI5* components)" }
        }
        if ($line -match $inlineStyleRe) {
            $findings += [PSCustomObject]@{ Sev='WARN'; Line=$no; Msg='inline <style> block (advisory - prefer .Classes / .Styles / app-level CSS via LoadAssetsOnDemand)' }
        }
        if ($line -match $numericWidthRe) {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="numeric pixel dimension in .bas: $($line.Trim().Substring(0, [Math]::Min(100, $line.Trim().Length)))" }
        }

        # Invented setters - skip lines that are comments or Sub declarations
        foreach ($m in [regex]::Matches($line, $setterRe)) {
            $setterName = 'set' + $m.Groups[1].Value
            if ($docSetters -notcontains $setterName) {
                $before = $line.Substring(0, $m.Index)
                if ($before.Contains("'") -or $before -match '\bSub\b') { continue }
                $findings += [PSCustomObject]@{ Sev='WARN'; Line=$no; Msg="possibly invented setter .$setterName - verify in components/<Name>.md" }
            }
        }
    }

    # Lifecycle: Sub Show must reference pgIndex.App + ClearPageView in first statements.
    # Sub declarations start at line start in B4J; anchor the match so a "Sub Show"
    # mention inside a comment (e.g. template headers) can never open a block.
    $showBlocks = [regex]::Matches($src, '(?m)^\s*Sub\s+Show\b.*?End\s+Sub', [System.Text.RegularExpressions.RegexOptions]::Singleline -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    foreach ($block in $showBlocks) {
        $body = $block.Value
        $statements = @($body -split "`r?`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -and -not $_.StartsWith("'") })
        $first3 = $statements[1..3] -join "`n"  # skip 'Sub Show' line itself
        if ($first3 -notmatch 'pgIndex\.App' -and $first3 -notmatch 'BANano\.Await\(\s*app\s*\.ClearPageView') {
            $findings += [PSCustomObject]@{ Sev='WARN'; Line=0; Msg="Sub Show in $($File.Name) missing pgIndex.App + ClearPageView pattern in first 3 statements" }
        }
        if ($body -notmatch 'pgIndex\.UpdateTitle') {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="Sub Show in $($File.Name) does not call pgIndex.UpdateTitle before End Sub" }
        }
    }

    return $findings
}

$allFindings = @()
foreach ($f in $pgFiles) {
    try {
        $allFindings += Scan-File $f
    } catch {
        $allFindings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="Cannot read file $($f.Name): $($_.Exception.Message)" }
    }
}

$failCount = @($allFindings | Where-Object { $_.Sev -eq 'FAIL' }).Count
$warnCount = @($allFindings | Where-Object { $_.Sev -eq 'WARN' }).Count

Write-Host ""
Write-Host "=== PRE-SCAN (negative-knowledge bans) ===" -ForegroundColor Cyan
foreach ($x in $allFindings) {
    $loc = if ($x.Line) { "$($x.Line): " } else { "" }
    if ($x.Sev -eq 'FAIL') {
        Write-Host "[FAIL] $loc$($x.Msg)" -ForegroundColor Red
    } else {
        Write-Host "[WARN] $loc$($x.Msg)" -ForegroundColor Yellow
    }
}
Write-Host ""
Write-Host "Total: $failCount FAIL, $warnCount WARN across $($pgFiles.Count) pg files" -ForegroundColor Gray

if ($failCount -gt 0) {
    Write-Host "RESULT: FAIL (fix ban violations, then re-run, then verify-conformance)" -ForegroundColor Red
    exit 1
} elseif ($warnCount -gt 0) {
    Write-Host "RESULT: WARN (advisories only, fix if real before verify-conformance)" -ForegroundColor Yellow
    exit 0
} else {
    Write-Host "RESULT: CLEAN (no bans, no advisories)" -ForegroundColor Green
    exit 0
}
