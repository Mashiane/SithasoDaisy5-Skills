---
name: SDUI5AdvancedCheckGroup
description: SithasoDaisy5 SDUI5AdvancedCheckGroup component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5AdvancedCheckGroup

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5AdvancedCheckGroup.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5AdvancedCheckGroup.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAdvancedCheckGroup.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAdvancedCheckGroup.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5AdvancedCheckGroup is a group of checkboxes with advanced options (select-all, indeterminate, validation). Children mount via ParentID.
_SDUI5AdvancedCheckGroup is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | checkbox | radio, checkbox, toggle | `setTypeOf` | `getTypeOf` |
| `LegendLabel` | String | Checkbox Group | — | `setLegendLabel` | `getLegendLabel` |
| `Color` | String | — | — | `setColor` | `getColor` |
| `Columns` | String | 3 | — | `setColumns` | `getColumns` |
| `RawOptions` | String | b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r | — | `setOptions` | `getRawOptions` |
| `Selected` | String | — | — | `setSelected` | `getSelected` |
| `ActiveBorderColor` | String | — | — | `setActiveBorderColor` | `getActiveBorderColor` |
| `ActiveColor` | String | — | — | `setActiveColor` | `getActiveColor` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | False | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | — | — | `setWidth` | `getWidth` |
| `Rounded` | String | lg | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | — | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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

Wire in parent: `Sub advancedcheckgroup_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (14)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `clear()` _(public)_
- `toggleCheckBox(key As String)` _(public)_
- `toggleState(key As String, state As Boolean)` _(public)_
- `clearChecked()` _(public)_
- `SetOptionsMap(lst As Map)` _(public)_
- `areKeysChecked(k As List)` As Boolean _(public)_
- `addOption(k As String, v As String)` _(public)_
## Key Setters (28)
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
- `setActiveBorderColor(s As String)` _(public)_
- `setActiveColor(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setColumns(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `setLegendLabel(s As String)` _(public)_
- `setOptions(s As String)` As 'ignoredeadcode _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setChecked(lst As List)` _(public)_
- `setCheckedMV(s As String)` As 'ignoredeadcode _(public)_
- `setSelected(s As String)` As 'ignoredeadcode _(public)_
## Getters (30)
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
- `getActiveBorderColor()` As String _(public)_
- `getActiveColor()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getColumns()` As String _(public)_
- `getHeight()` As String _(public)_
- `getLegendLabel()` As String _(public)_
- `getRawOptions()` As String _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getWidth()` As String _(public)_
- `getChecked()` As List _(public)_
- `getSelected()` As String _(public)_
- `getCheckedMV()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgAdvancedCheckGroup.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAdvancedCheckGroup.bas) (verified demo). `grp2` = a SDUI5AdvancedCheckGroup.

```b4j
	grp2.Initialize(Me, "grp2", "grp2")
	grp2.ParentID = "SDUI5Column2"
	grp2.Border = True
	grp2.LegendLabel = "Locations Radio"
	grp2.Options = ""
	grp2.Shadow = "lg"
	grp2.TypeOf = "radio"
	BANano.Await(grp2.AddComponent)
```

Builder methods, real call order (from `pgAdvancedCheckGroup.bas`):

```b4j
	grp1.SetOptionsMap(nm)
```

Demo-wired events: `Change` — handlers named `grp2_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim advancedcheckgroup As SDUI5AdvancedCheckGroup
advancedcheckgroup.Initialize(Me, "SDUI5AdvancedCheckGroup", "SDUI5AdvancedCheckGroup")
advancedcheckgroup.ParentID = "placeholder"
BANano.Await(advancedcheckgroup.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


