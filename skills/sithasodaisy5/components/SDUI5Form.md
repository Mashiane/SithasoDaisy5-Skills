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
## Public Methods (92)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `AddRC(r As Int, c As Int)` _(public)_
- `CenterRC(r As Int, c As Int)` _(public)_
- `PrepareRC()` _(public)_
- `SetRowStyles(r As Int, styleNames As Map)` _(public)_
- `SetRowClasses(r As Int, classNames As List)` _(public)_
- `SetRCClasses(r As Int, c As Int, classNames As List)` _(public)_
- `SetRCStyles(r As Int, c As Int, styleNames As Map)` _(public)_
- `SetRCSizes(r As Int, c As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` _(public)_
- `SetRCMargin(r As Int, c As Int, gma As String, gmt As String, gmb As String, gml As String, gmr As String, gmx As String, gmy As String)` _(public)_
- `SetRCPadding(r As Int, c As Int, gpa As String, gpt As String, gpb As String, gpl As String, gpr As String, gpx As String, gpy As String)` _(public)_
- `BuildGridFromRC()` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `RowID(r As Int)` As String _(public)_
- `CellID(r As Int, c As Int)` As String _(public)_
- `CellHere(r As Int, c As Int)` As String _(public)_
- `CellCenter(r As Int, c As Int)` _(public)_
- `LinkExisting()` As 'ignoredeadcode _(public)_
- `Cell(r As Int, c As Int)` As SDUI5Form _(public)_
- `AddRows1()` As SDUI5Form _(public)_
- `AddRows2()` As SDUI5Form _(public)_
- `AddRows3()` As SDUI5Form _(public)_
- `AddRows4()` As SDUI5Form _(public)_
- `AddRows5()` As SDUI5Form _(public)_
- `AddRows6()` As SDUI5Form _(public)_
- `AddRows7()` As SDUI5Form _(public)_
- `AddRows8()` As SDUI5Form _(public)_
- `AddRows9()` As SDUI5Form _(public)_
- `AddRows10()` As SDUI5Form _(public)_
- `AddRows11()` As SDUI5Form _(public)_
- `AddRows12()` As SDUI5Form _(public)_
- `AddRows(iRows As Int)` As SDUI5Form _(public)_
- `AddColumns(iColumns As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` As SDUI5Form _(public)_
- `AddColumnsOS(iColumns As Int, osxs As Int, osm As Int, omd As Int, olg As Int, oxl As Int, gxs As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int)` As SDUI5Form _(public)_
- `AddColumnsOSMP(iColumns As Int, osm As Int, omd As Int, olg As Int, oxl As Int, gsm As Int, gmd As Int, glg As Int, gxl As Int, gpa As Int, gpx As Int, gpy As Int, gpt As Int, gpb As Int, gpl As Int, gpr As Int, _ gma As Int, gmx As Int, gmy As Int, gmt As Int, gmb As Int, gml As Int, gmr As Int)` As SDUI5Form _(public)_
- `AddColumns3x4()` As SDUI5Form _(public)_
- `AddColumns4x3()` As SDUI5Form _(public)_
- `AddColumns2x6()` As SDUI5Form _(public)_
- `AddColumns6x2()` As SDUI5Form _(public)_
- `AddColumns5x2()` As SDUI5Form _(public)_
- `AddColumns3x2()` As SDUI5Form _(public)_
- `AddColumns11x1()` As SDUI5Form _(public)_
- `AddColumns10x1()` As SDUI5Form _(public)_
- `AddColumns9x1()` As SDUI5Form _(public)_
- `AddColumns8x1()` As SDUI5Form _(public)_
- `AddColumns7x1()` As SDUI5Form _(public)_
- `AddColumns12x1()` As SDUI5Form _(public)_
- `AddColumns8p4()` As SDUI5Form _(public)_
- `AddColumns4p8()` As SDUI5Form _(public)_
- `AddColumns1p11()` As SDUI5Form _(public)_
- `AddColumns11p1()` As SDUI5Form _(public)_
- `AddColumns2p10()` As SDUI5Form _(public)_
- `AddColumns10p2()` As SDUI5Form _(public)_
- `AddColumns3p9()` As SDUI5Form _(public)_
- `AddColumns9p3()` As SDUI5Form _(public)_
- `AddColumns3p6p3()` As SDUI5Form _(public)_
- `AddColumns6p3p3()` As SDUI5Form _(public)_
- `AddColumns7p5()` As SDUI5Form _(public)_
- `AddColumns5p7()` As SDUI5Form _(public)_
- `AddColumns12()` As SDUI5Form _(public)_
- `AddColumns6()` As SDUI5Form _(public)_
- `AddColumns2()` As SDUI5Form _(public)_
- `AddColumns1()` As SDUI5Form _(public)_
- `AddColumns3()` As SDUI5Form _(public)_
- `AddColumns4()` As SDUI5Form _(public)_
- `AddColumns5()` As SDUI5Form _(public)_
- `AddColumns7()` As SDUI5Form _(public)_
- `AddColumns8()` As SDUI5Form _(public)_
- `AddColumns9()` As SDUI5Form _(public)_
- `AddColumns10()` As SDUI5Form _(public)_
- `AddColumns11()` As SDUI5Form _(public)_
- `SubmitForm()` _(public)_
- `DontSubmitForm()` _(public)_
- `ResetValidation()` _(public)_
- `ValidateEach()` _(public)_
- `ValidateAll()` _(public)_
- `Validate(response As Boolean)` _(public)_
- `IsValid()` As Boolean _(public)_
- `BuildGrid()` _(public)_
- `NextRow()` As Int _(public)_
- `ThisRow()` As Int _(public)_
- `Row(r As Int)` As SDUI5Form _(public)_
- `RemoveClass(s As String)` _(public)_
- `AddClass(s As String)` _(public)_
- `AddStyle(k As String, v As String)` _(public)_
- `AddAttribute(k As String, v As String)` _(public)_
## Key Setters (19)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setAcceptCharset(s As String)` _(public)_
- `setAction(s As String)` _(public)_
- `setAutocomplete(s As String)` _(public)_
- `setEnctype(s As String)` _(public)_
- `setMethod(s As String)` _(public)_
- `setName(s As String)` _(public)_
- `setNovalidate(b As Boolean)` _(public)_
- `setRel(s As String)` _(public)_
- `setTarget(s As String)` _(public)_
## Getters (21)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getEnabled()` As Boolean _(public)_
- `getPositionStyle()` As String _(public)_
- `getPosition()` As String _(public)_
- `getAttributes()` As String _(public)_
- `getStyles()` As String _(public)_
- `getClasses()` As String _(public)_
- `getPaddingAXYTBLR()` As String _(public)_
- `getMarginAXYTBLR()` As String _(public)_
- `getAcceptCharset()` As String _(public)_
- `getAction()` As String _(public)_
- `getAutocomplete()` As String _(public)_
- `getEnctype()` As String _(public)_
- `getMethod()` As String _(public)_
- `getName()` As String _(public)_
- `getNovalidate()` As Boolean _(public)_
- `getRel()` As String _(public)_
- `getTarget()` As String _(public)_
## Private Methods (2)
- `BuildRow(xRow As GridRow)` As String _(private)_
- `BuildRowClass(xrow As GridRow)` As String _(private)_
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


