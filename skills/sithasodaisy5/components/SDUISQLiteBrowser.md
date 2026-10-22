---
name: SDUISQLiteBrowser
description: SithasoDaisy5 SDUISQLiteBrowser component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUISQLiteBrowser

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUISQLiteBrowser.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUISQLiteBrowser.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_Browser-side SQLite (sql.js) — schema/CRUD helpers running SQL in the browser._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, EventName As String, fileName As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
`Ready`, `Error`, `Complete`

Wire in parent: `Sub sqlitebrowser_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (33)
- `Initialize(Module As Object, EventName As String, fileName As String)` _(public)_
- `OpenDatabase()` _(public)_
- `ExecQueryResult(qry As String)` _(public)_
- `SELECT_TABLES()` _(public)_
- `TABLE_SCHEMA(tblName As String)` _(public)_
- `TABLE_INDEX_LIST(tblName As String)` _(public)_
- `TABLE_INDEX_INFO(idxName As String)` _(public)_
- `TABLE_FOREIGN_KEY_LIST(tblName As String)` _(public)_
- `TABLE_COUNT(tblName As String)` _(public)_
- `TABLE_SUM(tblName As String, fldName As String)` _(public)_
- `SELECT_ALL(tblName As String)` _(public)_
- `CLEAR_WHERE()` _(public)_
- `ADD_FIELD(fld As String)` _(public)_
- `ADD_FIELDS(fields As List)` _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` _(public)_
- `ADD_ORDER_BY(fld As String)` _(public)_
- `SetField(fldName As String, fldValue As Object)` _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `FirstRecord()` As Map _(public)_
- `NextRow()` As Boolean _(public)_
- `SchemaClear()` _(public)_
- `SetRecord(rec As Map)` _(public)_
- `PrepareRecord()` _(public)_
- `GetInt(fld As String)` As Int _(public)_
- `GetLong(fld As String)` As Long _(public)_
- `GetString(fld As String)` As String _(public)_
- `GetBoolean(fld As String)` As Boolean _(public)_
- `GetDouble(fld As String)` As Double _(public)_
- `GetRecord(pos As Int)` As Map _(public)_
- `MoveFirst()` _(public)_
- `MoveLast()` _(public)_
- `MovePrevious()` _(public)_
- `MoveNext()` _(public)_
## Key Setters (2)
- `setTableName(s As String)` _(public)_
- `setPosition(pos As Int)` _(public)_
## Getters (2)
- `getTableName()` As String _(public)_
- `getPosition()` As Int _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUISQLiteBrowser
svc.Initialize(Module As Object, EventName As String, fileName As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.


