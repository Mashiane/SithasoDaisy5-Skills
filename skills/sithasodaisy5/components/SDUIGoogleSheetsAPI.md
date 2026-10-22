---
name: SDUIGoogleSheetsAPI
description: SithasoDaisy5 SDUIGoogleSheetsAPI component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIGoogleSheetsAPI

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIGoogleSheetsAPI.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIGoogleSheetsAPI.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
<!-- 1-2 sentences: what this component is and when to reach for it. Auto-stub: fill for high-value components. -->
_SDUIGoogleSheetsAPI is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(sSheetName As String, bCreateIfNeeded As Boolean, iUserCount As Int)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
`Custom_Ready`

Wire in parent: `Sub googlesheetsapi_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (97)
- `Initialize(sSheetName As String, bCreateIfNeeded As Boolean, iUserCount As Int)` _(public)_
- `Connect(sSheetID As String, sClientID As String, sClientSecret As String, sRefreshToken As String)` _(public)_
- `NewList()` As List _(public)_
- `SetLimit(s As String)` _(public)_
- `SchemaClear()` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddBoolean(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddBoolean1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddDouble1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddDouble(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddFloat1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddFloat(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddText1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddText(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddLongText1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddLongText(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddInt1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddInt(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SetSchemaFromDataModel1(sourceTable As String, models As Map)` _(public)_
- `SetSchemaFromDataModel(models As Map)` _(public)_
- `SchemaAddBlob(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddFile(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddFile1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddBlob1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddNumber(bools As List)` As SDUIGoogleSheetsAPI _(public)_
- `SchemaAddNumber1(b As String)` As SDUIGoogleSheetsAPI _(public)_
- `SELECT_ALL()` As List _(public)_
- `CREATE()` As String _(public)_
- `DELETE(id As String)` As Boolean _(public)_
- `DELETE_MULTIPLE(items As List)` As Boolean _(public)_
- `UPDATE()` As String _(public)_
- `GetAffectedID()` _(public)_
- `READ(id As String)` As Map _(public)_
- `READ_BY(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_STRING(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_ID_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `ContainsKey(id As String)` As Boolean _(public)_
- `DELETE_ALL()` As Boolean _(public)_
- `GetKeyValuesFromList(source As List, bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `READ_ID_BY(fldName As String, fldValue As String)` As String _(public)_
- `GET_ID_BY_FIELD(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY(fldName As String, fldValue As String)` As String _(public)_
- `SetField(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `RemoveField(fldName As String)` _(public)_
- `FirstRecord()` As Map _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `CLEAR_WHERE()` As SDUIGoogleSheetsAPI _(public)_
- `Reset()` As SDUIGoogleSheetsAPI _(public)_
- `ADD_FIELD(fld As String)` As SDUIGoogleSheetsAPI _(public)_
- `ADD_FIELDS(fields As List)` As SDUIGoogleSheetsAPI _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` As SDUIGoogleSheetsAPI _(public)_
- `ADD_WHERE_STRING(fld As String, operator As String, value As Object)` As SDUIGoogleSheetsAPI _(public)_
- `WHERE_OR(pos As Int)` As SDUIGoogleSheetsAPI _(public)_
- `WHERE_AND(pos As Int)` As SDUIGoogleSheetsAPI _(public)_
- `ADD_ORDER_BY(fld As String)` As SDUIGoogleSheetsAPI _(public)_
- `ADD_ORDER_BY_DESC(fld As String)` As SDUIGoogleSheetsAPI _(public)_
- `NextRow()` As Boolean _(public)_
- `SetRecord(rec As Map)` _(public)_
- `DELETE_BY(fldName As String, fldValue As String)` As Boolean _(public)_
- `DELETE_BY_STRING(fldName As String, fldValue As String)` As Boolean _(public)_
- `DELETE_WHERE()` As Boolean _(public)_
- `SELECT_WHERE()` As List _(public)_
- `SELECT_WHERE1()` As List _(public)_
- `NextID()` As String _(public)_
- `PrepareRecord()` _(public)_
- `GetInt(fld As String)` As Int _(public)_
- `GetLong(fld As String)` As Long _(public)_
- `GetString(fld As String)` As String _(public)_
- `GetImage(fld As String)` As String _(public)_
- `GetBoolean(fld As String)` As Boolean _(public)_
- `GetDouble(fld As String)` As Double _(public)_
- `GetRecord(pos As Int)` As Map _(public)_
- `MoveStart()` _(public)_
- `MoveFirst()` _(public)_
- `MoveLast()` _(public)_
- `MovePrevious()` _(public)_
- `MoveNext()` _(public)_
- `SetRecordAsIs(rec As Map)` _(public)_
- `ADD_ORDER_BY_UPDATED_AT()` As SDUIGoogleSheetsAPI _(public)_
- `ADD_ORDER_BY_CREATED_AT()` As SDUIGoogleSheetsAPI _(public)_
- `COUNT_ALL()` As Int _(public)_
- `GetRecordsCount()` As Int _(public)_
- `GroupBy(groupFields() As String, aggDefs() As String, orderDefs() As String)` _(public)_
- `SetRecords(lst As List)` _(public)_
- `whereLessThanEqualTo(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `whereLessThan(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `whereBetween(fldName As String, fldStart As Object, fldEnd As Object)` As SDUIGoogleSheetsAPI _(public)_
- `whereNotEqual(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `orderBy(fldNames As List)` As SDUIGoogleSheetsAPI _(public)_
- `orderByDesc(fldNames As List)` As SDUIGoogleSheetsAPI _(public)_
- `selectFields(fldNames As List)` As SDUIGoogleSheetsAPI _(public)_
- `whereEqual(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `whereGreaterThan(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `whereGreaterThanEqualTo(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `whereLike(fldName As String, fldValue As Object)` As SDUIGoogleSheetsAPI _(public)_
- `SetNextID()` _(public)_
- `GroupListBy(nList As List, groupFields() As String, aggDefs() As String, orderDefs() As String)` _(public)_
## Key Setters (1)
- `setPosition(pos As Int)` _(public)_
## Getters (1)
- `getPosition()` As Int _(public)_
## Private Methods (1)
- `Class_Globals()` _(private)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim googlesheetsapi As SDUIGoogleSheetsAPI
googlesheetsapi.Initialize(Me, "SDUIGoogleSheetsAPI", "SDUIGoogleSheetsAPI")
googlesheetsapi.ParentID = "placeholder"
BANano.Await(googlesheetsapi.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


