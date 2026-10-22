---
name: SDUI5Conversation
description: SithasoDaisy5 SDUI5Conversation component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5Conversation

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5Conversation.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5Conversation.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5Conversation is a chat conversation container grouping chat items/messages. Children (chat items) mount via ParentID.
_SDUI5Conversation is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ChatId` | String | — | — | `setChatId` | `getChatId` |
| `ConversationType` | String | T | T, V, D, I, A | `setConversationType` | `getConversationType` |
| `TextColor` | String | — | — | `setTextColor` | `getTextColor` |
| `BackgroundColor` | String | — | — | `setBackgroundColor` | `getBackgroundColor` |
| `FontSize` | String | 14px | — | `setFontSize` | `getFontSize` |
| `Incoming` | Boolean | True | — | `setIncoming` | `getIncoming` |
| `SenderImage` | String | ./assets/mashy.jpg | — | `setSenderImage` | `getSenderImage` |
| `ImageShape` | String | — | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl | `setImageShape` | `getImageShape` |
| `ImageSize` | String | 12 | — | `setImageSize` | `getImageSize` |
| `SenderName` | String | — | — | `setSenderName` | `getSenderName` |
| `SenderTime` | String | — | — | `setSenderTime` | `getSenderTime` |
| `Footer` | String | — | — | `setFooter` | `getFooter` |
| `Message` | String | — | — | `setMessage` | `getMessage` |
| `ReAction` | String | — | — | `setReAction` | `getReAction` |
| `ReplyId` | String | — | — | `setReplyId` | `getReplyId` |
| `ReplyMessage` | String | — | — | `setReplyMessage` | `getReplyMessage` |
| `FileMimeType` | String | — | — | `setFileMimeType` | `getFileMimeType` |
| `FileName` | String | — | — | `setFileName` | `getFileName` |
| `FilePreview` | String | — | — | `setFilePreview` | `getFilePreview` |
| `FileSize` | String | none | lg, md, none, sm, xl, xs | `setFileSize` | `getFileSize` |
| `FileUrl` | String | — | — | `setFileUrl` | `getFileUrl` |
| `Visible` | Boolean | True | — | `setVisible` | `getVisible` |

Setter and getter names are the actual source `Sub` names. `—` means this component has no named accessor for that side; designer-time values may still be consumed through `Props` in `DesignerCreateView`.
## Events
`Reply`

Wire in parent: `Sub conversation_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (7)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
## Key Setters (31)
- `setParentID(s As String)` _(public)_
- `setVisible(b As Boolean)` _(public)_
- `setAvatarVisible(b As Boolean)` _(public)_
- `setHeaderVisible(b As Boolean)` _(public)_
- `setImageVisible(b As Boolean)` _(public)_
- `setMessageVisible(b As Boolean)` _(public)_
- `setPdfVisible(b As Boolean)` _(public)_
- `setReactionVisible(b As Boolean)` _(public)_
- `setVideoVisible(b As Boolean)` _(public)_
- `setImageSize(s As String)` As 'ignoredeadcode _(public)_
- `setImageShape(s As String)` As 'ignoredeadcode _(public)_
- `setBackgroundColor(s As String)` As 'ignoredeadcode _(public)_
- `setConversationType(s As String)` As 'ignoredeadcode _(public)_
- `setFileMimeType(s As String)` As 'ignoredeadcode _(public)_
- `setFileName(s As String)` As 'ignoredeadcode _(public)_
- `setFilePreview(s As String)` As 'ignoredeadcode _(public)_
- `setFileSize(s As String)` As 'ignoredeadcode _(public)_
- `setFileUrl(s As String)` As 'ignoredeadcode _(public)_
- `setFontSize(s As String)` As 'ignoredeadcode _(public)_
- `setFooter(s As String)` As 'ignoredeadcode _(public)_
- `setIncoming(b As Boolean)` As 'ignoredeadcode _(public)_
- `setMessage(s As String)` As 'ignoredeadcode _(public)_
- `setReplyId(s As String)` As 'ignoredeadcode _(public)_
- `setReplyMessage(s As String)` As 'ignoredeadcode _(public)_
- `setSenderImage(s As String)` As 'ignoredeadcode _(public)_
- `setSenderName(s As String)` As 'ignoredeadcode _(public)_
- `setSenderTime(s As String)` As 'ignoredeadcode _(public)_
- `setTextColor(s As String)` As 'ignoredeadcode _(public)_
- `setReAction(s As String)` As 'ignoredeadcode _(public)_
- `setChatId(s As String)` _(public)_
- `setFooterVisible(b As Boolean)` _(public)_
## Getters (33)
- `getID()` As String _(public)_
- `getParentID()` As String _(public)_
- `getHere()` As String _(public)_
- `getVisible()` As Boolean _(public)_
- `getAvatarVisible()` As Boolean _(public)_
- `getHeaderVisible()` As Boolean _(public)_
- `getImageVisible()` As Boolean _(public)_
- `getMessageVisible()` As Boolean _(public)_
- `getPdfVisible()` As Boolean _(public)_
- `getReactionVisible()` As Boolean _(public)_
- `getVideoVisible()` As Boolean _(public)_
- `getImageSize()` As String _(public)_
- `getImageShape()` As String _(public)_
- `getBackgroundColor()` As String _(public)_
- `getConversationType()` As String _(public)_
- `getFileMimeType()` As String _(public)_
- `getFileName()` As String _(public)_
- `getFilePreview()` As String _(public)_
- `getFileSize()` As String _(public)_
- `getFileUrl()` As String _(public)_
- `getFontSize()` As String _(public)_
- `getFooter()` As String _(public)_
- `getIncoming()` As Boolean _(public)_
- `getMessage()` As String _(public)_
- `getReplyId()` As String _(public)_
- `getReplyMessage()` As String _(public)_
- `getSenderImage()` As String _(public)_
- `getSenderName()` As String _(public)_
- `getSenderTime()` As String _(public)_
- `getTextColor()` As String _(public)_
- `getReAction()` As String _(public)_
- `getChatId()` As String _(public)_
- `getFooterVisible()` As Boolean _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim conversation As SDUI5Conversation
conversation.Initialize(Me, "SDUI5Conversation", "SDUI5Conversation")
conversation.ParentID = "placeholder"
BANano.Await(conversation.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


