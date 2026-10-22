---
name: SDUI5FieldSet
description: SithasoDaisy5 SDUI5FieldSet component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5FieldSet

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5FieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5FieldSet.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFieldSet.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5FieldSet is a fieldset with legend for grouping form fields. Children mount via ParentID. Use for grouping related inputs.
_SDUI5FieldSet is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _legend, _content, _label | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `Legend` | String | Legend | — | `setLegend` | `getLegend` |
| `LegendVisible` | Boolean | True | — | `setLegendVisible` | `getLegendVisible` |
| `Label` | String | Label | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `LabelVisible` | Boolean | True | — | `setLabelVisible` | `getLabelVisible` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Width` | String | xs | — | `setWidth` | `getWidth` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |
| `Enabled` | Boolean | True | — | `setEnabled` | `getEnabled` |
| `PositionStyle` | String | none | absolute, fixed, none, relative, static, sticky | `setPositionStyle` | `getPositionStyle` |
| `Position` | String | t=?; b=?; r=?; l=? | — | `setPosition` | `getPosition` |
| `MarginAXYTBLR` | String | a=?; x=?; y=?; t=?; b=?; l=?; r=? | — | `setMarginAXYTBLR` | `getMarginAXYTBLR` |
| `PaddingAXYTBLR` | String | a=4; x=?; y=?; t=?; b=?; l=?; r=? | — | `setPaddingAXYTBLR` | `getPaddingAXYTBLR` |
| `RawClasses` | String | — | — | `setClasses` | `getClasses` |
| `RawStyles` | String | — | — | `setStyles` | `getStyles` |
| `RawAttributes` | String | — | — | `setAttributes` | `getAttributes` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
Where a designer key and method name differ, the method names shown are the source-verified mapping.
## Events
_(none declared)_

Wire in parent: `Sub fieldset_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (23)
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
- `setLegendColor(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLabelVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLegend(s As String)` _(public)_
- `setLegendVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (25)
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
- `getLegendColor()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getHeight()` As String _(public)_
- `getLabel()` As String _(public)_
- `getLabelVisible()` As Boolean _(public)_
- `getLegend()` As String _(public)_
- `getLegendVisible()` As Boolean _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgFieldSet.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFieldSet.bas) (verified demo). `loginfs` = a SDUI5FieldSet.

```b4j
	loginfs.Initialize(Me, "loginfs", "loginfs")
	loginfs.ParentID = "login_content"
	loginfs.BackgroundColor = ""
	loginfs.Border = False
	loginfs.BorderColor = ""
	loginfs.Label = ""
	loginfs.LabelVisible = False
	loginfs.Legend = ""
	loginfs.LegendVisible = False
	loginfs.PaddingAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	loginfs.RoundedBox = False
	loginfs.Width = ""
	BANano.Await(loginfs.AddComponent)
```

Composite structure — children mount into sub-regions: a `txtEmail` inside `loginfs_content`:

```b4j
	txtEmail.Initialize(Me, "txtEmail", "txtEmail")
	txtEmail.ParentID = "loginfs_content"
	txtEmail.InputType = "label-input"
	txtEmail.Label = "Email"
	txtEmail.Placeholder = "Email"
	txtEmail.TypeOf = "email"
	txtEmail.DPAltFormat = "F j"
	BANano.Await(txtEmail.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `fieldset`, `border`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim fieldset As SDUI5FieldSet
fieldset.Initialize(Me, "SDUI5FieldSet", "SDUI5FieldSet")
fieldset.ParentID = "placeholder"
BANano.Await(fieldset.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


