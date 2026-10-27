---
name: SDUI5Avatar
description: SithasoDaisy5 SDUI5Avatar component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Avatar

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Avatar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Avatar.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgAvatar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAvatar.bas)
  - [`pgDropDown.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgDropDown.bas)
  - [`pgIndicator.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgIndicator.bas)
  - [`pgNavBar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgNavBar.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Avatar is a daisyUI `avatar` (image or placeholder text) with optional online status indicator, ring, badge, and mask. Props: AvatarType (image/placeholder), Size, Image (with extension), Mask (circle/squircle/hexagon/etc), Online/OnlineColor/OnlineStatus, Ring/RingColor/RingOffset/RingOffsetColor, Placeholder text, Badge/BadgeColor/BadgePosition. **Size is a numeric width/height string** (e.g. "12", "16", "48px") applied to the `_host` element — NOT a daisyUI size token like "lg"/"md"; passing "lg" produces invalid CSS. Use for user identity display; Image path must include extension.
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
| `AvatarType` | String | image | image, placeholder | `setAvatarType` | `getAvatarType` |
| `AvatarColor` | Boolean | False | — | `setAvatarColor` | `getAvatarColor` |
| `Image` | String | ./assets/600by600.jpg | — | `setImage` | `getImage` |
| `Mask` | String | circle | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl | `setMask` | `getMask` |
| `ChatImage` | Boolean | False | — | `setChatImage` | `getChatImage` |
| `Placeholder` | String | S | — | `setPlaceholder` | `getPlaceholder` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `TextSize` | String | — | 2xl, 3xl, 4xl, 5xl, 6xl, 7xl, 8xl, 9xl, base, lg, md, none, sm, xl, xs | `setTextSize` | `getTextSize` |
| `HasBadge` | Boolean | True | — | `setHasBadge` | `getHasBadge` |
| `Badge` | String | — | — | `setBadge` | `getBadge` |
| `BadgeColor` | String | secondary | — | `setBadgeColor` | `getBadgeColor` |
| `BadgePosition` | String | top-end | bottom-center, middle-center, bottom-end, bottom-start, middle-end, middle-start, top-center, top-end, top-start | `setBadgePosition` | `getBadgePosition` |
| `BadgeSize` | String | sm | lg, md, none, sm, xl, xs | `setBadgeSize` | `getBadgeSize` |
| `BadgeVisible` | Boolean | False | — | `setBadgeVisible` | `getBadgeVisible` |
| `BackgroundColor` | String | primary | — | `setBackgroundColor` | `getBackgroundColor` |
| `Size` | String | 12 | — | `setSize` | `getSize` |
| `OnlineStatus` | Boolean | False | — | `setOnlineStatus` | `getOnlineStatus` |
| `Online` | Boolean | False | — | `setOnline` | `getOnline` |
| `OnlineColor` | String | — | — | `setOnlineColor` | `getOnlineColor` |
| `Ring` | Boolean | False | — | `setRing` | `getRing` |
| `RingColor` | String | primary | — | `setRingColor` | `getRingColor` |
| `RingOffset` | String | 2 | — | `setRingOffset` | `getRingOffset` |
| `RingOffsetColor` | String | base-100 | — | `setRingOffsetColor` | `getRingOffsetColor` |
| `Activator` | Boolean | False | — | `setActivator` | `getActivator` |
| `PopOverTarget` | String | — | — | `setPopOverTarget` | `getPopOverTarget` |
| `RoundedField` | Boolean | False | — | `setRoundedField` | `getRoundedField` |
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
`Click`

Wire in parent: `Sub avatar_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (4)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (39)
- `setActivator(b As Boolean)` _(public)_
- `setAttributes(s As String)` _(public)_
- `setAvatarColor(b As Boolean)` _(public)_
- `setAvatarType(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setBadge(s As String)` _(public)_
- `setBadgeColor(s As String)` _(public)_
- `setBadgePosition(s As String)` _(public)_
- `setBadgeSize(s As String)` _(public)_
- `setBadgeVisible(b As Boolean)` _(public)_
- `setChatImage(b As Boolean)` _(public)_
- `setClasses(s As String)` _(public)_
- `setEnabled(b As Boolean)` _(public)_
- `setHasBadge(b As Boolean)` _(public)_
- `setImage(s As String)` _(public)_
- `setMarginAXYTBLR(s As String)` _(public)_
- `setMask(s As String)` _(public)_
- `setOnline(b As Boolean)` _(public)_
- `setOnlineColor(s As String)` _(public)_
- `setOnlineStatus(b As Boolean)` _(public)_
- `setPaddingAXYTBLR(s As String)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPlaceholder(s As String)` _(public)_
- `setPopOverTarget(s As String)` _(public)_
- `setPosition(s As String)` _(public)_
- `setPositionStyle(s As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setRing(b As Boolean)` _(public)_
- `setRingColor(s As String)` _(public)_
- `setRingOffset(s As String)` _(public)_
- `setRingOffsetColor(s As String)` _(public)_
- `setRoundedField(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setSize(s As String)` _(public)_
- `setSrc(s As String)` _(public)_
- `setStyles(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setTextSize(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (41)
- `getActivator()` _(public)_
- `getAttributes()` _(public)_
- `getAvatarColor()` _(public)_
- `getAvatarType()` _(public)_
- `getBackgroundColor()` _(public)_
- `getBadge()` _(public)_
- `getBadgeColor()` _(public)_
- `getBadgePosition()` _(public)_
- `getBadgeSize()` _(public)_
- `getBadgeVisible()` _(public)_
- `getChatImage()` _(public)_
- `getClasses()` _(public)_
- `getEnabled()` _(public)_
- `getHasBadge()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getImage()` _(public)_
- `getMarginAXYTBLR()` _(public)_
- `getMask()` _(public)_
- `getOnline()` _(public)_
- `getOnlineColor()` _(public)_
- `getOnlineStatus()` _(public)_
- `getPaddingAXYTBLR()` _(public)_
- `getParentID()` As String _(public)_
- `getPlaceholder()` _(public)_
- `getPopOverTarget()` _(public)_
- `getPosition()` _(public)_
- `getPositionStyle()` _(public)_
- `GetProperties()` _(public)_
- `getRing()` _(public)_
- `getRingColor()` _(public)_
- `getRingOffset()` _(public)_
- `getRingOffsetColor()` _(public)_
- `getRoundedField()` _(public)_
- `getShadow()` _(public)_
- `getSize()` _(public)_
- `getSrc()` _(public)_
- `getStyles()` _(public)_
- `getTextColor()` _(public)_
- `getTextSize()` _(public)_
- `getVisible()` _(public)_

## Private Methods (1)
- `SetDefaults()` _(private)_

## Verified Demo Usage

Real syntax from [`pgAvatar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAvatar.bas) (verified demo):

```b4j
Private SDUI5Avatar1 As SDUI5Avatar		'ignore
Private SDUI5Avatar10 As SDUI5Avatar		'ignore
Private SDUI5Avatar11 As SDUI5Avatar		'ignore
Private SDUI5Avatar12 As SDUI5Avatar		'ignore
Private SDUI5Avatar13 As SDUI5Avatar		'ignore
Private SDUI5Avatar14 As SDUI5Avatar		'ignore
Private SDUI5Avatar15 As SDUI5Avatar		'ignore
Private SDUI5Avatar16 As SDUI5Avatar		'ignore
Private SDUI5Avatar17 As SDUI5Avatar		'ignore
Private SDUI5Avatar18 As SDUI5Avatar		'ignore
Private SDUI5Avatar19 As SDUI5Avatar		'ignore
BANano.Await(SDUI5Container1.AddComponent)
```

## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `avatar`, `chat-image`, `rounded-field`, `avatar-placeholder`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim avatar As SDUI5Avatar
avatar.Initialize(Me, "SDUI5Avatar", "SDUI5Avatar")
avatar.ParentID = "placeholder"
BANano.Await(avatar.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.
