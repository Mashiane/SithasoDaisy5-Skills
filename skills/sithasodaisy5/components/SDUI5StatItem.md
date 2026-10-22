---
name: SDUI5StatItem
description: SithasoDaisy5 SDUI5StatItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5StatItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5StatItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5StatItem.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgStat.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgStat.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5StatItem is a single stat block. Mount into the stat container via `ParentID = statName`. Holds value/title/desc/figure.
_SDUI5StatItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _figure, _actions | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `FigureType` | String | none | avatar, icon, image, none, radial-progress | `setFigureType` | `getFigureType` |
| `AvatarShape` | String | circle | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl | `setAvatarShape` | `getAvatarShape` |
| `PlaceItemsCenter` | Boolean | False | — | `setPlaceItemsCenter` | `getPlaceItemsCenter` |
| `Title` | String | Total Page Views | — | `setTitle` | `getTitle` |
| `TitleTextColor` | String | — | — | `setTitleTextColor` | `getTitleTextColor` |
| `Value` | String | 89 400 | — | `setValue` | `getValue` |
| `ValueTextColor` | String | — | — | `setValueTextColor` | — |
| `Desc` | String | 21% more than last month | — | `setDesc` | `getDesc` |
| `DescTextColor` | String | — | — | `setDescTextColor` | `getDescTextColor` |
| `FigureColor` | String | — | — | `setFigureColor` | `getFigureColor` |
| `Icon` | String | — | — | `setIcon` | `getIcon` |
| `IconHeight` | String | 32px | — | `setIconHeight` | `getIconHeight` |
| `IconWidth` | String | 32px | — | `setIconWidth` | `getIconWidth` |
| `RadialValue` | String | 60 | — | `setRadialValue` | `getRadialValue` |
| `RadialSize` | String | 3rem | — | `setRadialSize` | `getRadialSize` |
| `RadialThickness` | String | 5px | — | `setRadialThickness` | `getRadialThickness` |
| `Shadow` | String | none | 2xl, inner, lg, md, none, shadow, sm, xl | `setShadow` | `getShadow` |
| `ActionsVisible` | Boolean | False | — | `setActionsVisible` | `getActionsVisible` |
| `Rounded` | String | none | 0, 2xl, 3xl, full, lg, md, none, rounded, sm, xl | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | False | — | `setRoundedBox` | `getRoundedBox` |
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
_(none declared)_

Wire in parent: `Sub statitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
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
- `setRadialSize(s As String)` As 'ignoredeadcode _(public)_
- `setRadialThickness(s As String)` As 'ignoredeadcode _(public)_
- `setRadialValue(s As String)` _(public)_
- `setAvatarShape(s As String)` As 'ignoredeadcode _(public)_
- `setFigureType(s As String)` _(public)_
- `setFigureColor(s As String)` As 'ignoredeadcode _(public)_
- `setValue(text As String)` As 'ignoredeadcode _(public)_
- `setValueTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setActionsVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setDesc(s As String)` As 'ignoredeadcode _(public)_
- `setDescTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconHeight(s As String)` As 'ignoredeadcode _(public)_
- `setIconWidth(s As String)` As 'ignoredeadcode _(public)_
- `setPlaceItemsCenter(b As Boolean)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setTitle(s As String)` As 'ignoredeadcode _(public)_
- `setTitleTextColor(s As String)` As 'ignoredeadcode _(public)_
## Getters (32)
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
- `getRadialSize()` As String _(public)_
- `getRadialThickness()` As String _(public)_
- `getRadialValue()` As String _(public)_
- `getAvatarShape()` As String _(public)_
- `getFigureType()` As String _(public)_
- `getFigureColor()` As String _(public)_
- `getValue()` As String _(public)_
- `getActionsVisible()` As Boolean _(public)_
- `getDesc()` As String _(public)_
- `getDescTextColor()` As String _(public)_
- `getIcon()` As String _(public)_
- `getIconHeight()` As String _(public)_
- `getIconVisible()` As Boolean _(public)_
- `getIconWidth()` As String _(public)_
- `getPlaceItemsCenter()` As Boolean _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getTitle()` As String _(public)_
- `getTitleTextColor()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgStat.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgStat.bas) (verified demo). `SDUI5StatItem3` = a SDUI5StatItem.

```b4j
	SDUI5StatItem3.Initialize(Me, "SDUI5StatItem3", "SDUI5StatItem3")
	SDUI5StatItem3.ParentID = "SDUI5Stat1"
	SDUI5StatItem3.AvatarShape = "squircle"
	SDUI5StatItem3.Desc = "Savings Account"
	SDUI5StatItem3.FigureColor = "#ffa500"
	SDUI5StatItem3.FigureType = "icon"
	SDUI5StatItem3.Icon = "./assets/wallet.svg"
	SDUI5StatItem3.IconHeight = "60px"
	SDUI5StatItem3.IconWidth = "60px"
	SDUI5StatItem3.Title = "Wallet"
	SDUI5StatItem3.Value = "$1,000"
	BANano.Await(SDUI5StatItem3.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `stat`, `place-items-center`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim statitem As SDUI5StatItem
statitem.Initialize(Me, "SDUI5StatItem", "SDUI5StatItem")
statitem.ParentID = "placeholder"
BANano.Await(statitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


