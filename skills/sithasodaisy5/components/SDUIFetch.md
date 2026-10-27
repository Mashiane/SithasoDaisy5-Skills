---
name: SDUIFetch
description: SithasoDaisy5 SDUIFetch component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIFetch

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIFetch.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIFetch.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_HTTP fetch client — async web requests with headers, params, auth, CORS and schema helpers._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(url As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub fetch_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (25)
- `AddData(k As String, v As String)` _(public)_
- `AddDataList(k As String, v As List)` _(public)_
- `AddDataMap(k As String, v As Map)` _(public)_
- `AddFormData(fldName As String, fldValue As Object)` _(public)_
- `AddHeader(prop As String, value As String)` _(public)_
- `AddHeaders(hdrs As Map)` _(public)_
- `AddParameter(k As String, v As String)` _(public)_
- `AddParameters(mapOf As Map)` _(public)_
- `DeleteWait()` _(public)_
- `ErrorMessage()` As String _(public)_
- `Initialize(url As String)` _(public)_
- `NewFormData()` _(public)_
- `PatchWait()` _(public)_
- `PostWait()` _(public)_
- `PutRecursive(xdata As Map, path As String, value As Object)` _(public)_
- `PutWait()` _(public)_
- `RedirectFollow()` _(public)_
- `ResponseList()` _(public)_
- `SchemaAddBoolean(bools As List)` _(public)_
- `SchemaAddDouble(bools As List)` _(public)_
- `SchemaAddIntegers(bools As List)` _(public)_
- `SchemaAddString(bools As List)` _(public)_
- `SchemaClear()` _(public)_
- `ToList()` _(public)_
- `URLQueryStringFromMap(params As Map)` As String _(public)_

## Key Setters (18)
- `SetAccessControlAllowCredentials(value As Boolean)` _(public)_
- `SetAccessControlAllowHeaders(value As String)` _(public)_
- `SetAccessControlAllowMethods(value As String)` _(public)_
- `SetAccessControlAllowOrigin(value As String)` _(public)_
- `SetAuthorizationBearerToken(sToken As String)` _(public)_
- `setBaseURL(s As String)` _(public)_
- `SetBasicAuthorization(username As String, password As String)` _(public)_
- `SetContentType(value As String)` _(public)_
- `SetContentTypeApplication_X_WWW_Form_URLEncoded()` _(public)_
- `SetContentTypeApplication_X_WWW_Form_URLEncodedUTF8()` _(public)_
- `SetContentTypeApplicationJSON()` _(public)_
- `SetData(m As Map)` _(public)_
- `setNoCache(b As Boolean)` _(public)_
- `setNoCors(b As Boolean)` _(public)_
- `SetOrigin(value As String)` _(public)_
- `setRedirect(s As String)` _(public)_
- `setReferrerPolicy(s As String)` _(public)_
- `SetURL(url As String)` _(public)_

## Getters (3)
- `GetRecursive(xdata As Map, path As String)` As Object _(public)_
- `getRedirect()` _(public)_
- `GetWait()` _(public)_

## Private Methods (9)
- `CBool(v As Object)` As Boolean _(private)_
- `CDbl(o As String)` As Double _(private)_
- `CInt(o As Object)` As Int _(private)_
- `CStr(o As Object)` As String _(private)_
- `fetchit(method As String)` _(private)_
- `InStr(sText As String, sFind As String)` As Int _(private)_
- `NumberFormat2Fix(number As Double, minimumIntegers As Int, maximumFractions As Int, minimumFractions As Int, groupingUsed As Boolean)` As Double _(private)_
- `RemDelim(sValue As String, Delim As String)` As String _(private)_
- `Val(value As String)` As String _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIFetch
svc.Initialize(url As String)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.
