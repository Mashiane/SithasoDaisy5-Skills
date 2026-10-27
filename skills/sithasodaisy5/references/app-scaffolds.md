---
name: app-scaffolds
description: Standard SithasoDaisy5 app shell templates — BANano_Ready entry, pgIndex.bas page registry, pg*.bas page template. Use as the starting point for any new app or new page.
---
# SithasoDaisy5 App Scaffolds

Copy-paste starting points. Every new app or page begins from one of these templates.

---

## 1. App Entry Point (embedded in `<AppName>.b4j`)

> **Ambiguity resolved (2026-08-31):** In a real B4J project the main module — `AppStart` +
> `BANano_Ready` — is **embedded inside the `<AppName>.b4j` project file itself**, after
> `@EndOfDesignText@`. There is **no separate `Main.bas`**; both reference projects
> (`SithasoDaisy5Template1\B4J\SithasoDaisy5Pages.b4j` and
> `0SithasoDaisy5DemoCode\B4J\SithasoDaisy5DemoCode.b4j`) confirm this. Earlier versions of
> this file described a separate `Main.bas` module — that was misleading. If your tooling
> insists on a module name for the entry, it is the project file itself.

The project file has two parts:

```text
<AppName>.b4j
  ├── Part 1: INI metadata (AppType, Library1..N, Module1..N, NumberOfModules, Version, @EndOfDesignText@)
  └── Part 2: Embedded entry module (the "Main"): Process_Globals + AppStart + Application_Error + BANano_Ready
```

### 1a. Minimal `<AppName>.b4j` template (metadata + embedded entry)

Copy-ready file: `skills/sd5-project-bootstrap/references/project.template.b4j`
(`<AppName>`/`<AppTitle>` placeholders; pgIndex + pgHome registered).

The canonical template below is the **B4J project file to be created** for every
new app — the same shape as the reference `SithasoDaisy5Demo.b4j` (production
entry module with DB globals, Debug log, `DoNotDeleteFolderOnCompilation`, and
an optional `env.json` version check), trimmed to greenfield-safe assets. Only
`./assets/600by600.jpg` ships with the library; do NOT add PWA icon / JS /
`env.json` references unless the app's `Files/` actually contains them.

```text
AppType=JavaFX
Build1=Default,b4j.example
Group=Default Group
Library1=banano
Library2=jcore
Library3=jfx
Library4=json
Library5=sithasodaisy5
Module1=pgIndex
Module2=pgHome
NumberOfFiles=0
NumberOfLibraries=5
NumberOfModules=2
Version=10.2
@EndOfDesignText@
```

```b4j
'=== Everything below @EndOfDesignText@ is the embedded entry module ===
#Region Project Attributes 
	#MergeLibraries: True
	#LibraryAuthor: Anele Mbanga (Mashy)
	#IgnoreWarnings:32, 16
#End Region

#Macro: After Save, Sync Layouts, ide://run?File=%ADDITIONAL%\JsonLayouts.jar&Args=%PROJECT%&Args=%PROJECT_NAME%
#Macro: Title, JsonLayouts folder, ide://run?File=%WINDIR%\explorer.exe&Args=%PROJECT%\JsonLayouts
#Macro: Title, Code bundle, ide://run?File=%ADDITIONAL%\CodeBundle.jar&Args=%PROJECT_NAME%

#IgnoreWarnings:12, 15
Sub Process_Globals
	Public BANano As BANano 'ignore
	Public AppName As String = "myapp"
	Public AppTitle As String = "My App"
	Public AppVersion As String = "1.00"
	Public Publish As String = "C:\laragon\www"
	Public Version As String = "1.00"
	Public ServerIP As String = "http://127.0.0.1"
	Public APIKey As String = ""
	Public ServerURL As String = ""
	Public DBHost As String = ""
	Public DBDriver As String = ""
	Public DBUser As String = ""
	Public DBPassword As String = ""
	Public DBPort As String = ""
	Public DBName As String = ""
End Sub

Sub AppStart (Form1 As Form, Args() As String)
	#if Debug
	'	MUST be literally this line if you want to use the B4J Logs jump to code feature!
		Log("BANanoLOGS")
	#End if
	'initialize banano for first use
	'this is the web-app builder
	BANano.Initialize("BANano", AppName, DateTime.now, AppName)
	BANano.Header.Title = AppTitle
	BANano.Header.AddFavicon("./assets/600by600.jpg", "16x16")
	BANano.Header.AddAppleTouchIcon("./assets/600by600.jpg", "180x180")
	BANano.Header.Author = "SithasoDaisy5"
	BANano.Header.Description = "SithasoDaisy5 web app"
	BANano.Header.Keywords = "banano,tailwindcss,app,sithasodaisy"
	BANano.Header.Language = "en"
	BANano.Header.AddMeta($"<meta name="copyright" content="© 2025 SithasoDaisy 5">"$)
	BANano.Header.AddMeta($"<meta name="robots" content="ALL">"$)
	BANano.TranspilerOptions.MinifyOnline = False
	BANano.TranspilerOptions.RemoveDeadCode = False
	BANano.TranspilerOptions.IgnoreWarningsOldBrowsers = True
	BANano.TranspilerOptions.ShowWarningDeadCode = False
	BANano.TranspilerOptions.MergeAllCSSFiles = False
	BANano.TranspilerOptions.MergeAllJavascriptFiles = False
	BANano.TranspilerOptions.EnableLiveCodeSwapping = True
	BANano.TranspilerOptions.DisableShortenVariableNames = True
	BANano.Header.OnDOMContentLoaded = modSD5.DOMContentLoaded
	BANano.TranspilerOptions.DoNotDeleteFolderOnCompilation($"${Publish}\${AppName}\assets"$)
	BANano.TranspilerOptions.DoNotDeleteFolderOnCompilation($"${Publish}\${AppName}\files"$)
	BANano.TranspilerOptions.DoNotDeleteFolderOnCompilation($"${Publish}\${AppName}\pdfjs"$)
	BANano.TranspilerOptions.ShowLogPosition = True

	'transpile the app to javascript
	BANano.Build(Publish)

	'open the default browser and show the generated index.html file
	Dim fx As JFX
	Dim appPath As String = $"${ServerIP}/${AppName}/index.html"$
	fx.ShowExternalDocument(appPath)
	#if release
	ExitApplication
	#end if
End Sub

'Return true to allow the default exceptions handler to handle the uncaught exception.
Sub Application_Error (Error As Exception, StackTrace As String) As Boolean
	Return True
End Sub

Sub BANano_Ready
	' Load env.json if present (mirrors SithasoDaisy5DemoCode reference app)
	' Provides APIKey, ServerURL, DB config, and version-check reload on mismatch.
	' If env.json is missing, gracefully continues to pgIndex.Initialize.
	Dim bfo As BANanoFetchOptions
	bfo.Initialize
	bfo.Cache = "no-store"
	bfo.Method = "GET"
	Dim env As Map = BANano.Await(BANano.GetFileAsJSON("./assets/env.json?" & DateTime.Now, bfo))
	If env <> Null Then
		APIKey = env.Get("api-key")
		ServerURL = env.Get("api-url")
		DBHost = env.Get("host")
		DBDriver = env.Get("driver")
		DBUser = env.Get("user")
		DBPassword = env.Get("password")
		DBPort = env.Get("port")
		DBName = env.Get("dbname")
		AppVersion = env.Get("version")
		If AppVersion <> "" And Version <> AppVersion Then
			BANano.Location.Reload(True)
			Return
		End If
	End If

	pgIndex.Initialize
End Sub
```

**Notes**:

- `modSD5` ships inside the `sithasodaisy5` library — you never create it per app.
- `./assets/600by600.jpg` is provided by the library's bundled files — no local copy needed.
- Every `.bas` module you add must be registered: `ModuleN=<name>` + bump `NumberOfModules`.
- `BANano_Ready` hands off to `pgIndex.Initialize`; the page registry takes over from there.
- The checked-in local BANano/SithasoDaisy5 demo uses the four-argument initializer shown above. If the installed BANano version differs, verify its initializer signature against a working project on that same toolchain before changing argument count.
- `AppStart` runs in the JFX desktop host and calls `BANano.Build(Publish)` to transpile to JS.
- **Propagate async helpers:** if a subroutine contains `BANano.Await(...)`, every caller that depends on its completion must also call it as `BANano.Await(SubName)`. For example, when `BuildBrandPanel` awaits each component's `AddComponent`, `Show` must use `BANano.Await(BuildBrandPanel)` before building dependent UI. Apply this transitively through all helper-call levels; otherwise later DOM work can run before awaited mounts complete and the browser app can fail during startup.
- The `DB*` globals and `env.json` block are optional (needed only for DB / API-backed
  apps); keep them declared so the entry module matches the reference shape exactly.
- The `#Macro` lines enable the JsonLayouts / CodeBundle IDE tools; harmless if absent.

### 1b. App `Files/` asset folder (canonical copy-source)

The skill carries only the assets a new app must **explicitly copy** — i.e. the
files the SithasoDaisy5 component `.bas` source references **that are NOT already
shipped inside the compiled `SithasoDaisy5.b4xlib`** (`C:\b4j\libraries\SithasoDaisy5.b4xlib`,
whose `Files/` folder is auto-bundled into `File.DirAssets` at build). Everything
the b4xlib already provides (JS/CSS libs, SVG icons, `600by600.jpg`, `mashy.jpg`,
`.bjl` layouts, `upload.php`, …) is excluded — the app gets those for free by
referencing the library. The canonical source:

```text
skills/sithasodaisy5/references/Files/          # 11 files — copy these into a new app's Files/
skills/sithasodaisy5/references/file-registry.b4j  # the matching FileN=/FileGroupN=/NumberOfFiles block
```

Contents (referenced by `.bas` source, not in the b4xlib): **11 sample images**
(`1.jpg`–`5.jpg`, `13.jpg`, `team-1..5.jpg`) used as defaults by
`SDUI5AvatarGroup`, `SDUI5Diff`, and `SDUI5Table`. Regenerate the folder +
registry whenever the library's `.bas` asset references or the b4xlib contents
change — see `sd5-book-to-skill` for the extractor pattern.

To give a new app the reference asset set:

1. **Copy the folder**: `Copy-Item skills/sithasodaisy5/references/Files/* <AppFolder>\Files\ -Recurse`
2. **Wire the project file**: append `file-registry.b4j`'s `FileN=` + `FileGroupN=`
   lines (11 each) into `<AppName>.b4j` and set `NumberOfFiles=11`. These are
   the exact entries from the reference app(s) — do not hand-write them.
3. **Prune what you don't use**: delete the unneeded `FileN=`/`FileGroupN=` lines
   and the matching files, and correct `NumberOfFiles` to match. The registry is
   the starting point, not a mandate to ship all 11 assets.
4. **Greenfield minimum**: if the app uses only library-bundled assets (remote
   daisyUI URLs + `600by600.jpg`), keep `NumberOfFiles=0` and skip the copy —
   that is the default §1a template state.

### 1c. `env.json` runtime config (template: `references/Files/env.json`)

Studied from demo `Files\env.json` (377 bytes, `File103=env.json` in the demo
`.b4j`). Every project created by skills must ship a valid `env.json` in `Files/env.json`
and have `FileN=env.json` + `FileGroupN=Default Group` registered in the `.b4j` `[FilesGroup]`
(with `NumberOfFiles` bumped) so BANano automatically copies it to `assets/` on build.

When creating an app using skills, update `env.json` as follows:
- **`api-key`**: A newly generated API key (128 random alphanumeric characters).
- **`api-url`**: `"http://127.0.0.1/<appname>"` containing the name of the app being created.
- **`version`**: The new version of the app we are starting on, usually `"1.00"`.
  **CRITICAL**: This must equal `Public Version As String` and `Public AppVersion As String` defined in the `.b4j` file (a mismatch triggers `BANano.Location.Reload(True)` in an infinite reload-loop).
- Standard database defaults:
  - `"host": "../assets/northwind.sqlite"`
  - `"driver": "sqlite"`
  - `"user": ""`
  - `"password": ""`
  - `"port": "3306"`
  - `"dbname": "addressbook"`

```json
{
    "api-key": "<newly-generated-128-char-key>",
    "api-url": "http://127.0.0.1/<appname>",
    "host": "../assets/northwind.sqlite",
    "driver": "sqlite",
    "user": "",
    "password": "",
    "port": "3306",
    "dbname": "addressbook",
    "version": "1.00"
}
```

| Key | Value for newly created app | Note |
|---|---|---|
| `api-key` | Newly generated 128-char alphanumeric string | Unique per app |
| `api-url` | `"http://127.0.0.1/<appname>"` | Contains the name of the app being created |
| `host` | `"../assets/northwind.sqlite"` | Local SQLite DB path |
| `driver` | `"sqlite"` | DB driver |
| `user` / `password` | `""` | Keep empty in shipped output |
| `port` | `"3306"` | Database port |
| `dbname` | `"addressbook"` | Database name |
| `version` | `"1.00"` | **Must equal `.b4j` `Version` and `AppVersion`** |

> `verify-conformance.ps1` enforces the wiring: every `FileN=` must have a
> matching `FileGroupN=Default Group\...`, every `FileN` must exist in `Files\`,
> and `NumberOfFiles` must equal the `FileN=` count (RULE-SETUP-004).

---

## 2. App Shell + Page Registry (`pgIndex.bas`)

Copy-ready minimal shell: `skills/sd5-project-bootstrap/references/pgIndex.template.bas`
(app + navbar + pageview + first page + title helper). Full drawer shell below.

`pgIndex` is the app's singleton: it **creates the `SDUI5App`**, builds the full shell
(left drawer with side-nav menu + user card, top navbar, page view, optional right/bottom
drawers, theme-controller toggle) and routes pages. Every app has exactly one. For the
complete source-based shell example, see the [demo `pgIndex.bas` source](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas).

```b4j
B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'=== pgIndex.bas ===
'--------------------------------------------------------------------------------
'APP SHELL + PAGE REGISTRY — the spine of the app. Understand this file first.
'
'What pgIndex owns (the whole app's mental model):
'  1. THE APP — pgIndex creates the SDUI5App singleton (`Public App`). Pages never
'     create an app; they borrow pgIndex's via `app = pgIndex.App`.
'  2. THE CHROME — everything that stays on screen while pages change: left drawer
'     (nav menu + user card), top navbar, theme toggle, optional right/bottom drawers.
'     All chrome is Private: pages must NOT touch it directly — they use the helper
'     API at the bottom of this module (UpdateTitle, OpenDrawer, ...).
'  3. THE PAGE VIEW — one container (id "pageview"). Every page Show() clears it
'     (`app.ClearPageView`) and mounts fresh content into `app.PageView`. Pages are
'     NOT kept alive between visits — they rebuild on every Show.
'  4. THE ROUTES — drawermenu_ItemClick is the single source of truth for menu
'     routing; code elsewhere (buttons, deep links) calls pgXxx.Show directly.
'
'Boot sequence (Sub Initialize, in order):
'  App.Initialize  ->  load shared assets (Uses*)  ->  build chrome (parents first!)
'  ->  build drawer menu  ->  show first page  ->  App.pageresume (hide splash).
'--------------------------------------------------------------------------------
'Static code module — app shell + page registry. Every app has exactly one.
#IgnoreWarnings:12

Sub Process_Globals
	Public BANano As BANano		'ignore
	Public App As SDUI5App		'ignore
	'--- shell chrome (Private + 'ignore to prevent compile warnings) ---
	Private appdrawer As SDUI5Drawer			'ignore
	Private drawerNav As SDUI5NavBar			'ignore
	Private drawerbody As SDUI5Panel			'ignore
	Private drawermenu As SDUI5Menu				'ignore
	Private draweruser As SDUI5DrawerUser		'ignore
	Private appnavbar As SDUI5NavBar			'ignore
	Private pageView As SDUI5Container			'ignore
	Private rightdrawer As SDUI5Drawer			'ignore
	Private bottomdrawer As SDUI5BottomDrawer	'ignore
End Sub

Sub Initialize
	'STEP 1 — create the app. This boots the framework against the <body> element:
	'installs the #loader-1 splash, wires online/offline events, inits themes.
	'App.Here is the shell root selector ("#body") — chrome mounts into it.
	BANano.Await(App.Initialize(Me))
	'optional: App.AddGoogleAdSenseURL("https://pagead2.googlesyndication.com/...")

	'STEP 2 — load shared assets ONCE, up front (each is a JS/CSS library injector).
	'Anything a component needs at runtime must be loaded here or it 404s later.
	'Trim to what your pages actually use.
	'BANano.Await(App.UsesColorWheel)
	'BANano.Await(App.UsesDatePicker)
	'BANano.Await(App.UsesFontAwesome)
	'BANano.Await(App.UsesJSONQuery)
	'BANano.Await(App.UsesGenderChart)
	'BANano.Await(App.UsesQuill)
	'BANano.Await(App.UsesGifPlayer)
	'BANano.Await(App.UsesBottomNavigation)
	'BANano.Await(App.UsesNoUISlider)

	'STEP 3 — build the chrome. Order matters: a component must exist in the DOM
	'before anything mounts INTO it (ParentID must point at an existing id).
	'MOUNT ORDER: appdrawer -> drawer regions -> navbar -> pageview -> menu -> extras.

	'--- left drawer: shell root ---
	appdrawer.Initialize(Me, "appdrawer", "appdrawer")
	appdrawer.ParentID = App.Here
	appdrawer.MdOpen = True
	BANano.Await(appdrawer.AddComponent)

	'--- navbar inside the drawer's side content ---
	drawerNav.Initialize(Me, "drawerNav", "drawerNav")
	drawerNav.ParentID = "appdrawer_sidecontent"
	drawerNav.BackgroundColor = "base-200"
	drawerNav.Gradient = ""
	drawerNav.GradientActive = False
	drawerNav.HasBurger = False
	drawerNav.LogoMask = "squircle"
	drawerNav.PaddingAXYTBLR = "a=2; x=?; y=?; t=?; b=?; l=?; r=?"
	drawerNav.Shadow = "lg"
	drawerNav.Title = "SithasoDaisy 5 Beta 11"
	drawerNav.Width = "full"
	BANano.Await(drawerNav.AddComponent)

	'--- top navbar over the content area ---
	appnavbar.Initialize(Me, "appnavbar", "appnavbar")
	appnavbar.ParentID = "appdrawer_content"
	appnavbar.BackgroundColor = "base-200"
	appnavbar.Gradient = ""
	appnavbar.GradientActive = False
	appnavbar.HasLogo = True
	appnavbar.HideHamburgerOnLargeScreen = True
	appnavbar.LogoHeight = "40px"
	appnavbar.LogoMask = "squircle"
	appnavbar.LogoWidth = "40px"
	appnavbar.Shadow = "lg"
	appnavbar.Title = Main.AppTitle
	appnavbar.Width = "full"
	BANano.Await(appnavbar.AddComponent)

	'--- page view: every page mounts into app.PageView (SDUI5App.PageView = "#pageview") ---
	pageView.Initialize(Me, "pageview", "pageview")
	pageView.ParentID = "appdrawer_content"
	pageView.Container = False
	BANano.Await(pageView.AddComponent)

	'--- panel + menu in the drawer's side content ---
	drawerbody.Initialize(Me, "drawerbody", "drawerbody")
	drawerbody.ParentID = "appdrawer_sidecontent"
	drawerbody.BackgroundColor = "base-100"
	drawerbody.Flexbox = True
	drawerbody.FlexDirection = "col"
	drawerbody.FlexGrow = "1"
	drawerbody.PaddingAXYTBLR = "a=?; x=?; y=?; t=4; b=?; l=?; r=?"
	BANano.Await(drawerbody.AddComponent)
	'
	drawermenu.Initialize(Me, "drawermenu", "drawermenu")
	drawermenu.ParentID = "drawerbody"
	drawermenu.BackgroundColor = "base-100"
	drawermenu.MinHeight = ""
	drawermenu.Classes = "px-4 py-0"
	drawermenu.ItemClasses = ""
	drawermenu.ItemStyles = ""
	drawermenu.RoundedBox = False
	drawermenu.RoundedItems = False
	drawermenu.TextColor = "base-content"
	drawermenu.Width = "full"
	BANano.Await(drawermenu.AddComponent)

	'--- user card under the menu ---
	draweruser.Initialize(Me, "draweruser", "draweruser")
	draweruser.ParentID = "appdrawer_sidecontent"
	draweruser.Avatar = "./assets/mashy.jpg"
	draweruser.AvatarShape = "squircle"
	draweruser.EmailAddress = "mbanga [dot] anele [at] ..."
	draweruser.UserName = "Anele Mbanga (Mashy)"
	BANano.Await(draweruser.AddComponent)

	'--- right drawer (optional; open with OpenRightDrawer) ---
	rightdrawer.Initialize(Me, "rightdrawer", "rightdrawer")
	rightdrawer.ParentID = "appdrawer_content"
	rightdrawer.RightSide = True
	rightdrawer.RoundedBottomLeft = "xl"
	rightdrawer.RoundedTopLeft = "xl"
	rightdrawer.Width = "600px"
	BANano.Await(rightdrawer.AddComponent)

	'--- bottom drawer (optional; open with OpenBottomDrawer) ---
	bottomdrawer.Initialize(Me, "bottomdrawer", "bottomdrawer")
	bottomdrawer.ParentID = "appdrawer_content"
	bottomdrawer.BackgroundColor = "bg-base-100"
	bottomdrawer.Breakpoints = "0;0.1;0.2;0.3;0.4;0.5;0.7;0.8;0.9;0.95;1"
	BANano.Await(bottomdrawer.AddComponent)

	'STEP 4 — menus + first page + splash.
	'build the navigation menu, show the first page, resume state
	BANano.Await(CreateDrawerMenu)
    'show the page of choice'
    BANano.Await(phShow.Show)
	'optional: create DB schemas — see AddDatabaseSchemas below
	'BANano.Await(AddDatabaseSchemas)
	'hide the #loader-1 splash installed by App.Initialize (show it again with
	'App.PagePause during long operations). Call this LAST, after boot work.
	App.pageresume
End Sub

'--------------------------------------------------------------------------------
'SHELL EVENT WIRING — handlers named "<EventName>_<Event>" (framework convention).
'These two form a sync loop: the hamburger toggles the drawer, and the drawer's
'open/close state flips the hamburger back — keep them paired.
'--------------------------------------------------------------------------------
'the navbar hamburger opens/closes the drawer
Private Sub appnavbar_BurgerClick (value As Boolean)
	appdrawer.OpenDrawer(value)
End Sub

'keep the hamburger swap in sync when the drawer opens/closes
Private Sub appdrawer_Opened (Status As Boolean)
	appnavbar.Hamburger.Active = Status
End Sub

'navbar title click (logo/title area)
Private Sub appnavbar_TitleClick (e As BANanoEvent)
	e.PreventDefault
	App.ShowToastSuccess("Title Click!")
End Sub

'navbar search events (fire when the navbar search box is used)
Private Sub appnavbar_SearchClick (Value As String)
	App.ShowSwalSuccess($"You entered search: '${Value}'"$)
End Sub

Private Sub appnavbar_SearchKeyUp (Value As String)
	Log(Value)
End Sub

Private Sub appnavbar_SearchClear (e As BANanoEvent)
	App.ShowSwalSuccess($"Search was cleared!"$)
End Sub

'user card events in the drawer side content
Private Sub draweruser_Click (event As BANanoEvent)
	App.ShowToastInfo("User Name")
End Sub

Private Sub draweruser_Exit (event As BANanoEvent)
	App.ShowToastInfo("Exit")
End Sub

'--- OPTIONAL: logoff button handler (uncomment + wire a btnLogOff to use) ---
'Private Sub btnLogOff_Click (e As BANanoEvent)
'	HideNavBar
'	CloseDrawerByForce
'	'...show your sign-in page, e.g. BANano.Await(pgSignIn.Show)
'End Sub

'--------------------------------------------------------------------------------
'NAVIGATION — menu definition + routing. Two pieces, wired by one naming rule:
'  menu item id "pg-<pagename>"  --click-->  drawermenu_ItemClick parses <pagename>
'  --route--> pgXxx.Show (called directly in the Select Case)
'So "pg-home" routes to pgHome.Show. To add a page: AddItemChild here + a route case
'in drawermenu_ItemClick + ModuleN= in <AppName>.b4j (§4). Non-page items (external
'links) use ids WITHOUT the "pg-" prefix and are ignored by the click router.
'--------------------------------------------------------------------------------
'--- menu definition ---
Sub CreateDrawerMenu
    'this shows how to add parent child relationships in the drawer menu'
	drawermenu.AddItemParent("", "wnew", "", "What's New")				' add parent'
	drawermenu.AddItemChild("wnew", "pg-swiper", "", "Swiper")			'add page'

	drawermenu.AddItemParent("sd5lowcode", "./assets/aperture.svg", "SD5 LowCode Generator")		'add page with icon'
End Sub

'route menu clicks: item ids follow "pg-<pagename>"
Private Sub drawermenu_ItemClick (item As String)
	'1. reset the chrome for the incoming page: close the drawer (mobile) and
	'   re-open it on medium+ screens, deactivate the hamburger swap
	appdrawer.OpenDrawer(False)
	appdrawer.MdOpen = True
	appnavbar.Hamburger.Active = False
	'2. reset pageview padding + height so every page starts from a known layout
	'   (special pages may override afterwards, e.g. login clears padding)
	pageView.PaddingAXYTBLR = "a:10px"
	App.PageViewToFullScreenHeight(Array("appnavbar"))
	'3. only "pg-*" items route to pages — others (external links etc.) exit here
	Dim sprefix As String = App.UI.MvField(item, 1, "-")
	If sprefix <> "pg" Then Return
	'4. highlight the clicked menu item (clears the previous highlight)
	BANano.Await(drawermenu.SetItemActive(item))
	'5. extract <pagename> from "pg-<pagename>" and route
	Dim sPage As String = App.UI.MvField(item, 2, "-")
    'the prefix of each page is pg, show the page we want
	Select Case sPage
		Case "bottomnav"
			pgBottomNav.Show
	End Select
End Sub

'--------------------------------------------------------------------------------
'HELPER API — the sanctioned way for PAGES to drive the chrome. Pages hold only
'`app = pgIndex.App`; the chrome components above are Private, so pages call these
'wrappers instead (e.g. pgIndex.UpdateTitle("Home") as the last line of Show()).
'Keep every helper one line deep — real logic belongs in pages, not here.
'--------------------------------------------------------------------------------
'--- helper API pages can call ---
Sub UpdateTitle(s As String)
	appnavbar.Title = s
End Sub

Sub ShowNavBar
	appnavbar.Visible = True
End Sub

Sub HideNavBar
	appnavbar.Visible = False
End Sub

Sub OpenDrawer
	appdrawer.OpenDrawer(True)
End Sub

Sub CloseDrawer
	appdrawer.OpenDrawer(False)
End Sub

Sub CloseDrawerByForce
	appdrawer.ForceClose
End Sub

Sub PageViewPaddingTo10px
	pageView.PaddingAXYTBLR = "a:10px"
End Sub

Sub OpenRightDrawer
	rightdrawer.OpenDrawer(True)
End Sub

Sub CloseRightDrawer
	rightdrawer.OpenDrawer(False)
End Sub

Sub CloseRightDrawerByForce
	rightdrawer.ForceClose
End Sub

Sub OpenBottomDrawer
	bottomdrawer.ShowOnBreakPoint(0.5)
End Sub

Sub OpenBottomDrawerOn(bp As Double)
	bottomdrawer.ShowOnBreakPoint(bp)
End Sub

Sub CloseBottomDrawer
	bottomdrawer.Hide
End Sub

Sub GetSearchValue As String
	Return appnavbar.SearchValue
End Sub

Sub SetSearchValue(s As String)
	appnavbar.SearchValue = s
End Sub

'--- OPTIONAL: database schemas (uncomment + edit for DB-backed apps) ---
'Sub AddDatabaseSchemas
'	App.AddDataModel("contacts", "id", False)
'	App.AddDataModelStrings("contacts", Array("id","fullname","emailaddress"))
'	Dim db As SDUIWebSQL
'	db.Initialize(Main.DBName, "contacts")
'	db.SetSchemaFromDataModel(App.DataModels)
'	BANano.Await(db.SchemaCreateTable)
'End Sub
```

**Key facts**:

- **The app is born here.** `App.Initialize(Me)` boots the framework on `<body>`
  (so `App.Here = "#body"` — the drawer's mount point), installs the `#loader-1`
  splash that `App.pageresume` hides at the end of boot, and wires online/offline
  connection events automatically.
- The **`pg-<pagename>` item-id suffix → route case in `drawermenu_ItemClick`** mapping is
  the single source of truth for routing. When adding a page: `ModuleN=` in
  `<AppName>.b4j` + a `drawermenu.AddItemChild` + a route case that calls `pgXxx.Show`
  (see §4).
- Shell region ids every part mounts into: `appdrawer_sidecontent` (drawer nav/menu/user),
  `appdrawer_content` (navbar + pageview + right/bottom drawers), `appnavbar_right`
  (navbar right side: label, theme toggle).
- Pages mount with `app = pgIndex.App` → `BANano.Await(app.ClearPageView)` →
  `ParentID = app.PageView` (lowercase `app` — see the L5-gate note in §3).
- **The chrome is a reference kit, not a requirement.** The drawer (nav/menu/user),
  navbar, pageview, and optional right/bottom drawers all live in this pgIndex so they
  are available when needed — but not every app uses all of them. Keep (or trim to)
  only the chrome your app actually needs.
- **Page names in the scaffold are placeholders for demonstration only.** `pgBottomNav`,
  `pg-swiper`, `pgHome`, `pgSettings`, the boot-time first page, etc. exist purely to
  show the wiring. The starting page of the app is whatever page you choose, and the
  drawer menu + route cases are defined per app (add yours via §4).

---

## 3. Page Module Template (`pgXxx.bas`)

Every page is a StaticCode module that mounts into the shell's pageview. This recommended
template was derived from the B4J page corpus. Component skills include reusable verified
usage excerpts and links to observed demo source. Use this template for new pages unless a
documented component or lifecycle pattern requires a different sequence; demo pages can
contain legacy patterns and are evidence, not templates by default.

Copy-ready file: `skills/sd5-project-bootstrap/references/pgPage.template.bas`
(CRUD variant: `pgPageCrud.template.bas`). The annotated version follows:

```b4j
B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'=== pgXxx.bas ===
'--------------------------------------------------------------------------------
'PAGE MODULE — one per page. The pgIndex router (drawermenu_ItemClick) calls Show().
'A page owns NOTHING except its own components: the app is borrowed from pgIndex,
'the chrome (navbar/drawer) is driven through pgIndex helpers, and the page mounts
'into app.PageView. Pages rebuild from scratch on every Show — keep no DOM state.
'--------------------------------------------------------------------------------
'Static code module

Sub Process_Globals
	Private BANano As BANano		'ignore
	Private app As SDUI5App			'ignore — borrowed from pgIndex, never created here
	'declare EVERY component you will mount — Private + 'ignore.
	'The 2nd Initialize arg becomes the DOM id, so unique names matter app-wide.
	Private SDUI5Container1 As SDUI5Container		'ignore
	Private SDUI5Row1 As SDUI5Row					'ignore
	Private SDUI5Column1 As SDUI5Column				'ignore
	Private SDUI5Button1 As SDUI5Button				'ignore
End Sub

'entry point — no arguments, ever (the pgIndex router calls it plain)
Sub Show
	'1. borrow the app + wipe the previous page.
	'   RULE-LIFECYCLE-001 / L5 gate: EXACTLY `app = pgIndex.App` (lowercase app)
	'   followed by `BANano.Await(app.ClearPageView)`.
	app = pgIndex.App
	BANano.Await(app.ClearPageView)

	'2. build the layout parent-first: Container -> Row -> Column -> leaves.
	'   Each AddComponent must complete BEFORE children reference its id.
	'   Page root ALWAYS mounts into app.PageView.
	SDUI5Container1.Initialize(Me, "SDUI5Container1", "SDUI5Container1")
	SDUI5Container1.ParentID = app.PageView
	BANano.Await(SDUI5Container1.AddComponent)

	'   rows = grid tracks: GridCols (base) + GridColsSm/GridColsMd responsive
	SDUI5Row1.Initialize(Me, "SDUI5Row1", "SDUI5Row1")
	SDUI5Row1.ParentID = "SDUI5Container1"
	SDUI5Row1.GridColsSm = "1"
	SDUI5Row1.GridColsMd = "12"
	BANano.Await(SDUI5Row1.AddComponent)

	'   columns = grid cells on a 12-wide grid: Size/SizeSm/SizeMd
	SDUI5Column1.Initialize(Me, "SDUI5Column1", "SDUI5Column1")
	SDUI5Column1.ParentID = "SDUI5Row1"
	SDUI5Column1.SizeMd = "6"
	SDUI5Column1.SizeSm = "12"
	BANano.Await(SDUI5Column1.AddComponent)

	'3. leaves. Composite components expose sub-regions you can mount into:
	'   "<name>_title", "<name>_actions", "<name>_content" (e.g. cards, modals).
	SDUI5Button1.Initialize(Me, "SDUI5Button1", "SDUI5Button1")
	SDUI5Button1.ParentID = "SDUI5Column1"
	SDUI5Button1.Color = "primary"
	SDUI5Button1.Text = "Get Started"
	BANano.Await(SDUI5Button1.AddComponent)

	'4. Set the navbar title through the shell after page construction.
	pgIndex.UpdateTitle("Xxx")
End Sub

'event handlers: "<ComponentName>_<Event>" — signature varies per event
'(_Click -> e As BANanoEvent, _Change -> value As Boolean, table rows -> Row/item...)
Private Sub SDUI5Button1_Click (e As BANanoEvent)
	'navigate to another page — Show clears the pageview and rebuilds it
	BANano.Await(pgSettings.Show)
End Sub
```

**Recommended page pattern** (compare with the linked demo source when a page uses an exception):

1. All components declared `Private` in `Process_Globals` (with `'ignore`)
2. `Sub Show` (no args) opens with `app = pgIndex.App` + `BANano.Await(app.ClearPageView)`
3. Mount parent-first: Container → Row (`GridCols*`) → Column (`Size*`) → leaves; every
   `AddComponent` before any child references that id
4. Page root mounts into `app.PageView`; composite sub-regions mount as `"name_title"`,
   `"name_actions"`, `"name_content"`
5. `pgIndex.UpdateTitle("...")` as the LAST statement
6. Event handlers named `<ComponentName>_<Event>`; navigate to another page by
   calling its `Show` directly (e.g. `BANano.Await(pgXxx.Show)`), go back by
   re-showing the previous page the same way

> **CRITICAL — lowercase `app` (L5 gate):** `verify-conformance.ps1` matches the lifecycle
> regex `BANano\.Await\(\s*app\s*\.ClearPageView` **case-sensitively**. B4J itself is
> case-insensitive, so both `App` and `app` compile — but **only lowercase `app` passes
> the gate**. Use `Private app As SDUI5App` + `app = pgIndex.App` in every page module.
> (Three older demo CRUD pages — pgCategories, pgContacts, pgProvinces — still use
> uppercase `App` and would fail the gate; do not copy their casing.)

> **NOTE — Container → Row → Column is a common shape, not a hard rule.** Source pages
> demonstrate that composition, but a page does not have to nest rows and columns inside
> a container to work. A page can mount a single component (a table, a form, a card)
> straight into `app.PageView` when that is all it needs.

### 3.1 Data / CRUD Page Variant

For pages driven by an `SDUI5Table` + input modal (studied from pgCategories /
pgContacts / pgProvinces). Differences from the basic page: splash lifecycle, shell
layout reset, Build/Mount split, table event handlers, modal form.

```b4j
Sub Show
	app = pgIndex.App
	'splash on while the page + data build (hide at the end with PageResume)
	app.PagePause
	'reset the shell layout — pgIndex does this on menu clicks; repeat here so
	'direct pgXxx.Show calls from code get the same treatment
	pgIndex.PageViewPaddingTo10px
	app.PageViewToFullScreenHeight(Array("appnavbar"))
	BANano.Await(app.ClearPageView)

	'the data table mounts into the pageview like any component
	tblXxx.Initialize(Me, "tblXxx", "tblXxx")
	tblXxx.ParentID = app.PageView
	'...Title, HasSearch, HasClone, tooltips...
	BANano.Await(tblXxx.AddComponent)

	'the input modal: mount into the pageview, OR into the shell's bottom drawer
	'content ("#bottomdrawercontent") for a drawer-hosted form (pgContacts style)
	mdlXxx.Initialize(Me, "mdlXxx", "mdlXxx")
	mdlXxx.ParentID = app.PageView
	BANano.Await(mdlXxx.AddComponent)

	'split heavy work out of Show: config, then data
	BANano.Await(BuildXxxTable)		'AddColumn + toolbar + MoveBackButton
	BANano.Await(BuildXxxModal)		'form controls inside the modal
	BANano.Await(MountXxx(False))	'load records -> tblXxx.SetItems
	app.PageResume
	pgIndex.UpdateTitle("Xxx")
End Sub

'table toolbar events (raised by SDUI5Table)
Private Sub tblXxx_Add (e As BANanoEvent)        'open modal in add mode
Private Sub tblXxx_Refresh (e As BANanoEvent)    're-mount data
Private Sub tblXxx_Back (e As BANanoEvent)       're-show the previous page, e.g. BANano.Await(pgHome.Show)
Private Sub tblXxx_EditRow (Row As Int, item As Map)
Private Sub tblXxx_DeleteRow (Row As Int, item As Map)
Private Sub tblXxx_CloneRow (Row As Int, item As Map)

'modal actions: validate (GetXxxValid) -> save -> MountXxx(True) -> close
Private Sub mdlXxx_Yes_Click (e As BANanoEvent)
Private Sub mdlXxx_No_Click (e As BANanoEvent)
```

Conventions in this variant: `BuildXxx*` subs configure (no data), `MountXxx(bAfterChange)`
loads data (and re-mounts after save/delete), `AddMode`/`EditMode` prepare the form,
`SetXxxDefaults` + `GetXxxValid` encapsulate defaults/validation.

### 3.2 How a Page Links Back to pgIndex

| Need                                | Call from the page                                                             |
| ----------------------------------- | ------------------------------------------------------------------------------ |
| Navigate to another page            | `BANano.Await(pgXxx.Show)`                                                 |
| Go back                             | `BANano.Await(pg<prev>.Show)` (re-show the previous page)                  |
| Update navbar title                 | `pgIndex.UpdateTitle("<title>")` (last line of `Show`)                     |
| Hide chrome (login/immersive pages) | `pgIndex.HideNavBar` + `pgIndex.CloseDrawerByForce`                        |
| Restore chrome                      | `pgIndex.ShowNavBar` + `pgIndex.OpenDrawer`                                |
| Host a form in the bottom drawer    | mount into`"#bottomdrawercontent"`, then `pgIndex.OpenBottomDrawerOn(0.5)` |
| Splash during long page build       | `app.PagePause` ... `app.PageResume`                                       |

---

## 3b. Two Page Conventions — Which to Use

There are two page shapes in the available references. **Use the code-composed style for
standard new apps unless you are building a layout (.bjl) based app.**

|               | Demo style (authoritative)                             | Template style                                                                       |
| ------------- | ------------------------------------------------------ | ------------------------------------------------------------------------------------ |
| Signature     | `Sub Show` (no args)                                 | `Sub Show(MainApp As SDUI5App)`                                                    |
| App access    | `app = pgIndex.App`                                  | `app = MainApp`                                                                    |
| Host          | `BANano.Await(app.ClearPageView)` + code composition | `BANano.LoadLayout(app.PageView, "xxxview")` + `.bjl` files                      |
| Public fields | none required                                          | `name`/`title`/`icon`/`color` + `getX` accessors (for drawer registration) |
| Source guidance | Component skill excerpts and links to demo modules | External template project; not included in this skill package |

Component skills carry copyable, verified code excerpts and identify the demo module used
for verification. Use API tables for member truth and linked demo sources for observed call
order and page context.

---

## 4. Wiring a Page Into the App

When you create a new `pgXxx.bas`, you need **3 changes**:

### A. Add `ModuleN=` to `<AppName>.b4j`

```
Module<NextN>=pgXxx
```

Also bump `NumberOfModules=<NextN>`.

### B. Add a Menu Item + Route Case in `pgIndex.bas`

```b4j
'1. in CreateDrawerMenu (under the right section):
drawermenu.AddItemChild("<sectionId>", "pg-xxx", "", "Xxx")
'2. in drawermenu_ItemClick (the single routing source of truth):
Case "xxx"
    pgXxx.Show
```

### C. Add to `plugin.json` triggers (if your agent uses trigger routing)

```json
{ "triggers": ["xxx", "xxx page", "go to xxx"] }
```

---

## 5. Back & Dock Patterns

Back-navigation is a **per-page decision** — a back handler re-shows the previous page
directly (e.g. `BANano.Await(pgHome.Show)`); the shell keeps no back-stack.

For the App-Shell-With-Dock pattern (always-visible bottom dock):

```b4j
Sub Show
    app = pgIndex.App
    BANano.Await(app.ClearPageView)
  
    ' Container (root)
    SDUI5Container1.Initialize(Me, "SDUI5Container1", "SDUI5Container1")
    SDUI5Container1.ParentID = app.PageView
    BANano.Await(SDUI5Container1.AddComponent)
  
    ' Content area (children of container)
    SDUI5Column1.Initialize(Me, "SDUI5Column1", "SDUI5Column1")
    SDUI5Column1.ParentID = "SDUI5Container1"
    SDUI5Column1.Classes = "min-h-screen pb-20"     ' pb-20 leaves space for dock
    BANano.Await(SDUI5Column1.AddComponent)
  
    ' ... your page content goes in SDUI5Column1 ...
  
    ' Bottom dock (always visible)
    SDUI5Dock1.Initialize(Me, "SDUI5Dock1", "SDUI5Dock1")
    SDUI5Dock1.ParentID = "SDUI5Container1"
    SDUI5Dock1.AddHomeTab("home", "Home", "./assets/home.svg")
    SDUI5Dock1.AddSearchTab("search", "Search", "./assets/search.svg")
    SDUI5Dock1.AddProfileTab("profile", "Profile", "./assets/profile.svg")
    SDUI5Dock1.ActiveTab = "home"
    BANano.Await(SDUI5Dock1.AddComponent)
  
    pgIndex.UpdateTitle("Home")
End Sub
```

---

## 6. 4-State Scaffold (Data-Driven Page)

Drop-in pattern for any page that fetches data. Uses only real components — Loading /
Alert (info = empty, error = failed) / Table:

```b4j
Sub Process_Globals
    Private BANano As BANano
    Private app As SDUI5App
    Private SDUI5Loading1 As SDUI5Loading
    Private SDUI5Alert1 As SDUI5Alert
    Private SDUI5Table1 As SDUI5Table
End Sub

Sub Show
    app = pgIndex.App
    BANano.Await(app.ClearPageView)
  
    ' ...mount container + table ...
  
    ' Initial state = Loading
    ShowLoading
  
    pgIndex.UpdateTitle("Products")
    LoadProducts
End Sub

Sub LoadProducts
    Try
        Dim data As List = app.PBCollection("products").GetList()
        If data.Size = 0 Then
            ShowEmpty
        Else
            SDUI5Table1.SetItems(data)
            ShowPopulated
        End If
    Catch
        SDUI5Alert1.Text = LastException.Message
        ShowError
    End Try
End Sub

Sub ShowLoading
    SDUI5Loading1.Visible = True
    SDUI5Alert1.Visible = False
    SDUI5Table1.Visible = False
End Sub

Sub ShowPopulated
    SDUI5Loading1.Visible = False
    SDUI5Alert1.Visible = False
    SDUI5Table1.Visible = True
End Sub

Sub ShowEmpty
    SDUI5Loading1.Visible = False
    SDUI5Alert1.Color = "info"          'info alert = empty state
    SDUI5Alert1.Text = "No products yet."
    SDUI5Alert1.Visible = True
    SDUI5Table1.Visible = False
End Sub

Sub ShowError
    SDUI5Loading1.Visible = False
    SDUI5Alert1.Color = "error"         'error alert = failed fetch (click to retry)
    SDUI5Table1.Visible = False
End Sub

Sub SDUI5Alert1_Click(e As BANanoEvent)
    LoadProducts    ' retry
End Sub
```

---

## 7. Reference App Wiring Model

This wiring sketch explains the shell relationship. For observed implementation details, see the [demo `pgIndex.bas` source](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas).

```b4j
'=== pgIndex.bas source pattern ===
Sub Process_Globals
    Public BANano As BANano      'ignore
    Public App As SDUI5App       'the demo CREATES the app here — not in Main
    '...shell components (drawer, navbar, menu, pageview, drawers, theme toggle)
End Sub

Sub Initialize
    BANano.Await(App.Initialize(Me))
    'App.Uses* asset loads
    '...builds the full shell: appdrawer + drawerNav + appnavbar + pageView
    '   + drawerbody/drawermenu + draweruser + rightdrawer + bottomdrawer + tglTheme
    '...routes via drawermenu_ItemClick: parses "pg-<suffix>" item ids and calls pgXxx.Show
    App.pageresume
End Sub
```

- Main's `BANano_Ready` loads `./assets/env.json` (API key, DB config, version check)
  then calls `pgIndex.Initialize` — the app itself is created inside pgIndex.
- Main exposes `AppTitle`/`DBName`/`APIKey`/`ServerURL` etc. in `Process_Globals`.
- Special page treatments in `drawermenu_ItemClick`: login pages clear the pageview
  padding, force-close the drawer and hide the navbar.

---

## 8. Bootstrap Checklist for a New App

When `sd5-web-orchestrator` runs Stage 1 (bootstrap), these are the generated files:

- [ ] `<AppName>.b4j` — metadata (`Library1..5`, `Module1..N`, `NumberOfModules`) **plus the embedded entry module** (`AppStart` + `BANano_Ready`) in the reference shape: DB globals, `#if Debug` `Log("BANanoLOGS")`, `#Macro` lines, `DoNotDeleteFolderOnCompilation` for assets/files/pdfjs, optional `env.json` block — see §1a template
- [ ] `pgIndex.bas` — app shell + registry (creates `App` via `App.Initialize(Me)`, full chrome: drawer + drawer nav/menu/user + navbar + `pageview` container + optional right/bottom drawers + theme toggle, `CreateDrawerMenu`, menu routing via `drawermenu_ItemClick`, helper API, `App.pageresume`) — see §2
- [ ] First page module (e.g., `pgHome.bas`) — minimal hero + CTA, using lowercase `app`
- [ ] Every `.bas` registered: `ModuleN=<name>` + bumped `NumberOfModules`
- [ ] Default theme + `app.SetTheme(...)` chosen in Stage 3 (set inside `AppStart`/`BANano_Ready` or pgIndex)
- [ ] First ARCH-N page model picked from `page-architectures.md` in Stage 4
- [ ] No PWA icon / JS / `env.json` `FileN=` references unless the app's `Files/` actually contains them (only `600by600.jpg` ships with the library)
- [ ] **Full asset set** (optional): copy `references/Files/` (11 files) into the app's `Files/`, wire `FileN=`/`FileGroupN=` from `references/file-registry.b4j`, set `NumberOfFiles=11` — see §1b; or keep `NumberOfFiles=0` for the greenfield minimum

If any of these are missing, `verify-conformance.ps1` fails. A bare `pg*.bas` with no
`.b4j` project file cannot be opened or built in B4J — the project file is mandatory.

---

## 9. References

- `sd5-primer.md` — language / build pipeline primer
- `page-architectures.md` — proven page patterns to scaffold from
- `negative-knowledge.md` — anti-patterns to avoid in scaffolds
- `rules-enforcer.md` — L4/L5 rules the scaffold must comply with
