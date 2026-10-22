<#
.SYNOPSIS
    Build-stage runtime gate for a SithasoDaisy5 web app. Evidences the
    UX-review items screenshots cannot prove, so the post-build visual review
    confirms instead of discovers.

.DESCRIPTION
    Runs after the app is built and served. Loads the running app in a headless
    browser, captures the rendered DOM + console stream, and writes
    BUILD-WATCH-<YYYYMMDD>.md next to the capture-screens output so the
    post-build ux-review pass can mark these items "Verified at build":

      1. JS / console errors (Uncaught, TypeError, ReferenceError, CONSOLE error)
         - reinforces sd5-web-verify conformance (invented API, bad wiring).
      2. Failed resource loads (net::ERR, 404, Failed to load resource)
         - reinforces asset bundling (FileN / lazy-load UsesX wiring).
      3. Page title set (pgIndex.UpdateTitle rendered into <title>)
         - reinforces lifecycle (UpdateTitle last) at runtime.
      4. Theme applied (html[data-theme] present)
         - reinforces semantic theming (app.SetTheme).
      5. Render proof (non-empty body text, expected container present)
         - reinforces hierarchy (Container -> Row -> Column -> leaf).

    Exit 1 = JS error / failed resource load (do not ship).
    Exit 0 = ran, warnings are advisory in the report.

    Best-effort: no headless browser or unreachable URL = skip with a note,
    exit 0 (post-build review falls back to "Verification Required: Yes").

.PARAMETER AppFolder
    The app folder. Report goes to <AppFolder>/ux-review/BUILD-WATCH-<date>.md.

.PARAMETER BaseUrl
    Base URL where the app is served (BANano-built bundle). Default http://localhost/<app>.

.PARAMETER Page
    Optional page id appended to the base URL to load (e.g. "login").
    Defaults to the root URL.

.PARAMETER SettleMs
    Virtual-time budget in ms for the headless renderer to settle. Default 8000.

.PARAMETER ExpectContainer
    A DOM id that must be present to prove the page view rendered
    (e.g. "pageview" or the pgIndex.PageView id). Default "pageview".

.EXAMPLE
    ./build-watch.ps1 -AppFolder C:\b4j\workspace\MyApp -BaseUrl http://localhost/<app>
.NOTES
    Template. Drop as build-watch.ps1 into the app folder (or call directly).
    Uses native headless Edge/Chrome - no Playwright/Selenium required.
#>

param(
    [Parameter(Mandatory = $true)][string]$AppFolder,
    [string]$BaseUrl = "http://localhost/<app>",
    [string]$Page = "",
    [int]$SettleMs = 8000,
    [string]$ExpectContainer = "pageview"
)

$ErrorActionPreference = "Continue"

function Resolve-HeadlessBrowser {
    $candidates = @(
        "$env:ProgramFiles(x86)\Microsoft\Edge\Application\msedge.exe",
        "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe",
        "$env:ProgramFiles\Google\Chrome\Application\chrome.exe",
        "$env:ProgramFiles(x86)\Google\Chrome\Application\chrome.exe",
        "$env:LOCALAPPDATA\Google\Chrome\Application\chrome.exe"
    )
    foreach ($c in $candidates) {
        if ($c -and (Test-Path $c)) { return $c }
    }
    $fromPath = (Get-Command msedge.exe -ErrorAction SilentlyContinue).Source
    if ($fromPath -and (Test-Path $fromPath)) { return $fromPath }
    $fromPath = (Get-Command chrome.exe -ErrorAction SilentlyContinue).Source
    if ($fromPath -and (Test-Path $fromPath)) { return $fromPath }
    return $null
}

$browser = Resolve-HeadlessBrowser
if (-not $browser) {
    Write-Host "BUILD-WATCH: no headless browser found, runtime checks skipped." -ForegroundColor Yellow
    exit 0
}

# --- output dir ---
$outDir = Join-Path $AppFolder "ux-review"
if (-not (Test-Path $outDir)) { New-Item -ItemType Directory -Path $outDir -Force | Out-Null }
$dateTag = Get-Date -Format "yyyyMMdd"
$reportPath = Join-Path $outDir "BUILD-WATCH-$dateTag.md"

$url = if ($Page) { "$BaseUrl/$Page" } else { $BaseUrl }
$profileDir = Join-Path $env:TEMP ("sd5-bw-" + [System.Guid]::NewGuid().ToString("N").Substring(0, 8))
$domPath = Join-Path $env:TEMP ("sd5-dom-" + [System.Guid]::NewGuid().ToString("N") + ".html")
$logOutPath = Join-Path $env:TEMP ("sd5-bwout-" + [System.Guid]::NewGuid().ToString("N") + ".log")
$logErrPath = Join-Path $env:TEMP ("sd5-bwerr-" + [System.Guid]::NewGuid().ToString("N") + ".log")

$errors = @()
$warnings = @()
$verified = @()

Write-Host "BUILD-WATCH: loading $url (settle ${SettleMs}ms) ..." -ForegroundColor Gray
# Start-Process -Wait is required: a GUI subsystem exe returns immediately
# with `&`, racing the DOM/console write. stdout carries the dumped DOM;
# stderr carries Chrome's console logging (must be separate redirect files).
$bwArgs = @(
    "--headless=new", "--disable-gpu", "--no-first-run", "--no-default-browser-check",
    "--user-data-dir=$profileDir",
    "--virtual-time-budget=$SettleMs",
    "--enable-logging=stderr", "--v=1",
    "--dump-dom", $url
)
$proc = Start-Process -FilePath $browser -ArgumentList $bwArgs -RedirectStandardOutput $logOutPath -RedirectStandardError $logErrPath -Wait -PassThru

$dom = ""
$logErrText = ""
$logOutText = ""
if (Test-Path $logErrPath) { $logErrText = Get-Content $logErrPath -Raw }
if (Test-Path $logOutPath) { $logOutText = Get-Content $logOutPath -Raw }
if ($logOutText -match '(?s)<!DOCTYPE html>.*$') {
    $dom = $Matches[0]
    $dom | Out-File -FilePath $domPath -Encoding utf8
}

if ($dom -eq "" -and $logErrText -eq "") {
    $warnings += "Headless browser produced no output (is the app reachable at $url ?)"
}

# 1. console errors (stderr carries Chrome CONSOLE lines)
if ($logErrText) {
    $consoleErrors = [regex]::Matches($logErrText, '(?im)CONSOLE\(\d+\)\s+"([^"]+)"') |
        Where-Object { $_.Value -match '(?i)error|uncaught|typeerror|referenceerror' }
    if ($consoleErrors.Count -gt 0) {
        foreach ($ce in $consoleErrors) {
            $errors += "Console error: $($ce.Groups[1].Value)"
        }
    } else {
        $verified += "No console JS errors in launch window"
    }

    # 2. failed resource loads
    $netErrs = [regex]::Matches($logErrText, '(?i)net::[A-Z_]+|Failed to load resource|ERR_NAME_NOT_RESOLVED|ERR_CONNECTION_REFUSED')
    if ($netErrs.Count -gt 0) {
        foreach ($ne in ($netErrs | Select-Object -First 8)) {
            $errors += "Failed resource load: $($ne.Value)"
        }
    } else {
        $verified += "No failed resource loads (net::ERR / 404)"
    }
}

# --- DOM checks (if we got a DOM) ---
if ($dom) {
    # 3. title
    $titleMatch = [regex]::Match($dom, '(?is)<title[^>]*>(.*?)</title>')
    if ($titleMatch.Success -and $titleMatch.Groups[1].Value.Trim()) {
        $verified += "Page title rendered: '$($titleMatch.Groups[1].Value.Trim())' (UpdateTitle lifecycle OK)"
    } else {
        $warnings += "No non-empty <title> in DOM (pgIndex.UpdateTitle may not have run)"
    }

    # 4. theme
    if ($dom -match 'data-theme\s*=') {
        $verified += "Theme applied: html[data-theme] present (app.SetTheme OK)"
    } else {
        $warnings += "No data-theme attribute in DOM (theme not applied / app.SetTheme missing)"
    }

    # 5. render proof: expected container + some body text
    if ($dom -match "id=`"$ExpectContainer`"") {
        $verified += "Page view container '#$ExpectContainer' present (hierarchy mounted)"
    } else {
        $warnings += "Expected container '#$ExpectContainer' not found in DOM - check pgIndex.PageView id"
    }
    $bodyText = ([regex]::Match($dom, '(?is)<body[^>]*>(.*?)</body>').Groups[1].Value -replace '<[^>]+>', ' ').Trim()
    if ($bodyText.Length -gt 0) {
        $verified += "Body renders non-empty text content"
    } else {
        $warnings += "Body appears empty after settle - check hierarchy / ClearPageView"
    }
}

# --- cleanup temp ---
Remove-Item $profileDir -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item $domPath -Force -ErrorAction SilentlyContinue
Remove-Item $logOutPath -Force -ErrorAction SilentlyContinue
Remove-Item $logErrPath -Force -ErrorAction SilentlyContinue

# --- write report ---
$report = @()
$report += "# BUILD-WATCH $dateTag"
$report += ""
$report += "Build-stage runtime gate for **$url**. Evidences UX-review items"
$report += "screenshots cannot prove. The post-build ux-review pass should mark"
$report += "the verified items below as **Verified at build**, not Verification Required."
$report += ""
$report += "## Verified at build"
if ($verified.Count -gt 0) {
    foreach ($v in $verified) { $report += "- $v" }
} else {
    $report += "- (none)"
}
$report += ""
$report += "## Warnings (review in post-build pass)"
if ($warnings.Count -gt 0) {
    foreach ($w in $warnings) { $report += "- $w" }
} else {
    $report += "- (none)"
}
$report += ""
$report += "## Errors (do not ship)"
if ($errors.Count -gt 0) {
    foreach ($e in $errors) { $report += "- $e" }
} else {
    $report += "- (none)"
}
$report += ""
$report += "---"
$report += "Generated by build-watch.ps1 (sd5-web-verify skill). Headless DOM + console capture."
$report += "Post-build: run capture-screens.ps1, then the ux-review.md pass, and cite this file for runtime items."
$report | Out-File -FilePath $reportPath -Encoding utf8

# --- console summary ---
Write-Host ""
Write-Host "=== BUILD-WATCH ===" -ForegroundColor Cyan
if ($errors.Count -eq 0) {
    Write-Host "PASS: no JS / resource-load errors" -ForegroundColor Green
} else {
    Write-Host "FAIL: $($errors.Count) error(s) (do not ship):" -ForegroundColor Red
    foreach ($e in $errors) { Write-Host "  - $e" -ForegroundColor Red }
}
foreach ($v in $verified) { Write-Host "  + $v" -ForegroundColor Green }
foreach ($w in $warnings) { Write-Host "  ~ $w" -ForegroundColor Yellow }
Write-Host "Report: $reportPath" -ForegroundColor Cyan

if ($errors.Count -gt 0) { exit 1 } else { exit 0 }
