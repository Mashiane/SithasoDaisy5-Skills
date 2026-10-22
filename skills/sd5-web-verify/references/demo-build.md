# Demo build chain and CLI evidence (verified evidence, 2026-10-22)

How `SithasoDaisy5DemoCode.b4j` becomes `C:\laragon\www\sd5codedemo\` in the
B4J IDE. Every IDE-flow claim cites the project file or the published output.
The B4JBuilder CLI was separately exercised on 2026-10-22; see §4 for the
verified behavior and the resolved target-project module-header issue.

## 1. Project globals (`.b4j:1160-1179`)

| Global | Demo value | Role |
|---|---|---|
| `AppName` | `"sd5codedemo"` | Output subfolder name AND `Initialize` app key |
| `AppTitle` | `"SithasoDaisy5 Code 57.47"` | `index.html` `<title>` (verified in output) |
| `Publish` | `"C:\laragon\www"` | Build root; output lands in `Publish\AppName` |
| `Version` | `"57.47"` | Compared against `env.json` version (reload on mismatch) |
| `ServerIP` | `"http://127.0.0.1"` | Browser-open URL root (Laragon serves docroot at `/`) |
| `APIKey/ServerURL/DB*` | `""` (filled from `env.json` at runtime) | Runtime config, never build config |

## 2. IDE build (F5 → `AppStart`, `.b4j:1181-1297`)

1. `Log("BANanoLOGS")` (debug log-jump, literal line required).
2. `BANano.Initialize("BANano", AppName, DateTime.now, AppName)` — 4th arg
   reuses AppName; `DateTime.now` cache-busts the build.
3. Header assembly: title, favicons, PWA icon set, `movies/places/services/
   webpushr.js` app scripts, adsense meta. (`JAVASCRIPT_NAME` commented out
   → default `scripts/app.js` + `ES5_app.js`.)
4. Transpiler options: debug-friendly (no minify, no dead-code removal, live
   swap on, full variable names). `DoNotDeleteFolderOnCompilation` protects
   `assets/`, `files/`, `pdfjs/` across rebuilds.
5. `BANano.Build(Publish)` transpiles every `.bas` → `C:\laragon\www\
   sd5codedemo\`. PWA/service-worker lines are commented out (not a PWA).
6. `fx.ShowExternalDocument("http://127.0.0.1/sd5codedemo/index.html")`
   opens the default browser at the Laragon URL. Release mode exits the IDE
   afterwards (`ExitApplication`).

## 3. Published output (verified on disk)

- `index.html` (10 KB): title = AppTitle; 6 CSS links first
  (`loader-1`, `sweetalert2`, `notyf`, `daisyui.min.css`, `daisyuithemes.css`,
  `typography.css`). No static `<script src>` — JS loads via the
  `DOMContentLoaded` harness (`modSD5.DOMContentLoaded`).
- `scripts/` (~100 files): `app.js` (1.5 MB, the demo) + `ES5_app.js`,
  `bananocore9.25.js` (+ES5), `sithasodaisy5.js` (3.6 MB, the library),
  one file per third-party lib (quill, leaflet, fullcalendar, kanban…).
- `styles/`, `assets/`, `pdfjs/`, `manifest.json`, `favicon.ico`.
- Runtime entry (`BANano_Ready`, `.b4j:1304+`): fetches
  `./assets/env.json?DateTime.Now` (`no-store`) → fills APIKey/ServerURL/DB
  globals → `pgIndex.Initialize`.

## 4. Template deltas (deliberate)

`project.template.b4j` is this shape trimmed for greenfield: PWA icon block,
extra app scripts, adsense meta, and commented-out options removed; env.json
block kept but marked optional. Anything trimmed is re-addable from this
file's §2–§3 as the app needs it.

## 4. B4JBuilder CLI verification (2026-10-22)

- B4JBuilder v10.70 was invoked with `-Task=Build` from the project folder.
- A minimal JavaFX project built successfully. A second smoke project with
  `banano`, `jcore`, `jfx`, `json`, and `sithasodaisy5` also built a JAR and
  reported `Completed successfully` (about 84 seconds). The builder's normal
  stdout includes its version, Java version, BaseFolder, ProjectFile,
  BuildConfiguration, parsing/compilation stages, JAR path, and elapsed time.
- The first `19-privacy-cloud-auth` attempt did **not** build because its new
  `pgCloudAuth.bas` lacked the B4J module design header. After adding the
  template header, the full `build-banano-app.ps1` chain passed: B4JBuilder
  exit 0, JAR created, JavaFX launch, BANano conversion-finished marker, and
  fresh `C:\laragon\www\sd5cloudauth\index.html` plus
  `scripts\app.js`. Evidence: app `.agent/build/BUILD-20261022-200432.md`.
- The build helper now captures stdout and stderr separately and combines them
  into its B4J log, including on nonzero exit. The initial failure log remains
  in the app build folder for diagnosis; current G4 is verified PASS by the
  later complete build report. G5 browser serving/rendering remains a separate
  gate.
