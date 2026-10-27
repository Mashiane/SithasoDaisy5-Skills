---
name: SDUI5Filter
description: SithasoDaisy5 SDUI5Filter component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Filter

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Filter.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Filter.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFilter.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFilter.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Filter is a filter bar with toggle buttons. Use for filtering lists/tables.
_SDUI5Filter is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | default | legend, default | `setTypeOf` | `getTypeOf` |
| `Label` | String | CheckBox Group | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `RawOptions` | String | b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r | — | `setOptions` | `getOptions` |
| `Value` | String | — | — | `setValue` | `getValue` |
| `Color` | String | primary | — | `setColor` | `getColor` |
| `ActiveColor` | String | #00ff00 | — | `setActiveColor` | `getActiveColor` |
| `Shape` | String | full | square, circle, none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setShape` | `getShape` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Required` | Boolean | False | — | `setRequired` | `getRequired` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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
`Change`

Wire in parent: `Sub filter_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddComponent()` _(public)_
- `AddOption(sKey As String, xValue As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (27)
- `setActiveColor(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setLabel(s As String)` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOptions(s As String)` _(public)_
- `SetOptionsFromMap(m As Map)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRequired(b As Boolean)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setShape(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (28)
- `getActiveColor()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getClasses()` _(public)_
- `getColor()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getLabel()` _(public)_
- `getLegendColor()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOptions()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRequired()` _(public)_
- `getRoundedBox()` _(public)_
- `getShadow()` _(public)_
- `getShape()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getTypeOf()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_

## Private Methods (2)
- `changed(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgFilter.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFilter.bas) (verified demo):

```b4j
Private SDUI5Filter1 As SDUI5Filter		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `w-full`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim filter As SDUI5Filter
filter.Initialize(Me, "SDUI5Filter", "SDUI5Filter")
filter.ParentID = "placeholder"
BANano.Await(filter.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
