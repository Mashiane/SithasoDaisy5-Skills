<#
.SYNOPSIS
    Validate web skill suite structure (working tree or dist/).
.DESCRIPTION
    Checks: every skills/*/SKILL.md has name:/description: frontmatter;
    plugin.json skills resolve to directories (sd5-book-to-skill intentionally
    excluded from plugin); skills-registry.json ids have entries; registry
    versions match plugin version. Exit 0 = PASS, 1 = FAIL.
#>
param([string]$Root = (Split-Path -Parent $PSScriptRoot))
$ErrorActionPreference = "Stop"
$fail = @()
$plugin = Get-Content -LiteralPath (Join-Path $Root "plugin.json") -Raw | ConvertFrom-Json
$regPath = Join-Path $Root "skills-registry.json"
$reg = if (Test-Path -LiteralPath $regPath) { Get-Content -LiteralPath $regPath -Raw | ConvertFrom-Json } else { $null }
$dirs = Get-ChildItem -LiteralPath (Join-Path $Root "skills") -Directory | ForEach-Object { $_.Name }
foreach ($d in $dirs) {
    $sk = Join-Path $Root "skills/$d/SKILL.md"
    if (-not (Test-Path -LiteralPath $sk)) { $fail += "${d}: SKILL.md missing"; continue }
    $head = (Get-Content -LiteralPath $sk -TotalCount 8) -join "`n"
    if ($head -notmatch '(?m)^name:\s*\S+') { $fail += "${d}: frontmatter name: missing" }
    if ($head -notmatch '(?m)^description:\s*\S+') { $fail += "${d}: frontmatter description: missing" }
}
foreach ($s in $plugin.skills) {
    if ($dirs -notcontains $s) { $fail += "plugin.json lists missing dir: $s" }
}
if ($reg) {
    foreach ($s in $reg.skills) {
        $entry = Join-Path $Root $s.entry
        if (-not (Test-Path -LiteralPath $entry)) { $fail += "registry $($s.id): entry missing ($($s.entry))" }
        if ($s.version -ne $plugin.version) { $fail += "registry $($s.id): version $($s.version) != plugin $($plugin.version)" }
    }
    $regIds = $reg.skills | ForEach-Object { $_.id }
    foreach ($s in $plugin.skills) { if ($regIds -notcontains $s) { $fail += "registry missing plugin skill: $s" } }
}

# code smell scan (advisory WARN; does not affect PASS/FAIL)
$smellPatterns = @(
    @{Pattern='\b\d{4,}\b';                    Category='Obfuscators';        Msg='Magic number literal (consider named constant)'}
    @{Pattern='^.{120,}$';                     Category='Bloaters';           Msg='Line exceeds 120 chars (Long Method / Formatting)'}
    @{Pattern='\b(true|false)\b';              Category='Lexical Abusers';    Msg='Raw boolean literal (Boolean Blindness)'}
    @{Pattern='(def|function|Sub)\s+\w+.*\n(\s.*\n){30,}'; Category='Bloaters';   Msg='Long method/function (>30 lines)'}
    @{Pattern='^\s*#.*(if|for|while|def|Function|Sub)\b';    Category='Dispensables'; Msg='Commented-out code block (Dead Code)'}
    @{Pattern='\.\w+\(\s*\)\.\w+\(\s*\)\.\w+'; Category='Couplers';           Msg='Message chain (Law of Demeter violation)'}
    @{Pattern='\b(get|set|add|put|store|save|load|fetch)\w*\b'; Category='Lexical Abusers'; Msg='Check naming consistency (Inconsistent Names)'}
    @{Pattern='\b(var|str|int|bool|list|arr|obj|num)\w*\b'; Category='Lexical Abusers'; Msg='Type embedded in name (Hungarian notation)'}
    @{Pattern='\b(temp|tmp|data|val|m1|m2|x|y|z)\b';        Category='Lexical Abusers'; Msg='Uncommunicative name'}
)

$mdFiles = Get-ChildItem -LiteralPath (Join-Path $Root 'skills') -Recurse -Filter '*.md' -File -ErrorAction SilentlyContinue
$pyFiles = Get-ChildItem -LiteralPath (Join-Path $Root 'skills') -Recurse -Filter '*.py' -File -ErrorAction SilentlyContinue
$basFiles = Get-ChildItem -LiteralPath (Join-Path $Root 'skills') -Recurse -Filter '*.bas' -File -ErrorAction SilentlyContinue
$b4jFiles = Get-ChildItem -LiteralPath (Join-Path $Root 'skills') -Recurse -Filter '*.b4j' -File -ErrorAction SilentlyContinue
$jsonFiles = Get-ChildItem -LiteralPath (Join-Path $Root 'skills') -Recurse -Filter '*.json' -File -ErrorAction SilentlyContinue
$allFiles = @($mdFiles) + @($pyFiles) + @($basFiles) + @($b4jFiles) + @($jsonFiles)

foreach ($f in $allFiles) {
    $text = Get-Content -LiteralPath $f.FullName -Raw
    foreach ($sp in $smellPatterns) {
        if ($text -match $sp.Pattern) {
            Write-Host "  [SMELL:$($sp.Category)] $($sp.Msg) in $($f.FullName.Replace($Root,''))" -ForegroundColor Yellow
        }
    }
}

Write-Host ""
Write-Host "=== VALIDATE SKILLS ($Root) ==="
if ($fail.Count -eq 0) { Write-Host "PASS - $($dirs.Count) skill dirs, $($plugin.skills.Count) plugin skills, registry consistent"; exit 0 }
foreach ($e in $fail) { Write-Host "  [FAIL] $e" -ForegroundColor Red }
Write-Host ""; Write-Host "RESULT: FAIL"; exit 1
