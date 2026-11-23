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
        2. Numeric pixel dimensions on .Width / .Height
        3. Width/Height/Shadow/Rounded assigned a full utility ("w-full", "shadow-md")
           instead of a suffix ("full", "md") — the framework doubles the prefix
        4. Raw* / ReadMe property access, capital Set* designer calls, static layout
           tokens in .Classes, w-screen, default placeholder text, self-calling modules,
           mojibake / non-ASCII string literals

      WARN (exit 0, advisory) = likely issues to review:
        5. Tailwind arbitrary values in .Classes (bg-[#..], text-[12px]) — ALLOWED, but
           flagged when applied to themed components where tokens would preserve theme switching
        6. Inline <style> blocks — use .Classes / .Styles / app-level CSS instead (advisory only)
        7. Raw HTML tags (<html>, <div>, <button class=, etc.)
        8. Possibly-invented setters (.setX where X isn't documented)
        9. Sub Show missing pgIndex.App + ClearPageView in first 3 statements

      SLOP (WARN by default, FAIL with -StrictSlop) = visual slop floor:
        SLOP-001  transition-all in .Classes (animates layout; use transform/opacity)
        SLOP-002  motion utility without a motion-safe: guard (prefers-reduced-motion)
        SLOP-003  placeholder image service hotlinked (ship assets locally)
        SLOP-004  the same generic CTA label three or more times on one page
        SLOP-005  data source referenced but no SDUI5Skeleton loading state
        SLOP-006  no curated font injected in pgIndex.bas
        SLOP-007  no boundary container (max-w-* + mx-auto) anywhere in the app

    This is advisory shift-left. verify-conformance.ps1 remains the L5 gate.

    Exit codes: 0 = clean or WARN-only, 1 = any FAIL, 2 = bad arguments.

.PARAMETER AppFolder
    The generated app folder (contains <AppName>.b4j + pgIndex.bas + pg*.bas).

.PARAMETER StrictSlop
    Promote SLOP-* findings from WARN to FAIL. Use for a release gate; leave off for
    incremental work so existing apps do not go red on first adoption.

.EXAMPLE
    ./pre-scan.ps1 -AppFolder C:\b4j\workspace\MyApp
#>

param(
    [Parameter(Mandatory = $true)][string]$AppFolder,
    [switch]$StrictSlop
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

# --- Regexes (case-insensitive; B4J is case-insensitive) ---
$hexColorRe    = '\.Color\s*=\s*"#([0-9A-Fa-f]{3,8})"'
$hexTwRe       = '(bg|text|border|fill|stroke)-\[#[0-9A-Fa-f]{3,8}\]'
$rawHtmlRe     = '<\s*(html|head|body|div|span|button|input|select|textarea|form|p|a|img|table|tr|td|th|ul|ol|li|h[1-6]|section|article|main|header|footer|nav|aside|style)\b'
$inlineStyleRe = '<\s*style\b'
$numericWidthRe = '\.(Width|Height)\s*=\s*\d+(\.\d+)?\s*$'
$rawPropertyRe = '\.(RawContent|RawSteps|RawOptions|RawChildKeys|RawChildIcons|RawImages|RawClasses|RawStyles|RawAttributes)\s*='
$readmePropertyRe = '\.ReadMe\s*='
$setterRe      = '\.set([A-Z][A-Za-z0-9_]*)\s*\('
$capitalSetPropRe = '\.(SetPositionStyle|SetPosition|SetMarginAXYTBLR|SetPaddingAXYTBLR|SetClasses|SetStyles|SetAttributes)\s*\('
$prefixedPropertyValueRe = '\.(?<prop>Width|Height|Shadow|Rounded)\s*=\s*"(?<val>[^"]*)"'
# --- Documented setters allowlist (source of truth: framework_setters.json or fallback) ---
$settersJsonPath = Join-Path $PSScriptRoot "framework_setters.json"
$docSettersLookup = @{}
if (Test-Path $settersJsonPath) {
    $rawList = Get-Content $settersJsonPath -Raw | ConvertFrom-Json
    foreach ($s in $rawList) { $docSettersLookup[$s.ToLower()] = $true }
} else {
    $fallbackSetters = @(
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
        'setLegend','setItemsSpec','setBorder','setStepsColor','setOverflowXAuto'
    )
    foreach ($s in $fallbackSetters) { $docSettersLookup[$s.ToLower()] = $true }
}

# Component-specific property support: Shadow/Rounded are not on every component.
$provPath = Join-Path $PSScriptRoot '..\..\sithasodaisy5\references\component-provenance.json'
$componentProps = @{}
if (Test-Path -LiteralPath $provPath) {
    try {
        $prov = Get-Content -LiteralPath $provPath -Raw -Encoding UTF8 | ConvertFrom-Json
        foreach ($p in $prov.components.PSObject.Properties) {
            $componentProps[$p.Name] = @($p.Value.props)
        }
    } catch {
        Write-Host ("WARN: could not read component provenance " + $provPath + ": " + $_.Exception.Message) -ForegroundColor Yellow
    }
}

function Scan-File([System.IO.FileInfo]$File) {
    $findings = @()
    $slopSev = if ($StrictSlop) { 'FAIL' } else { 'WARN' }
    # Encoding Gate: Ensure UTF-8 without BOM (RULE-ENCODING-001)
    $bytes = [System.IO.File]::ReadAllBytes($File.FullName)
    if ($bytes.Length -ge 3 -and $bytes[0] -eq 0xEF -and $bytes[1] -eq 0xBB -and $bytes[2] -eq 0xBF) {
        $findings += [PSCustomObject]@{ Sev='FAIL'; Line=1; Msg="File '$($File.Name)' contains UTF-8 BOM (Byte Order Mark). B4J requires UTF-8 WITHOUT BOM; BOM breaks compiler header detection (B4J=true)." }
    }

    $src = Get-Content -LiteralPath $File.FullName -Raw -Encoding UTF8 -ErrorAction Stop
    $lines = $src -split "`r?`n"
    $inGlobals = $false
    $varTypes = @{}
    foreach ($decl in [regex]::Matches($src, '(?m)^\s*(?:Private|Public|Dim)\s+([A-Za-z_]\w*)\s+As\s+(SDUI5[A-Za-z0-9_]+)\b')) {
        $varTypes[$decl.Groups[1].Value] = $decl.Groups[2].Value
    }

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        $no = $i + 1
        $trimmed = $line.Trim()

        if ($trimmed -match '^(?i)Sub\s+(Process|Class)_Globals\b') {
            $inGlobals = $true
            continue
        }
        if ($inGlobals -and $trimmed -match '^(?i)End\s+Sub\b') {
            $inGlobals = $false
            continue
        }

        if ($inGlobals) {
            if ($trimmed -match '^(?i)(Private|Public)\s+([A-Za-z0-9_]+)\s+As\s+(SDUI5[A-Za-z0-9_]+|BANano\b|BANanoElement\b|SDUI[A-Za-z0-9_]+)\b') {
                if ($trimmed -notmatch "(?i)['']ignore\b") {
                    $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Component variable '$($matches[2])' in $($File.Name) declared in globals must be suffixed with ''ignore' to prevent B4J compiler warnings: '$trimmed'" }
                }
            }
        }

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
        # Property-Value Prefix Gate (RULE-PROP-002): Width/Height/Shadow/Rounded take a SUFFIX.
        # UIShared.FixSize / FixShadow / FixRounded prepend the utility prefix, so a full utility
        # ("w-full", "shadow-md") becomes "w-w-full" / "shadow-shadow-md" — a class that does not exist.
        if ($line -match $prefixedPropertyValueRe) {
            $prop = $Matches['prop']
            $val = $Matches['val']
            $bad = $false
            $expected = ''
            $doubled = ''
            switch ($prop.ToLower()) {
                'width'   { if ($val -match '^w-')      { $bad = $true; $expected = 'full / 64 / screen';                  $doubled = "w-$val" } }
                'height'  { if ($val -match '^h-')      { $bad = $true; $expected = 'full / 64 / screen';                  $doubled = "h-$val" } }
                'shadow'  { if ($val -match '^shadow-' -and $val -ne 'shadow') { $bad = $true; $expected = 'md / lg / shadow'; $doubled = "shadow-$val" } }
                'rounded' { if ($val -match '^rounded-' -and $val -notin @('rounded','rounded-full')) { $bad = $true; $expected = 'box / lg / rounded / rounded-full'; $doubled = "rounded-$val" } }
            }
            if ($bad) {
                $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg=".$prop expects a suffix, not a full utility: '$val' becomes '$doubled'. Use .$prop = `"<suffix>`" (allowed: $expected)." }
            }
        }
        if ($line -match $rawPropertyRe) {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="B4X property assignment must not include 'Raw': $($line.Trim()). Use .Content, .Steps, .Options, .ChildKeys, etc." }
        }
        if ($line -match $readmePropertyRe) {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="ReadMe is purely designer-only layout metadata: $($line.Trim()). It has no setter or getter and must never be referenced in code." }
        }
        # Property-First Rule: Banned capital Set* on designer properties (RULE-PROP-001)
        if ($line -match $capitalSetPropRe) {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Designer properties must use property assignment syntax (.Property = value), not callable method '$($Matches[1])'." }
        }
        # Property-First Rule: static layout/spacing token leak in .Classes (RULE-PROP-001).
        # Token-based, so responsive variants (md:w-1/2), caps (max-w-full, min-h-screen) and
        # drop-shadow-* are not misread as property-first violations.
        if ($line -match '(?<receiver>[A-Za-z_][A-Za-z0-9_]*)\.Classes\s*=\s*"(?<classes>[^"]*)"') {
            $receiver = $Matches['receiver']
            $classStr = $Matches['classes']
            foreach ($tok in ($classStr -split '\s+')) {
                if (-not $tok) { continue }
                if ($tok.Contains(':')) { continue }
                if ($tok -match '\[[^\]]+\]') { continue }
                if ($tok -match '^(max|min)-(w|h)-') { continue }
                if ($tok -match '^drop-shadow-') { continue }
                if ($tok -in @('w-screen', 'h-screen', 'mx-auto')) { continue }
                $targetProp = $null
                if ($tok -match '^(m[trblxy]?)-') { $targetProp = 'MarginAXYTBLR' }
                elseif ($tok -match '^(p[trblxy]?)-') { $targetProp = 'PaddingAXYTBLR' }
                elseif ($tok -match '^w-') { $targetProp = 'Width' }
                elseif ($tok -match '^h-') { $targetProp = 'Height' }
                elseif ($tok -match '^shadow($|-(sm|md|lg|xl|2xl|xs|2xs|inner|none)$)') { $targetProp = 'Shadow' }
                elseif ($tok -match '^rounded(-|$)') { $targetProp = 'Rounded' }
                elseif ($tok -match '^(relative|absolute|fixed|sticky|static)$') { $targetProp = 'PositionStyle' }
                if (-not $targetProp) { continue }
                if ($componentProps.Count -gt 0 -and $varTypes.ContainsKey($receiver)) {
                    $type = $varTypes[$receiver]
                    if (-not ($componentProps.ContainsKey($type) -and ($componentProps[$type] -contains $targetProp))) { continue }
                }
                $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Static/unprefixed token '$tok' in .Classes violates Property-First rule. Assign via component property (.MarginAXYTBLR, .PaddingAXYTBLR, .Width, .Height, .Shadow, .Rounded, .PositionStyle, .Position). Reserve .Classes for responsive overrides (md:...) or animations." }
                break
            }
        }
        # Visual Defect Check: Default placeholder pollution
        if ($line -match '(?i)\.(Title|Content|Text)\s*=\s*"(Card Title|Card Content|Lorem ipsum[^"]*)"') {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Default framework placeholder text '$($Matches[2])' detected in $($File.Name). Explicitly overwrite with product copy or clear defaults via .Title = `"`" (RULE-DEFAULTS-001)." }
        }
        # Visual Defect Check: w-screen horizontal overflow trap
        if ($line -match '(?i)\.Classes\s*=\s*"[^"]*\bw-screen\b[^"]*"') {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="w-screen utility in .Classes causes horizontal page overflow in web browsers. Use w-full or max-w-* containers instead." }
        }
        # --- SLOP floor: machine-checkable visual slop (see references/anti-slop.md) ---
        $classMatch = [regex]::Match($line, '\.Classes\s*=\s*"([^"]*)"')
        if ($classMatch.Success) {
            $classStr = $classMatch.Groups[1].Value
            # SLOP-001: transition-all animates layout + paint; composite only.
            if ($classStr -match '\btransition-all\b') {
                $findings += [PSCustomObject]@{ Sev=$slopSev; Line=$no; Msg="SLOP-001 transition-all in $($File.Name) animates every property and causes layout jank. Use transition-transform or transition-[transform,box-shadow]." }
            }
            # SLOP-002: motion must respect prefers-reduced-motion.
            foreach ($tok in ($classStr -split '\s+')) {
                if (-not $tok) { continue }
                if ($tok -match '^motion-(safe|reduce):') { continue }
                $motion = ($tok -match '^(hover|active|focus|group-hover):' -and $tok -match '(translate|scale|rotate)-') -or ($tok -match '^animate-' -and $tok -notmatch '^animate-none')
                if ($motion) {
                    $findings += [PSCustomObject]@{ Sev=$slopSev; Line=$no; Msg="SLOP-002 '$tok' in $($File.Name) has no motion-safe: guard. Prefix it (motion-safe:$tok) so prefers-reduced-motion is respected." }
                }
            }
        }
        # SLOP-003: placeholder services must never be shipped.
        if ($line -match '\.(Image|RightImage|BackgroundImage|Src)\s*=\s*"([^"]*)"') {
            $imgVal = $Matches[2]
            if ($imgVal -match '(?i)(unsplash\.com|picsum\.photos|placehold\.|via\.placeholder|dummyimage|loremflickr)') {
                $findings += [PSCustomObject]@{ Sev=$slopSev; Line=$no; Msg="SLOP-003 placeholder/stock image service referenced in $($File.Name). Ship a verified local asset under ./assets/ instead." }
            }
        }
        $selfCallRe = "\bBANano\.Await\(\s*$([regex]::Escape($File.BaseName))\.Show\s*\)"
        if ($line -match $selfCallRe) {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Self-calling module via BANano.Await($($File.BaseName).Show) in $($File.Name) fails compilation. Use BANano.Await(Show)." }
        }
        # Encoding / Mojibake Gate: Detect corrupted characters (RULE-ENCODING-002)
        if ($line -match '(\uFFFD|\?{3,}|\u00E2\u20AC|\u00E2\u2020|\u00C3\u2014|\u00C3\u00A9)') {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Mojibake / unprintable character sequence detected in $($File.Name). Keep files strictly UTF-8 without BOM. Use pure ASCII, HTML entities (&rarr;, &mdash;, &bull;), or FontAwesome/Heroicons." }
        }
        # Non-ASCII in string literal check (RULE-ENCODING-003: Hard Gate)
        $quoteMatch = [regex]::Match($line, '"([^"]+)"')
        if ($quoteMatch.Success) {
            $hasHighChar = $false
            foreach ($ch in $quoteMatch.Groups[1].Value.ToCharArray()) {
                if ([int]$ch -gt 127) { $hasHighChar = $true; break }
            }
            if ($hasHighChar) {
                $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$no; Msg="Non-ASCII character in string literal in $($File.Name): $($line.Trim().Substring(0, [Math]::Min(100, $line.Trim().Length))). B4J/Java compiler will corrupt this on Windows into unprintable characters (mojibake). Use pure ASCII, HTML entities (&uarr;, &darr;, &rarr;, &mdash;, &bull;), or FontAwesome/Heroicons." }
            }
        }

        # Invented setters - skip lines that are comments or Sub declarations
        foreach ($m in [regex]::Matches($line, $setterRe)) {
            $setterName = 'set' + $m.Groups[1].Value
            if (-not $docSettersLookup.ContainsKey($setterName.ToLower())) {
                $before = $line.Substring(0, $m.Index)
                if ($before.Contains("'") -or $before -match '\bSub\b') { continue }
                $findings += [PSCustomObject]@{ Sev='WARN'; Line=$no; Msg="possibly invented setter .$setterName - verify in components/<Name>.md" }
            }
        }
    }

    # Table column order (RULE-TABLE-001): AddColumn* appends to the live DOM.
    $addCompLine = @{}
    $addColCalls = @()
    for ($i = 0; $i -lt $lines.Count; $i++) {
        $t = $lines[$i].Trim()
        if ($t.StartsWith("'")) { continue }
        if ($t -match '(?i)\b([A-Za-z_]\w*)\.AddComponent\b') {
            $v = $Matches[1].ToLower()
            if (-not $addCompLine.ContainsKey($v)) { $addCompLine[$v] = $i + 1 }
        }
        if ($t -match '(?i)\b([A-Za-z_]\w*)\.AddColumn[A-Za-z]*\s*\(') {
            $addColCalls += [PSCustomObject]@{ Var = $Matches[1].ToLower(); Line = $i + 1 }
        }
    }
    foreach ($ac in $addColCalls) {
        $compLine = 0
        if ($addCompLine.ContainsKey($ac.Var)) { $compLine = $addCompLine[$ac.Var] }
        if ($compLine -eq 0 -or $ac.Line -lt $compLine) {
            $findings += [PSCustomObject]@{ Sev='FAIL'; Line=$ac.Line; Msg="Column added before AddComponent: '$($ac.Var).AddColumn*' at line $($ac.Line), AddComponent at line $compLine. AddColumn* appends <th>/<td> immediately; pre-build calls are silently swallowed, leaving a headerless table. Move it after BANano.Await($($ac.Var).AddComponent) (RULE-TABLE-001)." }
        }
    }

    # Companion Parent-Child Component Hierarchy Check (RULE-LAYOUT-005)
    $companionMap = @{
        'sdui5statitem'       = 'sdui5stat'
        'sdui5stepsitem'      = 'sdui5steps'
        'sdui5timelineitem'   = 'sdui5timeline'
        'sdui5tabsitem'       = 'sdui5tabs'
        'sdui5menuitem'       = 'sdui5menu'
        'sdui5listitem'       = 'sdui5list'
        'sdui5carouselitem'   = 'sdui5carousel'
        'sdui5slideritem'     = 'sdui5slider'
        'sdui5swiperslide'    = 'sdui5swiper'
        'sdui5footertitle'    = 'sdui5footer'
    }

    $varToType = @{}
    $declMatches = [regex]::Matches($src, '(?m)^\s*(?:Private|Public|Dim)\s+([A-Za-z0-9_]+)\s+As\s+(SDUI5[A-Za-z0-9_]+)')
    foreach ($dm in $declMatches) {
        $varToType[$dm.Groups[1].Value.ToLower()] = $dm.Groups[2].Value.ToLower()
    }
    $initMatches = [regex]::Matches($src, '([A-Za-z0-9_]+)\.Initialize\s*\(\s*Me\s*,\s*"([^"]+)"')
    foreach ($im in $initMatches) {
        $vName = $im.Groups[1].Value.ToLower()
        $cId = $im.Groups[2].Value.ToLower()
        if ($varToType.ContainsKey($vName)) {
            $varToType[$cId] = $varToType[$vName]
        }
    }

    $parentMatches = [regex]::Matches($src, '(?m)^\s*([A-Za-z0-9_]+)\.ParentID\s*=\s*(?:"([^"]+)"|([A-Za-z0-9_.]+))')
    foreach ($pm in $parentMatches) {
        $vName = $pm.Groups[1].Value.ToLower()
        if ($varToType.ContainsKey($vName) -and $companionMap.ContainsKey($varToType[$vName])) {
            $childType = $varToType[$vName]
            $expectedParent = $companionMap[$childType]
            $target = if ($pm.Groups[2].Success -and $pm.Groups[2].Value) { $pm.Groups[2].Value.ToLower() } else { $pm.Groups[3].Value.ToLower() }
            
            if ($varToType.ContainsKey($target)) {
                $actualTargetType = $varToType[$target]
                if ($actualTargetType -ne $expectedParent) {
                    $findings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="Component '$($pm.Groups[1].Value)' in $($File.Name) ($childType) is mounted to '$target' ($actualTargetType). $childType MUST mount into an instance of $expectedParent (RULE-LAYOUT-005)." }
                }
            } else {
                if ($src -notmatch "(?i)\bAs\s+$expectedParent\b") {
                    $findings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="Component '$($pm.Groups[1].Value)' in $($File.Name) ($childType) has ParentID '$target', but no $expectedParent container exists in this module (RULE-LAYOUT-005)." }
                } elseif ($target -match '(?i)column|row|container|pageview|drawer') {
                    $findings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="Component '$($pm.Groups[1].Value)' in $($File.Name) ($childType) is mounted directly into layout container '$target'. It MUST mount into an instance of $expectedParent (RULE-LAYOUT-005)." }
                }
            }
        }
    }

    # Context-Aware Default Warning: SDUI5Card mounted to SDUI5Column should set Width = "full"
    foreach ($pm in $parentMatches) {
        $vName = $pm.Groups[1].Value.ToLower()
        if ($varToType.ContainsKey($vName) -and $varToType[$vName] -eq 'sdui5card') {
            $target = if ($pm.Groups[2].Success -and $pm.Groups[2].Value) { $pm.Groups[2].Value.ToLower() } else { $pm.Groups[3].Value.ToLower() }
            if ($varToType.ContainsKey($target) -and $varToType[$target] -eq 'sdui5column') {
                $widthAssigned = $src -match "(?i)\b$vName\.Width\s*=\s*`"full`""
                if (-not $widthAssigned) {
                    $findings += [PSCustomObject]@{ Sev='WARN'; Line=0; Msg="Card '$($pm.Groups[1].Value)' in $($File.Name) is mounted to column '$target' without explicit .Width = `"full`". SDUI5Card defaults to Width = '96' (384px fixed), which can overflow or misalign responsive grid cells." }
                }
            }
        }
    }

    # Accent Rarity check: Warn if more than 1 primary button exists on a single page
    $primaryBtnMatches = [regex]::Matches($src, '(?i)\b([A-Za-z0-9_]+)\.Color\s*=\s*"primary"')
    $primaryBtns = @()
    foreach ($pbm in $primaryBtnMatches) {
        $btnVar = $pbm.Groups[1].Value.ToLower()
        if ($varToType.ContainsKey($btnVar) -and $varToType[$btnVar] -match '(?i)button') {
            $primaryBtns += $btnVar
        }
    }
    if ($primaryBtns.Count -gt 1) {
        $findings += [PSCustomObject]@{ Sev='WARN'; Line=0; Msg="Multiple primary buttons ($($primaryBtns -join ', ')) in $($File.Name). Violates Accent Rarity (one primary CTA per viewport; demote secondary actions to 'neutral', 'ghost', or 'outline' per design-craft-guide.md)." }
    }

    # SLOP-004: the same generic CTA label repeated is a template smell.
    $ctaCounts = @{}
    foreach ($m in [regex]::Matches($src, '\.(?:Text|Title)\s*=\s*"([^"]{2,40})"')) {
        $label = $m.Groups[1].Value.Trim()
        if ($label -match '(?i)^(get started|learn more|sign up|try it free|contact us|buy now|shop now|submit|continue)$') {
            if ($ctaCounts.ContainsKey($label)) { $ctaCounts[$label]++ } else { $ctaCounts[$label] = 1 }
        }
    }
    foreach ($k in $ctaCounts.Keys) {
        if ($ctaCounts[$k] -ge 3) {
            $findings += [PSCustomObject]@{ Sev=$slopSev; Line=0; Msg="SLOP-004 CTA label '$k' repeated $($ctaCounts[$k])x in $($File.Name). Keep one primary action; reword or demote the repeats." }
        }
    }

    # SLOP-005: a page that loads data must show a loading state.
    if ($src -match '(?i)\b(SDUIFetch|SDUIRestApi|SDUIPocketBase|SDUIMySQLREST|SDUIMySQLRESTNative|SDUIPouchDB|SDUIGoogleSheetsAPI)\b' -and $src -notmatch '(?i)\bSDUI5Skeleton\b') {
        $findings += [PSCustomObject]@{ Sev=$slopSev; Line=0; Msg="SLOP-005 $($File.Name) references a data source but mounts no SDUI5Skeleton loading state. See references/state-recipes.md." }
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

# Environment check: env.json required
$hasEnvJson = (Test-Path (Join-Path $AppFolder "Files\env.json")) -or (Test-Path (Join-Path $AppFolder "assets\env.json"))
if (-not $hasEnvJson) {
    $allFindings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="env.json missing from Files/ and assets/. SithasoDaisy5 runtime requires env.json." }
}

foreach ($f in $pgFiles) {
    try {
        $allFindings += Scan-File $f
    } catch {
        $allFindings += [PSCustomObject]@{ Sev='FAIL'; Line=0; Msg="Cannot read file $($f.Name): $($_.Exception.Message)" }
    }
}

# --- SLOP-006 / SLOP-007: app-level design floor ---
$slopSevApp = if ($StrictSlop) { 'FAIL' } else { 'WARN' }

$indexFile = Join-Path $AppFolder "pgIndex.bas"
if (Test-Path -LiteralPath $indexFile) {
    $indexSrc = Get-Content -LiteralPath $indexFile -Raw -Encoding UTF8
    $hasCuratedFont = ($indexSrc -match '(?i)fonts\.googleapis\.com') -or
                      ($indexSrc -match '(?i)LoadAssetsOnDemand\([^)]*font') -or
                      ($indexSrc -match '(?i)\./assets/[^"]*\.(woff2?|css)') -or
                      ($indexSrc -match '(?i)@font-face') -or
                      ($indexSrc -match 'font-\[')
    if (-not $hasCuratedFont) {
        $allFindings += [PSCustomObject]@{ Sev=$slopSevApp; Line=0; Msg="SLOP-006 pgIndex.bas injects no curated font, so the app renders in the browser system font. Ship a local font under Files/ (preferred) or declare a remote font per design-craft-guide.md section 5." }
    }
}

$appSrc = ($pgFiles | ForEach-Object { Get-Content -LiteralPath $_.FullName -Raw -Encoding UTF8 }) -join "`n"
$hasBoundary = ($appSrc -match '(?i)\.Classes\s*=\s*"[^"]*\bmax-w-') -and (
    ($appSrc -match '(?i)\bmx-auto\b') -or
    ($appSrc -match '(?i)\.MarginAXYTBLR\s*=\s*"[^"]*\bx\s*=\s*auto')
)
if (-not $hasBoundary) {
    $allFindings += [PSCustomObject]@{ Sev=$slopSevApp; Line=0; Msg="SLOP-007 no boundary container found (max-w-* plus mx-auto). Page content is unbounded and will read as a stretched scaffold." }
}

$failCount = @($allFindings | Where-Object { $_.Sev -eq 'FAIL' }).Count
$warnCount = @($allFindings | Where-Object { $_.Sev -eq 'WARN' }).Count

Write-Host ""
Write-Host "=== PRE-SCAN (negative-knowledge bans + SLOP floor) ===" -ForegroundColor Cyan
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
if (-not $StrictSlop) { Write-Host "SLOP findings are advisory (WARN). Re-run with -StrictSlop to gate a release." -ForegroundColor DarkGray }

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
