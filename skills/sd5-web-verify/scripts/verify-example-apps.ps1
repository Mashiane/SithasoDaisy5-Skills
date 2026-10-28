[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)][string]$AppsRoot,
    [string]$BaseUrlRoot = 'http://127.0.0.1:8765',
    [string[]]$AppFolders = @(),
    [string]$Builder = 'C:\Program Files\Anywhere Software\B4J\B4JBuilder.exe',
    [string]$Java = 'C:\b4j\java\bin\java.exe',
    [string]$JavaFxLib = 'C:\b4j\java\javafx\lib',
    [string]$CaptureScript = (Join-Path $PSScriptRoot 'browser_capture.js'),
    [int]$DesktopWidth = 1280,
    [int]$DesktopHeight = 900,
    [int]$PhoneWidth = 390,
    [int]$PhoneHeight = 844,
    [int]$CompileAttempts = 2,
    [switch]$SkipCompile
)
$ErrorActionPreference = 'Stop'
$AppsRoot = (Resolve-Path -LiteralPath $AppsRoot).Path
foreach ($toolPath in @($Java, $JavaFxLib, $CaptureScript)) {
    if (-not (Test-Path -LiteralPath $toolPath)) { throw "Required verification tool is missing: $toolPath" }
}
if (-not (Get-Command node -ErrorAction SilentlyContinue)) { throw 'Node.js is required for exact viewport capture.' }
try { $null = Invoke-WebRequest -Uri "$BaseUrlRoot/" -Method Head -TimeoutSec 5 }
catch { throw "Cannot reach the static app server at $BaseUrlRoot. Start it before running visual verification." }

$targets = if ($AppFolders.Count -gt 0) {
    foreach ($folder in $AppFolders) { Resolve-Path -LiteralPath (Join-Path $AppsRoot $folder) | ForEach-Object { Get-Item -LiteralPath $_.Path } }
} else {
    Get-ChildItem -LiteralPath $AppsRoot -Directory | Where-Object { Get-ChildItem -LiteralPath $_.FullName -Filter '*.b4j' -File }
}
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$results = [System.Collections.Generic.List[string]]::new()
foreach ($appFolder in $targets) {
    $project = Get-ChildItem -LiteralPath $appFolder.FullName -Filter '*.b4j' -File | Select-Object -First 1
    if (-not $project) { continue }
    $projectText = Get-Content -LiteralPath $project.FullName -Raw
    $nameMatch = [regex]::Match($projectText, '(?m)^\s*Public\s+AppName\s+As\s+String\s*=\s*"([^"]+)"')
    $publishMatch = [regex]::Match($projectText, '(?m)^\s*Public\s+Publish\s+As\s+String\s*=\s*"([^"]+)"')
    if (-not $nameMatch.Success -or -not $publishMatch.Success) {
        $results.Add("$($appFolder.Name): FAIL - AppName/Publish missing")
        continue
    }
    $appName = $nameMatch.Groups[1].Value
    $outputFolder = Join-Path $publishMatch.Groups[1].Value $appName
    $objects = Join-Path $appFolder.FullName 'Objects'
    $jar = Join-Path $objects ($project.BaseName + '.jar')
    $evidence = Join-Path $appFolder.FullName ".agent\visual\$stamp"
    $shots = Join-Path $appFolder.FullName "ux-review\screens\verified-$stamp"
    New-Item -ItemType Directory -Path $evidence,$shots -Force | Out-Null
    Write-Host "[$($appFolder.Name)] B4J compile..." -ForegroundColor Cyan

    $compileExit = 0
    if (-not $SkipCompile) {
        for ($attempt = 1; $attempt -le [Math]::Max(1, $CompileAttempts); $attempt++) {
            $compileOut = Join-Path $evidence "B4J.attempt$attempt.out.log"
            $compileErr = Join-Path $evidence "B4J.attempt$attempt.err.log"
            $builderProc = Start-Process -FilePath $Builder -ArgumentList @('-Task=Build') -WorkingDirectory $appFolder.FullName -RedirectStandardOutput $compileOut -RedirectStandardError $compileErr -Wait -PassThru
            $compileExit = $builderProc.ExitCode
            Copy-Item -LiteralPath $compileOut -Destination (Join-Path $evidence 'B4J.out.log') -Force
            Copy-Item -LiteralPath $compileErr -Destination (Join-Path $evidence 'B4J.err.log') -Force
            if ($compileExit -eq 0 -and (Test-Path -LiteralPath $jar)) { break }
            if ($attempt -lt [Math]::Max(1, $CompileAttempts)) {
                Write-Warning "[$($appFolder.Name)] B4J build attempt $attempt exited $compileExit; retrying once."
                Start-Sleep -Seconds 2
            }
        }
    }
    if ($compileExit -ne 0 -or -not (Test-Path -LiteralPath $jar)) {
        $results.Add("$($appFolder.Name): FAIL - B4J compile exit $compileExit")
        continue
    }

    Write-Host "[$($appFolder.Name)] BANano transpile..." -ForegroundColor Cyan
    $started = Get-Date
    $javaOut = Join-Path $evidence 'BANano.out.log'
    $javaErr = Join-Path $evidence 'BANano.err.log'
    Push-Location $objects
    try {
        & $Java --module-path $JavaFxLib --add-modules ALL-MODULE-PATH -jar $jar 1> $javaOut 2> $javaErr
        $javaExit = $LASTEXITCODE
    } finally { Pop-Location }
    $logText = (Get-Content -LiteralPath $javaOut -Raw -ErrorAction SilentlyContinue) + (Get-Content -LiteralPath $javaErr -Raw -ErrorAction SilentlyContinue)
    $index = Join-Path $outputFolder 'index.html'
    $appJs = Join-Path $outputFolder 'scripts\app.js'
    $fresh = (Test-Path $index) -and (Test-Path $appJs) -and ((Get-Item $index).LastWriteTime -ge $started) -and ((Get-Item $appJs).LastWriteTime -ge $started)
    if ($javaExit -ne 0 -or -not $fresh -or $logText -notmatch 'BANano v[0-9.]+: conversion finished!') {
        $results.Add("$($appFolder.Name): FAIL - BANano exit $javaExit or fresh output/marker missing")
        continue
    }

    $appUrl = "$BaseUrlRoot/$appName/index.html"
    $captureResults = @{}
    foreach ($viewport in @(
        @{ Label='desktop'; Width=$DesktopWidth; Height=$DesktopHeight },
        @{ Label='mobile'; Width=$PhoneWidth; Height=$PhoneHeight }
    )) {
        $png = Join-Path $shots "$($viewport.Label).png"
        Write-Host "[$($appFolder.Name)] Capture $($viewport.Label) $($viewport.Width)x$($viewport.Height)..." -ForegroundColor Cyan
        $captureText = (& node $CaptureScript $appUrl $png $viewport.Width $viewport.Height 2>&1 | Out-String)
        $captureLines = $captureText -split "`r?`n"
        $jsonLine = [Array]::FindIndex($captureLines, [Predicate[string]]{ param($line) $line.Trim() -eq '{' })
        if ($jsonLine -lt 0) {
            $captureResults[$viewport.Label] = $null
            Set-Content -LiteralPath (Join-Path $evidence "$($viewport.Label).capture.log") -Value $captureText -Encoding UTF8
            continue
        }
        $payload = ($captureLines[$jsonLine..($captureLines.Length - 1)] -join "`n") | ConvertFrom-Json
        $captureResults[$viewport.Label] = $payload
        $payload | ConvertTo-Json -Depth 10 | Set-Content -LiteralPath (Join-Path $evidence "$($viewport.Label).json") -Encoding UTF8
    }
    $desktop = $captureResults.desktop
    $mobile = $captureResults.mobile
    if (-not $desktop -or -not $mobile -or -not $desktop.ready -or -not $mobile.ready) {
        $results.Add("$($appFolder.Name): BUILD PASS, CAPTURE FAIL")
    } else {
        $results.Add("$($appFolder.Name): BUILD PASS; desktop overflow=$($desktop.layoutMetrics.overflow), phone overflow=$($mobile.layoutMetrics.overflow), console errors=$($desktop.uncaughtExceptions.Count + $mobile.uncaughtExceptions.Count)")
    }
}
$summary = @("# Visual verification - $stamp",'') + $results
$summaryPath = Join-Path $AppsRoot "VISUAL-VERIFICATION-$stamp.md"
$summary | Set-Content -LiteralPath $summaryPath -Encoding UTF8
Write-Host ($summary -join "`n")
Write-Host "Summary: $summaryPath" -ForegroundColor Green
