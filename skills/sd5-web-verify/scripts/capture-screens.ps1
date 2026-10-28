<#
.SYNOPSIS
    Capture web page screenshots for the post-build UX review (L3 evidence).

.DESCRIPTION
    Phase 2 of sd5-web-verify: get rendered pages onto disk so a visual UX
    review can run on what the browser actually renders, not the source.

    Auto path: use a headless Edge/Chrome screenshot (native, no Playwright
    needed) of the running app (BANano-built bundle served on a base URL),
    saving one PNG per page to <AppFolder>/ux-review/screens/<Label>-<n>.png.

    Fallback path: if no headless-capable browser is found, print a clear
    message and leave it to the user to drop PNGs into the screens folder.

    Navigation is app-specific (BANano hash/query routing). Pass -Page once
    per page to capture; the URL used is BaseUrl + "/" + Page (or BaseUrl alone
    when no page is given). With -Count > 1 the script re-captures the same URL
    at -DelaySec intervals.

    Does not build or serve the app. Run the build/serve step first.

    Exit codes: 0 = captured (or fallback engaged, not a failure), 2 = bad arguments.

.PARAMETER AppFolder
    The generated app folder. Screenshots go to <AppFolder>/ux-review/screens/.

.PARAMETER BaseUrl
    Base URL where the app is served. Default http://localhost/<app>.

.PARAMETER Page
    Optional page id appended to the base URL (e.g. "login" -> <BaseUrl>/login).
    Repeat the parameter for multiple pages, or pass a comma-separated list.

.PARAMETER Out
    Output folder for PNGs. Default <AppFolder>/ux-review/screens.

.PARAMETER Label
    Name for this capture (defaults to the Page id, or "screen").

.PARAMETER Width / Height
    Viewport size for the headless screenshot. Default 1280x800.

.PARAMETER Count
    Number of screenshots per URL. Default 1. With Count > 1, -DelaySec pauses
    between captures.

.PARAMETER DelaySec
    Seconds between captures when Count > 1. Default 5.

.PARAMETER SettleMs
    Virtual-time budget in ms for the headless renderer to settle. Default 8000.

.EXAMPLE
    ./capture-screens.ps1 -AppFolder C:\b4j\workspace\MyApp -BaseUrl http://localhost/<app> -Page login
    ./capture-screens.ps1 -AppFolder C:\b4j\workspace\MyApp -Page login,dashboard,profile
.NOTES
    Requires a headless-capable Edge or Chrome on PATH or in standard locations.
    No browser = fallback message, exit 0 (review still runs on user-provided PNGs).
#>

param(
    [Parameter(Mandatory = $true)][string]$AppFolder,
    [string]$BaseUrl = "http://localhost/<app>",
    [string[]]$Page = @(),
    [string]$Out = "",
    [string]$Label = "",
    [int]$Width = 1280,
    [int]$Height = 800,
    [int]$Count = 1,
    [int]$DelaySec = 5,
    [int]$SettleMs = 8000
)

$ErrorActionPreference = "Stop"

if (-not $Out) { $Out = Join-Path $AppFolder "ux-review\screens" }
if (-not (Test-Path $Out)) { New-Item -ItemType Directory -Path $Out -Force | Out-Null }
$Out = (Resolve-Path -LiteralPath $Out).Path

# --- resolve a headless-capable browser ---
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
    Write-Host ""
    Write-Host "UX-REVIEW CAPTURE: no headless browser detected." -ForegroundColor Yellow
    Write-Host "Fallback: drop PNG screenshots into:" -ForegroundColor Yellow
    Write-Host "  $Out" -ForegroundColor White
    Write-Host "Then run the visual UX review pass (references/ux-review.md)." -ForegroundColor Yellow
    exit 0
}

# --- determine capture targets ---
$pages = @()
foreach ($p in $Page) {
    $pages += $p -split ","
}
$pages = @($pages | ForEach-Object { $_.Trim() } | Where-Object { $_ })
if ($pages.Count -eq 0) { $pages = @("") }

# --- profile dir (separate from a running browser profile) ---
$profileDir = Join-Path $env:TEMP ("sd5-capture-" + [System.Guid]::NewGuid().ToString("N").Substring(0, 8))

foreach ($pg in $pages) {
    $url = if ($pg) { "$BaseUrl/$pg" } else { $BaseUrl }
    $name = if ($Label) { $Label } elseif ($pg) { $pg } else { "screen" }

    for ($i = 1; $i -le $Count; $i++) {
        if ($i -gt 1 -and $DelaySec -gt 0) {
            Write-Host "Waiting ${DelaySec}s ..." -ForegroundColor Gray
            Start-Sleep -Seconds $DelaySec
        }
        $suffix = if ($Count -gt 1) { "-$i" } else { "" }
        $png = Join-Path $Out "$name$suffix.png"

        $errLog = Join-Path $env:TEMP ("sd5-cap-err-" + [System.Guid]::NewGuid().ToString("N") + ".log")
        $args = @(
            "--headless=new", "--disable-gpu", "--force-device-scale-factor=1", "--no-first-run", "--no-default-browser-check",
            "--user-data-dir=$profileDir",
            "--window-size=$Width,$Height",
            "--virtual-time-budget=$SettleMs",
            "--screenshot=$png", $url
        )
        # Start-Process -Wait is required: a GUI subsystem exe returns
        # immediately with `&`, racing the PNG write. -RedirectStandardError
        # captures the "N bytes written to file" confirmation / errors.
        $proc = Start-Process -FilePath $browser -ArgumentList $args -RedirectStandardError $errLog -Wait -PassThru
        if (Test-Path $png) {
            Write-Host "CAPTURED: $png" -ForegroundColor Green
        } else {
            $diag = if (Test-Path $errLog) { (Get-Content $errLog -TotalCount 3) -join " | " } else { "" }
            Write-Host "FAILED to capture $url (headless screenshot error; exit $($proc.ExitCode)). Is the app running at $BaseUrl ? $diag" -ForegroundColor Red
        }
        Remove-Item $errLog -Force -ErrorAction SilentlyContinue
    }
}

# --- cleanup ---
Remove-Item $profileDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "Screenshots ready in: $Out" -ForegroundColor Cyan
Write-Host "Next: run the visual UX review pass (references/ux-review.md)." -ForegroundColor Cyan
exit 0
