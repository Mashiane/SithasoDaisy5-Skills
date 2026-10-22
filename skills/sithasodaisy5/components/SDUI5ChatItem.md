---
name: SDUI5ChatItem
description: SithasoDaisy5 SDUI5ChatItem component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ChatItem

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ChatItem.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ChatItem.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ChatItem is a chat message bubble with avatar, name, time, and content. Use inside chat lists/conversations.
_SDUI5ChatItem is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `FromAvatar` | String | ./assets/mashy.jpg | — | `setFromAvatar` | `getFromAvatar` |
| `FromName` | String | From Name | — | `setFromName` | `getFromName` |
| `Message` | String | Message | — | `setMessage` | `getMessage` |
| `DeliveryTime` | String | 10:00 AM | — | `setDeliveryTime` | `getDeliveryTime` |
| `TimeAgo` | Boolean | True | — | `setTimeAgo` | `getTimeAgo` |
| `Unread` | String | 2 | — | `setUnread` | `getUnread` |
| `UnreadColor` | String | primary | — | `setUnreadColor` | `getUnreadColor` |
| `UnreadVisible` | Boolean | True | — | `setUnreadVisible` | `getUnreadVisible` |
| `HelpAvatar` | String | ./assets/mashy.jpg | — | `setHelpAvatar` | `getHelpAvatar` |
| `HelpVisible` | Boolean | False | — | `setHelpVisible` | `getHelpVisible` |
| `AvatarShape` | String | circle | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, rounded, rounded-2xl, rounded-3xl, rounded-lg, rounded-md, rounded-sm, rounded-xl, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4 | `setAvatarShape` | `getAvatarShape` |
| `AvatarSize` | String | 12 | — | `setAvatarSize` | `getAvatarSize` |
| `BackgroundColor` | String | base-100 | — | `setBackgroundColor` | `getBackgroundColor` |
| `Rounded` | String | none | none, rounded, 2xl, 3xl, full, lg, md, sm, xl, 0 | `setRounded` | `getRounded` |
| `RoundedBox` | Boolean | True | — | `setRoundedBox` | `getRoundedBox` |
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

Wire in parent: `Sub chatitem_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (26)
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
- `setAvatarShape(s As String)` _(public)_
- `setAvatarSize(s As String)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setDeliveryTime(s As String)` _(public)_
- `setFromAvatar(s As String)` _(public)_
- `setFromName(s As String)` _(public)_
- `setHelpAvatar(s As String)` _(public)_
- `setHelpVisible(b As Boolean)` _(public)_
- `setMessage(s As String)` _(public)_
- `setRounded(s As String)` _(public)_
- `setRoundedBox(b As Boolean)` _(public)_
- `setShadow(s As String)` _(public)_
- `setTimeAgo(b As Boolean)` _(public)_
- `setUnread(s As String)` _(public)_
- `setUnreadColor(s As String)` _(public)_
- `setUnreadVisible(b As Boolean)` _(public)_
## Getters (28)
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
- `getAvatarShape()` As String _(public)_
- `getAvatarSize()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getDeliveryTime()` As String _(public)_
- `getFromAvatar()` As String _(public)_
- `getFromName()` As String _(public)_
- `getHelpAvatar()` As String _(public)_
- `getHelpVisible()` As Boolean _(public)_
- `getMessage()` As String _(public)_
- `getRounded()` As String _(public)_
- `getRoundedBox()` As Boolean _(public)_
- `getShadow()` As String _(public)_
- `getTimeAgo()` As Boolean _(public)_
- `getUnread()` As String _(public)_
- `getUnreadColor()` As String _(public)_
- `getUnreadVisible()` As Boolean _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `list-row flex items-center gap-3 p-2 hover:bg-base-200 cursor-pointer wa-sidebar-chat`, `rounded-box`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim chatitem As SDUI5ChatItem
chatitem.Initialize(Me, "SDUI5ChatItem", "SDUI5ChatItem")
chatitem.ParentID = "placeholder"
BANano.Await(chatitem.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


