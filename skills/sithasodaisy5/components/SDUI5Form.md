---
name: SDUI5Form
description: SithasoDaisy5 SDUI5Form component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Form

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Form.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Form.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Form is a form container that wires submit/reset, field validation, and layout for inputs. Children (inputs, selects, textareas, buttons) mount into the form via `ParentID = "{formName}"`. Use Validate/IsValid and the submit/reset events for form handling. Inputs inside still need their own InputType/mode settings.
_SDUI5Form is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Callback As Object, Name As String, EventName As String)` | **Has DesignerCreateView**: Yes
## Designer Properties
| Key | Type | Default | List | Setter | Getter |
|---|---|---|---|---|---|
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Name` | String | — | — | `setName` | `getName` |
| `AcceptCharset` | String | utf-8 | — | `setAcceptCharset` | `getAcceptCharset` |
| `Action` | String | — | — | `setAction` | `getAction` |
| `Autocomplete` | String | off | off, on | `setAutocomplete` | `getAutocomplete` |
| `Enctype` | String | application/x-www-form-urlencoded | application/x-www-form-urlencoded, multipart/form-data, text/plain | `setEnctype` | `getEnctype` |
| `Method` | String | none | get, none, post | `setMethod` | `getMethod` |
| `Novalidate` | Boolean | False | — | `setNovalidate` | `getNovalidate` |
| `Rel` | String | none | external, help, license, next, nofollow, none, noopener, noreferrer, opener, prev, search | `setRel` | `getRel` |
| `Target` | String | none | _blank, _parent, _self, _top, none | `setTarget` | `getTarget` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
`Submit`

Wire in parent: `Sub form_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (83)
- `AddAttribute(k As String, v As String)` _(public)_
- `AddClass(s As String)` _(public)_
- `AddColumns(iColumns As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` As SDUI5Form _(public)_
- `AddColumns1()` _(public)_
- `AddColumns10()` _(public)_
- `AddColumns10p2()` _(public)_
- `AddColumns10x1()` _(public)_
- `AddColumns11()` _(public)_
- `AddColumns11p1()` _(public)_
- `AddColumns11x1()` _(public)_
- `AddColumns12()` _(public)_
- `AddColumns12x1()` _(public)_
- `AddColumns1p11()` _(public)_
- `AddColumns2()` _(public)_
- `AddColumns2p10()` _(public)_
- `AddColumns2x6()` _(public)_
- `AddColumns3()` _(public)_
- `AddColumns3p6p3()` _(public)_
- `AddColumns3p9()` _(public)_
- `AddColumns3x2()` _(public)_
- `AddColumns3x4()` _(public)_
- `AddColumns4()` _(public)_
- `AddColumns4p8()` _(public)_
- `AddColumns4x3()` _(public)_
- `AddColumns5()` _(public)_
- `AddColumns5p7()` _(public)_
- `AddColumns5x2()` _(public)_
- `AddColumns6()` _(public)_
- `AddColumns6p3p3()` _(public)_
- `AddColumns6x2()` _(public)_
- `AddColumns7()` _(public)_
- `AddColumns7p5()` _(public)_
- `AddColumns7x1()` _(public)_
- `AddColumns8()` _(public)_
- `AddColumns8p4()` _(public)_
- `AddColumns8x1()` _(public)_
- `AddColumns9()` _(public)_
- `AddColumns9p3()` _(public)_
- `AddColumns9x1()` _(public)_
- `AddColumnsOS(iColumns As Int, osxs As Int, osm As Int, omd As Int, olg As Int, oxl As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` As SDUI5Form _(public)_
- `AddColumnsOSMP()` _(public)_
- `AddComponent()` _(public)_
- `AddRC(r As Int, c As Int)` _(public)_
- `AddRows(iRows As Int)` As SDUI5Form _(public)_
- `AddRows1()` _(public)_
- `AddRows10()` _(public)_
- `AddRows11()` _(public)_
- `AddRows12()` _(public)_
- `AddRows2()` _(public)_
- `AddRows3()` _(public)_
- `AddRows4()` _(public)_
- `AddRows5()` _(public)_
- `AddRows6()` _(public)_
- `AddRows7()` _(public)_
- `AddRows8()` _(public)_
- `AddRows9()` _(public)_
- `AddStyle(k As String, v As String)` _(public)_
- `BuildGrid()` _(public)_
- `BuildGridFromRC()` _(public)_
- `Cell(r As Int, c As Int)` As SDUI5Form _(public)_
- `CellCenter(r As Int, c As Int)` _(public)_
- `CellHere(r As Int, c As Int)` As String _(public)_
- `CellID(r As Int, c As Int)` As String _(public)_
- `CenterRC(r As Int, c As Int)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `DontSubmitForm()` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsValid()` _(public)_
- `LinkExisting()` _(public)_
- `NextRow()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `PrepareRC()` _(public)_
- `Remove()` _(public)_
- `RemoveClass(s As String)` _(public)_
- `ResetValidation()` _(public)_
- `Row(r As Int)` As SDUI5Form _(public)_
- `RowID(r As Int)` As String _(public)_
- `SubmitForm()` _(public)_
- `ThisRow()` _(public)_
- `Validate(response As Boolean)` _(public)_
- `ValidateAll()` _(public)_
- `ValidateEach()` _(public)_

## Key Setters (27)
- `setAcceptCharset(s As String)` _(public)_
- `setAction(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setAutocomplete(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setEnctype(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMethod(s As String)` _(public)_
- `setName(s As String)` _(public)_
- `setNovalidate(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `SetRCClasses(r As Int, c As Int, classNames As List)` _(public)_
- `SetRCMargin(r As Int, c As Int, gma As String, gmt As String, gmb As String, gml As String, gmr As String, gmx As String, gmy As String)` _(public)_
- `SetRCPadding(r As Int, c As Int, gpa As String, gpt As String, gpb As String, gpl As String, gpr As String, gpx As String, gpy As String)` _(public)_
- `SetRCSizes(r As Int, c As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` _(public)_
- `SetRCStyles(r As Int, c As Int, styleNames As Map)` _(public)_
- `setRel(s As String)` _(public)_
- `SetRowClasses(r As Int, classNames As List)` _(public)_
- `SetRowStyles(r As Int, styleNames As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTarget(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (22)
- `getAcceptCharset()` _(public)_
- `getAction()` _(public)_
- `getAttributes()` _(public)_
- `getAutocomplete()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getEnctype()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMethod()` _(public)_
- `getName()` _(public)_
- `getNovalidate()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRel()` _(public)_
- `getStyles()` _(public)_
- `getTarget()` _(public)_
- `getVisible()` _(public)_

## Private Methods (10)
- `BuildColumnClass(col As GridColumn)` As String _(private)_
- `BuildColumnStyle(col As GridColumn)` As String _(private)_
- `BuildMarginPadding(sprefix As String, gma As String, gmx As String, gmy As String, gmt As String, gmb As String, gml As String, gmr As String)` As String _(private)_
- `BuildOffsets(col As GridColumn)` As String _(private)_
- `BuildRow(xRow As GridRow)` As String _(private)_
- `BuildRowClass(xrow As GridRow)` As String _(private)_
- `BuildRowStyle(col As GridRow)` As String _(private)_
- `BuildSpans(col As GridColumn)` As String _(private)_
- `dontsubmit(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim form As SDUI5Form
form.Initialize(Me, "SDUI5Form", "SDUI5Form")
form.ParentID = "placeholder"
BANano.Await(form.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
