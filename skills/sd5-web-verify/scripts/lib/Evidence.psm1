<#
.SYNOPSIS
    Delivery evidence helpers for the SithasoDaisy5 gate pipeline (G0-G8).
.DESCRIPTION
    Single implementation of the DELIVERY.json contract, shared by
    run-pipeline.ps1 (writer) and check-delivery.ps1 (gate).

    Evidence lives at <AppFolder>/.agent/DELIVERY.json and is written only by
    the pipeline runner. A handwritten or model-authored file is not evidence.

    Digest scope is source-only. Generated output (Objects/, assets/,
    ux-review/, .agent/) is excluded so the pipeline cannot invalidate its own
    evidence by building.
#>

$script:GateOrder = @('G0', 'G1', 'G2', 'G3', 'G4', 'G5', 'G6', 'G7', 'G8')

$script:GateNames = [ordered]@{
    G0 = 'Contract'
    G1 = 'Bootstrap'
    G2 = 'Feature Slices'
    G3 = 'Static Integrity'
    G4 = 'Build'
    G5 = 'Runtime'
    G6 = 'UX Review'
    G7 = 'Regression'
    G8 = 'Hardening'
}

function Get-GateOrder {
    return $script:GateOrder
}

function Resolve-AppRoot {
    param([Parameter(Mandatory = $true)][string]$AppPath)
    return (Resolve-Path -LiteralPath $AppPath).Path.TrimEnd('\', '/')
}

function Get-DeliveryPath {
    param(
        [Parameter(Mandatory = $true)][string]$AppPath,
        [string]$EvidencePath = ""
    )
    $root = Resolve-AppRoot -AppPath $AppPath
    if ($EvidencePath) { return $EvidencePath }
    return (Join-Path $root ".agent\DELIVERY.json")
}

function Get-SourceManifest {
    param([Parameter(Mandatory = $true)][string]$AppPath)

    $root = Resolve-AppRoot -AppPath $AppPath
    $excludeDirs = @('objects', 'assets', 'ux-review', '.agent', '__pycache__')
    $includeRoots = @('contract', 'files', 'jsonlayouts')
    $items = New-Object System.Collections.Generic.List[string]

    Get-ChildItem -LiteralPath $root -Recurse -File -ErrorAction SilentlyContinue | ForEach-Object {
        $rel = $_.FullName.Substring($root.Length + 1)
        $parts = $rel -split '\\'
        if ($parts.Length -gt 1) {
            $dirParts = $parts[0..($parts.Length - 2)]
            foreach ($d in $dirParts) {
                if ($excludeDirs -contains $d.ToLower()) { return }
            }
        }
        # G0 regenerates the contract index with a timestamp; it is derived, not source.
        if ($rel -ieq 'contract\contract.index.json') { return }

        $ext = $_.Extension.ToLower()
        $top = $parts[0].ToLower()
        if ($ext -eq '.b4j' -or $ext -eq '.bas') { $items.Add($rel) }
        elseif ($includeRoots -contains $top) { $items.Add($rel) }
    }

    return @($items | Sort-Object { $_.ToLower() })
}

function Get-SourceDigest {
    param([Parameter(Mandatory = $true)][string]$AppPath)

    $root = Resolve-AppRoot -AppPath $AppPath
    $manifest = Get-SourceManifest -AppPath $root
    $sb = New-Object System.Text.StringBuilder

    foreach ($rel in $manifest) {
        $full = Join-Path $root $rel
        $fileHash = (Get-FileHash -LiteralPath $full -Algorithm SHA256).Hash
        [void]$sb.Append($rel.ToLower()).Append(':').Append($fileHash).Append("`n")
    }

    $sha = [System.Security.Cryptography.SHA256]::Create()
    try {
        $bytes = [System.Text.Encoding]::UTF8.GetBytes($sb.ToString())
        $hash = ($sha.ComputeHash($bytes) | ForEach-Object { $_.ToString('x2') }) -join ''
    } finally {
        $sha.Dispose()
    }

    return [pscustomobject]@{
        algorithm      = 'sha256'
        sourceManifest = $manifest
        hash           = $hash
    }
}

function Write-DeliveryJson {
    param(
        [Parameter(Mandatory = $true)]$Delivery,
        [Parameter(Mandatory = $true)][string]$Path
    )
    $dir = Split-Path -Parent $Path
    if ($dir -and -not (Test-Path -LiteralPath $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }
    $json = $Delivery | ConvertTo-Json -Depth 8
    $utf8 = New-Object System.Text.UTF8Encoding($false)
    [System.IO.File]::WriteAllText($Path, $json, $utf8)
}

function Initialize-Delivery {
    param(
        [Parameter(Mandatory = $true)][string]$AppPath,
        [string]$SuiteVersion = 'unknown',
        [string]$EvidencePath = ""
    )

    $root = Resolve-AppRoot -AppPath $AppPath
    $path = Get-DeliveryPath -AppPath $root -EvidencePath $EvidencePath

    $gates = @()
    foreach ($g in $script:GateOrder) {
        $gates += [ordered]@{
            id       = $g
            name     = $script:GateNames[$g]
            status   = 'NOT RUN'
            script   = $null
            exitCode = $null
            evidence = @()
        }
    }

    $delivery = [ordered]@{
        schemaVersion = 1
        app           = [ordered]@{
            name   = (Split-Path -Leaf $root)
            folder = $root
        }
        pipeline      = [ordered]@{
            suiteVersion = $SuiteVersion
            host         = "$($PSVersionTable.PSEdition) $($PSVersionTable.PSVersion) / $([System.Environment]::OSVersion.VersionString)"
            startedAt    = (Get-Date).ToUniversalTime().ToString('o')
            endedAt      = $null
        }
        gates         = $gates
        overall       = 'PARTIAL'
        digest        = $null
    }

    Write-DeliveryJson -Delivery $delivery -Path $path
    return $path
}

function Update-DeliveryGate {
    param(
        [Parameter(Mandatory = $true)][string]$EvidencePath,
        [Parameter(Mandatory = $true)][string]$Id,
        [Parameter(Mandatory = $true)][string]$Status,
        [string]$Script,
        $ExitCode,
        [string[]]$Evidence = @()
    )

    if (-not (Test-Path -LiteralPath $EvidencePath)) { return }
    $delivery = Get-Content -LiteralPath $EvidencePath -Raw | ConvertFrom-Json
    $gate = @($delivery.gates) | Where-Object { $_.id -eq $Id } | Select-Object -First 1
    if (-not $gate) { return }

    $gate.status = $Status
    if ($PSBoundParameters.ContainsKey('Script')) { $gate.script = $Script }
    if ($PSBoundParameters.ContainsKey('ExitCode')) { $gate.exitCode = $ExitCode }
    if ($PSBoundParameters.ContainsKey('Evidence')) { $gate.evidence = @($Evidence) }

    Write-DeliveryJson -Delivery $delivery -Path $EvidencePath
}

function Complete-Delivery {
    param(
        [Parameter(Mandatory = $true)][string]$EvidencePath,
        $Digest
    )

    if (-not (Test-Path -LiteralPath $EvidencePath)) { return 'ABSENT' }
    $delivery = Get-Content -LiteralPath $EvidencePath -Raw | ConvertFrom-Json
    $delivery.pipeline.endedAt = (Get-Date).ToUniversalTime().ToString('o')
    if ($Digest) { $delivery.digest = $Digest }

    $gates = @($delivery.gates)
    if (@($gates | Where-Object { $_.status -eq 'FAIL' -or $_.status -eq 'BLOCKED' }).Count -gt 0) {
        $delivery.overall = 'FAIL'
    } elseif (@($gates | Where-Object { $_.status -ne 'PASS' }).Count -gt 0) {
        $delivery.overall = 'PARTIAL'
    } else {
        $delivery.overall = 'PASS'
    }

    Write-DeliveryJson -Delivery $delivery -Path $EvidencePath
    return $delivery.overall
}

function Test-DeliveryValidity {
    param(
        [Parameter(Mandatory = $true)][string]$AppPath,
        [string]$EvidencePath = ""
    )

    $root = Resolve-AppRoot -AppPath $AppPath
    $path = Get-DeliveryPath -AppPath $root -EvidencePath $EvidencePath
    $result = [ordered]@{
        verdict  = 'ABSENT'
        exitCode = 1
        reasons  = @()
        digest   = $null
    }

    if (-not (Test-Path -LiteralPath $path)) {
        $result.reasons += "no evidence at $path"
        return [pscustomobject]$result
    }

    try {
        $delivery = Get-Content -LiteralPath $path -Raw | ConvertFrom-Json
    } catch {
        $result.reasons += 'evidence file is unparseable'
        return [pscustomobject]$result
    }

    $gates = @($delivery.gates)
    $missing = @($script:GateOrder | Where-Object {
            $id = $_
            -not ($gates | Where-Object { $_.id -eq $id })
        })
    if ($missing.Count -gt 0) {
        $result.reasons += "gates missing from evidence: $($missing -join ', ')"
    }

    $failed = @($gates | Where-Object { $_.status -eq 'FAIL' -or $_.status -eq 'BLOCKED' })
    $open = @($gates | Where-Object { $_.status -eq 'NOT RUN' -or $_.status -eq 'NOT APPLICABLE' })

    foreach ($gate in @($gates | Where-Object { $_.status -eq 'PASS' })) {
        if ($null -ne $gate.exitCode -and [int]$gate.exitCode -ne 0) {
            $result.reasons += "$($gate.id) marked PASS with exitCode $($gate.exitCode)"
        }
        foreach ($item in @($gate.evidence)) {
            if ($item -and -not (Test-Path -LiteralPath (Join-Path $root $item))) {
                $result.reasons += "$($gate.id) evidence missing: $item"
            }
        }
    }

    if ($delivery.digest -and $delivery.digest.hash) {
        $current = Get-SourceDigest -AppPath $root
        $result.digest = $delivery.digest.hash
        if ($current.hash -ne $delivery.digest.hash) {
            $result.verdict = 'STALE'
            $result.reasons += 'source changed since the pipeline ran (digest mismatch)'
            return [pscustomobject]$result
        }
    } else {
        $result.reasons += 'evidence has no source digest'
    }

    $isDeliverable = ($delivery.overall -eq 'PASS') -and
        ($failed.Count -eq 0) -and
        ($open.Count -eq 0) -and
        ($missing.Count -eq 0) -and
        ($result.reasons.Count -eq 0)

    if ($isDeliverable) {
        $result.verdict = 'DELIVERABLE'
        $result.exitCode = 0
    } elseif ($failed.Count -gt 0 -or $delivery.overall -eq 'FAIL') {
        $result.verdict = 'FAILED'
    } elseif ($open.Count -gt 0 -or $delivery.overall -eq 'PARTIAL') {
        $result.verdict = 'PARTIAL'
    } else {
        $result.verdict = 'INCONSISTENT'
    }

    return [pscustomobject]$result
}

Export-ModuleMember -Function `
    Get-GateOrder, Get-SourceManifest, Get-SourceDigest, `
    Initialize-Delivery, Update-DeliveryGate, Complete-Delivery, Test-DeliveryValidity
