<#
.SYNOPSIS
    Build a B4J app, run its BANano AppStart build, and record build evidence.
.DESCRIPTION
    This helper follows the checked-in B4J demo workflow: B4JBuilder.exe -Task=Build,
    then execute the generated jar with the installed JavaFX runtime and wait for
    fresh BANano index.html/scripts/app.js output plus the BANano success marker.
    It does not serve the output or claim browser-runtime/visual success.
#>
param(
    [Parameter(Mandatory = $true)][string]$ProjectRoot,
    [int]$TimeoutSec = 240,
    [switch]$SkipCompile,
    [string]$Builder = "C:\Program Files\Anywhere Software\B4J\B4JBuilder.exe",
    [string]$Java = "C:\b4j\java\bin\java.exe",
    [string]$JavaFxLib = "C:\b4j\java\javafx\lib"
)
$ErrorActionPreference = "Stop"
$ProjectRoot = (Resolve-Path -LiteralPath $ProjectRoot).Path
$project = Get-ChildItem -LiteralPath $ProjectRoot -Filter "*.b4j" -File | Select-Object -First 1
if (-not $project) { throw "No .b4j project file found in $ProjectRoot" }
foreach ($required in @($Builder, $Java, $JavaFxLib)) {
    if (-not (Test-Path -LiteralPath $required)) { throw "Required B4J build tool is missing: $required" }
}
$source = Get-Content -LiteralPath $project.FullName -Raw
$nameMatch = [regex]::Match($source, '(?m)^\s*Public\s+AppName\s+As\s+String\s*=\s*"([^"]+)"')
$publishMatch = [regex]::Match($source, '(?m)^\s*Public\s+Publish\s+As\s+String\s*=\s*"([^"]+)"')
if (-not $nameMatch.Success -or -not $publishMatch.Success) {
    throw "Embedded Process_Globals must declare string AppName and Publish values for reliable output discovery."
}
$appName = $nameMatch.Groups[1].Value
$publishRoot = $publishMatch.Groups[1].Value
$outputFolder = Join-Path $publishRoot $appName
$null = New-Item -ItemType Directory -Path $publishRoot -Force
$jar = Join-Path (Join-Path $ProjectRoot "Objects") ($project.BaseName + ".jar")
$evidenceDir = Join-Path $ProjectRoot ".agent\build"
New-Item -ItemType Directory -Path $evidenceDir -Force | Out-Null
$stamp = Get-Date -Format "yyyyMMdd-HHmmss"
$report = Join-Path $evidenceDir "BUILD-$stamp.md"
$compileLog = Join-Path $evidenceDir "B4J-$stamp.log"
$compileStdout = Join-Path $evidenceDir "B4J-$stamp.out.log"
$compileStderr = Join-Path $evidenceDir "B4J-$stamp.err.log"
$stdout = Join-Path $evidenceDir "BANano-$stamp.out.log"
$stderr = Join-Path $evidenceDir "BANano-$stamp.err.log"
$transpileLogs = @((Join-Path $ProjectRoot "banano-transpile.log"), (Join-Path $ProjectRoot "Objects\banano-transpile.log"))
foreach ($path in $transpileLogs) { if (Test-Path -LiteralPath $path) { Remove-Item -LiteralPath $path -Force } }

if ($SkipCompile) {
    $buildExit = 0
    $buildStatus = "SKIPPED"
    "Skipped by request; using existing jar: $jar" | Set-Content -LiteralPath $compileLog -Encoding UTF8
} else {
    Push-Location $ProjectRoot
    try {
        # Ensure all Java compilation and transpile processes use UTF-8
        $env:JAVA_TOOL_OPTIONS = "-Dfile.encoding=UTF-8"
        # Start-Process keeps native stderr from becoming a terminating
        # PowerShell error, so failed B4JBuilder diagnostics are still saved.
        $builderProc = Start-Process -FilePath $Builder -ArgumentList @("-Task=Build") -WorkingDirectory $ProjectRoot `
            -RedirectStandardOutput $compileStdout -RedirectStandardError $compileStderr -Wait -PassThru
        $buildExit = $builderProc.ExitCode
        $buildStatus = if ($buildExit -eq 0) { "PASS" } else { "FAIL" }
        @("=== B4JBuilder stdout ===", (Get-Content -LiteralPath $compileStdout -Raw -ErrorAction SilentlyContinue),
          "=== B4JBuilder stderr ===", (Get-Content -LiteralPath $compileStderr -Raw -ErrorAction SilentlyContinue)) |
            Set-Content -LiteralPath $compileLog -Encoding UTF8
    } finally { Pop-Location }
}
if ($buildExit -ne 0 -or -not (Test-Path -LiteralPath $jar)) {
    @("# Build report - $stamp", "", "- B4J compile: FAIL (exit $buildExit)", "- Project: $($project.FullName)", "- Log: $compileLog") | Set-Content -LiteralPath $report -Encoding UTF8
    throw "B4J compile failed (exit $buildExit); see $compileLog"
}

$started = Get-Date
$objectsDir = Join-Path $ProjectRoot "Objects"
$proc = Start-Process -FilePath $Java -ArgumentList @("-Dfile.encoding=UTF-8", "--module-path", $JavaFxLib, "--add-modules", "ALL-MODULE-PATH", "-jar", $jar) -WorkingDirectory $objectsDir -RedirectStandardOutput $stdout -RedirectStandardError $stderr -PassThru
$deadline = $started.AddSeconds($TimeoutSec)
$success = $false
$failure = ""
while ((Get-Date) -lt $deadline) {
    Start-Sleep -Milliseconds 500
    $logText = ""
    foreach ($path in @($stdout, $stderr) + $transpileLogs) { if (Test-Path -LiteralPath $path) { $logText += (Get-Content -LiteralPath $path -Raw) } }
    $indexPath = Join-Path $outputFolder "index.html"
    $appJsPath = Join-Path $outputFolder "scripts\app.js"
    $freshIndex = (Test-Path -LiteralPath $indexPath) -and ((Get-Item -LiteralPath $indexPath).LastWriteTime -ge $started)
    $freshJs = (Test-Path -LiteralPath $appJsPath) -and ((Get-Item -LiteralPath $appJsPath).LastWriteTime -ge $started)
    if ($logText -match '(?i)something went wrong|could not set the b4jname') { $failure = "BANano reported a build error."; break }
    if ($logText -match 'BANano v[0-9.]+: conversion finished!' -and $freshIndex -and $freshJs) { $success = $true; break }
    if ($proc.HasExited) {
        Start-Sleep -Milliseconds 500
        $logText = ""
        foreach ($path in @($stdout, $stderr) + $transpileLogs) { if (Test-Path -LiteralPath $path) { $logText += (Get-Content -LiteralPath $path -Raw) } }
        $freshIndex = (Test-Path -LiteralPath $indexPath) -and ((Get-Item -LiteralPath $indexPath).LastWriteTime -ge $started)
        $freshJs = (Test-Path -LiteralPath $appJsPath) -and ((Get-Item -LiteralPath $appJsPath).LastWriteTime -ge $started)
        if ($logText -match 'BANano v[0-9.]+: conversion finished!' -and $freshIndex -and $freshJs) {
            $success = $true
            break
        }
        $failure = "Java exited before fresh BANano output and success marker were detected (exit $($proc.ExitCode))."
        break
    }
}
if (-not $success -and -not $failure) { $failure = "Timed out after $TimeoutSec seconds waiting for BANano output." }
if (-not $proc.HasExited) {
    # BANano may finish transpiling and exit between the HasExited check and
    # Stop-Process. A missing PID here is a harmless cleanup race, not a build
    # failure; continue so the success/failure report is still written.
    Stop-Process -Id $proc.Id -Force -ErrorAction SilentlyContinue
}
$status = if ($success) { "PASS" } else { "FAIL" }
$lines = @(
    "# Build report - $stamp", "",
    "- B4J compile: $buildStatus (B4JBuilder exit $buildExit)",
    "- BANano transpile: $status",
    "- Project: $($project.FullName)",
    "- Jar: $jar",
    "- Output: $outputFolder",
    "- B4J log: $compileLog",
    "- BANano stdout/stderr: $stdout ; $stderr",
    "- Completed: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss K')"
)
if ($failure) { $lines += "- Failure: $failure" }
$lines | Set-Content -LiteralPath $report -Encoding UTF8
Write-Host (Get-Content -LiteralPath $report -Raw)
if (-not $success) { exit 1 }
