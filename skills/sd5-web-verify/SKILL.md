---
name: sd5-web-verify
description: Quality inspection and conformance gate for SithasoDaisy5 web apps. Pre-scan (L4) catches banned patterns; verify-conformance (L5) enforces the Skill Coverage Contract + lifecycle + wiring. Used by sd5-web-orchestrator Stages 5/6/8.
metadata:
  category: technique
  triggers: verify, scan, gate, hard gate, conformance, lint
---

# sd5-web-verify — Quality Inspection & Conformance Gate

Four PowerShell gate scripts + a reference UX-review template. Orchestrator
Stages 5/6/8 call these. All gate scripts are PowerShell (`pwsh -File ...`) for
consistency with the b4a `b4x-verify` suite; the regeneration/maintenance
utilities in `scripts/` remain Python (no b4a counterpart).

---

## Scripts

### `scripts/pre-scan.ps1` — L4 hard gate

Fast static scan for **banned patterns**. Runs in seconds. Catches what humans + LLMs most commonly get wrong.

```powershell
pwsh -File <skill>/scripts/pre-scan.ps1 -AppFolder <AppFolder>
```

**Bans** (L4 = hard fail):
- Raw HTML tags (`<html>`, `<div>`, `<button>`, ...) — B4J shouldn't emit raw HTML
- Inline `<style>` blocks
- Numeric pixel dimensions on `.Width` / `.Height` (use semantic or Tailwind sizing like `"full"`, `"screen"`, `"64"`)
- Missing `pgIndex.UpdateTitle(...)` before `End Sub`

**Allowed with Advisory (L1-L3 = advisory warning, not fail)**:
- Hex colors in `.Color = "#..."` or Tailwind arbitrary hex (`bg-[#FF6B35]`) — hex colors are fully supported for custom brand palettes; semantic tokens (`primary`, `secondary`, etc.) remain preferred when dynamic multi-theme switching is desired.
- Possibly-invented setters (`setX` where X isn't in the documented allowlist)
- Raw HTML tags (advisory — confirm they are framework-emitted, not hand-written)
- Missing `BANano.Await(app.ClearPageView)` in the first statements of `Sub Show`
- Possibly-invented setters (`setX` where X isn't in the documented allowlist)
- Raw HTML tags (advisory — confirm they are framework-emitted, not hand-written)
- Missing `BANano.Await(app.ClearPageView)` in the first statements of `Sub Show`

**Exit codes**:
- `0` = clean
- `1` = hard gate violated (FAIL)
- `2` = bad arguments

### `scripts/verify-conformance.ps1` — L5 hard gate

Deeper check. Runs in seconds. Enforces contracts that span framework + app + skill.

```powershell
pwsh -File <skill>/scripts/verify-conformance.ps1 `
  -AppFolder <AppFolder> `
  -FrameworkFolder <FrameworkRoot> `
  -SkillFolder <SkillRoot>
```

**Checks** (L5 = hard fail):
1. **Skill Coverage Contract** — every normalized `ModuleN=` name in `SithasoDaisy5.b4j`, including path-qualified shared modules, MUST have `components/<Name>.md`
2. **App uses documented components** — every framework-registered `SDUI5*` class in `pg*.bas` MUST have a `.md` file; external path-qualified `SDUI5*` modules are reported as advisory warnings
3. **Lifecycle** — every `Sub Show` MUST contain `ClearPageView` and end with `UpdateTitle`
4. **Grid sizing** — `SizeMd + SizeSm ≤ 12` per column (warn, not fail)
5. **Color policy** — semantic tokens preferred for theme switching; hex colors are allowed and supported (warn, not fail)

**Exit codes**:
- `0` = PASS
- `1` = any L5 violation (FAIL)
- `2` = bad arguments

### `scripts/check-contract.ps1` — L5 Skill Coverage Contract (standalone)

Framework-wide guarantee: **1:1 between normalized `SithasoDaisy5.b4j`
`ModuleN=` names and top-level `components/*.md`**. Path-qualified module paths
are reduced to their basename; `components/_unused/` is excluded. Run it alone,
or use it through verify-conformance.

```powershell
pwsh -File <skill>/scripts/check-contract.ps1 `
  -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
  -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5
```

**Exit codes**: `0` = PASS (1:1; reports UI/support counts), `1` = missing or extra skill files, `2` = bad arguments.

### `scripts/capture-screens.ps1` — L3 evidence

Per-page screenshot capture via **headless Edge/Chrome** (native, no
Playwright/Selenium required). Loads the running app at a base URL and saves one
PNG per page.

```powershell
pwsh -File <skill>/scripts/capture-screens.ps1 `
  -AppFolder <AppFolder> `
  -BaseUrl http://localhost/<app> `
  -Page login,dashboard,profile
```

Outputs PNG per page in `<AppFolder>/ux-review/screens/<PageId>.png`. Used in orchestrator Stage 8.
No headless browser = fallback message, exit 0 (drop PNGs manually).

For G6 design review, capture **both desktop and phone widths**. Run once per viewport with a separate `-Out` directory so the same page name cannot overwrite its other capture. Example:

```powershell
pwsh -File <skill>/scripts/capture-screens.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<app> -Page home,profile,dashboard -Width 1280 -Height 900 -Out <AppFolder>\ux-review\screens\desktop
pwsh -File <skill>/scripts/capture-screens.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<app> -Page home,profile,dashboard -Width 390 -Height 844 -Out <AppFolder>\ux-review\screens\phone
```

Use the contracted viewport when the user specifies a target. Add tablet or 200% zoom evidence when the page design, interaction model, or contract makes that relevant. These captures are required G6 evidence; screenshots from only one width leave G6 open.

For exact CSS viewport emulation, use `scripts/browser_capture.js`. It sets the viewport through Chrome DevTools Protocol, waits for image assets, writes a full-page PNG, and reports horizontal overflow, console messages, and uncaught exceptions. This avoids Windows display scaling changing the CSS viewport behind `--window-size`.

```powershell
node <skill>/scripts/browser_capture.js `
  http://127.0.0.1:8765/<app>/index.html `
  <AppFolder>/ux-review/screens/mobile.png 390 844
```

### `scripts/verify-example-apps.ps1` — suite visual verification

Builds each app folder's `.b4j` project, runs the generated JAR through the BANano transpiler, then captures desktop and phone screenshots with exact viewport metrics. It writes build logs, per-viewport JSON evidence, screenshots, and a suite summary. Start a local static server rooted at the shared publish directory before running it.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File `
  <skill>/scripts/verify-example-apps.ps1 `
  -AppsRoot C:\b4j\workspace\0SithasoDaisy5Skills\AIExamples `
  -BaseUrlRoot http://127.0.0.1:8765
```

Use `-AppFolders @('01-landing-hero')` to run one project, or `-SkipCompile` only when its JAR was built from its current source.

This script follows the verified first-example build flow: compile the `.b4j`
project with B4JBuilder, run its JAR with the configured JavaFX runtime to
transpile BANano, serve the published output, and open that output in headless
Chrome. Keep compile and transpile logs with each capture so a blank screenshot
can be tied to the actual build/runtime failure.

For a visual audit, use the suite script rather than capturing at device-pixel
width. The browser capture emulates the CSS viewport directly (default
1280×900 and 390×844), waits for image assets, and records overflow candidates,
visible control DOM, console messages, and uncaught exceptions. Review both
screenshots for every app; a zero-overflow metric does not establish that the
layout is usable or visually sound. Fix issues from screenshot/DOM evidence,
then rebuild and recapture the affected app at both viewports. A screenshot with
`ready: false`, a visible loader, or runtime exceptions is a failed visual check,
even when a PNG exists.

### `references/build-watch.template.ps1` — build-stage runtime gate (L4)

Drop as `build-watch.ps1` into the app folder (or call directly). Loads the app
headless, captures the rendered DOM + console stream, and writes
`ux-review/BUILD-WATCH-<YYYYMMDD>.md` evidencing what screenshots cannot prove:
JS console errors, failed resource loads, page title, theme attribute, and
render proof (expected container + body text). Exit 1 = JS / load errors.

```powershell
pwsh -File <skill>/references/build-watch.template.ps1 `
  -AppFolder <AppFolder> -BaseUrl http://localhost/<app>
```

### `scripts/build-banano-app.ps1` — G4 compile and transpile gate

Run B4JBuilder in the project folder, execute the resulting JAR with the
configured JavaFX runtime, and wait for a new BANano `index.html`,
`scripts/app.js`, and the conversion-finished marker. It writes a build report
and preserves B4JBuilder stdout/stderr, including diagnostics on failure. It
does not serve the output or prove browser runtime/visual behavior.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File `
  <skill>/scripts/build-banano-app.ps1 -ProjectRoot <AppFolder>
```

### `scripts/verify-production-hardening.ps1` — G8 release-only gate

Release security/hygiene scan of the published app folder. Deep checks run on
**first-party output only** (`index.html`, `app.js`, `ES5_app.js`,
`sithasodaisy5.js`) plus `env.json` anywhere under the folder — vendor-pinned
libs are out of scope (supply-chain, not app code). **FAIL** = high-confidence
token in first-party files, non-empty `env.json` secret values, missing
`index.html`. **WARN** = embedded build-time `Publish` path in `app*.js`
(accepted local-publish mechanism), non-localhost `http://` in first-party
files, missing `manifest.json`, possible secrets in project source (advisory).

```powershell
pwsh -File <skill>/scripts/verify-production-hardening.ps1 `
  -OutputFolder C:\laragon\www\<app> -ProjectFolder <AppFolder>
```

Scans app output (and optionally the app project) only — never framework,
demo, or skill source. Exit codes 0/1/2 like the other gates.

---

## Run the Full Suite

```powershell
# L4 pre-scan
pwsh -File <skill>/scripts/pre-scan.ps1 -AppFolder <AppFolder>

# L5 Skill Coverage Contract (standalone)
pwsh -File <skill>/scripts/check-contract.ps1 `
  -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
  -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5

# L5 verify-conformance
pwsh -File <skill>/scripts/verify-conformance.ps1 `
  -AppFolder <AppFolder> `
  -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
  -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5

# G4 B4J compile + BANano transpile (before serving)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File `
  <skill>/scripts/build-banano-app.ps1 -ProjectRoot <AppFolder>

# L4 build-stage runtime gate (after serve)
pwsh -File <skill>/references/build-watch.template.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<app>

# G8 production hardening (after publish to Laragon folder)
pwsh -File <skill>/scripts/verify-production-hardening.ps1 `
  -OutputFolder C:\laragon\www\<app> -ProjectFolder <AppFolder>

# L3 capture (after build + serve)
pwsh -File <skill>/scripts/capture-screens.ps1 `
  -AppFolder <AppFolder> `
  -BaseUrl http://localhost/<app> `
  -Page home,login,dashboard
```

---

## Maintenance Contract

The gate scripts **must stay in sync** with `rules-enforcer.md` and
`ux-master-doctrine.md`. When you:

- Add a new rule → update `rules-enforcer.md` AND add the regex/check to the relevant script
- Add a new NEG → update `negative-knowledge.md` AND add to `pre-scan.ps1` if it's a regex-detectable pattern
- Add a new ARCH-N → update `page-architectures.md` AND ensure pre-scan doesn't false-positive on it
- Add a new documented setter → update the `$docSetters` allowlist in `pre-scan.ps1`

If a script is out of sync with the rules, **fix the script** — don't work around it.

### Which engine, when

- **Gate scripts** (pre-scan, verify-conformance, check-contract, capture-screens,
  build-banano-app, build-watch, production-hardening) are **PowerShell** — run by the agent during delivery, consistent
  with b4a's `b4x-verify`. Invoke with `powershell.exe -NoProfile -ExecutionPolicy Bypass -File`
  (Windows PowerShell 5.1+ is sufficient; `pwsh` not required). Exit codes 0/1/2.
- **Regeneration / maintenance utilities** (`extract.py`, `gen_components.py`,
  `generate_manifest.py`, `crossref_daisyui.py`, citation/case-drift/enrichment
  scripts) stay **Python stdlib-only** (no pip packages) — they are skill-maintenance tooling with no b4a
  counterpart, and Python is the better fit for that data processing.
- **Dev-only one-offs** in `scripts/` (`audit_*`, `case*`, `check_*now.py`, `debug_*`,
  `glob_test.py`, `test_specific.py`, `preview_table.py`, `list_*.py`, `find_missing_*`,
  `fix_case_drift_*`, `revert_*`, `reinject_*`) are executed working notes kept for
  provenance. They are excluded from publish via `.gitignore` and are not part of
  any gate. Do not invoke them during delivery.

---

## References

- `../sithasodaisy5/references/rules-enforcer.md` — every L1-L5 rule (source of truth)
- `./references/laragon-serve.md` - Laragon install + per-app serve convention + G5/G6 wiring (`http://localhost/<app>/index.html`)
- `./references/demo-build.md` - verified IDE flow and dated B4JBuilder CLI evidence/limitations
- `./references/production-hardening.md` - G8 release-only rules (secrets, paths, required files)
- `../sithasodaisy5/references/negative-knowledge.md` — anti-patterns (source of truth)
- `../sithasodaisy5/references/ux-master-doctrine.md` — quantitative laws + DoD
- `../sd5-web-orchestrator/SKILL.md` — Stage 5/6/8 use these scripts
- `../sd5-web-orchestrator/references/ux-review.md` — visual review template (Stage 9)

---

## Core Operating Principles: Truth & Accuracy

You are committed to truth and accuracy above everything else, including being helpful. A wrong answer delivered confidently is worse than no answer. Follow these 7 rules in every response:

1. **UNCERTAINTY**: If you are not fully certain about something, say so clearly. Use phrases like "I am not certain, but..." or "You may want to verify this...". Never state guesses as facts.
2. **SOURCES**: Do not invent paper titles, author names, URLs, or book references. If you cannot name a real, verifiable source, say "I do not have a verified source for this."
3. **STATISTICS**: Flag any number you are not 100 percent confident in. Say "approximately" and recommend the user verify it from a primary source.
4. **RECENT EVENTS**: Remind the user when a topic may have changed since your knowledge cutoff. Do not present outdated info as current.
5. **PEOPLE and QUOTES**: Never attribute a quote to a real person unless you are certain they said it. If unsure, say "I cannot confirm this quote is accurate."
6. **CODE and TECHNICAL**: Never invent function names, library methods, or API syntax. If unsure a function exists, tell the user to verify it in the current docs.
7. **LOGIC GAPS**: Do not fill missing context with assumptions. If something is unclear, ask a clarifying question before answering.

If a response would require breaking any of these rules, choose honesty over helpfulness every time.
