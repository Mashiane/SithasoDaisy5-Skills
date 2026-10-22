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
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (38)
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
- `setHasBadge(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAvatarColor(b As Boolean)` As 'ignoredeadcode _(public)_
- `setPopOverTarget(s As String)` As 'ignoredeadcode _(public)_
- `setShadow(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeSize(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setBadge(s As String)` As 'ignoredeadcode _(public)_
- `setBadgeColor(s As String)` As 'ignoredeadcode _(public)_
- `setBadgePosition(s As String)` As 'ignoredeadcode _(public)_
- `setTextSize(s As String)` As 'ignoredeadcode _(public)_
- `setAvatarType(s As String)` _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setSize(s As String)` As 'ignoredeadcode _(public)_
- `setImage(s As String)` _(public)_
- `setSrc(s As String)` _(public)_
- `setMask(s As String)` As 'ignoredeadcode _(public)_
- `setOnline(b As Boolean)` As 'ignoredeadcode _(public)_
- `setOnlineColor(s As String)` _(public)_
- `setOnlineStatus(b As Boolean)` _(public)_
- `setPlaceholder(s As String)` As 'ignoredeadcode _(public)_
- `setRing(b As Boolean)` As 'ignoredeadcode _(public)_
- `setRingColor(s As String)` As 'ignoredeadcode _(public)_
- `setRingOffset(s As String)` As 'ignoredeadcode _(public)_
- `setRingOffsetColor(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setActivator(b As Boolean)` _(public)_
- `setRoundedField(b As Boolean)` _(public)_
- `setChatImage(b As Boolean)` _(public)_
## Getters (39)
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
- `getHasBadge()` As Boolean _(public)_
- `getAvatarColor()` As Boolean _(public)_
- `getPopOverTarget()` As String					'ignoredeadcode _(public)_
- `getShadow()` As String _(public)_
- `getBadgeSize()` As String _(public)_
- `getBadgeVisible()` As Boolean _(public)_
- `getBadge()` As String _(public)_
- `getBadgeColor()` As String _(public)_
- `getBadgePosition()` As String _(public)_
- `getTextSize()` As String _(public)_
- `getAvatarType()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getSize()` As String _(public)_
- `getImage()` As String _(public)_
- `getSrc()` As String _(public)_
- `getMask()` As String _(public)_
- `getOnline()` As Boolean _(public)_
- `getOnlineColor()` As String _(public)_
- `getOnlineStatus()` As Boolean _(public)_
- `getPlaceholder()` As String _(public)_
- `getRing()` As Boolean _(public)_
- `getRingColor()` As String _(public)_
- `getRingOffset()` As String _(public)_
- `getRingOffsetColor()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getActivator()` As Boolean _(public)_
- `getRoundedField()` As Boolean _(public)_
- `getChatImage()` As Boolean _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgAvatar.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgAvatar.bas) (verified demo). `SDUI5Avatar16` = a SDUI5Avatar.

```b4j
	SDUI5Avatar16.Initialize(Me, "SDUI5Avatar16", "SDUI5Avatar16")
	SDUI5Avatar16.ParentID = "SDUI5Column16"
	SDUI5Avatar16.AvatarType = "placeholder"
	SDUI5Avatar16.BackgroundColor = "neutral"
	SDUI5Avatar16.Image = ""
	SDUI5Avatar16.Online = True
	SDUI5Avatar16.OnlineStatus = True
	SDUI5Avatar16.Placeholder = "AM"
	SDUI5Avatar16.RingColor = ""
	SDUI5Avatar16.Size = "20"
	SDUI5Avatar16.TextColor = "neutral-content"
	SDUI5Avatar16.TextSize = "3xl"
	BANano.Await(SDUI5Avatar16.AddComponent)
```

Demo-wired events: `Click` — handlers named `SDUI5Avatar16_<Event>`.

Also used in: `pgDropDown`, `pgIndicator`, `pgNavBar`
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


