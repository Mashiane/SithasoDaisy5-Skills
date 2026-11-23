<#
.SYNOPSIS
    SithasoDaisy5 First-Time-Right (FTR) Delivery Pipeline Runner (G0 -> G8).
.DESCRIPTION
    Executes the G0-G8 gate chain sequentially and writes machine evidence to
    <AppFolder>/.agent/DELIVERY.json.

    Executed here:
      [G0] Contract Integrity Gate (validate-contracts.py)
      [G1] Bootstrap Structure Gate (module/file counts, pgIndex wiring)
      [G2] Feature Slice Gate (contract screen/component provenance)
      [G3] Static Integrity Gate (pre-scan.ps1 + verify-conformance.ps1)
      [G4] Compilation / Transpile Gate (build-banano-app.ps1 via B4JBuilder)
      [G5] Browser Runtime & CDP Verification (browser_capture.js)
      [G6] UX Review closure (ux-review/UX-REVIEW-*.md with APPROVED verdict)
      [G7] Regression closure (.agent/REGRESSION.md)
      [G8] Production Hardening (verify-production-hardening.ps1 on published output)

    Gate statuses are PASS, FAIL, BLOCKED, NOT RUN. WARN is not a gate state.
    The runner reports execution; it does not decide delivery. Only
    check-delivery.ps1 exiting 0 makes the app deliverable.
.PARAMETER AppFolder
    The target application folder (e.g. C:\b4j\workspace\0SithasoDaisy5Skills\AIExamples\09-finance-dashboard).
.PARAMETER BaseUrl
    The URL where the compiled app is hosted (default http://localhost/<appname>/index.html).
.PARAMETER SkipBuild
    Skip G4 compilation (e.g. when validating contracts and static code only).
.PARAMETER SkipCapture
    Skip G5 browser capture and CDP audit.
.PARAMETER StopOnFail
    Halt execution immediately on the first FAIL (default $true). BLOCKED and
    NOT RUN do not halt; they downgrade the final evidence to FAIL / PARTIAL.
.PARAMETER EvidenceOut
    Optional evidence path override. Default <AppFolder>/.agent/DELIVERY.json.
#>
param(
    [Parameter(Mandatory = $true)][string]$AppFolder,
    [string]$BaseUrl = "",
    [switch]$SkipBuild,
    [switch]$SkipCapture,
    [bool]$StopOnFail = $true,
    [string]$EvidenceOut = ""
)

$ErrorActionPreference = "Stop"
$root = (Resolve-Path $PSScriptRoot\..\..\..).Path
$appPath = (Resolve-Path $AppFolder).Path
$appName = (Get-Item $appPath).Name
$fwRoot = "C:\b4j\workspace\0SithasoDaisy5"

$evidenceModule = Join-Path $root "skills\sd5-web-verify\scripts\lib\Evidence.psm1"
if (-not (Test-Path -LiteralPath $evidenceModule)) {
    Write-Host "Evidence module not found: $evidenceModule" -ForegroundColor Red
    exit 2
}
Import-Module $evidenceModule -Force

$suiteVersion = 'unknown'
$pluginJson = Join-Path $root 'plugin.json'
if (Test-Path -LiteralPath $pluginJson) {
    try { $suiteVersion = (Get-Content -LiteralPath $pluginJson -Raw | ConvertFrom-Json).version } catch { }
}

$evidencePath = Initialize-Delivery -AppPath $appPath -SuiteVersion $suiteVersion -EvidencePath $EvidenceOut

Write-Host "========================================================" -ForegroundColor Cyan
Write-Host " SITHASODAISY5 FTR PIPELINE RUNNER (G0 -> G8)           " -ForegroundColor Cyan
Write-Host " Target App: $appName ($appPath)" -ForegroundColor White
Write-Host " Evidence:   $evidencePath" -ForegroundColor White
Write-Host "========================================================" -ForegroundColor Cyan

$scorecard = [ordered]@{}

# Helper for gate reporting. Records evidence before any halt.
function Report-Gate {
    param(
        [string]$Gate,
        [string]$Name,
        [string]$Status,
        [string]$Details,
        [string]$Script = "",
        $ExitCode = $null,
        [string[]]$Evidence = @()
    )
    $color = switch ($Status) {
        "PASS" { "Green" }
        "NOT RUN" { "Yellow" }
        "BLOCKED" { "Magenta" }
        default { "Red" }
    }
    Write-Host "[$Gate] $Name : $Status ($Details)" -ForegroundColor $color
    $script:scorecard[$Gate] = [ordered]@{ Name = $Name; Status = $Status; Details = $Details }
    Update-DeliveryGate -EvidencePath $evidencePath -Id $Gate -Status $Status -Script $Script -ExitCode $ExitCode -Evidence $Evidence
    if ($Status -eq "FAIL" -and $StopOnFail) {
        $digest = Get-SourceDigest -AppPath $appPath
        $overall = Complete-Delivery -EvidencePath $evidencePath -Digest $digest
        Write-Host "`nPIPELINE HALTED at [$Gate] due to failure. Overall: $overall" -ForegroundColor Red
        exit 1
    }
}

# ---------------------------------------------------------
# [G0] Contract Integrity Gate
# ---------------------------------------------------------
Write-Host "`n--- [G0] Validating Application & Screen Contracts ---" -ForegroundColor Yellow
$validatorScript = Join-Path $root "skills\sd5-application-planner\scripts\validate-contracts.py"
if (Test-Path -LiteralPath $validatorScript) {
    $proc = Start-Process -FilePath "python" -ArgumentList "`"$validatorScript`"", "--app-folder", "`"$appPath`"", "--write-index" -NoNewWindow -Wait -PassThru
    if ($proc.ExitCode -eq 0) {
        Report-Gate "G0" "Contract Gate" "PASS" "Requirements, features & screen contracts verified" `
            -Script "validate-contracts.py" -ExitCode 0 -Evidence @("contract/contract.index.json")
    } else {
        Report-Gate "G0" "Contract Gate" "FAIL" "Contract validation errors detected" `
            -Script "validate-contracts.py" -ExitCode $proc.ExitCode
    }
} else {
    Report-Gate "G0" "Contract Gate" "BLOCKED" "validate-contracts.py not found" -Script "validate-contracts.py"
}

# ---------------------------------------------------------
# [G1] Bootstrap Structure Gate
# ---------------------------------------------------------
Write-Host "`n--- [G1] Verifying Bootstrap Structure ---" -ForegroundColor Yellow
$b4jFile = Get-ChildItem -LiteralPath $appPath -Filter "*.b4j" -File | Select-Object -First 1
if (-not $b4jFile) {
    Report-Gate "G1" "Bootstrap Gate" "BLOCKED" "No .b4j entry point in app folder" -Script "run-pipeline.ps1"
} else {
    $b4jText = Get-Content -LiteralPath $b4jFile.FullName -Raw
    $modules = @([regex]::Matches($b4jText, '(?m)^\s*Module\d+\s*=\s*(.+?)\s*$') | ForEach-Object { $_.Groups[1].Value.Trim() })
    $problems = @()

    $numMatch = [regex]::Match($b4jText, '(?m)^\s*NumberOfModules\s*=\s*(\d+)')
    if ($numMatch.Success -and [int]$numMatch.Groups[1].Value -ne $modules.Count) {
        $problems += "NumberOfModules=$($numMatch.Groups[1].Value) but $($modules.Count) ModuleN= entries"
    }

    $missing = @()
    foreach ($m in $modules) {
        # Path-qualified entries are external/shared modules resolved by B4J,
        # not files that must live in the app folder.
        if ($m.StartsWith('|')) { continue }
        $leaf = ($m -split '[\\/]')[-1]
        $found = (Test-Path -LiteralPath (Join-Path $appPath "$leaf.bas")) -or (Test-Path -LiteralPath (Join-Path $appPath $m))
        if (-not $found) { $missing += $leaf }
    }
    if ($missing.Count -gt 0) { $problems += "unresolved modules: $($missing -join ', ')" }
    if (@($modules | Where-Object { $_ -match 'pgIndex' }).Count -eq 0) { $problems += "pgIndex not registered" }

    if ($problems.Count -gt 0) {
        Report-Gate "G1" "Bootstrap Gate" "FAIL" ($problems -join '; ') -Script "run-pipeline.ps1" -ExitCode 1
    } else {
        Report-Gate "G1" "Bootstrap Gate" "PASS" "$($modules.Count) modules registered, all resolve" `
            -Script "run-pipeline.ps1" -ExitCode 0 -Evidence @($b4jFile.Name)
    }
}

# ---------------------------------------------------------
# [G2] Feature Slice Gate (contract -> component provenance)
# ---------------------------------------------------------
Write-Host "`n--- [G2] Verifying Feature Slices (Contract -> Components) ---" -ForegroundColor Yellow
$contractIndex = Join-Path $appPath "contract\contract.index.json"
$componentDir = Join-Path $root "skills\sithasodaisy5\components"
if (-not (Test-Path -LiteralPath $contractIndex)) {
    Report-Gate "G2" "Feature Slice Gate" "BLOCKED" "contract/contract.index.json missing (run G0)" -Script "contract.index.json"
} else {
    try {
        $idx = Get-Content -LiteralPath $contractIndex -Raw -Encoding UTF8 | ConvertFrom-Json
        $g2Problems = @()
        if ($idx.status -ne 'PASS') { $g2Problems += "contract index status=$($idx.status)" }
        $screens = @($idx.screens)
        if ($screens.Count -eq 0) { $g2Problems += "no contracted screens" }
        foreach ($screen in $screens) {
            if (-not $screen.id) { $g2Problems += "screen has no SCREEN id"; continue }
            if ($screen.owner -is [array] -or -not $screen.owner) { $g2Problems += "$($screen.id) must have exactly one feature owner" }
            foreach ($comp in @($screen.components)) {
                if ($comp -and $comp -like 'SDUI5*' -and -not (Test-Path -LiteralPath (Join-Path $componentDir "$comp.md"))) {
                    $g2Problems += "$($screen.id) references undocumented component $comp"
                }
            }
        }
        if ($g2Problems.Count -gt 0) {
            Report-Gate "G2" "Feature Slice Gate" "FAIL" ($g2Problems -join '; ') -Script "contract.index.json" -ExitCode 1
        } else {
            Report-Gate "G2" "Feature Slice Gate" "PASS" "$($screens.Count) screen contract(s) map to documented components" `
                -Script "contract.index.json" -ExitCode 0 -Evidence @("contract/contract.index.json")
        }
    } catch {
        Report-Gate "G2" "Feature Slice Gate" "FAIL" "contract.index.json unreadable: $($_.Exception.Message)" -Script "contract.index.json" -ExitCode 1
    }
}

# ---------------------------------------------------------
# [G3] Static Integrity Gate (Pre-Scan + Conformance)
# ---------------------------------------------------------
Write-Host "`n--- [G3] Static Integrity (Pre-Scan + Conformance) ---" -ForegroundColor Yellow
$preScanScript = Join-Path $root "skills\sd5-web-verify\scripts\pre-scan.ps1"
$verifyScript = Join-Path $root "skills\sd5-web-verify\scripts\verify-conformance.ps1"
$skillFolder = Join-Path $root "skills\sithasodaisy5"
$g3Problems = @()
if (Test-Path -LiteralPath $preScanScript) {
    & $preScanScript -AppFolder $appPath
    if ($LASTEXITCODE -ne 0) { $g3Problems += "pre-scan failed (exit $LASTEXITCODE)" }
} else {
    $g3Problems += "pre-scan.ps1 not found"
}
if (Test-Path -LiteralPath $verifyScript) {
    & $verifyScript -AppFolder $appPath -FrameworkFolder $fwRoot -SkillFolder $skillFolder
    if ($LASTEXITCODE -ne 0) { $g3Problems += "verify-conformance failed (exit $LASTEXITCODE)" }
} else {
    $g3Problems += "verify-conformance.ps1 not found"
}
if ($g3Problems.Count -gt 0) {
    Report-Gate "G3" "Static Integrity Gate" "FAIL" ($g3Problems -join '; ') -Script "pre-scan.ps1 + verify-conformance.ps1" -ExitCode 1
} else {
    Report-Gate "G3" "Static Integrity Gate" "PASS" "Pre-scan and conformance passed" -Script "pre-scan.ps1 + verify-conformance.ps1" -ExitCode 0
}

# ---------------------------------------------------------
# [G4] Compilation / Transpilation Gate (B4JBuilder -> BANano)
# ---------------------------------------------------------
if (-not $SkipBuild) {
    Write-Host "`n--- [G4] Building Application via B4JBuilder & BANano ---" -ForegroundColor Yellow
    $buildScript = Join-Path $root "skills\sd5-web-verify\scripts\build-banano-app.ps1"
    if (Test-Path -LiteralPath $buildScript) {
        & $buildScript -ProjectRoot $appPath
        $code = $LASTEXITCODE
        if ($code -eq 0) {
            Report-Gate "G4" "Build Gate" "PASS" "B4J compiled & BANano transpiled clean" -Script "build-banano-app.ps1" -ExitCode 0
        } else {
            Report-Gate "G4" "Build Gate" "FAIL" "B4J/BANano build failed" -Script "build-banano-app.ps1" -ExitCode $code
        }
    } else {
        Report-Gate "G4" "Build Gate" "BLOCKED" "build-banano-app.ps1 not found" -Script "build-banano-app.ps1"
    }
} else {
    Report-Gate "G4" "Build Gate" "NOT RUN" "Skipped by parameter (-SkipBuild)" -Script "build-banano-app.ps1"
}

# ---------------------------------------------------------
# [G5] Browser Runtime & CDP Diagnostic Gate
# ---------------------------------------------------------
$appTargetName = ""
$b4jForName = Get-ChildItem -LiteralPath $appPath -Filter "*.b4j" -File | Select-Object -First 1
if ($b4jForName) {
    $nameText = Get-Content -LiteralPath $b4jForName.FullName -Raw
    $nameMatch = [regex]::Match($nameText, '(?m)^\s*Public\s+AppName\s+As\s+String\s*=\s*"([^"]+)"')
    if ($nameMatch.Success) { $appTargetName = $nameMatch.Groups[1].Value.Trim() }
}
if (-not $appTargetName) {
    $appTargetName = ($appName -replace '^\d+[-_]', '').ToLower()
}

if (-not $SkipCapture) {
    Write-Host "`n--- [G5] Browser Runtime & Chrome CDP Audit ---" -ForegroundColor Yellow
    if (-not $BaseUrl) {
        $BaseUrl = "http://localhost/$appTargetName/index.html"
    }

    # Ensure local app assets are synced to published target directory
    $appLocalAssets = Join-Path $appPath "assets"
    $targetAssetsDir = "C:\laragon\www\$appTargetName\assets"
    if ((Test-Path -LiteralPath $appLocalAssets) -and (Test-Path -LiteralPath $targetAssetsDir)) {
        Copy-Item -Path "$appLocalAssets\*" -Destination $targetAssetsDir -Recurse -Force -ErrorAction SilentlyContinue
    }

    $cdpScript = Join-Path $root "skills\sd5-web-verify\scripts\browser_capture.js"
    $screensDir = Join-Path $appPath "ux-review\screens"
    if (-not (Test-Path -LiteralPath $screensDir)) { New-Item -ItemType Directory -Path $screensDir -Force | Out-Null }

    if (Test-Path -LiteralPath $cdpScript) {
        $desktopShot = Join-Path $screensDir "pipeline-desktop.png"
        $mobileShot = Join-Path $screensDir "pipeline-mobile.png"

        function Extract-JsonSafe([string]$text) {
            $start = $text.IndexOf('{')
            $end = $text.LastIndexOf('}')
            if ($start -ge 0 -and $end -gt $start) {
                return ($text.Substring($start, $end - $start + 1) | ConvertFrom-Json)
            }
            return ($text | ConvertFrom-Json)
        }

        # A build can still be flushing the published bundle when the first
        # navigation starts. Retry a not-ready load before judging the gate.
        function Invoke-Capture([string]$url, [string]$png, [int]$w, [int]$h) {
            for ($i = 0; $i -lt 2; $i++) {
                $out = & node $cdpScript $url $png $w $h | Out-String
                try {
                    $probe = Extract-JsonSafe $out
                    if ($probe.domSummary.pageView -eq $true -and $probe.domSummary.title) { return $out }
                } catch {
                    Write-Host "  capture output could not be parsed; retrying ..." -ForegroundColor Yellow
                }
                Write-Host "  capture not ready; retrying after a short settle ..." -ForegroundColor Yellow
                Start-Sleep -Seconds 4
            }
            return $out
        }

        # Let the transpiler release the output folder before the first load.
        Start-Sleep -Seconds 3

        Write-Host "Running Desktop CDP Audit (1280x900) against $BaseUrl ..." -ForegroundColor Gray
        $desktopOut = Invoke-Capture $BaseUrl $desktopShot 1280 900

        Write-Host "Running Mobile CDP Audit (390x844) against $BaseUrl ..." -ForegroundColor Gray
        $mobileOut = Invoke-Capture $BaseUrl $mobileShot 390 844

        try {
            $dJson = Extract-JsonSafe $desktopOut
            $mJson = Extract-JsonSafe $mobileOut

            $hasOverflow = ($dJson.layoutMetrics.overflow -eq $true) -or ($mJson.layoutMetrics.overflow -eq $true)
            $failedAssets = ($dJson.assetMetrics.failed.Count + $mJson.assetMetrics.failed.Count)
            $exceptions = (@($dJson.uncaughtExceptions).Count + @($mJson.uncaughtExceptions).Count + @($dJson.unhandledRejections).Count + @($mJson.unhandledRejections).Count)
            $titleOk = [bool]($dJson.domSummary.title -and $dJson.domSummary.title.Trim().Length -gt 0)
            $pageViewOk = [bool]($dJson.domSummary.pageView -eq $true)
            $bodyOk = [bool]($dJson.domSummary.bodyLength -gt 20)
            $themeOk = [bool]($dJson.domSummary.theme -and $dJson.domSummary.theme.Trim().Length -gt 0)
            $domOk = $titleOk -and $pageViewOk -and $bodyOk

            # Write machine audit report
            $auditReport = @"
# Browser CDP Audit Report
- Target URL: $BaseUrl
- Generated: $(Get-Date -Format "yyyy-MM-dd HH:mm:ss")
- Desktop Viewport: 1280x900 (Horizontal Overflow: $($dJson.layoutMetrics.overflow))
- Mobile Viewport: 390x844 (Horizontal Overflow: $($mJson.layoutMetrics.overflow))
- Failed Asset URLs (404s): $failedAssets
- Uncaught JS Exceptions: $exceptions
- Title: $($dJson.domSummary.title) ($(if ($titleOk) { "PASS" } else { "FAIL" }))
- Page View Container: $($dJson.domSummary.pageView) ($(if ($pageViewOk) { "PASS" } else { "FAIL" }))
- Body Text Length: $($dJson.domSummary.bodyLength) ($(if ($bodyOk) { "PASS" } else { "FAIL" }))
- Theme Attribute: $($dJson.domSummary.theme) ($(if ($themeOk) { "PASS" } else { "ADVISORY" }))

## Verification Findings
- Zero Horizontal Scrollbar: $(if ($hasOverflow) { "FAIL" } else { "PASS" })
- Asset Integrity: $(if ($failedAssets -gt 0) { "FAIL" } else { "PASS" })
- Runtime Console: $(if ($exceptions -gt 0) { "FAIL" } else { "PASS" })
- Title/PageView/Body Rendered: $(if ($domOk) { "PASS" } else { "FAIL" })
"@
            $auditPath = Join-Path $appPath "ux-review\BROWSER-AUDIT.md"
            Set-Content -LiteralPath $auditPath -Value $auditReport -Encoding UTF8

            if ($hasOverflow -or ($failedAssets -gt 0) -or ($exceptions -gt 0) -or (-not $domOk)) {
                Report-Gate "G5" "Browser Runtime Gate" "FAIL" "Overflow: $hasOverflow, 404s: $failedAssets, Exceptions: $exceptions, Title: $titleOk, PageView: $pageViewOk, Body: $bodyOk" `
                    -Script "browser_capture.js" -ExitCode 1 -Evidence @("ux-review/BROWSER-AUDIT.md")
            } else {
                $themeNote = if ($themeOk) { "theme set by host" } else { "theme not set (host-supplied)" }
                Report-Gate "G5" "Browser Runtime Gate" "PASS" "0 overflow, 0 404s, 0 exceptions; title/pageview/body rendered; $themeNote" `
                    -Script "browser_capture.js" -ExitCode 0 -Evidence @("ux-review/BROWSER-AUDIT.md")
            }
        } catch {
            Report-Gate "G5" "Browser Runtime Gate" "BLOCKED" "CDP output could not be parsed; runtime not proven" -Script "browser_capture.js"
        }
    } else {
        Report-Gate "G5" "Browser Runtime Gate" "BLOCKED" "browser_capture.js not found" -Script "browser_capture.js"
    }
} else {
    Report-Gate "G5" "Browser Runtime Gate" "NOT RUN" "Skipped by parameter (-SkipCapture)" -Script "browser_capture.js"
}

# ---------------------------------------------------------
# [G6] UX Review closure (artifact gate)
# ---------------------------------------------------------
Write-Host "`n--- [G6] Checking UX Review Evidence ---" -ForegroundColor Yellow
$uxReviewDir = Join-Path $appPath "ux-review"
$uxFiles = @(Get-ChildItem -LiteralPath $uxReviewDir -Filter "UX-REVIEW-*.md" -File -ErrorAction SilentlyContinue)
$shotDir = Join-Path $appPath "ux-review\screens"
$shots = @(Get-ChildItem -LiteralPath $shotDir -Recurse -File -ErrorAction SilentlyContinue | Where-Object { $_.Extension -eq '.png' })
$designShots = @($shots | Where-Object { $_.Name -notmatch '^pipeline-' })
$desktopShots = @($designShots | Where-Object { $_.Name -match '(?i)desktop|1440|1280' })
$phoneShots = @($designShots | Where-Object { $_.Name -match '(?i)mobile|phone|390' })
$uxApproved = @()
$uxScoreProblems = @()
foreach ($f in $uxFiles) {
    $text = Get-Content -LiteralPath $f.FullName -Raw -Encoding UTF8
    if ($text -notmatch '(?i)\bAPPROVED\b') { continue }
    $uxApproved += $f
    $averageRows = @([regex]::Matches($text, '(?im)^\s*\|\s*\*\*Average\*\*\s*\|(.+)$'))
    if ($averageRows.Count -eq 0) {
        $uxScoreProblems += "$($f.Name): no scored Average row"
    } else {
        foreach ($row in $averageRows) {
            $scoreCells = [regex]::Matches($row.Groups[1].Value, '\*\*(\d(?:\.\d+)?)\*\*')
            if ($scoreCells.Count -eq 0) {
                $scoreCells = [regex]::Matches($row.Groups[1].Value, '\b(\d\.\d+)\b')
            }
            foreach ($m in $scoreCells) {
                $avg = [double]$m.Groups[1].Value
                if ($avg -lt 3.5) { $uxScoreProblems += "$($f.Name): average $avg < 3.5" }
            }
        }
    }
}

if ($uxApproved.Count -eq 0) {
    Report-Gate "G6" "UX Review Gate" "NOT RUN" "No ux-review/UX-REVIEW-*.md with an APPROVED verdict" -Script "ux-review.md"
} elseif ($uxScoreProblems.Count -gt 0) {
    Report-Gate "G6" "UX Review Gate" "FAIL" ($uxScoreProblems -join '; ') -Script "ux-review.md" -ExitCode 1
} elseif ($desktopShots.Count -eq 0 -or $phoneShots.Count -eq 0) {
    Report-Gate "G6" "UX Review Gate" "NOT RUN" "Need at least one non-pipeline desktop and one phone screenshot (desktop=$($desktopShots.Count), phone=$($phoneShots.Count))" -Script "capture-screens.ps1"
} else {
    $reviewRel = "ux-review/$($uxApproved[0].Name)"
    Report-Gate "G6" "UX Review Gate" "PASS" "$($uxApproved.Count) approved review(s), desktop=$($desktopShots.Count), phone=$($phoneShots.Count)" `
        -Script "ux-review.md" -ExitCode 0 -Evidence @($reviewRel)
}

# ---------------------------------------------------------
# [G7] Regression closure (artifact gate)
# ---------------------------------------------------------
Write-Host "`n--- [G7] Checking Regression Evidence ---" -ForegroundColor Yellow
$regressionPath = Join-Path $appPath ".agent\REGRESSION.md"
if ((Test-Path -LiteralPath $regressionPath) -and ((Get-Item -LiteralPath $regressionPath).Length -gt 0)) {
    $regText = Get-Content -LiteralPath $regressionPath -Raw -Encoding UTF8
    $hasNew = $regText -match '(?i)\bnew\b|\bfixed\b'
    $hasPre = $regText -match '(?i)pre-existing'
    if ($hasNew -and $hasPre) {
        Report-Gate "G7" "Regression Gate" "PASS" ".agent/REGRESSION.md separates new/fixed and pre-existing failures" `
            -Script "sd5-web-regression" -ExitCode 0 -Evidence @(".agent/REGRESSION.md")
    } else {
        Report-Gate "G7" "Regression Gate" "FAIL" ".agent/REGRESSION.md must separate new/fixed from pre-existing failures" `
            -Script "sd5-web-regression" -ExitCode 1
    }
} else {
    Report-Gate "G7" "Regression Gate" "NOT RUN" "No .agent/REGRESSION.md" -Script "sd5-web-regression"
}

# ---------------------------------------------------------
# [G8] Production Hardening on published output
# ---------------------------------------------------------
Write-Host "`n--- [G8] Production Hardening on Published Output ---" -ForegroundColor Yellow
$hardeningScript = Join-Path $root "skills\sd5-web-verify\scripts\verify-production-hardening.ps1"
$outputFolder = "C:\laragon\www\$appTargetName"
if (-not (Test-Path -LiteralPath $hardeningScript)) {
    Report-Gate "G8" "Hardening Gate" "BLOCKED" "verify-production-hardening.ps1 not found" -Script "verify-production-hardening.ps1"
} elseif (-not (Test-Path -LiteralPath $outputFolder)) {
    Report-Gate "G8" "Hardening Gate" "BLOCKED" "Published output not found at $outputFolder" -Script "verify-production-hardening.ps1"
} else {
    & $hardeningScript -OutputFolder $outputFolder -ProjectFolder $appPath
    $code = $LASTEXITCODE
    if ($code -eq 0) {
        Report-Gate "G8" "Hardening Gate" "PASS" "Published output clean" -Script "verify-production-hardening.ps1" -ExitCode 0
    } else {
        Report-Gate "G8" "Hardening Gate" "FAIL" "Hardening scan rejected published output" -Script "verify-production-hardening.ps1" -ExitCode $code
    }
}

# ---------------------------------------------------------
# Final scorecard and verdict
# ---------------------------------------------------------
$digest = Get-SourceDigest -AppPath $appPath
$overall = Complete-Delivery -EvidencePath $evidencePath -Digest $digest

Write-Host "`n========================================================" -ForegroundColor Cyan
Write-Host " FINAL FTR PIPELINE SCORECARD: $appName" -ForegroundColor Cyan
Write-Host "========================================================" -ForegroundColor Cyan
foreach ($k in $scorecard.Keys) {
    $item = $scorecard[$k]
    $color = switch ($item.Status) {
        "PASS" { "Green" }
        "NOT RUN" { "Yellow" }
        "BLOCKED" { "Magenta" }
        default { "Red" }
    }
    Write-Host ("[{0,-2}] {1,-20} : {2,-7} ({3})" -f $k, $item.Name, $item.Status, $item.Details) -ForegroundColor $color
}
Write-Host "========================================================" -ForegroundColor Cyan

$openGates = @($scorecard.Keys | Where-Object { $scorecard[$_].Status -ne "PASS" })

switch ($overall) {
    "PASS" {
        Write-Host "VERDICT: PASS - all gates G0-G8 passed." -ForegroundColor Green
        Write-Host "Delivery decision: run check-delivery.ps1 (expected exit 0)." -ForegroundColor Gray
        exit 0
    }
    "PARTIAL" {
        Write-Host "VERDICT: PARTIAL - gates not passed: $($openGates -join ', ')" -ForegroundColor Yellow
        Write-Host "This is NOT a delivery. Run check-delivery.ps1; it will exit 1." -ForegroundColor Yellow
        exit 0
    }
    default {
        Write-Host "VERDICT: FAIL - gates not passed: $($openGates -join ', ')" -ForegroundColor Red
        Write-Host "This is NOT a delivery. Run check-delivery.ps1; it will exit 1." -ForegroundColor Red
        exit 1
    }
}
