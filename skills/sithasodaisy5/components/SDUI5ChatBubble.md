---
name: SDUI5ChatBubble
description: SithasoDaisy5 SDUI5ChatBubble component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5ChatBubble

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5ChatBubble.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5ChatBubble.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgChatBubble.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgChatBubble.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5ChatBubble is a chat message bubble with avatar/name/time. Use inside chat conversations.
_SDUI5ChatBubble is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `Placement` | String | start | end, start | `setPlacement` | `getPlacement` |
| `MessageFrom` | String | Mashy | — | `setMessageFrom` | `getMessageFrom` |
| `MessageTime` | String | 17:20 | — | `setMessageTime` | `getMessageTime` |
| `Image` | String | ./assets/mashy.jpg | — | `setImage` | `getImage` |
| `ImageSize` | String | 10 | — | `setImageSize` | `getImageSize` |
| `Message` | String | Welcome to SithasoDaisy5 | — | `setMessage` | `getMessage` |
| `Footer` | String | Delivered | — | `setFooter` | `getFooter` |
| `Color` | String | none | accent, error, info, neutral, none, primary, secondary, success, warning | `setColor` | `getColor` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `HeaderVisible` | Boolean | True | — | `setHeaderVisible` | `getHeaderVisible` |
| `ImageVisible` | Boolean | True | — | `setImageVisible` | `getImageVisible` |
| `FooterVisible` | Boolean | True | — | `setFooterVisible` | `getFooterVisible` |
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

Wire in parent: `Sub chatbubble_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (6)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (23)
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
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setColor(s As String)` As 'ignoredeadcode _(public)_
- `setFooter(s As String)` _(public)_
- `setFooterVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setHeaderVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setImage(s As String)` _(public)_
- `setImageSize(s As String)` As 'ignoredeadcode _(public)_
- `setImageVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setMessage(s As String)` As 'ignoredeadcode _(public)_
- `setMessageFrom(s As String)` _(public)_
- `setMessageTime(s As String)` _(public)_
- `setPlacement(s As String)` _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
## Getters (25)
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
- `getBackgroundColor()` As String _(public)_
- `getColor()` As String _(public)_
- `getFooter()` As String _(public)_
- `getFooterVisible()` As Boolean _(public)_
- `getHeaderVisible()` As Boolean _(public)_
- `getImage()` As String _(public)_
- `getImageSize()` As String _(public)_
- `getImageVisible()` As Boolean _(public)_
- `getMessage()` As String _(public)_
- `getMessageFrom()` As String _(public)_
- `getMessageTime()` As String _(public)_
- `getPlacement()` As String _(public)_
- `getTextColor()` As String _(public)_
## Private Methods (0)
_(none)_
## Verified Demo Usage

Real syntax from [`pgChatBubble.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgChatBubble.bas) (verified demo). `SDUI5ChatBubble2` = a SDUI5ChatBubble.

```b4j
	SDUI5ChatBubble2.Initialize(Me, "SDUI5ChatBubble2", "SDUI5ChatBubble2")
	SDUI5ChatBubble2.ParentID = "SDUI5Column1"
	SDUI5ChatBubble2.FooterVisible = False
	SDUI5ChatBubble2.HeaderVisible = False
	SDUI5ChatBubble2.ImageVisible = False
	SDUI5ChatBubble2.Message = "It's the most famous B4x Web Development BANano Framework. <br> Enjoy it and <b>have fun</b>"
	SDUI5ChatBubble2.MessageTime = "17:20"
	SDUI5ChatBubble2.Placement = "end"
	BANano.Await(SDUI5ChatBubble2.AddComponent)
```
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `chat`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim chatbubble As SDUI5ChatBubble
chatbubble.Initialize(Me, "SDUI5ChatBubble", "SDUI5ChatBubble")
chatbubble.ParentID = "placeholder"
BANano.Await(chatbubble.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


