---
name: SDUI5CheckBoxGroup
description: SithasoDaisy5 SDUI5CheckBoxGroup component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5CheckBoxGroup

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5CheckBoxGroup.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5CheckBoxGroup.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgCheckBox.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgCheckBox.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgToggle.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToggle.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5CheckBoxGroup groups checkboxes (legend/normal). Children (checkboxes) mount via ParentID. Use for multi-select option groups.
_SDUI5CheckBoxGroup is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | checkbox | checkbox, toggle | `setTypeOf` | `getTypeOf` |
| `Label` | String | CheckBox Group | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `RawOptions` | String | b4a=b4a; b4j=b4j; b4i=b4i; b4r=b4r | — | `setOptions` | `getOptions` |
| `Selected` | String | — | — | `setSelected` | `getSelected` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `CheckedColor` | String | — | — | `setCheckedColor` | `getCheckedColor` |
| `Size` | String | none | lg, md, none, sm, xl, xs | `setSize` | — |
| `GroupName` | String | — | — | `setGroupName` | `getGroupName` |
| `ColumnView` | Boolean | False | — | `setColumnView` | `getColumnView` |
| `LabelPosition` | String | right | left, right | `setLabelPosition` | `getLabelPosition` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `Hint` | String | — | — | `setHint` | `getHint` |
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
`Change`

Wire in parent: `Sub checkboxgroup_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (14)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `AddOption(k As String, v As String)` _(public)_
- `Clear()` As 'ignoredeadcode _(public)_
- `SetOptionsFromMap(m As Map)` As 'ignoredeadcode _(public)_
- `SetItemsChips(titems As Map)` _(public)_
- `SetOptionsFromList(m As List)` _(public)_
- `HintError(s As String)` As 'ignoredeadcode _(public)_
- `IsBlank()` As Boolean _(public)_
- `ResetValidation()` _(public)_
## Key Setters (30)
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
- `setShadow(s As String)` _(public)_
- `setSelected(s As String)` As 'ignoredeadcode _(public)_
- `setColumnView(b As Boolean)` _(public)_
- `setLabelPosition(s As String)` _(public)_
- `setOptions(s As String)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setCheckedColor(s As String)` _(public)_
- `setColor(s As String)` _(public)_
- `setGroupName(s As String)` _(public)_
- `setHint(s As String)` _(public)_
- `setLabel(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setValue(s As String)` _(public)_
- `setTypeOf(s As String)` _(public)_
## Getters (31)
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
- `getShadow()` As String _(public)_
- `getSelected()` As String _(public)_
- `getColumnView()` As Boolean _(public)_
- `getLabelPosition()` As String _(public)_
- `getHeight()` As String _(public)_
- `getWidth()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getOptions()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getBorder()` As Boolean _(public)_
- `getBorderColor()` As String _(public)_
- `getCheckedColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getGroupName()` As String _(public)_
- `getHint()` As String _(public)_
- `getLabel()` As String _(public)_
- `getValue()` As String _(public)_
- `getTypeOf()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgToggle.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgToggle.bas) (verified demo). `SDUI5CheckBoxGroup1` = a SDUI5CheckBoxGroup.

```b4j
	SDUI5CheckBoxGroup1.Initialize(Me, "SDUI5CheckBoxGroup1", "SDUI5CheckBoxGroup1")
	SDUI5CheckBoxGroup1.ParentID = "SDUI5Column5"
	SDUI5CheckBoxGroup1.BackgroundColor = "base-200"
	SDUI5CheckBoxGroup1.Border = True
	SDUI5CheckBoxGroup1.BorderColor = "base-300"
	SDUI5CheckBoxGroup1.CheckedColor = ""
	SDUI5CheckBoxGroup1.Color = "none"
	SDUI5CheckBoxGroup1.ColumnView = True
	SDUI5CheckBoxGroup1.Enabled = True
	SDUI5CheckBoxGroup1.GroupName = "anelex"
	SDUI5CheckBoxGroup1.Height = ""
	SDUI5CheckBoxGroup1.Hint = ""
	SDUI5CheckBoxGroup1.Label = "Toggle Group"
	SDUI5CheckBoxGroup1.LabelPosition = "left"
	SDUI5CheckBoxGroup1.MarginAXYTBLR = "a=?; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5CheckBoxGroup1.PaddingAXYTBLR = "a=4; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5CheckBoxGroup1.Position = "t=?; b=?; r=?; l=?"
	SDUI5CheckBoxGroup1.PositionStyle = "none"
	SDUI5CheckBoxGroup1.Attributes = ""
	SDUI5CheckBoxGroup1.Classes = ""
	SDUI5CheckBoxGroup1.Options = "b4a:b4a; b4i:b4i; b4j:b4j; b4r:b4r"
	SDUI5CheckBoxGroup1.Styles = ""
	SDUI5CheckBoxGroup1.RoundedBox = True
	SDUI5CheckBoxGroup1.Selected = ""
	SDUI5CheckBoxGroup1.Shadow = "none"
	SDUI5CheckBoxGroup1.Size = "none"
	SDUI5CheckBoxGroup1.TypeOf = "toggle"
	SDUI5CheckBoxGroup1.Visible = True
	SDUI5CheckBoxGroup1.Width = "full"
	BANano.Await(SDUI5CheckBoxGroup1.AddComponent)
```

Demo-wired events: `Change` — handlers named `SDUI5CheckBoxGroup1_<Event>`.

Also used in: `pgCheckBox`, `pgModal`, `pgValidation`
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `fieldset`, `border`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim checkboxgroup As SDUI5CheckBoxGroup
checkboxgroup.Initialize(Me, "SDUI5CheckBoxGroup", "SDUI5CheckBoxGroup")
checkboxgroup.ParentID = "placeholder"
BANano.Await(checkboxgroup.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


