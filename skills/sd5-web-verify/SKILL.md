---
name: sd5-web-verify
description: Quality inspection and conformance gate for SithasoDaisy5 web apps. Pre-scan (L4) catches banned patterns; verify-conformance (L5) enforces the Skill Coverage Contract + lifecycle + wiring. Used by sd5-web-orchestrator gates G3/G4/G5/G6/G8.
metadata:
  category: technique
  triggers: verify, scan, gate, hard gate, conformance, lint
---

# sd5-web-verify — Quality Inspection & Conformance Gate

The gate scripts plus a reference UX-review template. Orchestrator
gates G3/G4/G5/G6/G8 call these. All gate scripts are PowerShell (`powershell.exe -NoProfile -ExecutionPolicy Bypass -File ...`) for
consistency with the b4a `b4x-verify` suite; the regeneration/maintenance
utilities in `scripts/` remain Python (no b4a counterpart).

---

## Scripts

### `scripts/pre-scan.ps1` — L4 hard gate

Fast static scan for **banned patterns**. Runs in seconds. Catches what humans + LLMs most commonly get wrong.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/pre-scan.ps1 -AppFolder <AppFolder>
```

**Hard bans**:
- Raw HTML tags (`<html>`, `<div>`, `<button>`, ...) and inline `<style>` blocks.
- Numeric pixel dimensions on `.Width` / `.Height`.
- Missing `pgIndex.UpdateTitle(...)` before `End Sub`.
- Property-first violations (RULE-PROP-001/002): static `m-*`/`p-*`/`w-*`/`h-*`/`shadow-*`/`rounded-*` tokens in `.Classes`, doubled prefixes (`"w-full"`, `"shadow-md"`), and capital `Set*` designer calls.

**Advisory (does not fail)**:
- Hex colors in `.Color` or arbitrary Tailwind hex (allowed; semantic tokens preferred for theme switching).
- Possibly-invented setters (`setX` not in the documented allowlist).
- Missing `BANano.Await(app.ClearPageView)` in the first statements of `Sub Show`.

The token list and exemptions live in `pre-scan.ps1`; the definitions are in
[RULE-PROP-001/002](../sithasodaisy5/references/rules-enforcer.md#rule-prop-001).

**Exit codes**:
- `0` = clean
- `1` = hard gate violated (FAIL)
- `2` = bad arguments

### `scripts/verify-conformance.ps1` — L5 hard gate

Deeper check. Runs in seconds. Enforces contracts that span framework + app + skill.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/verify-conformance.ps1 `
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
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/check-contract.ps1 `
  -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
  -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5
```

**Exit codes**: `0` = PASS (1:1; reports UI/support counts), `1` = missing or extra skill files, `2` = bad arguments.

### `scripts/capture-screens.ps1` & `playwright_test.js` — L3 Evidence & UX Review

Headless browser capture and automated UX/UI verification. **Playwright-first** with graceful fallback to native headless Edge/Chrome CLI.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/capture-screens.ps1 `
  -AppFolder <AppFolder> `
  -BaseUrl http://localhost/<app> `
  -Page login,dashboard,profile
```

**Playwright-first capture** (`playwright_test.js`): multi-viewport sweep, console/runtime diagnostics,
overflow gate, WCAG fast audit, and `ux-review/screens/ux-report.json` evidence.
It falls back to native headless Edge/Chrome. Details: [capture-and-verify.md](references/capture-and-verify.md).

Use the contracted viewport when specified; screenshots from only one width leave G6 open.
For exact CSS viewport emulation use `browser_capture.js`:

```powershell
node <skill>/scripts/browser_capture.js `
  http://127.0.0.1:8765/<app>/index.html `
  <AppFolder>/ux-review/screens/mobile.png 390 844
```

Suite-level verification (`verify-example-apps.ps1`) builds each app, transpiles, serves, and captures
both viewports with logs and JSON evidence. Usage and evidence-validity rules:
[capture-and-verify.md](references/capture-and-verify.md).

### `scripts/verify_visual_evidence.py` — evidence receipt integrity (advisory)

Optional. Validates a `visual-evidence.json` receipt:

- source and artifact SHA-256 values;
- declared required checks and per-check environment;
- unresolved entries.

Exit `0` = required checks pass; `1` = blocked checks remain; `2` = unreadable receipt;
`3` = integrity failure (missing file, stale hash, malformed record).

```powershell
python <skill>/scripts/verify_visual_evidence.py <AppFolder>/ux-review/visual-evidence.json
```

Start from `scripts/visual-evidence.template.json`. A passing run proves integrity only - not taste, and not that anyone inspected the capture.

### `references/build-watch.template.ps1` — build-stage runtime gate (L4)

Drop as `build-watch.ps1` into the app folder (or call directly). Loads the app
headless, captures the rendered DOM + console stream, and writes
`ux-review/BUILD-WATCH-<YYYYMMDD>.md` evidencing what screenshots cannot prove:
JS console errors, failed resource loads, page title, theme attribute, and
render proof (expected container + body text). Exit 1 = JS / load errors.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/references/build-watch.template.ps1 `
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
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/verify-production-hardening.ps1 `
  -OutputFolder C:\laragon\www\<app> -ProjectFolder <AppFolder>
```

Scans app output (and optionally the app project) only — never framework,
demo, or skill source. Exit codes 0/1/2 like the other gates.

### `scripts/check-delivery.ps1` — delivery gate (G8 closure)

The only authority over the word "delivered". Reads `<AppFolder>/.agent/DELIVERY.json`
(written by `run-pipeline.ps1`) and requires: `overall = PASS`, every G0-G8 row `PASS`,
each `PASS` row's exit code 0 and cited evidence files present, and a source digest that
matches the current tree. Anything else exits 1. A prose summary, a console scorecard, or
model confidence is not evidence.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/check-delivery.ps1 -AppFolder <AppFolder> [-Json]
```

Exit codes 0/1/2 like the other gates. `PARTIAL` (any gate `NOT RUN`) and `STALE`
(source changed after the run) both exit 1.

---

## Run the Full Suite

```powershell
# L4 pre-scan
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/pre-scan.ps1 -AppFolder <AppFolder>

# L5 Skill Coverage Contract (standalone)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/check-contract.ps1 `
  -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
  -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5

# L5 verify-conformance
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/verify-conformance.ps1 `
  -AppFolder <AppFolder> `
  -FrameworkFolder C:\b4j\workspace\0SithasoDaisy5 `
  -SkillFolder C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5

# G4 B4J compile + BANano transpile (before serving)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File `
  <skill>/scripts/build-banano-app.ps1 -ProjectRoot <AppFolder>

# L4 build-stage runtime gate (after serve)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/references/build-watch.template.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<app>

# G8 production hardening (after publish to Laragon folder)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/verify-production-hardening.ps1 `
  -OutputFolder C:\laragon\www\<app> -ProjectFolder <AppFolder>

# Delivery gate (only this exits 0 for a deliverable app)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/check-delivery.ps1 -AppFolder <AppFolder>

# L3 capture (after build + serve)
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/capture-screens.ps1 `
  -AppFolder <AppFolder> `
  -BaseUrl http://localhost/<app> `
  -Page home,login,dashboard
```

---

## Maintenance contract

Gate scripts stay in sync with `rules-enforcer.md` and `ux-master-doctrine.md`.
Adding a rule, NEG, architecture pattern, setter, or gate requires updating the corresponding script
in the same pass. If a script is out of sync, fix the script; do not work around it.
Engine split and the dev-only exclusion list: [maintenance-contract.md](references/maintenance-contract.md).

---

## References

- `../sithasodaisy5/references/rules-enforcer.md` — every L1-L5 rule (source of truth)
- `./references/laragon-serve.md` - Laragon install + per-app serve convention + G5/G6 wiring (`http://localhost/<app>/index.html`)
- `./references/demo-build.md` - verified IDE flow and dated B4JBuilder CLI evidence/limitations
- `./references/production-hardening.md` - G8 release-only rules (secrets, paths, required files)
- [browser-evidence.md](references/browser-evidence.md) — G5 DOM, console, network, accessibility, and untrusted-content boundaries.
- [performance-budget.md](references/performance-budget.md) — Core Web Vitals targets, first-party budgets, keep-or-revert rules.
- [debugging-runbook.md](references/debugging-runbook.md) — stop-the-line triage for G4/G5 failures.
- [security-hardening.md](references/security-hardening.md) — G8 application-security checklist for app-authored code.
- `./references/visual-evidence.md` - optional visual-evidence receipt: scope, hashes, states, blocked checks
- `../sithasodaisy5/references/negative-knowledge.md` — anti-patterns (source of truth)
- `../sithasodaisy5/references/ux-master-doctrine.md` — quantitative laws + DoD
- `../sd5-web-orchestrator/SKILL.md` — Stage 5/6/8 use these scripts
- `../sd5-web-orchestrator/references/ux-review.md` — visual review template (Stage 9)

---

## Operating principles

Truth and accuracy rank above helpfulness. The canonical 7 rules live in
[operating-principles.md](../sithasodaisy5/references/operating-principles.md) and apply to every response.
