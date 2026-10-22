# Laragon serve flow (G5 runtime evidence)

Recommended dev webserver: **Laragon** (Apache). BANano emits static files
(`index.html` + `assets/` + `scripts/` + `styles/`); no PHP/MySQL needed to
serve a built app. Live precedent: `C:\laragon\www\sd5codedemo\index.html`
(BANano v9.25 output) opens at `http://localhost/sd5codedemo/index.html`.

## Install (one time)

1. Install Laragon (portable or full) and start it; ensure Apache is running.
2. Confirm the docroot exists: `C:\laragon\www\`.
3. Open `http://localhost/sd5codedemo/index.html` — the reference BANano app
   must load. If it does not, fix Laragon/Apache first; no app gate can pass
   without a serving webserver.

## Per-app convention (every app)

1. One subfolder per app: `C:\laragon\www\<appname>\` (lowercase, no spaces).
2. In the B4J project's embedded entry module, set the BANano `Publish` path
   to `C:\laragon\www\<appname>\` before building. (`ServerIP`/port follow the
   user's app template — see OPEN item below.)
3. Build in B4J (F5 / builder). Verify `index.html` + `assets/` land in the
   app subfolder. Never publish two apps to the same folder.
4. Open `http://localhost/<appname>/index.html` and confirm the app renders.

Full verified chain (demo project → published output): `demo-build.md`.

## G5/G6 wiring (after serve)

```powershell
# G5 runtime gate — console errors, resource loads, title, theme, render proof
powershell.exe -NoProfile -ExecutionPolicy Bypass -File skills\sd5-web-verify\references\build-watch.template.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<appname>

# G6 capture — one PNG per contracted page
powershell.exe -NoProfile -ExecutionPolicy Bypass -File skills\sd5-web-verify\scripts\capture-screens.ps1 -AppFolder <AppFolder> -BaseUrl http://localhost/<appname> -Page home,login,dashboard
```

`build-watch` writes `ux-review/BUILD-WATCH-<YYYYMMDD>.md`; capture writes
`<AppFolder>/ux-review/screens/<PageId>.png`. Cite both in `.agent/STATE.md`.

## OPEN

- The user's canonical app template (exact `Publish`/`ServerIP`/env block) is
  still to be provided. Known from `BANanoEssentialsV1.09.pdf` meanwhile: the
  entry module's `AppStart` is the only non-transpiled method (p22) and must
  contain `BANano.Initialize` + `JAVASCRIPT_NAME` cache-bust +
  `Log("BANanoLOGS")` (p59) + `BANano.Build`; subfolder-served PWAs set
  `TranspilerOptions.SetPWAStartUrl` (p59). See
  `../../sithasodaisy5/references/banano-essentials.md`. When the template
  lands, its values replace any per-app guesses.
