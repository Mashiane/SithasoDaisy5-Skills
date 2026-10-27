---
name: SDUIJSONQuery
description: SithasoDaisy5 SDUIJSONQuery component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUIJSONQuery

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUIJSONQuery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUIJSONQuery.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgJSONQuery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONQuery.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_JSON query helper — SQL-like select/filter/order/group over JSON data (where*, Order*, Pluck, Unique)._

This is a **service module**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(jsonObject As Object)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub jsonquery_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (22)
- `Exec()` _(public)_
- `Find(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `groupBy(fld As String)` As SDUIJSONQuery _(public)_
- `Initialize(jsonObject As Object)` As SDUIJSONQuery _(public)_
- `Limit(i As Int)` As SDUIJSONQuery _(public)_
- `Offset(i As Int)` As SDUIJSONQuery _(public)_
- `OrderAsc(fld As String)` As SDUIJSONQuery _(public)_
- `OrderDesc(fld As String)` As SDUIJSONQuery _(public)_
- `Pluck(fld As String)` As SDUIJSONQuery _(public)_
- `selectFields(flds As List)` As SDUIJSONQuery _(public)_
- `Unique(fld As String)` As SDUIJSONQuery _(public)_
- `whereBetween(fld As String, val1 As Object, val2 As Object)` As SDUIJSONQuery _(public)_
- `whereEqual(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereGreaterThan(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereGreaterThanOrEqual(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereIn(fld As String, values As List)` As SDUIJSONQuery _(public)_
- `whereLessThan(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereLessThanOrEqual(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereLike(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereNotEqual(fld As String, val As Object)` As SDUIJSONQuery _(public)_
- `whereNotIn(fld As String, values As List)` As SDUIJSONQuery _(public)_
- `whereOr(fld As String, operator As String, val As String)` As SDUIJSONQuery _(public)_

## Key Setters (0)

## Getters (0)

## Private Methods (1)
- `Reset()` _(private)_

## Verified Demo Usage
Real syntax from [`pgJSONQuery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONQuery.bas) (verified demo). Methods are chainable; the demo
shows them commented as a cheat-sheet — the active call is `Initialize`:

```b4j
Dim jsonQ As SDUIJSONQuery
Dim movies As List = BANano.Window.GetField("movies")
jsonQ.Initialize(movies)                       'Initialize(data As List)

'demo cheat-sheet (chainable):
'jsonQ.whereEqual("rating", 8.4).whereGreaterThan("year", 1970).whereOr("rating", "=", 8.4)
'jsonQ.whereLike("name", "Godfather")
'jsonQ.whereBetween("rating", 8, 9)
'jsonQ.groupBy("rating")
'jsonQ.selectFields(Array("actor", "rating"))
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim svc As SDUIJSONQuery
svc.Initialize(jsonObject As Object)
```
## Composes With
- Pairs with the SDUI5 page components: call service methods from page/component event handlers.
