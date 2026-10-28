B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'Static code module - MINIMAL app shell + page registry. Every app has exactly one pgIndex.
'Studied from: 0SithasoDaisy5DemoCode\B4J\pgIndex.bas (847-line drawer/nav shell).
'This template is the minimal shell: app + pageview + first page + title helper.
'Grow into the full drawer/navbar/menu shell (app-scaffolds.md sec. 2) when the app
'needs side navigation; do not copy the full chrome for a 1-3 page app.
'RULES: chrome stays Private (pages use helpers below); pages mount into app.PageView;
'pages rebuild on every Show (no DOM state kept); routing = pgXxx.Show calls.
#IgnoreWarnings:12
Sub Process_Globals
	Public BANano As BANano		'ignore
	Public App As SDUI5App		'ignore
	Private appnavbar As SDUI5NavBar		'ignore - top navbar (title host)
	Private pageView As SDUI5Container		'ignore - ALL pages mount here (id: pageview)
End Sub

Sub Initialize					'ignoreDeadCode
	'STEP 1 - create the app (boots framework on #body, splash, online/offline, themes)
	BANano.Await(App.Initialize(Me))

	'STEP 2 - Typography & Surface: Load curated modern Google Font and configure ambient canvas
	App.LoadAssetsOnDemand("google-font-jakarta", Array("https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap"))
	App.AddClass("font-['Plus_Jakarta_Sans',sans-serif] bg-base-200/30 text-base-content antialiased min-h-screen")

	'STEP 3 - shared UsesX loaders, trimmed to what pages use (one line per dependency).
	'Per-page loaders go at the top of that page's Show, before ClearPageView.
	'BANano.Await(App.UsesFontAwesome)

	'STEP 4 - chrome, parents first (a ParentID must exist in the DOM before use)
	appnavbar.Initialize(Me, "appnavbar", "appnavbar")
	appnavbar.ParentID = App.Here
	appnavbar.Title = Main.AppTitle
	appnavbar.Width = "full"
	appnavbar.Classes = "border-b border-base-200/80 bg-base-100/80 backdrop-blur-md sticky top-0 z-40"
	BANano.Await(appnavbar.AddComponent)

	pageView.Initialize(Me, "pageview", "pageview")
	pageView.ParentID = App.Here
	pageView.Container = False
	BANano.Await(pageView.AddComponent)

	'STEP 5 - first page + splash off (LAST: pageresume hides #loader-1)
	BANano.Await(pgHome.Show)
	App.pageresume
End Sub

'--- HELPER API: the only way pages drive the chrome (chrome stays Private) ---
Sub UpdateTitle(s As String)
	appnavbar.Title = s
End Sub

Sub UpdateBrowserTitle(s As String)
	BANano.Window.SetField("document.title", s)
End Sub

Sub ShowNavBar
	appnavbar.Visible = True
End Sub

Sub HideNavBar
	appnavbar.Visible = False
End Sub
