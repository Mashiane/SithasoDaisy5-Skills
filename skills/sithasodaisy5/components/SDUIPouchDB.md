---
name: SDUIPouchDB
description: SithasoDaisy5 SDUIPouchDB component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIPouchDB

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIPouchDB.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIPouchDB.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_PouchDB client — offline-first browser storage with records CRUD, indexes, bulk ops and remote sync._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, EventName As String, DataBase As String, TableName As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub pouchdb_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (110)
- `Initialize(Module As Object, EventName As String, DataBase As String, TableName As String)` _(public)_
- `MoveStart()` _(public)_
- `orderBy(fldNames As List)` As SDUIPouchDB _(public)_
- `orderByDesc(fldNames As List)` As SDUIPouchDB _(public)_
- `selectFields(fldNames As List)` As SDUIPouchDB _(public)_
- `whereEqual(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `whereGreaterThan(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `whereGreaterThanEqualTo(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `whereLike(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `SetNextID()` _(public)_
- `ConnectRemote(xHost As String, xPort As String, xUserName As String, xPassword As String, xDBName As String, xTableName As String)` _(public)_
- `Sync(bLive As Boolean, bRetry As Boolean)` As RelaxSync _(public)_
- `GetAffectedID()` _(public)_
- `NextID()` As String _(public)_
- `Info()` As Map _(public)_
- `COUNT_ALL()` As Int _(public)_
- `COMPACT()` _(public)_
- `WATCH_CHANGES(sinceWhen As String, live As Boolean, includedocs As Boolean)` _(public)_
- `CREATE()` As String _(public)_
- `SELECT_RANGE(range As String)` _(public)_
- `READ(docID As String)` As Map _(public)_
- `READ_BY(fldName As String, fldValue As Object)` As Map _(public)_
- `ContainsField(fldName As String, id As String)` As Boolean _(public)_
- `GetKeyValues(bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `ContainsKey(id As String)` As Boolean _(public)_
- `READ_BY_STRING_FIELDS(fldName As String, fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_ID_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_BY(fldName As String, fldValue As String)` As String _(public)_
- `READ_FIELDS(fldValue As Object, theseFlds As List)` As Map _(public)_
- `SetRecordAt(pos As Int, rec As Map)` _(public)_
- `GetImage(fld As String)` As String _(public)_
- `DELETE(docID As String)` As Boolean _(public)_
- `PURGE(docID As String)` As Boolean _(public)_
- `UPDATE()` As String _(public)_
- `UPDATE_BULK(nrecs As List)` _(public)_
- `DELETE_BULK(nrecs As List)` _(public)_
- `CREATE_BULK(nrecs As List)` _(public)_
- `SELECT_ALL()` _(public)_
- `FirstRecord()` As Map _(public)_
- `GetIndexes()` As Map _(public)_
- `CreateIndexes(idName As String, xFields As List)` As Map _(public)_
- `CreateMultipleIndexes(xFields As List)` _(public)_
- `CreateIndex(idxName As String)` As Map _(public)_
- `SELECT_WHERE1()` As List _(public)_
- `SetRecords(lst As List)` _(public)_
- `SetRecordAsIs(rec As Map)` _(public)_
- `SELECT_WHERE()` _(public)_
- `GET_ID_BY_FIELD(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY(fldName As String, fldValue As String)` As String _(public)_
- `CLEAR_WHERE()` _(public)_
- `ADD_FIELDS(flds As List)` _(public)_
- `ADD_FIELD(fld As String)` _(public)_
- `ADD_ORDER_BY(fld As String)` _(public)_
- `ADD_ORDER_BY_DESC(fld As String)` _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` _(public)_
- `CLOSE()` _(public)_
- `GetRecordsCount()` As Int _(public)_
- `SchemaAddBlob(bools As List)` _(public)_
- `SchemaAddBoolean(bools As List)` _(public)_
- `SchemaAddDouble(bools As List)` _(public)_
- `SchemaAddFloat(bools As List)` _(public)_
- `SchemaAddText(bools As List)` _(public)_
- `SchemaAddInt(bools As List)` _(public)_
- `SchemaAddField(fldName As String, fldType As String)` _(public)_
- `SchemaClear()` _(public)_
- `PrepareRecord()` _(public)_
- `SetRecord(rec As Map)` _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `SetField(fldName As String, fldValue As Object)` _(public)_
- `SetFieldAttachment(fileName As String, mimeType As String, base64Data As String)` _(public)_
- `PutAttachment(sid As String, fileName As String, base64Data As String, mimeType As String)` As Map _(public)_
- `GetAttachment(sid As String, fileName As String)` As Map _(public)_
- `NextRow()` As Boolean _(public)_
- `SchemaAddLongText1(b As String)` _(public)_
- `SchemaAddLongText(bools As List)` _(public)_
- `SchemaAddFile(bools As List)` _(public)_
- `SchemaAddFile1(b As String)` _(public)_
- `GetInt(fld As String)` As Int _(public)_
- `GetLong(fld As String)` As Long _(public)_
- `GetString(fld As String)` As String _(public)_
- `whereLessThanEqualTo(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `whereLessThan(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `whereBetween(fldName As String, fldStart As Object, fldEnd As Object)` As SDUIPouchDB _(public)_
- `whereNotEqual(fldName As String, fldValue As Object)` As SDUIPouchDB _(public)_
- `GetBoolean(fld As String)` As Boolean _(public)_
- `GetDouble(fld As String)` As Double _(public)_
- `DELETE_BY(fldName As String, fldValue As String)` As Boolean _(public)_
- `deleteWhere(priKey As String, whereMap As Map, whereOps As List)` As Boolean _(public)_
- `DELETE_WHERE()` _(public)_
- `GetRecord(pos As Int)` As Map _(public)_
- `MoveFirst()` _(public)_
- `MoveLast()` _(public)_
- `MovePrevious()` _(public)_
- `MoveNext()` _(public)_
- `PutRecursive(data As Map, path As String, value As Object)` _(public)_
- `PutRecursiveDelim(data As Map, path As String, value As Object, delim As String)` _(public)_
- `GetRecursive(data As Map, path As String)` As Object _(public)_
- `SetSchemaFromDataModel1(sourceTable As String, models As Map)` _(public)_
- `SchemaAddBoolean1(b As String)` _(public)_
- `SchemaAddDouble1(b As String)` _(public)_
- `SchemaAddInt1(b As String)` _(public)_
- `SchemaAddText1(b As String)` _(public)_
- `SetSchemaFromDataModel(models As Map)` _(public)_
- `SetFieldsFromDataModel(models As Map)` _(public)_
- `RemoveFields(themFields As List)` _(public)_
- `SchemaAddIndex(idxName As String, bUnique As Boolean)` _(public)_
- `SchemaAddIndexes(idxNames1 As List)` _(public)_
- `SchemaAddUniqueIndexes(idxNames1 As List)` _(public)_
- `GroupBy(groupFields() As String, aggDefs() As String, orderDefs() As String)` _(public)_
## Key Setters (7)
- `setTableName(s As String)` _(public)_
- `setIncludeDesignLocal(b As Boolean)` _(public)_
- `setIncludeDocs(b As Boolean)` As 'ignoredeadcode _(public)_
- `setIncludeAttachments(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAutoKeys(b As Boolean)` _(public)_
- `setFields(tflds As List)` _(public)_
- `setPosition(pos As Int)` _(public)_
## Getters (7)
- `getTableName()` As String _(public)_
- `getIncludeDesignLocal()` As Boolean _(public)_
- `getIncludeDocs()` As Boolean _(public)_
- `getIncludeAttachments()` As Boolean _(public)_
- `getAutoKeys()` As Boolean _(public)_
- `getFields()` As List _(public)_
- `getPosition()` As Int _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIPouchDB
svc.Initialize(Module As Object, EventName As String, DataBase As String, TableName As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.


