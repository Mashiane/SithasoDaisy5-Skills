---
name: SDUIPocketBase
description: SithasoDaisy5 SDUIPocketBase component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIPocketBase

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIPocketBase.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIPocketBase.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_PocketBase backend client — records CRUD, admin/user auth, files, filters and realtime connection._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Module As Object, eventName As String, url As String, TableName As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
`Connect`, `Disconnect`, `ConnectError`, `RealTime`, `Changes`, `Change`, `AuthChange`, `BeforeSend`, `AfterSend`

Wire in parent: `Sub pocketbase_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (234)
- `ADD_EXPAND(sexpand As String)` As SDUIPocketBase _(public)_
- `ADD_FIELD(fld As String)` As SDUIPocketBase _(public)_
- `ADD_FIELDS(fields As List)` As SDUIPocketBase _(public)_
- `ADD_FILE_FIELD(fld As String, fldURL As String)` As SDUIPocketBase _(public)_
- `ADD_GROUP_BY(grpBys As List)` _(public)_
- `ADD_OR_WHERE(fld As String, operator As String, value As Object)` As SDUIPocketBase _(public)_
- `ADD_OR_WHERE_STRING(fld As String, operator As String, value As Object)` As SDUIPocketBase _(public)_
- `ADD_ORDER_BY(fld As String)` As SDUIPocketBase _(public)_
- `ADD_ORDER_BY_CREATED_AT()` _(public)_
- `ADD_ORDER_BY_DESC(fld As String)` As SDUIPocketBase _(public)_
- `ADD_ORDER_BY_UPDATED_AT()` _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` As SDUIPocketBase _(public)_
- `ADD_WHERE_STRING(fld As String, operator As String, value As Object)` As SDUIPocketBase _(public)_
- `AddFilter(fltr As String)` _(public)_
- `AddHeader(prop As String, value As String)` _(public)_
- `ADMIN_AUTH_REFRESH()` _(public)_
- `ADMIN_AUTH_WITH_PASSWORD(email As String, pwd As String)` As Map _(public)_
- `ADMIN_CONFIRM_PASSWORD_RESET(token As String, newPassword As String, confimPassword As String)` As Map _(public)_
- `ADMIN_REQUEST_PASSWORD_RESET(email As String)` As Boolean _(public)_
- `AssignRealRecord(dbRecord As Map)` _(public)_
- `BATCH_ADD_CREATE()` _(public)_
- `BATCH_ADD_DELETE()` _(public)_
- `BATCH_ADD_UPDATE()` _(public)_
- `BATCH_ADD_UPSERT()` _(public)_
- `BATCH_CREATE()` _(public)_
- `BATCH_SEND()` _(public)_
- `BuildFileThumbNailURL(id As String, fileName As String, width As String, height As String)` As String _(public)_
- `BuildFileURL(id As String, fileName As String)` As String _(public)_
- `CancelAllRequests()` _(public)_
- `CancelRequest(reqKey As String)` As BANanoPromise _(public)_
- `CHANGE_USER_PASSWORD(uEmail As String, newPassword As String, confirmPassword As String)` As Map _(public)_
- `CLEAR_WHERE()` _(public)_
- `ClearHeaders()` _(public)_
- `ContainsField(fldName As String, id As String)` As Boolean _(public)_
- `ContainsFieldFetch(fldName As String, id As String)` As Boolean _(public)_
- `ContainsKey(id As String)` As Boolean _(public)_
- `ContainsKeyFetch(id As String)` As Boolean _(public)_
- `COUNT_ALL()` _(public)_
- `CREATE()` _(public)_
- `CREATE_ADMIN(profile As Map)` As Map _(public)_
- `CREATE_COLLECTION(nameOf As String, colType As String, colSchema As List)` As Map _(public)_
- `CREATE_COLLECTION1()` _(public)_
- `CREATE_COLLECTION2()` _(public)_
- `CREATE_COLLECTION_ORIGINAL(col As Map)` As Map _(public)_
- `CREATE_FETCH()` _(public)_
- `CREATE_FORM()` _(public)_
- `CREATE_FORMDATA(fileField As String)` As Map _(public)_
- `CREATE_OR_UPDATE()` _(public)_
- `CREATE_OR_UPDATE_BY_FIELD(fldName As String)` As String _(public)_
- `CREATE_OR_UPDATE_FORM(sID As String)` As String _(public)_
- `CREATE_USER(profile As Map)` As Map _(public)_
- `CREATE_USER_FORM()` _(public)_
- `CREATE_VIEW(nameOf As String, qry As String)` _(public)_
- `DELETE(id As String)` As Boolean _(public)_
- `DELETE_ADMIN(id As String)` As Boolean _(public)_
- `DELETE_ALL()` _(public)_
- `DELETE_ALL_REST(tableName As String)` As Map _(public)_
- `DELETE_ALL_RESTAUTH(tableName As String)` As Map _(public)_
- `DELETE_BY(fldName As String, fldValue As String)` As Boolean _(public)_
- `DELETE_BY_STRING(fldName As String, fldValue As String)` As Boolean _(public)_
- `DELETE_COLLECTION(colName As String)` As Boolean _(public)_
- `DELETE_FETCH(delID As String)` As Boolean _(public)_
- `DELETE_MULTIPLE(items As List)` As Boolean _(public)_
- `DELETE_USER(id As String)` As Boolean _(public)_
- `DELETE_WHERE()` _(public)_
- `deleteWhere(priKey As String, whereMap As Map, whereOps As List)` As Boolean _(public)_
- `EstablishFileUrl(fileField As String, urlField As String)` _(public)_
- `EstablishFileUrl1(rec As Map, fileField As String, urlField As String)` _(public)_
- `Exists(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsByString(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsByStringFetch(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsFetch(fldName As String, fldValue As Object)` As Boolean _(public)_
- `ExistsWhere(where As Map)` As Boolean _(public)_
- `ExistsWhereFetch(where As Map)` As Boolean _(public)_
- `FILE_FIELD(fld As String, fldUrl As String)` As SDUIPocketBase _(public)_
- `findWhere(whereMap As Map, whereOps As List)` As List _(public)_
- `findWhereFetch(whereMap As Map, whereOps As List)` As List _(public)_
- `findWhereOrderBy(whereMap As Map, whereOps As List, orderByx As List)` As List _(public)_
- `findWhereOrderByFetch(whereMap As Map, whereOps As List, orderByx As List)` As List _(public)_
- `FirstRecord()` _(public)_
- `groupBy(fldNames As List)` As SDUIPocketBase _(public)_
- `Initialize(Module As Object, eventName As String, url As String, TableName As String)` As SDUIPocketBase _(public)_
- `InitializeOnConnection(Module As Object, connection As BANanoObject, eventName As String, url As String, TableName As String)` As SDUIPocketBase _(public)_
- `IsRecordValid(m As Map, props As List)` As Boolean _(public)_
- `ListKeys()` _(public)_
- `MoveFirst()` _(public)_
- `MoveLast()` _(public)_
- `MoveNext()` _(public)_
- `MovePrevious()` _(public)_
- `MoveStart()` _(public)_
- `NextID()` _(public)_
- `NextRow()` _(public)_
- `NumberFormat2Fix(number As Double, minimumIntegers As Int, maximumFractions As Int, minimumFractions As Int, groupingUsed As Boolean)` As Double _(public)_
- `orderBy(fldNames As List)` As SDUIPocketBase _(public)_
- `orderByDesc(fldNames As List)` As SDUIPocketBase _(public)_
- `OrWhereEqual(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereGreaterThan(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereGreaterThanEqualTo(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereLessThan(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereLessThanEqualTo(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereLike(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereNotEqual(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `OrWhereNotLike(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `PrepareForm()` _(public)_
- `PrepareRecord()` _(public)_
- `PutRecursive(data As Map, path As String, value As Object)` _(public)_
- `READ(id As String)` As Map _(public)_
- `READ_ADMIN(id As String)` As Map _(public)_
- `READ_BY(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_FETCH(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_FIELDS(fldName As String, fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_BY_FIELDS_FETCH(fldName As String, fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_BY_STRING(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_STRING_FETCH(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_STRING_FIELDS(fldName As String, fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_BY_STRING_FIELDS1(fldName As String, fldValue As Object)` As Map _(public)_
- `READ_BY_STRING_FIELDS_FETCH(fldName As String, fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_COLLECTION(id As String)` As Map _(public)_
- `READ_FETCH(id As String)` As Map _(public)_
- `READ_FIELDS(fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_FIELDS_FETCH(fldValue As Object, theseFlds As List)` As Map _(public)_
- `READ_ID_BY(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_BY_FETCH(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_BY_STRING_FETCH(fldName As String, fldValue As String)` As String _(public)_
- `READ_ID_WHERE(whereIs As Map)` As String _(public)_
- `READ_USER(id As String)` As Map _(public)_
- `RealtimePublish(Module As Object, topicName As String, value As String)` _(public)_
- `RealtimeSubscribe(Module As Object, topicName As String)` _(public)_
- `RealtimeUnSubscribe(topicName As String)` _(public)_
- `RealtimeUnSubscribeByPrefix(topicName As String)` _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `RemoveField(fldName As String)` _(public)_
- `RemoveFields(themFields As List)` _(public)_
- `Reset()` _(public)_
- `Schema_CreateCollection(nameOf As String, colType As String, options As Map)` As Map _(public)_
- `SchemaAdd(surl As String, semail As String, spassword As String, collections As List)` As Boolean _(public)_
- `SchemaAddBlob(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddBlob1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddBoolean(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddBoolean1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddDouble(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddDouble1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddFile(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddFile1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddFloat(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddFloat1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddFromAsset(sassetFile As String, semail As String, spassword As String)` As Boolean _(public)_
- `SchemaAddIndex(idxName As String, bUnique As Boolean)` As SDUIPocketBase _(public)_
- `SchemaAddIndexes(idxNames1 As List)` As SDUIPocketBase _(public)_
- `SchemaAddInt(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddInt1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddJson(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddJson1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddLongText(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddLongText1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddNumber(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddNumber1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddRelation(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddRelation1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddText(bools As List)` As SDUIPocketBase _(public)_
- `SchemaAddText1(b As String)` As SDUIPocketBase _(public)_
- `SchemaAddUniqueIndexes(idxNames1 As List)` As SDUIPocketBase _(public)_
- `SchemaBackUp(prjName As String, surl As String, semail As String, spassword As String)` As Boolean _(public)_
- `SchemaClear()` _(public)_
- `SchemaGet(prjName As String, surl As String, semail As String, spassword As String)` As List _(public)_
- `SchemaRestore(surl As String, semail As String, spassword As String, collections As List)` As Boolean _(public)_
- `SchemaRestoreFromAsset(sassetFile As String, semail As String, spassword As String)` As Boolean _(public)_
- `SchemaTableGet(ftblName As String, surl As String, semail As String, spassword As String)` As Map _(public)_
- `SchemaToPocketBase()` _(public)_
- `SchemaUpdate(surl As String, semail As String, spassword As String, collections As List)` As Boolean _(public)_
- `SELECT_ALL()` _(public)_
- `SELECT_ALL_ADMINS()` _(public)_
- `SELECT_ALL_COLLECTIONS(e As String, p As String)` As List _(public)_
- `SELECT_ALL_COLLECTIONS_NAMES(e As String, p As String)` As List _(public)_
- `SELECT_ALL_FETCH()` _(public)_
- `SELECT_ALL_USERS()` _(public)_
- `SELECT_COLLECTIONS()` As List _(public)_
- `SELECT_RAW(qry As String)` As List _(public)_
- `SELECT_TO_VIEW(nameOf As String)` _(public)_
- `SELECT_TO_VIEW_ONLY(nameOf As String)` _(public)_
- `SELECT_VIEW(viewName As String)` _(public)_
- `SELECT_WHERE()` _(public)_
- `SELECT_WHERE1()` _(public)_
- `SELECT_WHERE1_FETCH()` _(public)_
- `SELECT_WHERE_FETCH()` _(public)_
- `selectFields(fldNames As List)` As SDUIPocketBase _(public)_
- `SEND(EndPoint As String, options As Map)` As BANanoPromise _(public)_
- `SEND_EMAIL_REST(toEmail As String, Subject As String, Message As String)` As Map _(public)_
- `SERVER_DATE_TIME()` _(public)_
- `Subscribe(Module As Object, TableName As String)` _(public)_
- `SubscribeToRecord(Module As Object, TableName As String, id As String)` _(public)_
- `UnSubscribe(TableName As String)` _(public)_
- `UnSubscribeToRecord(TableName As String, id As String)` _(public)_
- `UPDATE()` _(public)_
- `UPDATE_ADMIN(id As String, profile As Map)` As Map _(public)_
- `UPDATE_BY(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_BY_STRING(fldName As String, fldValue As String)` As String _(public)_
- `UPDATE_COLLECTION(colName As String, colSchema As Map)` As Map _(public)_
- `UPDATE_COLLECTION1()` _(public)_
- `UPDATE_COLLECTION2()` _(public)_
- `UPDATE_COLLECTION_ORIGINAL(col As Map)` As Map _(public)_
- `UPDATE_FETCH()` _(public)_
- `UPDATE_FILE(sid As String, fileField As String, fileObj As Map)` As String _(public)_
- `UPDATE_FORM(sID As String)` As Map _(public)_
- `UPDATE_FORMDATA(sID As String)` As String _(public)_
- `UPDATE_PER_FIELD()` _(public)_
- `UPDATE_USER(id As String, profile As Map)` As Map _(public)_
- `UPDATE_USER_FORM(id As String)` As Map _(public)_
- `USER_AUTH_REFRESH()` _(public)_
- `USER_AUTH_WITH_GOOGLE()` _(public)_
- `USER_AUTH_WITH_PASSWORD(email As String, pwd As String)` As Map _(public)_
- `USER_CONFIRM_EMAIL_CHANGE(token As String, email As String)` As Map _(public)_
- `USER_CONFIRM_PASSWORD_RESET(token As String, newPassword As String, confimPassword As String)` As Map _(public)_
- `USER_CONFIRM_VERIFICATION(token As String)` As Map _(public)_
- `USER_ISVALID()` _(public)_
- `USER_MODEL()` _(public)_
- `USER_REQUEST_EMAIL_CHANGE(email As String)` As Map _(public)_
- `USER_REQUEST_PASSWORD_RESET(email As String)` As Boolean _(public)_
- `USER_REQUEST_VERIFICATION(email As String)` As Map _(public)_
- `USER_REVOKE_GOOGLE_TOKEN()` _(public)_
- `USER_SIGNOUT()` _(public)_
- `USER_TOKEN()` _(public)_
- `WHERE_AND(pos As Int)` As SDUIPocketBase _(public)_
- `WHERE_OR(pos As Int)` As SDUIPocketBase _(public)_
- `whereBetween(fldName As String, fldStart As Object, fldEnd As Object)` As SDUIPocketBase _(public)_
- `whereEqual(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereGreaterThan(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereGreaterThanEqualTo(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereLessThan(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereLessThanEqualTo(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereLike(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereNotEqual(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `whereNotLike(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_

## Key Setters (19)
- `setApiKey(s As String)` _(public)_
- `SetAuthorizationBearerToken(sToken As String)` _(public)_
- `SetAutoCancellation(b As Boolean)` As BANanoPromise _(public)_
- `SetField(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `setFields(tflds As List)` _(public)_
- `SetFieldsFromDataModel(models As Map)` _(public)_
- `SetForm(m As Map)` _(public)_
- `SetFormField(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `SetFormFile(fldName As String, fldValue As Object)` As SDUIPocketBase _(public)_
- `SetNextID()` _(public)_
- `setNoCache(b As Boolean)` _(public)_
- `setPosition(pos As Int)` _(public)_
- `SetRecord(rec As Map)` _(public)_
- `SetRecordAsIs(rec As Map)` _(public)_
- `SetRecordAt(pos As Int, rec As Map)` _(public)_
- `SetRecords(lst As List)` _(public)_
- `SetSchemaFromDataModel(models As Map)` _(public)_
- `SetSchemaFromDataModel1(sourceTable As String, models As Map)` _(public)_
- `setTableName(s As String)` _(public)_

## Getters (29)
- `GET_ID_BY_FIELD(fldName As String, fldValue As String)` As String _(public)_
- `GET_ID_BY_FIELD_FETCH(fldName As String, fldValue As String)` As String _(public)_
- `GetAffectedID()` _(public)_
- `GetBoolean(fld As String)` As Boolean _(public)_
- `GetDataModel()` _(public)_
- `GetDataModelOfTable(tblName As String)` As Map _(public)_
- `GetDataModels(e As String, p As String)` As Map _(public)_
- `GetDocumentURL(fileField As String)` As String _(public)_
- `GetDouble(fld As String)` As Double _(public)_
- `getFields()` _(public)_
- `getFileURL(rec As Map, filesFieldName As String)` As String _(public)_
- `getFileURLTo(rec As Map, fileField As String, urlField As String)` _(public)_
- `GetFirstListItem(tableName As String)` As Map _(public)_
- `GetFirstListItemFetch(tableName As String)` As Map _(public)_
- `GetImage(fld As String)` As String _(public)_
- `GetInt(fld As String)` As Int _(public)_
- `GetKeyValues(bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `GetKeyValuesFromList(source As List, bHasNothing As Boolean, k As String, v As String)` As Map _(public)_
- `GetLong(fld As String)` As Long _(public)_
- `getNoCache()` _(public)_
- `getPosition()` _(public)_
- `GetRealRecord(dbRecord As Map)` As Map _(public)_
- `GetRecord(pos As Int)` As Map _(public)_
- `GetRecordsCount()` _(public)_
- `GetRecordURLLink(rec As Map, tableName As String, filesFieldName As String)` As String _(public)_
- `GetRecursive(data As Map, path As String)` As Object _(public)_
- `GetString(fld As String)` As String _(public)_
- `GetURLLink(filesFieldName As String)` As String _(public)_
- `GetViews(e As String, p As String)` As List _(public)_

## Private Methods (18)
- `CBool(v As Object)` As Boolean _(private)_
- `CDbl(o As String)` As Double _(private)_
- `CInt(o As Object)` As Int _(private)_
- `CStr(o As Object)` As String _(private)_
- `Download(content As String, fileName As String)` _(private)_
- `guidAlphaApp(glen As Int)` As String _(private)_
- `HandleChange(e As Map)` _(private)_
- `InStr(sText As String, sFind As String)` As Int _(private)_
- `isBase64Image(imgURL As String)` As Boolean _(private)_
- `isNaN(obj As Object)` As Boolean _(private)_
- `Join(delimiter As String, lst As List)` As String _(private)_
- `JoinIndexNames(idx As String)` As String _(private)_
- `ListOfMapsGetProperty(lst As List, key As String)` As List _(private)_
- `MvField(sValue As String, iPosition As Int, Delimiter As String)` As String _(private)_
- `PrepareSubs(Module As Object, eventName As String)` _(private)_
- `RemDelim(sValue As String, Delim As String)` As String _(private)_
- `StrParse(delim As String, inputString As String)` As List _(private)_
- `Val(value As String)` As String _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIPocketBase
svc.Initialize(Module As Object, eventName As String, url As String, TableName As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.
