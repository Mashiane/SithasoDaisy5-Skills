<#
.SYNOPSIS
    Release-only security/hygiene gate (G8) for built BANano output.
.DESCRIPTION
    Scans TEXT files in the published app folder (html/js/mjs/json/css/svg/map/
    txt/ftl; binary assets are skipped - byte noise is not evidence) for release
    blockers: high-confidence secrets, secret-bearing env.json values, absolute
    Windows paths, missing index.html. Never scans framework or skill source -
    app output (and optionally the app project folder for advisory warnings)
    only. Exit codes: 0 = PASS, 1 = FAIL, 2 = bad arguments.
#>
param(
    [Parameter(Mandatory = $true)][string]$OutputFolder,
    [string]$ProjectFolder = ""
)
$ErrorActionPreference = "Stop"
if (-not (Test-Path -LiteralPath $OutputFolder -PathType Container)) {
    Write-Error "Output folder not found: $OutputFolder"; exit 2
}
$fail = @()
$warn = @()

$index = Join-Path $OutputFolder "index.html"
if (-not (Test-Path -LiteralPath $index -PathType Leaf)) { $fail += "index.html missing in $OutputFolder" }

$textExt = @(".html", ".js", ".mjs", ".json", ".css", ".svg", ".map", ".txt", ".ftl")
$served = Get-ChildItem -LiteralPath $OutputFolder -Recurse -File -ErrorAction SilentlyContinue |
    Where-Object { $textExt -contains $_.Extension.ToLower() }
$secretRe = '(AIza[0-9A-Za-z_-]{10,}|sk-(live|test)-[0-9A-Za-z]{8,}|xox[bap]-|-----BEGIN [A-Z ]*PRIVATE KEY-----|ghp_[0-9A-Za-z]{20,}|AKIA[0-9A-Z]{16})'
$absPathRe = '[A-Za-z]:\\[^\\\s"''<>]{2,}'
$urlRe = 'http://(?!localhost|127\.0\.0\.1)'
$firstPartyRe = '^(app|ES5_app|sithasodaisy5)\.js$'
$buildArtifactRe = '^(app|ES5_app)\.js$'
$servedCount = @($served).Count
foreach ($f in $served) {
    if ($f.Name -ieq "env.json") {
        $text = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction SilentlyContinue
        if ($text) {
            foreach ($m in [regex]::Matches($text, '"?(api-?key|password|secret|token)"?\s*:\s*"([^"]+)"', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)) {
                if ($m.Groups[2].Value -ne "") { $fail += "env.json ships non-empty '$($m.Groups[1].Value)' value" ; break }
            }
        }
        continue
    }
    # Deep checks run on FIRST-PARTY output only (index + built app/library
    # JS): vendor-pinned libs carry their own build strings and inert URLs,
    # which lexical rules cannot separate from real leaks. Supply-chain review
    # of pinned libs is out of scope for this gate.
    if ($f.Name -ieq "index.html" -or ($f.Name -match $firstPartyRe)) {
        $text = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction SilentlyContinue
        if (-not $text) { continue }
        if ($text -match $secretRe) { $fail += "$($f.Name): high-confidence secret/token in served file" }
        if ($text -match $absPathRe) {
            if ($f.Name -match $buildArtifactRe) { $warn += "$($f.Name): build-time Publish path embedded (accepted local-publish mechanism; confirm no sensitive segments)" }
            else { $fail += "$($f.Name): absolute Windows path in served file (workstation leak)" }
        }
        if ($text -match $urlRe) {
            $warn += "$($f.Name): non-localhost http:// URL (mixed-content risk)"
        }
    }
}
if (-not (Test-Path -LiteralPath (Join-Path $OutputFolder "manifest.json") -PathType Leaf)) {
    $warn += "manifest.json missing (PWA installability)"
}

if ($ProjectFolder -ne "" -and (Test-Path -LiteralPath $ProjectFolder -PathType Container)) {
    $src = Get-ChildItem -LiteralPath $ProjectFolder -Recurse -File -ErrorAction SilentlyContinue |
        Where-Object { ($_.Extension -ieq ".bas" -or $_.Extension -ieq ".b4j") -and ($_.FullName -notmatch '\\(dist|Objects|\.agent)\\') }
    foreach ($f in $src) {
        $text = Get-Content -LiteralPath $f.FullName -Raw -ErrorAction SilentlyContinue
        if ($text -and ($text -match $secretRe)) { $warn += "$($f.Name): possible secret in project source (advisory - confirm intended)" }
    }
}

Write-Host ""
Write-Host "=== PRODUCTION HARDENING (G8 release gate) ==="
Write-Host "Output: $OutputFolder ($servedCount text files present; deep checks on first-party output + env.json)"
foreach ($w in $warn) { Write-Host "  [WARN] $w" -ForegroundColor Yellow }
foreach ($e in $fail) { Write-Host "  [FAIL] $e" -ForegroundColor Red }
if ($fail.Count -eq 0 -and $warn.Count -eq 0) { Write-Host "PASS - 0 FAIL, 0 WARN" }
elseif ($fail.Count -eq 0) { Write-Host ""; Write-Host "PASS - 0 FAIL, $($warn.Count) WARN" }
else { Write-Host ""; Write-Host "RESULT: FAIL (fix errors above; output is not releasable)"; exit 1 }
