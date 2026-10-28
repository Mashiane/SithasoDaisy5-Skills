B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'Static code module - PAGE. Studied from 0SithasoDaisy5DemoCode\B4J\pg*.bas
'(117+ pages follow this shape exactly: pgButtons, pgCard, pgModal, ...).
'RULES: Private declares + 'ignore; the Show routine takes no args; lowercase app;
'ClearPageView first; parent-first mount with Await; UpdateTitle LAST;
'If a Build* helper contains BANano.Await internally, Show must call it as
'BANano.Await(Build*) so its async component mounts finish before dependent work.
'Any caller of Show must likewise await it when it depends on the page finishing.
'handlers named <ComponentName>_<Event>. L5 gate enforces lifecycle casing.
'Wire into app: ModuleN=pgXxx in <AppName>.b4j (+ NumberOfModules bump) and,
'for menu apps, AddItemChild + route Case in pgIndex (app-scaffolds.md sec. 4).
Sub Process_Globals
	Private BANano As BANano		'ignore
	Private app As SDUI5App			'ignore - borrowed from pgIndex, never created here
	'declare EVERY component you will mount - Private + 'ignore.
	'The 2nd Initialize arg becomes the DOM id: unique names app-wide.
	Private SDUI5Container1 As SDUI5Container		'ignore
	Private SDUI5Row1 As SDUI5Row					'ignore
	Private SDUI5Column1 As SDUI5Column				'ignore
	Private SDUI5Button1 As SDUI5Button				'ignore
End Sub

'entry point - no arguments, ever (callers invoke pgXxx.Show plain)
Sub Show
	'1. borrow the app + wipe the previous page (lowercase app - L5 gate regex)
	app = pgIndex.App
	BANano.Await(app.ClearPageView)

	'2. build parent-first: Container -> Row -> Column -> leaves.
	'Page root ALWAYS mounts into app.PageView. (A single component may mount
	'straight into app.PageView when no grid is needed.)
	SDUI5Container1.Initialize(Me, "SDUI5Container1", "SDUI5Container1")
	SDUI5Container1.ParentID = app.PageView
	BANano.Await(SDUI5Container1.AddComponent)

	SDUI5Row1.Initialize(Me, "SDUI5Row1", "SDUI5Row1")
	SDUI5Row1.ParentID = "SDUI5Container1"
	SDUI5Row1.GridColsSm = "1"
	SDUI5Row1.GridColsMd = "12"
	BANano.Await(SDUI5Row1.AddComponent)

	SDUI5Column1.Initialize(Me, "SDUI5Column1", "SDUI5Column1")
	SDUI5Column1.ParentID = "SDUI5Row1"
	SDUI5Column1.SizeMd = "6"
	SDUI5Column1.SizeSm = "12"
	BANano.Await(SDUI5Column1.AddComponent)

	'3. leaves (composite sub-regions: "<name>_title/_actions/_content")
	SDUI5Button1.Initialize(Me, "SDUI5Button1", "SDUI5Button1")
	SDUI5Button1.ParentID = "SDUI5Column1"
	SDUI5Button1.Color = "primary"
	SDUI5Button1.Text = "Get Started"
	BANano.Await(SDUI5Button1.AddComponent)

	'4. LAST line - navbar title through the shell
	pgIndex.UpdateTitle("Xxx")
End Sub

'event handlers: "<ComponentName>_<Event>" (signature varies per event)
Private Sub SDUI5Button1_Click (e As BANanoEvent)
	e.PreventDefault
	'navigate: Show clears the pageview and rebuilds it
	BANano.Await(pgHome.Show)
End Sub
