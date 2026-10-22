---
name: SDUIRestApi
description: SithasoDaisy5 SDUIRestApi component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIRestApi

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIRestApi.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIRestApi.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
<!-- 1-2 sentences: what this component is and when to reach for it. Auto-stub: fill for high-value components. -->
_SDUIRestApi is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, eventName As String, url As String, sTableName As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub restapi_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (110)
- `Initialize(Module As Object, eventName As String, url As String, sTableName As String)` _(public)_
- `InitializeApiKey(Module As Object, eventName As String, url As String, sTableName As String, apiKey As String)` _(public)_
- `EscapeField(f As String)` As String _(public)_
- `CreateTable()` As String _(public)_
- `CREATE_TABLE()` _(public)_
- `GetAffectedID()` _(public)_
- `SchemaAddLongText1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddLongText(bools As List)` As SDUIRestApi _(public)_
- `SetLimit(s As String)` _(public)_
- `SchemaClear()` As SDUIRestApi _(public)_
- `SchemaAddIndex(idxName As String, bUnique As Boolean)` _(public)_
- `SchemaAddIndexes(idxNames1 As List)` _(public)_
- `SchemaAddUniqueIndexes(idxNames1 As List)` _(public)_
- `SchemaAddBoolean(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddBoolean1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddDouble1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddDouble(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddFloat1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddFloat(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddText1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddText(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddInt1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddInt(bools As List)` As SDUIRestApi _(public)_
- `SetSchemaFromDataModel1(sourceTable As String, models As Map)` _(public)_
- `SetSchemaFromDataModel(models As Map)` _(public)_
- `SchemaAddBlob(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddFile(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddFile1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddBlob1(b As String)` As SDUIRestApi _(public)_
- `SchemaAddNumber(bools As List)` As SDUIRestApi _(public)_
- `SchemaAddNumber1(b As String)` As SDUIRestApi _(public)_
- `SELECT_ALL()` As List _(public)_
- `CREATE()` As Map _(public)_
- `DELETE(id As String)` As Boolean _(public)_
- `DELETE_MULTIPLE(items As List)` As Boolean _(public)_
- `UPDATE()` As String _(public)_
- `UPDATE_WHERE()` As String _(public)_
- `READ(id As String)` As Map _(public)_
- `READ_BY(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_STRING(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_ID_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_BY(fldName As String, fldValue As String)` As String _(public)_
- `ContainsKey(id As String)` As Boolean _(public)_
- `ContainsField(fldName As String, id As String)` As Boolean _(public)_
- `ListKeys()` As List _(public)_
- `DELETE_ALL()` _(public)_
- `GetKeyValues(bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `GetKeyValuesFromList(source As List, bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `CREATE_OR_UPDATE()` As String _(public)_
- `CREATE_OR_UPDATE_BY_FIELD(fldName As String)` As String _(public)_
- `GET_ID_BY_FIELD(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY(fldName As String, fldValue As String)` As String _(public)_
- `SetField(fldName As String, fldValue As Object)` As SDUIRestApi _(public)_
- `RemoveField(fldName As String)` _(public)_
- `FirstRecord()` As Map _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `CLEAR_WHERE()` As SDUIRestApi _(public)_
- `Reset()` As SDUIRestApi _(public)_
- `ADD_FIELD(fld As String)` As SDUIRestApi _(public)_
- `ADD_JOIN(fld As String)` As SDUIRestApi _(public)_
- `ADD_FIELDS(fields As List)` As SDUIRestApi _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` As SDUIRestApi _(public)_
- `ADD_WHERE_STRING(fld As String, operator As String, value As Object)` As SDUIRestApi _(public)_
- `WHERE_OR(pos As Int)` As SDUIRestApi _(public)_
- `WHERE_AND(pos As Int)` As SDUIRestApi _(public)_
- `ADD_ORDER_BY(fld As String)` As SDUIRestApi _(public)_
- `ADD_ORDER_BY_DESC(fld As String)` As SDUIRestApi _(public)_
- `NextRow()` As Boolean _(public)_
- `SetRecord(rec As Map)` _(public)_
- `DELETE_BY(fldName As String, fldValue As String)` _(public)_
- `DELETE_BY_STRING(fldName As String, fldValue As String)` _(public)_
- `DELETE_WHERE()` _(public)_
- `ExistsByString(fldName As String, fldValue As Object)` As Boolean _(public)_
- `Exists(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsWhere(where As Map)` As Boolean _(public)_
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
- `deleteWhere(priKey As String, whereMap As Map, whereOps As List)` As Boolean _(public)_
- `findWhere(whereMap As Map, whereOps As List)` As List _(public)_
- `findWhereOrderBy(whereMap As Map, whereOps As List, orderBy As List)` As List _(public)_
- `SetRecordAsIs(rec As Map)` _(public)_
- `ADD_ORDER_BY_UPDATED_AT()` As SDUIRestApi _(public)_
- `ADD_ORDER_BY_CREATED_AT()` As SDUIRestApi _(public)_
- `COUNT_ALL()` As Int _(public)_
- `GetRecordsCount()` As Int _(public)_
- `SELECT_RAW(query As String)` As List _(public)_
- `GetDataModels()` As Map _(public)_
- `SelectDistinctWhere(tblfields As List, tblWhere As Map, operators As List, orderBy As List)` As List _(public)_
- `ShowDatabases()` As List _(public)_
- `DATABASE_EXISTS()` As Boolean _(public)_
- `DELETE_TABLE(stableName As String)` As Boolean _(public)_
- `TABLE_EXISTS(tblName As String)` As Boolean _(public)_
- `ShowTableNames(Dbase As String)` As List _(public)_
- `ShowIndexes(Dbase As String)` As List _(public)_
- `ShowForeignKeys(Dbase As String)` As List _(public)_
## Key Setters (2)
- `setDBName(s As String)` _(public)_
- `setPosition(pos As Int)` _(public)_
## Getters (2)
- `getDBName()` As String _(public)_
- `getPosition()` As Int _(public)_
## Private Methods (1)
- `Class_Globals()` _(private)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim restapi As SDUIRestApi
restapi.Initialize(Me, "SDUIRestApi", "SDUIRestApi")
restapi.ParentID = "placeholder"
BANano.Await(restapi.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


