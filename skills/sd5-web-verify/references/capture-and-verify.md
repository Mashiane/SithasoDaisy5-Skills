# Capture and Verify

## Playwright engine (`playwright_test.js`)

- **Multi-viewport sweep**: desktop 1440x900, tablet 768x1024, mobile 390x844.
  Outputs `<page>-desktop.png`, `<page>-tablet.png`, `<page>-mobile.png`.
- **Console/runtime diagnostics**: `console.error`, uncaught BANano exceptions, failed network requests.
- **Layout gate**: detects `scrollWidth > clientWidth` horizontal overflow (`w-screen` leaks).
- **WCAG 2.2 fast audit**: missing `alt`, unlabelled inputs, empty buttons.
- **Evidence**: writes `ux-review/screens/ux-report.json` with PASS/WARN/FAIL and exact findings.
- **Fallback**: native headless Edge/Chrome when Node/Playwright is absent.

## Exact viewport capture

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/capture-screens.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<app> -Page home,profile,dashboard -Width 1280 -Height 900 -Out <AppFolder>\ux-review\screens\desktop
powershell.exe -NoProfile -ExecutionPolicy Bypass -File <skill>/scripts/capture-screens.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<app> -Page home,profile,dashboard -Width 390 -Height 844 -Out <AppFolder>\ux-review\screens\phone
```

Use the contracted viewport when the user specifies one. Add tablet or 200% zoom evidence when the page
design, interaction model, or contract makes it relevant. Screenshots from only one width leave G6 open.

## `browser_capture.js`

Sets the viewport through Chrome DevTools Protocol, waits for image assets, writes a full-page PNG, and
reports horizontal overflow, console messages, and uncaught exceptions. Use it for exact CSS viewport
emulation; it avoids Windows display scaling changing the viewport behind `--window-size`.

```powershell
node <skill>/scripts/browser_capture.js `
  http://127.0.0.1:8765/<app>/index.html `
  <AppFolder>/ux-review/screens/mobile.png 390 844
```

## `verify-example-apps.ps1`

Builds each app's `.b4j`, runs the generated JAR through the BANano transpiler, captures desktop and phone
screenshots, and writes build logs, per-viewport JSON, screenshots, and a suite summary.
Start a local static server rooted at the shared publish directory first.

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File `
  <skill>/scripts/verify-example-apps.ps1 `
  -AppsRoot C:\b4j\workspace\0SithasoDaisy5Skills\AIExamples `
  -BaseUrlRoot http://127.0.0.1:8765
```

Use `-AppFolders @('01-landing-hero')` for one project; `-SkipCompile` only when its JAR matches the source.

## Evidence validity

- A screenshot with `ready: false`, a visible loader, or runtime exceptions is a failed visual check.
- Review both screenshots for every app; zero overflow does not prove the layout is usable.
- Keep compile/transpile logs with each capture so a blank screenshot can be tied to the real failure.
- Fix from screenshot/DOM evidence, then rebuild and recapture the affected app at both viewports.
