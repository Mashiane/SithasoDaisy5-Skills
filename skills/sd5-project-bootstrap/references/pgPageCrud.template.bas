B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=10
@EndOfDesignText@
'Static code module — DATA / CRUD PAGE (SDUI5Table + input modal).
'Studied from pgCategories / pgContacts / pgProvinces (exceptions flagged):
'they use UPPERCASE App and would FAIL the L5 gate — this template uses
'lowercase app throughout. Splash lifecycle, shell reset, Build/Mount split,
'table + modal event shapes follow the demos exactly.
Sub Process_Globals
	Private BANano As BANano		'ignore
	Private app As SDUI5App			'ignore — borrowed from pgIndex
	Private tblXxx As SDUI5Table		'ignore
	Private mdlXxx As SDUI5Modal		'ignore
	'...form controls for BuildXxxModal...
End Sub

Sub Show
	app = pgIndex.App
	'splash on while page + data build (hide at end with PageResume)
	app.PagePause
	'reset shell layout so direct pgXxx.Show calls match menu-click routing
	pgIndex.PageViewPaddingTo10px
	app.PageViewToFullScreenHeight(Array("appnavbar"))
	BANano.Await(app.ClearPageView)

	'table mounts into the pageview like any component
	tblXxx.Initialize(Me, "tblXxx", "tblXxx")
	tblXxx.ParentID = app.PageView
	'...Title, HasSearch, HasClone, tooltips...
	BANano.Await(tblXxx.AddComponent)

	'input modal: pageview, or shell bottom-drawer content
	'("#bottomdrawercontent") for drawer-hosted forms (pgContacts style)
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

'BuildXxx* configure (no data); MountXxx(bAfterChange) loads data;
'AddMode/EditMode prepare the form; SetXxxDefaults + GetXxxValid own defaults/validation.

'table toolbar events (raised by SDUI5Table)
Private Sub tblXxx_Add (e As BANanoEvent)        'open modal in add mode
Private Sub tblXxx_Refresh (e As BANanoEvent)    're-mount data
Private Sub tblXxx_Back (e As BANanoEvent)       're-show previous page, e.g. BANano.Await(pgHome.Show)
Private Sub tblXxx_EditRow (Row As Int, item As Map)
Private Sub tblXxx_DeleteRow (Row As Int, item As Map)
Private Sub tblXxx_CloneRow (Row As Int, item As Map)

'modal actions: validate (GetXxxValid) -> save -> MountXxx(True) -> close
Private Sub mdlXxx_Yes_Click (e As BANanoEvent)
Private Sub mdlXxx_No_Click (e As BANanoEvent)
