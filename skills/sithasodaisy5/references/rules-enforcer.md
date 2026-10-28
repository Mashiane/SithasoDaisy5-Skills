---
name: rules-enforcer
description: Non-negotiable L1–L5 rules for SithasoDaisy5 web app generation. Cite RULE-* IDs in your reasoning trace. L4/L5 are hard gates enforced by sd5-web-verify scripts.
---

# SithasoDaisy5 — Rules Enforcer (L1–L5)

The authoritative constraint layer. Every generated page must comply. Each rule carries a level:

- **L1** — guideline (advisory)
- **L2** — instruction (cite in trace, follow unless impossible)
- **L3** — soft gate (visual review catches it)
- **L4** — hard gate (static script check, exit 1 on violation)
- **L5** — release-blocking (orchestrator treats this as `exit 1`)

Cite the `RULE-*` ID when you decide to obey or violate. The orchestrator audits the trace.

---

## 1. Setup & Project File Rules

### RULE-SETUP-001 — L5 — ModuleN= Coverage (Skill Coverage Contract)

**Source**: `verify-conformance.ps1 --check-coverage`  
**What**: Every component registered in `SithasoDaisy5.b4j` `ModuleN=` MUST have a corresponding `components/<Name>.md` file (exact case).  
**Why**: Without the skill file, agents have no API surface to consult. The framework ships components, agents must know them.  
**Violation → exit 1**.

### RULE-SETUP-002 — L5 — Every Page Class Is a StaticCode Module

**What**: Every `pg*.bas` must start with the B4J static-code header:
```
B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
```
**Why**: B4J compiler requires this header or fails to recognize the module.

### RULE-SETUP-003 — L5 — Page Wiring in Demo .b4j

**What**: For demo apps: every `pg*.bas` MUST have a corresponding `ModuleN=<pgName>` entry in `SithasoDaisy5DemoCode.b4j`. For standalone apps: same rule in your app's `.b4j`.  
**Why**: Unwired pages are silently omitted from the build. `pgIndex.App` won't find them at runtime.

### RULE-SETUP-004 — L4 — Custom Asset Bundling

**What**: Custom assets in your app's `Files/` need BOTH `FileN=<filename>` + `FileGroupN=Default Group`. `NumberOfFiles` must match the count.  
**Why**: Missing `FileGroupN` causes build crash with `ResourcesNotFoundException`.

### RULE-SETUP-006 -- L2 -- AppName lowercase web domain

**What**: `Public AppName` in `<AppName>.b4j` MUST be lowercase alphanumeric+hyphens only (`^[a-z0-9-]+$`). No uppercase, spaces, or underscores. The publish folder is `C:\laragon\www`. The app name becomes the subfolder name and URL path segment.

**Why**: Uppercase breaks URL routing on case-sensitive servers/CDNs; spaces break URL encoding. The `verify-conformance.ps1` gate enforces this gate.

### RULE-SETUP-005 — L2 — One Module Per Page

**What**: One `pg*.bas` per page. Do not combine pages into a single mega-module.  
**Why**: Easier navigation, easier wire-up, easier debugging.

---

## 2. Page Lifecycle Rules

### RULE-LIFECYCLE-001 — L4 — `ClearPageView` First

**What**: Every `Sub Show` MUST start with `BANano.Await(app.ClearPageView)` as the first statement after `app = pgIndex.App`.  
**Why**: Skipping causes stale views from previous page to persist and duplicate child stacking on resize/rotation.  
**Source**: `verify-conformance.ps1 --check-lifecycle`.

### RULE-LIFECYCLE-002 — L4 — `UpdateTitle` Last

**What**: Every `Sub Show` MUST end with `pgIndex.UpdateTitle("...")` as the final statement before `End Sub`.  
**Why**: Browser tab title stays correct across navigation. Without it, stale title from previous page persists.  
**Source**: `verify-conformance.ps1 --check-lifecycle`.

### RULE-LIFECYCLE-003 — L2 — `Sub Show` Is the Page Entry

**What**: Each page exposes a `Sub Show()` that mounts components. No other entry points (no constructor logic that touches the DOM).  
**Why**: Page lifecycle is owned by `pgIndex`; bypasses cause undefined behavior.

### RULE-LIFECYCLE-004 — L2 — Error Sub for Top-Level Pages

**What**: Pages that do I/O (fetch, save) SHOULD implement a `Sub <Page>_Error(message As String)` for centralized error handling.  
**Why**: Consistent error UX across pages.

### RULE-LIFECYCLE-005 — L4 — Component Declarations Must Have 'ignore Suffix

**What**: Every component variable declared in `Process_Globals` or `Class_Globals` (e.g. `Private SDUI5Button1 As SDUI5Button 'ignore`, `Private app As SDUI5App 'ignore`, `Private BANano As BANano 'ignore`) MUST be suffixed with `'ignore`.  
**Why**: In B4J/B4X, component variables created, initialized, or manipulated through BANano method calls trigger compiler warnings 16 / 12 (unused or assigned variable). Appending `'ignore` silences these warnings and ensures a warning-free compile.  
**Source**: `verify-conformance.ps1` and `pre-scan.ps1`.

---

## 3. Hierarchy & Layout Rules

### RULE-LAYOUT-001 — L4 — Container → Row → Column → Leaf

**What**: Every component must have a parent that exists in the DOM hierarchy before `AddComponent` is called on the child. Standard chain: `SDUI5Container1` → `SDUI5RowN` → `SDUI5ColumnN` → leaf.  
**Why**: Skipping levels causes layout collapse (no grid, no flex) or "Parent not found" runtime errors.  
**Source**: `verify-conformance.ps1 --check-hierarchy`.

### RULE-LAYOUT-002 — L4 — AddComponent Before Children

**What**: Parent's `AddComponent` MUST run before any child's `ParentID = <parent_id>` assignment + `AddComponent`.  
**Why**: Setting `ParentID` to a non-mounted parent → runtime error.

### RULE-LAYOUT-003 — L4 — Grid Sizing Constraints

**What**: When using `SDUI5Row` with `GridColsMd` + `GridColsSm`, the sum across child columns must be ≤ 12 on each breakpoint.  
**Why**: Exceeding 12 overflows the grid.  
**Source**: `verify-conformance.ps1 --check-grid`.

### RULE-LAYOUT-004 — L2 — `pageScroll.Clear / AutoFit` Not Needed (BANano vs B4XPages)

**What**: Unlike native B4XPages, SithasoDaisy5's web `Sub Show` doesn't need manual pageScroll setup — `app.ClearPageView` handles it. Don't add your own scroll containers.  
**Why**: Double-scroll causes double-rendering bugs.

### RULE-LAYOUT-005 — L4 — Companion Parent-Child Component Hierarchy

**What**: Specific leaf items are companion child components of dedicated parent containers and MUST mount into an instance of their designated parent container (via `ParentID`), NEVER directly into a PageView, Container, or unrelated column:
- `SDUI5Column` MUST have an `SDUI5Row` parent container (`.grid` layout).
- `SDUI5StatItem` (`stat`) MUST have an `SDUI5Stat` (`stats`) parent container.
- `SDUI5StepsItem` (`step`) MUST have an `SDUI5Steps` (`steps`) parent container.
- `SDUI5TimelineItem` (`timeline-item`) MUST have an `SDUI5Timeline` (`timeline`) parent container.
- `SDUI5TabsItem` (`tab`) MUST have an `SDUI5Tabs` (`tabs`) parent container.
- `SDUI5MenuItem` MUST have an `SDUI5Menu` parent container.
- `SDUI5ListItem` MUST have an `SDUI5List` parent container.
- `SDUI5CarouselItem` MUST have an `SDUI5Carousel` parent container.
- `SDUI5SwiperSlide` MUST have an `SDUI5Swiper` parent container.
- `SDUI5SliderItem` MUST have an `SDUI5Slider` parent container.
- `SDUI5FooterTitle` MUST have an `SDUI5Footer` parent container.

**The 3 Golden Lifecycle Rules for Companion Architecture**:
1. **Parent First**: Always `Initialize`, configure, and `BANano.Await(Parent.AddComponent)` BEFORE mounting any child items.
2. **Mount via ParentID**: Set `child.ParentID = Parent.ID`, never mount to generic containers.
3. **Universal 3-Step Mounting**: Mount child items via `BANano.Await(child.AddComponent)`. Never call nonexistent methods like `.AddItem()` or `.Refresh()` on the parent container.

**Why**: daisyUI child components rely on CSS selectors (e.g. `.stats > .stat`, `.steps > .step`, `.timeline > li`, `.grid > col`) established by their container. Without the parent container, styling, dividers, rounded corners, responsive direction (`Direction`, `MDDirection`), and elevation are broken.  
**Source**: `verify-conformance.ps1` and `pre-scan.ps1`.

---

## 4. Component Mount Rules

### RULE-MOUNT-001 — L4 — Component-Specific Color Values

**What**: Read the component's exact color property list and setter behavior before assigning a color. Use semantic tokens when that property is a listed daisyUI variant; use literal CSS values only for properties documented as CSS color channels. Do not assume `.Color` is interchangeable across components.
**Why**: Color-named properties can render variant classes, target nested controls, set HTML attributes, or pass raw colors to a library.
**Source**: `references/design-tokens.md` §1.1 and the per-component reference/source.

### RULE-MOUNT-002 — L4 — No Invented APIs

**What**: Never invent method names, property names, or event names. If a member isn't in `components/<Name>.md`, it doesn't exist.  
**Why**: B4J is compiled; invented calls won't compile or will throw at runtime.  
**Source**: `verify-conformance.ps1 --check-apis`.

### RULE-MOUNT-003 — L4 — Demonstrated Status Before Use

**What**: Every component used must be **Demonstrated** (has a verified `pg*.bas` demo) OR user has explicitly approved a **Documented-only** use.  
**Why**: Documented-only means no demo proves the API works as documented. Risk of runtime failure.  
**Source**: `verify-conformance.ps1 --check-status`.

### RULE-MOUNT-004 — L4 — Component Existence in Skill

**What**: Every `SDUI5*` class used in your page MUST exist in `components/<Name>.md`.  
**Why**: No API surface = no way to verify correct usage.  
**Source**: `verify-conformance.ps1 --check-coverage` (inverse check on page imports).

### RULE-MOUNT-005 — L4 — Standard 3-Step Mount Sequence

**What**: Standard components (`SDUI5Button`, `SDUI5TextBox`, `SDUI5Alert`, etc.): `Initialize` → `setParentID` → property setters → `AddComponent`.  
**Why**: Deviations only work for container-style components (see `component-creation-patterns.md`).

### RULE-MOUNT-006 — L2 — Container Deviations Need Acknowledgement

**What**: `SDUI5Stat`, `SDUI5Dock`, `SDUI5Carousel`, `SDUI5Timeline`, `SDUI5Accordion`, `SDUI5SweetAlert` need non-standard mount sequences. Confirm the deviation is documented for that component before using.  
**Why**: Generic 3-step fails on these.

---

## 5. Interaction, Ergonomics & State Rules

### RULE-INTERACT-001 — L4 — Touch Targets ≥ 48px (Fitts)

**What**: Interactive click targets must have minimum `min-h-12 min-w-12` (48px). Icon-only buttons need explicit sizing.  
**Why**: Sub-48px targets fail Fitts's Law + WCAG 2.5.5.

### RULE-INTERACT-002 — L2 — Top-Level Nav ≤ 5 Items (Hick) — Advisory

**What**: Navbar / Dock / Tabs at the top level: ≤ 5 items recommended. Overflow goes behind a "More" menu. Web dashboards may legitimately run 6–7 items — justify in the reasoning trace.  
**Why**: Hick's Law; more items = more friction. Guidance, not a hard gate — real web layouts vary.

### RULE-INTERACT-003 — L4 — State Coverage for Data-Driven Views

**What**: Any view that fetches / computes / awaits data MUST implement the **core 4 states**: Loading + Populated + Empty + Error. **Extended states** (offline, permission denied, validation failure, partial data, first-use) must be **declared in the screen contract** with a plan or explicit N/A.  
**Why**: Without Empty/Error, the user sees a blank screen and assumes the app is broken. Extended states prevent silent failure modes (offline cache confusion, blocked permissions, half-loaded records).  
**Enforcement**: heuristic WARN in `verify-conformance.ps1` (state-component scan) + hard review at Stage 9 via `ux-review.md` state-coverage section.  
**Source**: `verify-conformance.ps1` check 6/6.

### RULE-INTERACT-004 — L4 — Destructive Actions Need Confirmation

**What**: Delete, clear, reset, logout actions MUST call `app.ShowSwalConfirm(message)` async before executing.  
**Why**: One-tap destruction is hostile UX. Async confirmation is the convention.

### RULE-INTERACT-005 — L2 — Form Submit Is the Last Action

**What**: In a form, the Submit button should be at the bottom-right (LTR) or bottom-left (RTL). Submit fires the form's `Submit` event handler (e.g. `Sub SDUI5Form1_Submit(e As BANanoEvent)`).  
**Why**: Jakob's Law — users expect Submit at the end of the form.

---

## 6. Code Style Rules

### RULE-CODE-001 — L2 — Use Hungarian-ish Prefixes

**What**: Variable names follow `s` (string), `i` (int), `b` (bool), `d` (double), `lst` (list), `m` (map), `pg` (page).  
**Why**: Codebase convention; helps compiler shadowing diagnostics.

### RULE-CODE-002 — L2 — One Statement Per Line

**What**: Never use `:` as a statement separator in B4J. Each declaration/assignment/call on its own line.  
**Why**: B4J syntax error on `:` outside of labels.

### RULE-CODE-003 — L4 — Use the Component's Color Contract

**What**: `.Color` is component-specific. When its designer list enumerates semantic daisyUI variants, use one of those values (for example `SDUI5Button.Color = "primary"`). Do not pass hex/rgb to a variant property unless its component reference explicitly supports CSS colors. Shared `BackgroundColor`/`TextColor`/`BorderColor` helpers transform values through `UIShared.FixColor`; that helper wraps `#hex` as an arbitrary Tailwind class but does not convert `rgb(...)`/`rgba(...)` into valid arbitrary-class syntax. Use documented raw CSS properties or `.Styles` for CSS color values.
**Source**: framework component setters and `UIShared.FixColor`; see `design-tokens.md` §1.1.

### RULE-CODE-004 — L4 — Width/Height Use Units/Tokens, Not Bare Numbers

**What**: `.Width` / `.Height` must not be bare numbers (e.g. `320`). Use values with units (e.g. `"320px"`, `"10rem"`) or framework size tokens/Tailwind-based values (e.g. `"full"`, `"w-64"`, `"h-32"`).
**Source**: `verify-conformance.ps1 --check-dimensions`.

---

## 7. Anti-Patterns (Hard Bans)

### RULE-ANTI-001 — L5 — No Direct HTML/CSS/Tailwind Config

**What**: SithasoDaisy5 is a B4J/BANano framework. Generated output is `.bas` only. Do not emit raw `<html>`, `<style>`, custom CSS rules, or Tailwind config edits.  
**Why**: The framework owns HTML/CSS emission; bypassing it breaks theming and accessibility.  
**Source**: `verify-conformance.ps1 --check-output`.

### RULE-ANTI-002 — L4 — No Library Source Edits

**What**: Never edit `C:\b4j\workspace\0SithasoDaisy5\*.bas`. The library is packaged in `SithasoDaisy5.b4xlib`. Compose apps with public APIs only.  
**Why**: Edits don't propagate via `.b4xlib`; you lose them on next build.

### RULE-ANTI-003 — L4 — No HTML `title` Attribute for Tooltips

**What**: Tooltips come from `SDUI5ToolTip`, not HTML `title=`. attribute.  
**Why**: The framework manages tooltip accessibility; HTML `title=` is a separate, less accessible mechanism.

### RULE-ANTI-004 — L2 — No WebView / Iframe Wrappers

**What**: Don't wrap `SDUI5*` outputs in `<webview>`, `<iframe>`, or other browser-level containers. The B4J runtime already provides the browser context.  
**Why**: Double-isolation breaks event flow.

### RULE-ANTI-005 — L4 — No LocalStorage Direct Access

**What**: Don't call `localStorage.setItem(...)` directly. Use `app.LocalStorageSet(key, value)` / `app.LocalStorageGet(key, defaultValue)` wrappers.  
**Why**: Framework provides cross-cutting concerns (namespacing, expiry, JSON serialization) you don't want to re-implement per app.

---

## 8. Web-to-SithasoDaisy5 Translation Rules

### RULE-XLATE-001 — L2 — Use the Mapping Table

**What**: When converting web → SithasoDaisy5, consult `daisyui-compatibility.md` for the SDUI5 equivalent of every DaisyUI class you used.  
**Why**: Some web concepts don't have native equivalents (e.g., `B4XDaisySweetAlert` is a 3-arg-Initialize dialog). Partial mappings must be reported, not invented.

### RULE-XLATE-002 — L2 — No `<div onclick>` Pattern

**What**: Never produce `<div onclick="...">` HTML or its B4J equivalent `Sub <container>_Click(...)` on a non-interactive container.  
**Why**: WCAG 2.1.1 — keyboard nav requires real `<button>` / `<input>`. SDUI5 emits these correctly when you use the right component.

### RULE-XLATE-003 — L2 — Tailwind Utility in `.Classes` Only

**What**: Tailwind utilities (`flex`, `grid`, `gap-4`, `lg:p-8`) go in the `.Classes` property. Never inline in HTML.  
**Why**: Framework class assembly happens during `DesignerCreateView`.

---

## 8.1 Encoding & Unprintable Character Prevention Rules

### RULE-ENCODING-001 — L5 — UTF-8 Without BOM Only

**What**: All `.bas`, `.b4j`, `.json`, and `.md` files MUST be encoded as strictly UTF-8 **WITHOUT BOM** (Byte Order Mark `0xEF 0xBB 0xBF`).  
**Why**: A UTF-8 BOM on Line 1 corrupts B4J compiler header parsing (`B4J=true` fails to match), causing hard compilation crashes.  
**Enforcement**: `pre-scan.ps1` checks raw file byte headers. Violation → exit 1.

### RULE-ENCODING-002 — L5 — Zero Mojibake or Replacement Characters

**What**: Source code and skills must NEVER contain replacement characters (`\ufffd`), consecutive question marks (`???`), or mojibake sequences (`â€”`, `â†‘`, `Ã©`).  
**Why**: Mojibake results from reading UTF-8 through Windows-1252 ANSI codepages. BANano transpiles this corruption directly into live client `app.js`.  
**Enforcement**: `pre-scan.ps1` scans for mojibake byte patterns. Violation → exit 1.

### RULE-ENCODING-003 — L5 — Pure ASCII in Code & String Literals

**What**: Never write raw high-Unicode characters (arrows `↑` `→`, em-dashes `—`, smart quotes `“”`, symbols `★` `⌘`, or emojis `🎉` `🔍`) in `.bas` code or string literals.  
**Allowed alternatives**:
- Pure ASCII: Use `-` for dashes, `'` for quotes, `...` for ellipses.
- Standard HTML entities: `&uarr;`, `&darr;`, `&rarr;`, `&mdash;`, `&bull;`, `&#9733;`.
- Semantic icon properties: `.Icon = "fa-solid fa-arrow-trend-up"`, `.Icon = "fa-solid fa-magnifying-glass"`, `.Icon = "fa-solid fa-star"`.  
**Why**: Windows Java/BANano transpilers default to Windows-1252. Raw non-ASCII string literals are corrupted into multi-byte unprintable characters in the browser.  
**Enforcement**: `pre-scan.ps1` validates string literals with `[int]$ch -gt 127`. Violation → exit 1.

---

## 9. Quick Rule Reference (for the orchestrator's audit trace)

| Rule | Level | Failure mode | Script check |
|---|---|---|---|
| SETUP-001 ModuleN= coverage | L5 | Missing skill file | `--check-coverage` |
| SETUP-002 StaticCode header | L5 | Build crash | `--check-headers` |
| SETUP-003 ModuleN= wiring | L5 | Silent page omission | `--check-wiring` |
| SETUP-004 Custom assets | L4 | Build crash | `--check-assets` |
| ENCODING-001 UTF-8 without BOM | L5 | Compiler header crash | `pre-scan.ps1` |
| ENCODING-002 No mojibake tokens | L5 | Live runtime corruption | `pre-scan.ps1` |
| ENCODING-003 Pure ASCII in string literals | L5 | Codepage transpile mojibake | `pre-scan.ps1` |
| LIFECYCLE-001 ClearPageView first | L4 | Stale views | `--check-lifecycle` |
| LIFECYCLE-002 UpdateTitle last | L4 | Stale tab title | `--check-lifecycle` |
| LAYOUT-001 Hierarchy | L4 | Layout collapse | `--check-hierarchy` |
| LAYOUT-002 AddComponent order | L4 | "Parent not found" | `--check-hierarchy` |
| LAYOUT-003 Grid sizing | L4 | Grid overflow | `--check-grid` |
| MOUNT-001 Component-specific color values | L4 | Wrong color channel / invalid rendering | per-component source/reference |
| MOUNT-002 No invented APIs | L4 | Compile/runtime fail | `--check-apis` |
| MOUNT-003 Demonstrated status | L4 | Runtime failures | `--check-status` |
| MOUNT-004 Component exists | L4 | No API surface | `--check-coverage` |
| INTERACT-001 Touch targets | L4 | Fitts/WCAG fail | `--check-targets` |
| INTERACT-002 Nav ≤ 5 | L2 advisory | Hick's Law | (no gate — justify in trace) |
| INTERACT-003 State coverage | L4 | Blank screen | `verify-conformance` 6/6 (heuristic) + Stage 9 review |
| INTERACT-004 Confirm destructive | L4 | Hostile UX | `--check-confirm` |
| CODE-003 Use component color contract | L4 | Wrong variant or invalid CSS | per-component source/reference |
| CODE-004 No numeric px | L4 | Layout bug | `--check-dimensions` |
| ANTI-001 No raw HTML/CSS | L5 | Breaks framework | `--check-output` |
| ANTI-002 No lib edits | L4 | Lost work | manual check |
| ANTI-005 No localStorage direct | L4 | Bypasses wrappers | `--check-storage` |
| XLATE-002 No div onclick | L2 | Accessibility | `--check-accessibility` |

---

## 10. When You Disagree With a Rule

If the user explicitly asks for something that violates a rule (e.g., "use a custom hex color"), **document the violation in your reasoning trace** with:

- Which rule (`RULE-*` ID)
- Why the user wants to violate it
- What mitigations you applied (e.g., verify contrast manually)

The orchestrator allows documented violations when the user accepts them. Silent violations fail the audit.
