---
name: state-recipes
description: Copy-ready B4J patterns for the Mandatory 4-State UI Engine in SithasoDaisy5 web apps. Provides concrete implementations for Loading (Skeleton/Shimmer), Populated (Data grid), Empty (Illustrated state), and Error (Actionable recovery) states.
---

# SithasoDaisy5 — 4-State UI Architecture & Implementation Recipes

> **The 4-State Law of UI Completeness (RULE-DOCTRINE-004):**  
> Every data-driven page, table, or async component must explicitly implement **all four states**. An app that only implements the populated "happy path" is incomplete, brittle, and un-shippable.

```text
┌────────────────────────────────────────────────────────┐
│               MANDATORY 4-STATE ARCHITECTURE           │
├──────────────┬─────────────────────────────────────────┤
│ 1. LOADING   │ SDUI5Skeleton / SDUI5Loading            │
│              │ Preserves layout geometry (zero CLS)    │
├──────────────┼─────────────────────────────────────────┤
│ 2. POPULATED │ SDUI5Table / SDUI5Card / SDUI5Container │
│              │ Bound to real data, scroll-optimized    │
├──────────────┼─────────────────────────────────────────┤
│ 3. EMPTY     │ SDUI5Empty + SVG Illustration + CTA     │
│              │ "No records found" + "Create First" CTA │
├──────────────┼─────────────────────────────────────────┤
│ 4. ERROR     │ SDUI5Alert (.Color="error") + Retry     │
│              │ Plain language reason + 1-tap "Retry"   │
└──────────────┴─────────────────────────────────────────┘
```

---

## 1. The State Controller Pattern (B4J Implementation)

Every data-driven page module should define containers for the states and manage them through a centralized `SetViewState` sub:

```b4x
Sub Process_Globals
	Private stateLoading As SDUI5Container
	Private statePopulated As SDUI5Container
	Private stateEmpty As SDUI5Empty
	Private stateError As SDUI5Alert
End Sub

Public Sub SetViewState(sState As String)
	' Hide all state containers first
	stateLoading.Visible = (sState = "LOADING")
	statePopulated.Visible = (sState = "POPULATED")
	stateEmpty.Visible = (sState = "EMPTY")
	stateError.Visible = (sState = "ERROR")
End Sub
```

---

## 2. Concrete State Recipes

### State 1: LOADING (Layout-Preserving Skeleton)
Never leave the user looking at a blank white container while data fetches. Use `SDUI5Skeleton` sized identically to the final content to prevent **Cumulative Layout Shift (CLS)**:

```b4x
Private Sub BuildLoadingState(parentID As String)
	stateLoading.Initialize(Me, "stateLoading", "stateLoading")
	stateLoading.ParentID = parentID
	stateLoading.Classes = "w-full flex flex-col gap-4 animate-pulse"
	BANano.Await(stateLoading.AddComponent)

	' Skeleton Header bar
	Dim skelHeader As SDUI5Skeleton
	skelHeader.Initialize(Me, "skelHeader", "skelHeader")
	skelHeader.ParentID = stateLoading.Here
	skelHeader.Classes = "h-12 w-full rounded-xl"
	BANano.Await(skelHeader.AddComponent)

	' Skeleton 3-Card Grid
	Dim skelGrid As SDUI5Row
	skelGrid.Initialize(Me, "skelGrid", "skelGrid")
	skelGrid.ParentID = stateLoading.Here
	BANano.Await(skelGrid.AddComponent)

	For i = 1 To 3
		Dim skelCol As SDUI5Column
		skelCol.Initialize(Me, "skelCol" & i, "skelCol" & i)
		skelCol.ParentID = skelGrid.Here
		skelCol.SizeMd = 4
		skelCol.SizeSm = 12
		BANano.Await(skelCol.AddComponent)

		Dim skelCard As SDUI5Skeleton
		skelCard.Initialize(Me, "skelCard" & i, "skelCard" & i)
		skelCard.ParentID = skelCol.Here
		skelCard.Classes = "h-48 w-full rounded-2xl"
		BANano.Await(skelCard.AddComponent)
	Next
End Sub
```

---

### State 2: POPULATED (Data Display)
Standard layout populated with domain data (Bento grid, data cards, or table):

```b4x
Private Sub BuildPopulatedState(parentID As String)
	statePopulated.Initialize(Me, "statePopulated", "statePopulated")
	statePopulated.ParentID = parentID
	statePopulated.Classes = "w-full"
	BANano.Await(statePopulated.AddComponent)
	
	' Mount real data cards or table into statePopulated.Here...
End Sub
```

---

### State 3: EMPTY (Illustrated State with Call-to-Action)
An empty screen is an onboarding opportunity. Never show a bare table header with zero rows. Provide a clear SVG illustration, explanatory copy, and a direct action button:

```b4x
Private Sub BuildEmptyState(parentID As String)
	stateEmpty.Initialize(Me, "stateEmpty", "stateEmpty")
	stateEmpty.ParentID = parentID
	stateEmpty.Icon = "./assets/inbox.svg"
	stateEmpty.Title = "No records found"
	stateEmpty.Description = "You haven't created any items yet. Start by adding your first project."
	stateEmpty.ActionText = "Create New Project"
	stateEmpty.Classes = "w-full py-16 text-center"
	BANano.Await(stateEmpty.AddComponent)
End Sub

' Event handler for empty state primary action:
Private Sub stateEmpty_ActionClick(e As BANanoEvent)
	' Navigate to create modal or creation form
	OpenCreateDialog
End Sub
```

---

### State 4: ERROR (Actionable Recovery & Retry)
When network or data fetches fail, communicate the cause in plain human language and provide an immediate one-tap **Retry** button:

```b4x
Private Sub BuildErrorState(parentID As String)
	stateError.Initialize(Me, "stateError", "stateError")
	stateError.ParentID = parentID
	stateError.Color = "error"
	stateError.Icon = "./assets/alert-circle.svg"
	stateError.Title = "Unable to load data"
	stateError.Text = "We encountered a network error while fetching your data. Please verify your connection."
	stateError.ActionText = "Retry"
	stateError.Classes = "w-full shadow-lg"
	BANano.Await(stateError.AddComponent)
End Sub

' Event handler for error retry:
Private Sub stateError_ActionClick(e As BANanoEvent)
	FetchDataAsync
End Sub
```

---

## 3. Data Flow Integration Pattern

Putting it all together in your data fetching sub:

```b4x
Public Sub FetchDataAsync
	' 1. Enter Loading State immediately
	SetViewState("LOADING")
	
	' Simulate / execute async fetch (e.g. SDUIFetch, PocketBase, or SQLite)
	Dim records As List = ... ' fetch data
	
	If fetchFailed Then
		' 2. Handle Error State
		SetViewState("ERROR")
		Return
	End If
	
	If records.Size = 0 Then
		' 3. Handle Empty State
		SetViewState("EMPTY")
	Else
		' 4. Handle Populated State
		RenderRecords(records)
		SetViewState("POPULATED")
	End If
End Sub
```

---

## 4. Verification Gate (G6 / G7 UX Review)

During Stage 9 UX review, the reviewer must verify:
- [ ] **Loading**: Does initial load display a skeleton screen or spinner without jumping layout?
- [ ] **Empty**: When filtering or zero records exist, does an illustrated empty card with a CTA appear?
- [ ] **Error**: Does network failure trigger an alert banner with an actionable Retry button?
- [ ] **Populated**: Does data render with clean typography, proper spacing, and zero horizontal scroll?

