---
name: SDUI5SpeedDial
description: SithasoDaisy5 SDUI5SpeedDial component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5SpeedDial

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5SpeedDial.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5SpeedDial.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgFAB.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFAB.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5SpeedDial is a speed-dial FAB with multiple actions. Children (actions) mount via ParentID. Use for quick multi-action buttons.
_SDUI5SpeedDial is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `TypeOf` | String | icon | icon, text | `setTypeOf` | `getTypeOf` |
| `MainButtonType` | String | none | none, close, main | `setMainButtonType` | `getMainButtonType` |
| `Color` | String | — | — | `setColor` | `getColor` |
| `TextColor` | String | #ffffff | — | `setTextColor` | `getTextColor` |
| `Size` | String | lg | lg, md, none, sm, xl, xs | `setSize` | `getSize` |
| `Flower` | Boolean | False | — | `setFlower` | `getFlower` |
| `Icon` | String | ./assets/plus-solid.svg | — | `setIcon` | `getIcon` |
| `IconSize` | String | 60% | — | `setIconSize` | `getIconSize` |
| `Text` | String | — | — | `setText` | `getText` |
| `MainButtonIcon` | String | — | — | `setMainButtonIcon` | `getMainButtonIcon` |
| `MainButtonColor` | String | — | — | `setMainButtonColor` | `getMainButtonColor` |
| `MainButtonText` | String | — | — | `setMainButtonText` | `getMainButtonText` |
| `MainButtonTextColor` | String | #ffffff | — | `setMainButtonTextColor` | `getMainButtonTextColor` |
| `ChildSize` | String | md | lg, md, none, sm, xl, xs | `setChildSize` | `getChildSize` |
| `RawChildKeys` | String | — | — | `setChildKeys` | `getChildKeys` |
| `RawChildColors` | String | — | — | `setChildColors` | `getChildColors` |
| `RawChildIcons` | String | — | — | `setChildIcons` | `getChildIcons` |
| `RawChildText` | String | — | — | `setChildText` | `getChildText` |
| `RawChildTextColor` | String | — | — | `setChildTextColor` | `getChildTextColor` |
| `CenterChildren` | Boolean | False | — | `setCenterChildren` | `getCenterChildren` |
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

Wire in parent: `Sub speeddial_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
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
- `setCenterChildren(b As Boolean)` As 'ignoredeadcode _(public)_
- `setMainButtonType(s As String)` As 'ignoredeadcode _(public)_
- `setText(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setChildSize(s As String)` _(public)_
- `setFlower(b As Boolean)` _(public)_
- `setIcon(s As String)` As 'ignoredeadcode _(public)_
- `setIconSize(s As String)` As 'ignoredeadcode _(public)_
- `setMainButtonColor(s As String)` As 'ignoredeadcode _(public)_
- `setMainButtonIcon(s As String)` As 'ignoredeadcode _(public)_
- `setMainButtonText(s As String)` As 'ignoredeadcode _(public)_
- `setMainButtonTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setChildColors(s As String)` As 'ignoredeadcode _(public)_
- `setChildIcons(s As String)` As 'ignoredeadcode _(public)_
- `setChildKeys(s As String)` As 'ignoredeadcode _(public)_
- `setChildText(s As String)` As 'ignoredeadcode _(public)_
- `setChildTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setTypeOf(s As String)` _(public)_
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
- `getCenterChildren()` As Boolean _(public)_
- `getMainButtonType()` As String _(public)_
- `getText()` As String _(public)_
- `getChildSize()` As String _(public)_
- `getColor()` As String _(public)_
- `getFlower()` As Boolean _(public)_
- `getIcon()` As String _(public)_
- `getIconSize()` As String _(public)_
- `getMainButtonColor()` As String _(public)_
- `getMainButtonIcon()` As String _(public)_
- `getMainButtonText()` As String _(public)_
- `getMainButtonTextColor()` As String _(public)_
- `getChildColors()` As String _(public)_
- `getChildIcons()` As String _(public)_
- `getChildKeys()` As String _(public)_
- `getChildText()` As String _(public)_
- `getChildTextColor()` As String _(public)_
- `getSize()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getTypeOf()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgFAB.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgFAB.bas) (verified demo). `SDUI5SpeedDial1` = a SDUI5SpeedDial.

```b4j
	SDUI5SpeedDial1.Initialize(Me, "SDUI5SpeedDial1", "SDUI5SpeedDial1")
	SDUI5SpeedDial1.ParentID = "fabpage"
	SDUI5SpeedDial1.ChildSize = "lg"
	SDUI5SpeedDial1.Color = "#6c3a7d"
	SDUI5SpeedDial1.MainButtonColor = "#afc8a4"
	SDUI5SpeedDial1.MainButtonIcon = "./assets/xmark-solid.svg"
	SDUI5SpeedDial1.MainButtonText = "F"
	SDUI5SpeedDial1.MainButtonType = "main"
	SDUI5SpeedDial1.ChildColors = "a=#3c79f4; b=#941c38; c=#de5be1; d: #d2fd1c"
	SDUI5SpeedDial1.ChildIcons = $"a=./assets/camera-solid.svg;
b=./assets/list-solid.svg;
c=./assets/image-solid.svg;
d=./assets/microphone-solid.svg"$
	SDUI5SpeedDial1.ChildKeys = "a; b; c; d"
	SDUI5SpeedDial1.ChildText = "a=A; b=B; c=C; d=D"
	SDUI5SpeedDial1.ChildTextColor = "a=#ffffff; b=#ffffff; c=#ffffff;  d=#ffffff"
	SDUI5SpeedDial1.Text = "A"
	BANano.Await(SDUI5SpeedDial1.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `fab flex!`, `fab-flower`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim speeddial As SDUI5SpeedDial
speeddial.Initialize(Me, "SDUI5SpeedDial", "SDUI5SpeedDial")
speeddial.ParentID = "placeholder"
BANano.Await(speeddial.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


