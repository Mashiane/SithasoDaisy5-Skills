---
name: SDUI5Swap
description: SithasoDaisy5 SDUI5Swap component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Swap

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Swap.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Swap.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgSwap.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwap.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Swap toggles between two children (on/off). Children mount via ParentID. Use for theme toggles.
_SDUI5Swap is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `SwapType` | String | text | icon, text, svg | `setSwapType` | `getSwapType` |
| `TypeOf` | String | flip | flip, rotate | `setTypeOf` | `getTypeOf` |
| `OnIcon` | String | — | — | `setOnIcon` | `getOnIcon` |
| `OffIcon` | String | — | — | `setOffIcon` | `getOffIcon` |
| `IndeterminateIcon` | String | — | — | `setIndeterminateIcon` | `getIndeterminateIcon` |
| `Height` | String | 32px | — | `setHeight` | `getHeight` |
| `Width` | String | 32px | — | `setWidth` | `getWidth` |
| `OnText` | String | ON | — | `setOnText` | `getOnText` |
| `OnTextColor` | String | — | — | `setOnTextColor` | `getOnTextColor` |
| `OffText` | String | OFF | — | `setOffText` | `getOffText` |
| `OffTextColor` | String | — | — | `setOffTextColor` | `getOffTextColor` |
| `IndeterminateText` | String | NA | — | `setIndeterminateText` | `getIndeterminateText` |
| `IndeterminateTextColor` | String | — | — | `setIndeterminateTextColor` | `getIndeterminateTextColor` |
| `TextSize` | String | 9xl | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `Active` | Boolean | False | — | `setActive` | `getActive` |
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

Wire in parent: `Sub swap_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (25)
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
- `setActive(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHeight(s As String)` As 'ignoredeadcode _(public)_
- `setIndeterminateIcon(s As String)` _(public)_
- `setIndeterminateText(s As String)` _(public)_
- `setIndeterminateTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setOffIcon(s As String)` _(public)_
- `setOffText(s As String)` _(public)_
- `setOffTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setOnIcon(s As String)` _(public)_
- `setOnText(s As String)` _(public)_
- `setOnTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setSwapType(s As String)` _(public)_
- `setTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setTypeOf(s As String)` _(public)_
- `setWidth(s As String)` As 'ignoredeadcode _(public)_
## Getters (26)
- `getID()` As String _(public)_
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
- `getActive()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getIndeterminateIcon()` As String _(public)_
- `getIndeterminateText()` As String _(public)_
- `getIndeterminateTextColor()` As String _(public)_
- `getOffIcon()` As String _(public)_
- `getOffText()` As String _(public)_
- `getOffTextColor()` As String _(public)_
- `getOnIcon()` As String _(public)_
- `getOnText()` As String _(public)_
- `getOnTextColor()` As String _(public)_
- `getSwapType()` As String _(public)_
- `getTextSize()` As String _(public)_
- `getTypeOf()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgSwap.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgSwap.bas) (verified demo). `SDUI5Swap2` = a SDUI5Swap.

```b4j
	SDUI5Swap2.Initialize(Me, "SDUI5Swap2", "SDUI5Swap2")
	SDUI5Swap2.ParentID = "SDUI5Row1"
	SDUI5Swap2.Active = True
	SDUI5Swap2.Height = "80px"
	SDUI5Swap2.IndeterminateText = ""
	SDUI5Swap2.MarginAXYTBLR = "a=10px; x=?; y=?; t=?; b=?; l=?; r=?"
	SDUI5Swap2.OffIcon = "./assets/yyoff.svg"
	SDUI5Swap2.OffText = ""
	SDUI5Swap2.OffTextColor = "#FF0000"
	SDUI5Swap2.OnIcon = "./assets/yyon.svg"
	SDUI5Swap2.OnText = ""
	SDUI5Swap2.OnTextColor = "#00FF00"
	SDUI5Swap2.SwapType = "icon"
	SDUI5Swap2.TypeOf = "rotate"
	SDUI5Swap2.Width = "80px"
	BANano.Await(SDUI5Swap2.AddComponent)
```

Demo-wired events: `Change` — handlers named `SDUI5Swap2_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim swap As SDUI5Swap
swap.Initialize(Me, "SDUI5Swap", "SDUI5Swap")
swap.ParentID = "placeholder"
BANano.Await(swap.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


