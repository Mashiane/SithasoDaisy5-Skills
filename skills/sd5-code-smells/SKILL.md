---
name: sd5-code-smells
description: Detect and remediate code smells from codesmells.org catalog across SithasoDaisy5 skills — markdown, B4J code, Python scripts, JSON configs
metadata:
  category: quality
  triggers: code-smell, quality, refactoring, validation, clean-code, codesmells-org
---

# SithasoDaisy5 Code Smell Detection

This skill detects and remediates code smells from the [Code Smells Catalog](https://www.codesmells.org/) across SithasoDaisy5-Skills repository — covering skill markdown files, B4J/BANano code samples, Python scripts, and JSON configuration.

## 🎯 Purpose

Map the 56 peer-reviewed code smells to this project's artifacts and provide automated detection via the existing validation pipeline.

## 📦 Scope

| Artifact Type | Smell Categories |
|---|---|
| Skill markdown (SKILL.md, references/*.md) | Lexical, Linguistic, Dispensables, Obfuscators |
| B4J/BANano code samples (references/*.bas, *.b4j) | Bloaters, Object-Oriented Abusers, Change Preventers |
| Python scripts (scripts/*.py) | Functional Abusers, Data Dealers, Couplers |
| JSON configs (skills-registry.json, component-*.json, env.json) | Data Clumps, Primitive Obsession |

## 🔍 Detection Rules

### 1. Lexical Abusers (Markdown/Documentation)
| Smell | Detection | Fix |
|---|---|---|
| **Fallacious Comment** | Comment contradicts code behavior | Update or remove |
| **Fallacious Method Name** | Method name doesn't match behavior | Rename to match |
| **Uncommunicative Name** | Single-letter or abbreviated names | Use intention-revealing names |
| **Inconsistent Names** | Same concept, different terms | Standardize vocabulary |
| **Type Embedded in Name** | `varString`, `listItems` | Remove type from name |
| **What Comment** | Comments narrating what code does | Extract to well-named function |

### 2. Bloaters (B4J Code / Python)
| Smell | Detection | Fix |
|---|---|---|
| **Long Method** | > 30 lines / > 100 chars wide | Extract method |
| **Large Class** | > 500 lines / > 20 methods | Split by responsibility |
| **Long Parameter List** | > 4 parameters | Introduce parameter object |
| **Data Clump** | Same 3+ params travel together | Create object/DTO |
| **Primitive Obsession** | Phone as string, price as float | Create domain types |

### 3. Object-Oriented Abusers (B4J / Skill Structure)
| Smell | Detection | Fix |
|---|---|---|
| **Feature Envy** | Method uses another class's data more than own | Move method |
| **Data Class** | Class holds data, no behavior | Add behavior or make struct |
| **Refused Bequest** | Subclass throws NotImplemented | Favor composition |
| **Inappropriate Static** | Static method hard to mock | Instance method + DI |

### 4. Change Preventers (Cross-file)
| Smell | Detection | Fix |
|---|---|---|
| **Shotgun Surgery** | One change → many files | Consolidate related logic |
| **Divergent Change** | Class changes for multiple reasons | Split by reason |
| **Parallel Inheritance** | Add subclass A → must add subclass B | Flatten hierarchy |

### 5. Dispensables (All)
| Smell | Detection | Fix |
|---|---|---|
| **Duplicated Code** | Same logic in 3+ places | Extract common function |
| **Dead Code** | Unreachable / unreferenced | Delete |
| **Speculative Generality** | Unused abstraction for "future" | YAGNI — remove |
| **Lazy Element** | Class with 1 method delegating | Inline |

### 6. Couplers (Cross-boundary)
| Smell | Detection | Fix |
|---|---|---|
| **Message Chain** | `a.getB().getC().doX()` | Hide delegation |
| **Middle Man** | Class only delegates | Remove indirection |
| **Insider Trading** | Classes share private details | Define clear interface |

### 7. Obfuscators (Readability)
| Smell | Detection | Fix |
|---|---|---|
| **Complicated Boolean** | Nested &&/||/! hard to parse | Extract predicate method |
| **Magic Number** | Bare literal (86400, 1024) | Named constant |
| **Vertical Separation** | Declaration far from use | Move declaration down |
| **Inconsistent Style** | Mixed formatting conventions | Auto-format |

### 8. Functional Abusers (Python / Scripts)
| Smell | Detection | Fix |
|---|---|---|
| **Side Effects** | Function modifies global state | Return value instead |
| **Mutable Data** | Global variables modified anywhere | Encapsulate + immutability |
| **Imperative Loops** | Manual index tracking | Use comprehensions/generators |

## 🛠️ Integration: Extend validate-skills.ps1

Add to `tools/validate-skills.ps1` after the existing validation checks:

```powershell
# code smell scan (advisory WARN)
$smellPatterns = @(
    # Magic numbers
    @{Pattern='\b\d{4,}\b';                    Category='Obfuscators';        Msg='Magic number literal (consider named constant)'}
    # Long lines
    @{Pattern='^.{120,}$';                     Category='Bloaters';           Msg='Line exceeds 120 chars (Long Method / Formatting)'}
    # Boolean blindness
    @{Pattern='\b(true|false)\b';              Category='Lexical Abusers';    Msg='Raw boolean literal (Boolean Blindness)'}
    # Long function (Python/B4J)
    @{Pattern='(def|function|Sub)\s+\w+.*\n(\s.*\n){30,}'; Category='Bloaters';   Msg='Long method/function (>30 lines)'}
    # Commented code
    @{Pattern='^\s*#.*(if|for|while|def|Function|Sub)\b';    Category='Dispensables'; Msg='Commented-out code block (Dead Code)'}
    # Message chain (B4J)
    @{Pattern='\.\w+\(\s*\)\.\w+\(\s*\)\.\w+'; Category='Couplers';           Msg='Message chain (Law of Demeter violation)'}
    # Inconsistent naming
    @{Pattern='\b(get|set|add|put|store|save|load|fetch)\w*\b'; Category='Lexical Abusers'; Msg='Check naming consistency (Inconsistent Names)'}
    # Hungarian notation
    @{Pattern='\b(var|str|int|bool|list|arr|obj|num)\w*\b'; Category='Lexical Abusers'; Msg='Type embedded in name (Hungarian notation)'}
    # Uncommunicative names
    @{Pattern='\b(temp|tmp|data|val|m1|m2|x|y|z)\b';        Category='Lexical Abusers'; Msg='Uncommunicative name'}
)

# Collect all relevant files
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
```

## 📋 Usage

### Run Detection
```powershell
# Full validation + smell detection
pwsh -File tools/validate-skills.ps1

# Quick smell-only scan
pwsh -Command "
  $smells = @(
    '\b\d{4,}\b', '^.{120,}$', '\b(true|false)\b',
    '(def|function|Sub)\s+\w+.*\n(\s.*\n){30,}',
    '^\s*#.*(if|for|while|def|Function|Sub)\b'
  )
  Get-ChildItem skills -Recurse -Filter '*.md' | ForEach-Object {
    $t = Get-Content $_.FullName -Raw
    foreach ($p in $smells) {
      if ($t -match $p) { Write-Host \"SMELL: $($_.FullName) matches $p\" }
    }
  }
"
```

### Auto-Fix Common Smells

| Smell | Auto-Fix |
|---|---|
| Trailing whitespace | `sed -i 's/\s\+$//'` |
| Magic numbers → constants | Manual (requires intent) |
| Long lines | Auto-wrap at 120 |
| Inconsistent headers | Normalize to ATX `#` |

## 📚 Reference

- [Code Smells Catalog](https://www.codesmells.org/) — 56 smells, 10 categories, Springer Nature research
- [Clean Code](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-code.html) — Uncle Bob
- [Refactoring.Guru Smells](https://refactoring.guru/refactoring/smells) — Visual catalog

## 📝 Skill Metadata

```yaml
name: sd5-code-smells
description: Detect and remediate code smells from codesmells.org catalog across SithasoDaisy5 skills
category: quality
depends: []
recommends: [sd5-web-verify]
risk: safe
status: experimental
version: 1.0.0
authority: 4
platforms: [web, b4j, banano, python, markdown, json]
keywords: [code-smell, quality, refactoring, validation, clean-code, codesmells-org]
```

## 🔗 Related Skills

- `sd5-web-verify` — Pre-scan and conformance gate
- `sd5-web-regression` — Regression testing
- `clean-code` — General clean code principles
- `code-refactoring-refactor-clean` — Refactoring expertise