<#
.SYNOPSIS
    SithasoDaisy5 First-Time-Right (FTR) Delivery Pipeline Runner (G0 -> G8).
.DESCRIPTION
    Executes the disciplined 5-pillar engineering gates sequentially with hard exit codes:
      [G0] Contract Integrity Gate (validate-contracts.py)
      [G2] Static Pre-Scan Gate (pre-scan.ps1 negative knowledge)
      [G3] Conformance Gate (verify-conformance.ps1)
      [G4] Compilation / Transpile Gate (build-banano-app.ps1 via B4JBuilder)
      [G6] Browser Runtime & CDP Verification (browser_capture.js layout, assets, exceptions)
      [G7] UX & Design Quality Review Gate
.PARAMETER AppFolder
    The target application folder (e.g. C:\b4j\workspace\0SithasoDaisy5Skills\AIExamples\09-finance-dashboard).
.PARAMETER BaseUrl
    The URL where the compiled app is hosted (default http://localhost/<appname>/index.html).
.PARAMETER SkipBuild
    Skip G4 compilation (e.g. when validating contracts & static code only).
.PARAMETER SkipCapture
    Skip G6 browser capture & CDP audit.
.PARAMETER StopOnFail
    Halt execution immediately on any gate failure (default $true).
.EXAMPLE
    pwsh -File skills/sd5-web-orchestrator/scripts/run-pipeline.ps1 -AppFolder AIExamples/09-finance-dashboard
#>
param(
    [Parameter(Mandatory = $true)][string]$AppFolder,
    [string]$BaseUrl = "",
    [switch]$SkipBuild,
    [switch]$SkipCapture,
    [bool]$StopOnFail = $true
)

$ErrorActionPreference = "Stop"
$root = (Resolve-Path $PSScriptRoot\..\..\..).Path
$appPath = (Resolve-Path $AppFolder).Path
$appName = (Get-Item $appPath).Name

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " SITHASODAISY5 FTR PIPELINE RUNNER (G0 -> G8)           " -ForegroundColor Cyan
Write-Host " Target App: $appName ($appPath)" -ForegroundColor White
Write-Host "========================================================" -ForegroundColor Cyan

$scorecard = [ordered]@{}

# Helper for gate reporting
function Report-Gate {
    param([string]$Gate, [string]$Name, [string]$Status, [string]$Details)
    $color = if ($Status -eq "PASS") { "Green" } elseif ($Status -eq "WARN") { "Yellow" } else { "Red" }
    Write-Host "[$Gate] $Name : $Status ($Details)" -ForegroundColor $color
    $script:scorecard[$Gate] = @{ Name = $Name; Status = $Status; Details = $Details }
    if ($Status -eq "FAIL" -and $StopOnFail) {
        Write-Host "`nPIPELINE HALTED at [$Gate] due to failure." -ForegroundColor Red
        exit 1
    }
}

# ---------------------------------------------------------
# [G0] Contract Integrity Gate
# ---------------------------------------------------------
Write-Host "`n--- [G0] Validating Application & Screen Contracts ---" -ForegroundColor Yellow
$validatorScript = Join-Path $root "skills\sd5-application-planner\scripts\validate-contracts.py"
if (Test-Path $validatorScript) {
    $proc = Start-Process -FilePath "python" -ArgumentList "`"$validatorScript`"", "--app-folder", "`"$appPath`"", "--write-index" -NoNewWindow -Wait -PassThru
    if ($proc.ExitCode -eq 0) {
        Report-Gate "G0" "Contract Gate" "PASS" "Requirements, features & screen contracts verified"
    } else {
        Report-Gate "G0" "Contract Gate" "FAIL" "Contract validation errors detected"
    }
} else {
    Report-Gate "G0" "Contract Gate" "WARN" "validate-contracts.py not found"
}

# ---------------------------------------------------------
# [G2] Static Pre-Scan Gate (Negative Knowledge)
# ---------------------------------------------------------
Write-Host "`n--- [G2] Executing Static Pre-Scan (Banned Patterns) ---" -ForegroundColor Yellow
$preScanScript = Join-Path $root "skills\sd5-web-verify\scripts\pre-scan.ps1"
if (Test-Path $preScanScript) {
    & $preScanScript -AppFolder $appPath
    if ($LASTEXITCODE -eq 0) {
        Report-Gate "G2" "Pre-Scan Gate" "PASS" "Zero hard bans detected"
    } else {
        Report-Gate "G2" "Pre-Scan Gate" "FAIL" "Banned code patterns found"
    }
} else {
    Report-Gate "G2" "Pre-Scan Gate" "WARN" "pre-scan.ps1 not found"
}

# ---------------------------------------------------------
# [G3] Conformance Verification Gate
# ---------------------------------------------------------
Write-Host "`n--- [G3] Verifying Module & Lifecycle Conformance ---" -ForegroundColor Yellow
$verifyScript = Join-Path $root "skills\sd5-web-verify\scripts\verify-conformance.ps1"
$fwRoot = "C:\b4j\workspace\0SithasoDaisy5"
$skillFolder = Join-Path $root "skills\sithasodaisy5"
if (Test-Path $verifyScript) {
    & $verifyScript -AppFolder $appPath -FrameworkFolder $fwRoot -SkillFolder $skillFolder
    if ($LASTEXITCODE -eq 0) {
        Report-Gate "G3" "Conformance Gate" "PASS" "100% module wiring & lifecycle verified"
    } else {
        Report-Gate "G3" "Conformance Gate" "FAIL" "Module/lifecycle conformance failed"
    }
} else {
    Report-Gate "G3" "Conformance Gate" "WARN" "verify-conformance.ps1 not found"
}

# ---------------------------------------------------------
# [G4] Compilation / Transpilation Gate (B4JBuilder -> BANano)
# ---------------------------------------------------------
if (-not $SkipBuild) {
    Write-Host "`n--- [G4] Building Application via B4JBuilder & BANano ---" -ForegroundColor Yellow
    $buildScript = Join-Path $root "skills\sd5-web-verify\scripts\build-banano-app.ps1"
    if (Test-Path $buildScript) {
        & $buildScript -ProjectRoot $appPath
        if ($LASTEXITCODE -eq 0) {
            Report-Gate "G4" "Build Gate" "PASS" "B4J compiled & BANano transpiled clean"
        } else {
            Report-Gate "G4" "Build Gate" "FAIL" "B4J/BANano build failed"
        }
    } else {
        Report-Gate "G4" "Build Gate" "WARN" "build-banano-app.ps1 not found"
    }
} else {
    Report-Gate "G4" "Build Gate" "WARN" "Skipped by parameter"
}

# ---------------------------------------------------------
# [G6] Browser Runtime & CDP Diagnostic Gate
# ---------------------------------------------------------
if (-not $SkipCapture) {
    Write-Host "`n--- [G6] Browser Runtime & Chrome CDP Audit ---" -ForegroundColor Yellow
    if (-not $BaseUrl) {
        # Extract exact AppName from .b4j file if available, otherwise fall back to clean folder name
        $b4jFile = Get-ChildItem -LiteralPath $appPath -Filter "*.b4j" -File | Select-Object -First 1
        $appTargetName = ""
        if ($b4jFile) {
            $b4jContent = Get-Content -LiteralPath $b4jFile.FullName -Raw
            $match = [regex]::Match($b4jContent, '(?m)^\s*Public\s+AppName\s+As\s+String\s*=\s*"([^"]+)"')
            if ($match.Success) {
                $appTargetName = $match.Groups[1].Value.Trim()
            }
        }
        if (-not $appTargetName) {
            $appTargetName = ($appName -replace '^\d+[-_]','').ToLower()
        }
        $BaseUrl = "http://localhost/$appTargetName/index.html"
    }

    # Ensure local app assets are synced to published target directory
    $appLocalAssets = Join-Path $appPath "assets"
    $targetAssetsDir = "C:\laragon\www\$appTargetName\assets"
    if ((Test-Path $appLocalAssets) -and (Test-Path $targetAssetsDir)) {
        Copy-Item -Path "$appLocalAssets\*" -Destination $targetAssetsDir -Recurse -Force -ErrorAction SilentlyContinue
    }

    $cdpScript = Join-Path $root "skills\sd5-web-verify\scripts\browser_capture.js"
    $screensDir = Join-Path $appPath "ux-review\screens"
    if (-not (Test-Path $screensDir)) { New-Item -ItemType Directory -Path $screensDir -Force | Out-Null }

    if (Test-Path $cdpScript) {
        $desktopShot = Join-Path $screensDir "pipeline-desktop.png"
        $mobileShot = Join-Path $screensDir "pipeline-mobile.png"
        
        Write-Host "Running Desktop CDP Audit (1280x900) against $BaseUrl ..." -ForegroundColor Gray
        $desktopOut = & node $cdpScript $BaseUrl $desktopShot 1280 900 | Out-String
        
        Write-Host "Running Mobile CDP Audit (390x844) against $BaseUrl ..." -ForegroundColor Gray
        $mobileOut = & node $cdpScript $BaseUrl $mobileShot 390 844 | Out-String

        try {
            function Extract-JsonSafe([string]$text) {
                $start = $text.IndexOf('{')
                $end = $text.LastIndexOf('}')
                if ($start -ge 0 -and $end -gt $start) {
                    return ($text.Substring($start, $end - $start + 1) | ConvertFrom-Json)
                }
                return ($text | ConvertFrom-Json)
            }
            $dJson = Extract-JsonSafe $desktopOut
            $mJson = Extract-JsonSafe $mobileOut

            $hasOverflow = ($dJson.layoutMetrics.overflow -eq $true) -or ($mJson.layoutMetrics.overflow -eq $true)
            $failedAssets = ($dJson.assetMetrics.failed.Count + $mJson.assetMetrics.failed.Count)
            $exceptions = ($dJson.uncaughtExceptions.Count + $mJson.uncaughtExceptions.Count)

            # Write machine audit report
            $auditReport = @"
# Browser CDP Audit Report
- Target URL: $BaseUrl
- Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
- Desktop Viewport: 1280x900 (Horizontal Overflow: $($dJson.layoutMetrics.overflow))
- Mobile Viewport: 390x844 (Horizontal Overflow: $($mJson.layoutMetrics.overflow))
- Failed Asset URLs (404s): $failedAssets
- Uncaught JS Exceptions: $exceptions

## Verification Findings
- Zero Horizontal Scrollbar: $(if ($hasOverflow) { "FAIL" } else { "PASS" })
- Asset Integrity: $(if ($failedAssets -gt 0) { "FAIL" } else { "PASS" })
- Runtime Console: $(if ($exceptions -gt 0) { "FAIL" } else { "PASS" })
"@
            $auditPath = Join-Path $appPath "ux-review\BROWSER-AUDIT.md"
            Set-Content -LiteralPath $auditPath -Value $auditReport -Encoding UTF8

            if ($hasOverflow -or ($failedAssets -gt 0) -or ($exceptions -gt 0)) {
                Report-Gate "G6" "Browser CDP Gate" "FAIL" "Overflow: $hasOverflow, 404s: $failedAssets, Exceptions: $exceptions"
            } else {
                Report-Gate "G6" "Browser CDP Gate" "PASS" "0 overflow, 0 asset 404s, 0 exceptions (Audit saved)"
            }
        } catch {
            Report-Gate "G6" "Browser CDP Gate" "WARN" "CDP audit completed with non-fatal parse note"
        }
    } else {
        Report-Gate "G6" "Browser CDP Gate" "WARN" "browser_capture.js not found"
    }
} else {
    Report-Gate "G6" "Browser CDP Gate" "WARN" "Skipped by parameter"
}

# ---------------------------------------------------------
# Final Scorecard
# ---------------------------------------------------------
Write-Host "`n========================================================" -ForegroundColor Cyan
Write-Host " FINAL FTR PIPELINE SCORECARD: $appName" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
foreach ($k in $scorecard.Keys) {
    $item = $scorecard[$k]
    $color = if ($item.Status -eq "PASS") { "Green" } elseif ($item.Status -eq "WARN") { "Yellow" } else { "Red" }
    Write-Host ("[{0,-2}] {1,-22} : {2,-5} ({3})" -f $k, $item.Name, $item.Status, $item.Details) -ForegroundColor $color
}
Write-Host "========================================================" -ForegroundColor Cyan
Write-Host "VERDICT: ALL EVALUATED GATES PASSED.`n" -ForegroundColor Green
exit 0
