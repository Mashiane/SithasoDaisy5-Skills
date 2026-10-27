---
name: SDUI5Accordion
description: SithasoDaisy5 SDUI5Accordion component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Accordion

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Accordion.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Accordion.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAccordion.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAccordion.bas)
  - [`pgJSONQuery.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgJSONQuery.bas)
  - [`pgToastCharts.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToastCharts.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Accordion is an accordion group of collapsible items. Children (collapse items) mount via `ParentID = accordionName`. Use for FAQ/expandable sections.
_SDUI5Accordion is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `RawOptions` | String | btn1=Button 1; btn2=Button 2; btn3=Button 3 | — | `setOptions` | `getOptions` |
| `Active` | String | btn1 | — | `setActive` | `getActive` |
| `ClearContents` | Boolean | False | — | `setClearContents` | `getClearContents` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
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

Wire in parent: `Sub accordion_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddComponent()` _(public)_
- `AddOption(sKey As String, sText As String)` _(public)_
- `Clear()` _(public)_
- `CollapseItem(skey As String)` As SDUI5Collapse _(public)_
- `ContentAt(key As String)` As String _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (20)
- `setActive(item As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setClearContents(b As Boolean)` _(public)_
- `SetCollapseItemIcon(btnID As String, text As String)` _(public)_
- `SetCollapseItemText(btnID As String, text As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setOptions(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRounded(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_

## Getters (20)
- `getActive()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getClasses()` _(public)_
- `getClearContents()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getOptions()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRounded()` _(public)_
- `getShadow()` _(public)_
- `getStyles()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgAccordion.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAccordion.bas) (verified demo):

```b4j
Private acc1 As SDUI5Accordion		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `join join-vertical`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim accordion As SDUI5Accordion
accordion.Initialize(Me, "SDUI5Accordion", "SDUI5Accordion")
accordion.ParentID = "placeholder"
BANano.Await(accordion.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
