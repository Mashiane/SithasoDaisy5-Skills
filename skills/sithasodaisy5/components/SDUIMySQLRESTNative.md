---
name: SDUIMySQLRESTNative
description: SithasoDaisy5 SDUIMySQLRESTNative component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIMySQLRESTNative

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIMySQLRESTNative.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIMySQLRESTNative.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_MySQL REST API client (native variant) — SQL-style CRUD over a REST endpoint._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
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

Wire in parent: `Sub mysqlrestnative_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (81)
- `ADD_FIELD(fld As String)` As SDUIMySQLRESTNative _(public)_
- `ADD_FIELDS(fields As List)` As SDUIMySQLRESTNative _(public)_
- `ADD_JOIN(fld As String)` As SDUIMySQLRESTNative _(public)_
- `ADD_ORDER_BY(fld As String)` As SDUIMySQLRESTNative _(public)_
- `ADD_ORDER_BY_CREATED_AT()` _(public)_
- `ADD_ORDER_BY_DESC(fld As String)` As SDUIMySQLRESTNative _(public)_
- `ADD_ORDER_BY_UPDATED_AT()` _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` As SDUIMySQLRESTNative _(public)_
- `ADD_WHERE_STRING(fld As String, operator As String, value As Object)` As SDUIMySQLRESTNative _(public)_
- `CLEAR_WHERE()` _(public)_
- `ContainsField(fldName As String, id As String)` As Boolean _(public)_
- `ContainsKey(id As String)` As Boolean _(public)_
- `CREATE()` _(public)_
- `CREATE_OR_UPDATE()` _(public)_
- `CREATE_OR_UPDATE_BY_FIELD(fldName As String)` As String _(public)_
- `CREATE_TABLE()` _(public)_
- `DELETE(id As String)` As Boolean _(public)_
- `DELETE_ALL()` _(public)_
- `DELETE_BY(fldName As String, fldValue As String)` _(public)_
- `DELETE_BY_STRING(fldName As String, fldValue As String)` _(public)_
- `DELETE_MULTIPLE(items As List)` As Boolean _(public)_
- `DELETE_WHERE()` _(public)_
- `deleteWhere(priKey As String, whereMap As Map, whereOps As List)` As Boolean _(public)_
- `EscapeField(f As String)` As String _(public)_
- `Exists(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsByString(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsWhere(where As Map)` As Boolean _(public)_
- `findWhere(whereMap As Map, whereOps As List)` As List _(public)_
- `findWhereOrderBy(whereMap As Map, whereOps As List, orderBy As List)` As List _(public)_
- `FirstRecord()` _(public)_
- `Initialize(Module As Object, eventName As String, url As String, sTableName As String)` _(public)_
- `ListKeys()` _(public)_
- `MoveFirst()` _(public)_
- `MoveLast()` _(public)_
- `MoveNext()` _(public)_
- `MovePrevious()` _(public)_
- `MoveStart()` _(public)_
- `NewList()` _(public)_
- `NextID()` _(public)_
- `NextRow()` _(public)_
- `PrepareRecord()` _(public)_
- `READ(id As String)` As Map _(public)_
- `READ_BY(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_STRING(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_ID_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_WHERE(whereIs As Map)` As String _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `RemoveField(fldName As String)` _(public)_
- `Reset()` _(public)_
- `SchemaAddBlob(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddBlob1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddBoolean(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddBoolean1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddDouble(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddDouble1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddFile(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddFile1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddFloat(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddFloat1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddIndex(idxName As String, bUnique As Boolean)` _(public)_
- `SchemaAddIndexes(idxNames1 As List)` _(public)_
- `SchemaAddInt(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddInt1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddLongText(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddLongText1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddNumber(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddNumber1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddText(bools As List)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddText1(b As String)` As SDUIMySQLRESTNative _(public)_
- `SchemaAddUniqueIndexes(idxNames1 As List)` _(public)_
- `SchemaClear()` _(public)_
- `SELECT_ALL()` _(public)_
- `SELECT_WHERE()` _(public)_
- `SELECT_WHERE1()` _(public)_
- `UPDATE()` _(public)_
- `UPDATE_BY(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_WHERE()` _(public)_
- `WHERE_AND(pos As Int)` As SDUIMySQLRESTNative _(public)_
- `WHERE_OR(pos As Int)` As SDUIMySQLRESTNative _(public)_
- `whereNotEqual(fldName As String, fldValue As Object)` As SDUIMySQLRESTNative _(public)_

## Key Setters (7)
- `SetField(fldName As String, fldValue As Object)` As SDUIMySQLRESTNative _(public)_
- `SetLimit(s As String)` _(public)_
- `setPosition(pos As Int)` _(public)_
- `SetRecord(rec As Map)` _(public)_
- `SetRecordAsIs(rec As Map)` _(public)_
- `SetSchemaFromDataModel(models As Map)` _(public)_
- `SetSchemaFromDataModel1(sourceTable As String, models As Map)` _(public)_

## Getters (12)
- `GET_ID_BY_FIELD(fldName As String, fldValue As String)` As String _(public)_
- `GetAffectedID()` _(public)_
- `GetBoolean(fld As String)` As Boolean _(public)_
- `GetDouble(fld As String)` As Double _(public)_
- `GetImage(fld As String)` As String _(public)_
- `GetInt(fld As String)` As Int _(public)_
- `GetKeyValues(bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `GetKeyValuesFromList(source As List, bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `GetLong(fld As String)` As Long _(public)_
- `getPosition()` _(public)_
- `GetRecord(pos As Int)` As Map _(public)_
- `GetString(fld As String)` As String _(public)_

## Private Methods (15)
- `CBool(v As Object)` As Boolean _(private)_
- `CDbl(o As String)` As Double _(private)_
- `CInt(o As Object)` As Int _(private)_
- `CStr(o As Object)` As String _(private)_
- `GetRecursive(xdata As Map, path As String)` As Object _(private)_
- `guidAlphaApp(glen As Int)` As String _(private)_
- `InStr(sText As String, sFind As String)` As Int _(private)_
- `isNaN(obj As Object)` As Boolean _(private)_
- `Join(delimiter As String, lst As List)` As String _(private)_
- `ListOfMapsGetProperty(lst As List, key As String)` As List _(private)_
- `MvField(sValue As String, iPosition As Int, Delimiter As String)` As String _(private)_
- `NumberFormat2Fix(number As Double, minimumIntegers As Int, maximumFractions As Int, minimumFractions As Int, groupingUsed As Boolean)` As Double _(private)_
- `RemDelim(sValue As String, Delim As String)` As String _(private)_
- `StrParse(delim As String, inputString As String)` As List _(private)_
- `Val(value As String)` As String _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIMySQLRESTNative
svc.Initialize(Module As Object, eventName As String, url As String, sTableName As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.
