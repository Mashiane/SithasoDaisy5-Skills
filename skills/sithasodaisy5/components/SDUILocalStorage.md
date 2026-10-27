---
name: SDUILocalStorage
description: SithasoDaisy5 SDUILocalStorage component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUILocalStorage

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUILocalStorage.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUILocalStorage.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_Browser `localStorage` persistence — record/schema CRUD over key-value pairs client-side._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(dbName As String, pk As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub localstorage_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (32)
- `ADD_FIELD(fld As String)` As SDUILocalStorage _(public)_
- `ADD_FIELDS(fields As List)` As SDUILocalStorage _(public)_
- `ADD_ORDER_BY(fld As String)` As SDUILocalStorage _(public)_
- `ADD_WHERE(fld As String, operator As String, value As Object)` As SDUILocalStorage _(public)_
- `Clear()` _(public)_
- `CLEAR_WHERE()` _(public)_
- `Create()` _(public)_
- `Delete(pv As String)` _(public)_
- `Initialize(dbName As String, pk As String)` _(public)_
- `MoveFirst()` _(public)_
- `MoveLast()` _(public)_
- `MoveNext()` _(public)_
- `MovePrevious()` _(public)_
- `MoveStart()` _(public)_
- `NextID()` _(public)_
- `NextRow()` _(public)_
- `PrepareRecord()` _(public)_
- `Read(pv As String)` As Map _(public)_
- `RecordFromMap(sm As Map)` _(public)_
- `RemoveField(fldName As String)` _(public)_
- `SchemaAddBoolean(bools As List)` As SDUILocalStorage _(public)_
- `SchemaAddBoolean1(b As String)` As SDUILocalStorage _(public)_
- `SchemaAddDouble(bools As List)` As SDUILocalStorage _(public)_
- `SchemaAddDouble1(b As String)` As SDUILocalStorage _(public)_
- `SchemaAddFloat(bools As List)` As SDUILocalStorage _(public)_
- `SchemaAddFloat1(b As String)` As SDUILocalStorage _(public)_
- `SchemaAddInt(bools As List)` As SDUILocalStorage _(public)_
- `SchemaAddInt1(b As String)` As SDUILocalStorage _(public)_
- `SchemaAddText(bools As List)` As SDUILocalStorage _(public)_
- `SchemaAddText1(b As String)` As SDUILocalStorage _(public)_
- `SchemaClear()` _(public)_
- `Update()` _(public)_

## Key Setters (4)
- `SetField(fldName As String, fldValue As Object)` _(public)_
- `setPosition(pos As Int)` _(public)_
- `SetRecord(rec As Map)` _(public)_
- `setRecords(lst As List)` _(public)_

## Getters (8)
- `GetBoolean(fld As String)` As Boolean _(public)_
- `GetDouble(fld As String)` As Double _(public)_
- `GetInt(fld As String)` As Int _(public)_
- `GetLong(fld As String)` As Long _(public)_
- `getPosition()` _(public)_
- `GetRecord(pos As Int)` As Map _(public)_
- `getRecords()` _(public)_
- `GetString(fld As String)` As String _(public)_

## Private Methods (10)
- `CBool(v As Object)` As Boolean _(private)_
- `CDbl(o As String)` As Double _(private)_
- `CInt(o As Object)` As Int _(private)_
- `CStr(o As Object)` As String _(private)_
- `getRecordPos(res As List, tPK As String)` As Int _(private)_
- `guidAlphaApp(glen As Int)` As String _(private)_
- `InStr(sText As String, sFind As String)` As Int _(private)_
- `isNaN(obj As Object)` As Boolean _(private)_
- `NumberFormat2Fix(number As Double, minimumIntegers As Int, maximumFractions As Int, minimumFractions As Int, groupingUsed As Boolean)` As Double _(private)_
- `Val(value As String)` As String _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUILocalStorage
svc.Initialize(dbName As String, pk As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.
