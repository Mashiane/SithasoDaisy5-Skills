---
name: SDUI5DrawerUser
description: SithasoDaisy5 SDUI5DrawerUser component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5DrawerUser

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5DrawerUser.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5DrawerUser.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5DrawerUser is a drawer variant with user profile header. Content mounts via `ParentID = drawerName`. Use for user-account side panels.
_SDUI5DrawerUser is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `UserName` | String | — | — | `setUserName` | `getUserName` |
| `EmailAddress` | String | — | — | `setEmailAddress` | `getEmailAddress` |
| `Avatar` | String | — | — | `setAvatar` | `getAvatar` |
| `AvatarShape` | String | circle | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl | `setAvatarShape` | `getAvatarShape` |
| `AvatarSize` | String | 8 | — | `setAvatarSize` | `getAvatarSize` |
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
`Exit`, `Click`

Wire in parent: `Sub draweruser_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (5)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (16)
- `setAttributes(s As String)` _(public)_
- `setAvatar(s As String)` _(public)_
- `setAvatarShape(s As String)` _(public)_
- `setAvatarSize(s As String)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEmailAddress(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setStyles(s As String)` _(public)_
- `setUserName(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (18)
- `getAttributes()` _(public)_
- `getAvatar()` _(public)_
- `getAvatarShape()` _(public)_
- `getAvatarSize()` _(public)_
- `getClasses()` _(public)_
- `getEmailAddress()` _(public)_
- `getEnabled()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getStyles()` _(public)_
- `getUserName()` _(public)_
- `getVisible()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgIndex.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndex.bas) (verified demo):

```b4j
Private draweruser As SDUI5DrawerUser	'ignore
BANano.Await(appdrawer.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `flex justify-between items-center p-2`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim draweruser As SDUI5DrawerUser
draweruser.Initialize(Me, "SDUI5DrawerUser", "SDUI5DrawerUser")
draweruser.ParentID = "placeholder"
BANano.Await(draweruser.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
