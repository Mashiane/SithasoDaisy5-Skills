---
name: SDUI5GroupSelect
description: SithasoDaisy5 SDUI5GroupSelect component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5GroupSelect

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5GroupSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5GroupSelect.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgGroupSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGroupSelect.bas)
  - [`pgModal.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgModal.bas)
  - [`pgThemeSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgThemeSelect.bas)
  - [`pgValidation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgValidation.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5GroupSelect is a select with grouped options. Use for categorized dropdowns. InputType controls label rendering.
_SDUI5GroupSelect is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Label` | String | Group Select | — | `setLabel` | `getLabel` |
| `LegendColor` | String | — | — | `setLegendColor` | `getLegendColor` |
| `GroupName` | String | group1 | — | `setGroupName` | `getGroupName` |
| `RawOptions` | String | b4a=b4a; b4i=b4i; b4j=b4j; b4r=b4r | — | `setOptions` | `getOptions` |
| `Selected` | String | — | — | `setSelected` | `getSelected` |
| `SingleSelect` | Boolean | False | — | `setSingleSelect` | `getSingleSelect` |
| `ChipColor` | String | neutral | — | `setChipColor` | `getChipColor` |
| `ActiveColor` | String | #22c55e | — | `setActiveColor` | `getActiveColor` |
| `TextColor` | String | #ffffff | — | `setTextColor` | `getTextColor` |
| `ThemeController` | Boolean | False | — | `setThemeController` | `getThemeController` |
| `Size` | String | xs | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `BackgroundColor` | String | base-200 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Border` | Boolean | True | — | `setBorder` | `getBorder` |
| `BorderColor` | String | base-300 | — | `setBorderColor` | `getBorderColor` |
| `Height` | String | — | — | `setHeight` | `getHeight` |
| `Width` | String | full | — | `setWidth` | `getWidth` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
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

Wire in parent: `Sub groupselect_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (8)
- `AddComponent()` _(public)_
- `AddOption(k As String, v As String)` _(public)_
- `Clear()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `IsBlank()` _(public)_
- `Remove()` _(public)_
- `ResetValidation()` _(public)_

## Key Setters (38)
- `setActiveColor(s As String)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBorder(b As Boolean)` _(public)_
- `setBorderColor(s As String)` _(public)_
- `setChipColor(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `SetCountries()` _(public)_
- `SetDays()` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setGroupName(s As String)` _(public)_
- `setHeight(s As String)` _(public)_
- `SetItemsChips(titems As Map)` _(public)_
- `setLabel(s As String)` _(public)_
- `SetLanguages()` _(public)_
- `setLegendColor(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `SetMonths()` _(public)_
- `setOptions(s As String)` _(public)_
- `SetOptionsFromMap(mItems As Map)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setSelected(s As String)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSingleSelect(b As Boolean)` _(public)_
- `setSize(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setThemeController(b As Boolean)` _(public)_
- `SetThemes()` _(public)_
- `setValue(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setWidth(s As String)` _(public)_
- `SetYears(yearsIntoPast As Int, yearsIntoFuture As Int)` _(public)_

## Getters (32)
- `getActiveColor()` _(public)_
- `getAttributes()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBorder()` _(public)_
- `getBorderColor()` _(public)_
- `getChipColor()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getGroupName()` _(public)_
- `getHeight()` _(public)_
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
- `getRoundedBox()` _(public)_
- `getSelected()` _(public)_
- `getShadow()` _(public)_
- `getSingleSelect()` _(public)_
- `getSize()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getThemeController()` _(public)_
- `getValue()` _(public)_
- `getVisible()` _(public)_
- `getWidth()` _(public)_

## Private Methods (5)
- `BuildIconColor(nc As String)` As String _(private)_
- `changed(e As BANanoEvent)` _(private)_
- `IconClick(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_
- `UpdateChanges(fireEvent As Boolean)` _(private)_

## Verified Demo Usage

Real syntax from [`pgGroupSelect.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgGroupSelect.bas) (verified demo):

```b4j
Private SDUI5GroupSelect1 As SDUI5GroupSelect		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `fieldset`, `border`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim groupselect As SDUI5GroupSelect
groupselect.Initialize(Me, "SDUI5GroupSelect", "SDUI5GroupSelect")
groupselect.ParentID = "placeholder"
BANano.Await(groupselect.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
