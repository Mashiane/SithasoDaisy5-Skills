---
name: SDUI5LottiePlayer
description: SithasoDaisy5 SDUI5LottiePlayer component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5LottiePlayer

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5LottiePlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5LottiePlayer.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgLottiePlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLottiePlayer.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5LottiePlayer plays Lottie animations. Use for animated icons/illustrations.
_SDUI5LottiePlayer is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Src` | String | — | — | `setSrc` | `getSrc` |
| `AutoPlay` | Boolean | True | — | `setAutoPlay` | `getAutoPlay` |
| `Background` | String | — | — | `setBackground` | `getBackground` |
| `Controls` | Boolean | False | — | `setControls` | `getControls` |
| `Height` | String | 300px | — | `setHeight` | `getHeight` |
| `Width` | String | 300px | — | `setWidth` | `getWidth` |
| `Hover` | Boolean | False | — | `setHover` | `getHover` |
| `Intermission` | String | — | — | `setIntermission` | `getIntermission` |
| `Mode` | String | normal | bounce, normal, bounce-reverse, reverse | `setMode` | `getMode` |
| `ShouldLoop` | Boolean | False | — | `setShouldLoop` | `getShouldLoop` |
| `Speed` | String | 1 | — | `setSpeed` | `getSpeed` |
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

Wire in parent: `Sub lottieplayer_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (21)
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
- `setAutoPlay(b As Boolean)` _(public)_
- `setBackground(s As String)` _(public)_
- `setControls(b As Boolean)` _(public)_
- `setHeight(s As String)` _(public)_
- `setHover(b As Boolean)` _(public)_
- `setIntermission(s As String)` _(public)_
- `setMode(s As String)` _(public)_
- `setShouldLoop(b As Boolean)` _(public)_
- `setSpeed(s As String)` _(public)_
- `setSrc(s As String)` _(public)_
- `setWidth(s As String)` _(public)_
## Getters (23)
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
- `getAutoPlay()` As Boolean _(public)_
- `getBackground()` As String _(public)_
- `getControls()` As Boolean _(public)_
- `getHeight()` As String _(public)_
- `getHover()` As Boolean _(public)_
- `getIntermission()` As String _(public)_
- `getMode()` As String _(public)_
- `getShouldLoop()` As Boolean _(public)_
- `getSpeed()` As String _(public)_
- `getSrc()` As String _(public)_
- `getWidth()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgLottiePlayer.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgLottiePlayer.bas) (verified demo). `SDUI5LottiePlayer4` = a SDUI5LottiePlayer.

```b4j
	SDUI5LottiePlayer4.Initialize(Me, "SDUI5LottiePlayer4", "SDUI5LottiePlayer4")
	SDUI5LottiePlayer4.ParentID = "SDUI5Column4"
	SDUI5LottiePlayer4.AutoPlay = False
	SDUI5LottiePlayer4.Height = "400px"
	SDUI5LottiePlayer4.Hover = True
	SDUI5LottiePlayer4.Intermission = "1000"
	SDUI5LottiePlayer4.ShouldLoop = True
	SDUI5LottiePlayer4.Src = "https://assets4.lottiefiles.com/datafiles/zc3XRzudyWE36ZBJr7PIkkqq0PFIrIBgp4ojqShI/newAnimation.json"
	SDUI5LottiePlayer4.Width = "400px"
	BANano.Await(SDUI5LottiePlayer4.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim lottieplayer As SDUI5LottiePlayer
lottieplayer.Initialize(Me, "SDUI5LottiePlayer", "SDUI5LottiePlayer")
lottieplayer.ParentID = "placeholder"
BANano.Await(lottieplayer.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


