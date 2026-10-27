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
## Public Methods (5)
- `AddComponent()` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `Remove()` _(public)_

## Key Setters (32)
- `setAvatarVisible(b As Boolean)` _(public)_
- `setBackgroundColor(s As String)` _(public)_
- `setChatId(s As String)` _(public)_
- `setConversationType(s As String)` _(public)_
- `setFileMimeType(s As String)` _(public)_
- `setFileName(s As String)` _(public)_
- `setFilePreview(s As String)` _(public)_
- `setFileSize(s As String)` _(public)_
- `setFileUrl(s As String)` _(public)_
- `setFontSize(s As String)` _(public)_
- `setFooter(s As String)` _(public)_
- `setFooterVisible(b As Boolean)` _(public)_
- `setHeaderVisible(b As Boolean)` _(public)_
- `setImageShape(s As String)` _(public)_
- `setImageSize(s As String)` _(public)_
- `setImageVisible(b As Boolean)` _(public)_
- `setIncoming(b As Boolean)` _(public)_
- `setMessage(s As String)` _(public)_
- `setMessageVisible(b As Boolean)` _(public)_
- `setParentID(s As String)` _(public)_
- `setPdfVisible(b As Boolean)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `setReAction(s As String)` _(public)_
- `setReactionVisible(b As Boolean)` _(public)_
- `setReplyId(s As String)` _(public)_
- `setReplyMessage(s As String)` _(public)_
- `setSenderImage(s As String)` _(public)_
- `setSenderName(s As String)` _(public)_
- `setSenderTime(s As String)` _(public)_
- `setTextColor(s As String)` _(public)_
- `setVideoVisible(b As Boolean)` _(public)_
- `setVisible(b As Boolean)` _(public)_

## Getters (34)
- `getAvatarVisible()` _(public)_
- `getBackgroundColor()` _(public)_
- `getChatId()` _(public)_
- `getConversationType()` _(public)_
- `getFileMimeType()` _(public)_
- `getFileName()` _(public)_
- `getFilePreview()` _(public)_
- `getFileSize()` _(public)_
- `getFileUrl()` _(public)_
- `getFontSize()` _(public)_
- `getFooter()` _(public)_
- `getFooterVisible()` _(public)_
- `getHeaderVisible()` _(public)_
- `getHere()` As String _(public)_
- `getID()` As String _(public)_
- `getImageShape()` _(public)_
- `getImageSize()` _(public)_
- `getImageVisible()` _(public)_
- `getIncoming()` _(public)_
- `getMessage()` _(public)_
- `getMessageVisible()` _(public)_
- `getParentID()` _(public)_
- `getPdfVisible()` _(public)_
- `GetProperties()` _(public)_
- `getReAction()` _(public)_
- `getReactionVisible()` _(public)_
- `getReplyId()` _(public)_
- `getReplyMessage()` _(public)_
- `getSenderImage()` _(public)_
- `getSenderName()` _(public)_
- `getSenderTime()` _(public)_
- `getTextColor()` _(public)_
- `getVideoVisible()` _(public)_
- `getVisible()` _(public)_

## Private Methods (3)
- `ClickReply(e As BANanoEvent)` _(private)_
- `OpenFileOnTab(e As BANanoEvent)` _(private)_
- `SetDefaults()` _(private)_

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
