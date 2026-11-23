<#
.SYNOPSIS
    Delivery gate for a SithasoDaisy5 app. The only authority over "delivered".
.DESCRIPTION
    Reads <AppFolder>/.agent/DELIVERY.json (written by run-pipeline.ps1) and
    decides whether the app may be called delivered.

    DELIVERABLE requires ALL of:
      - overall = PASS (G0-G8 all PASS)
      - every G0-G8 row present, no FAIL / BLOCKED / NOT RUN / NOT APPLICABLE
      - every PASS row has exitCode 0 and its cited evidence files exist
      - the recorded source digest matches the current source tree

    Anything else is NOT DELIVERABLE. A prose summary, a console scorecard, or
    model confidence is not evidence.

    Exit codes: 0 = DELIVERABLE, 1 = NOT DELIVERABLE, 2 = bad arguments.
.PARAMETER AppFolder
    The generated app folder (contains the .b4j entry point).
.PARAMETER EvidencePath
    Optional override for the evidence file. Default <AppFolder>/.agent/DELIVERY.json.
.PARAMETER Json
    Emit the verdict as JSON instead of a one-line report.
.EXAMPLE
    powershell.exe -NoProfile -ExecutionPolicy Bypass -File skills/sd5-web-verify/scripts/check-delivery.ps1 -AppFolder AIExamples/09-finance-dashboard
#>
param(
    [string]$AppFolder = "",
    [string]$EvidencePath = "",
    [switch]$Json
)

$ErrorActionPreference = "Stop"

if (-not $AppFolder) {
    [Console]::Error.WriteLine("Usage: check-delivery.ps1 -AppFolder <path> [-EvidencePath <path>] [-Json]")
    exit 2
}

if (-not (Test-Path -LiteralPath $AppFolder -PathType Container)) {
    [Console]::Error.WriteLine("App folder not found: $AppFolder")
    exit 2
}

$modulePath = Join-Path $PSScriptRoot "lib\Evidence.psm1"
if (-not (Test-Path -LiteralPath $modulePath)) {
    [Console]::Error.WriteLine("Evidence module not found: $modulePath")
    exit 2
}
Import-Module $modulePath -Force

$appPath = (Resolve-Path -LiteralPath $AppFolder).Path
$result = Test-DeliveryValidity -AppPath $appPath -EvidencePath $EvidencePath

if ($Json) {
    $result | ConvertTo-Json -Depth 5
    exit $result.exitCode
}

$app = Split-Path -Leaf $appPath
$shortDigest = 'none'
if ($result.digest) {
    $take = [Math]::Min(12, $result.digest.Length)
    $shortDigest = $result.digest.Substring(0, $take)
}

if ($result.exitCode -eq 0) {
    Write-Host "DELIVERABLE: $app (G0-G8 PASS, digest $shortDigest)" -ForegroundColor Green
} else {
    Write-Host "NOT DELIVERABLE: $app ($($result.verdict), digest $shortDigest)" -ForegroundColor Red
    foreach ($reason in @($result.reasons)) {
        if ($reason) { Write-Host "  - $reason" -ForegroundColor Yellow }
    }
}

exit $result.exitCode
