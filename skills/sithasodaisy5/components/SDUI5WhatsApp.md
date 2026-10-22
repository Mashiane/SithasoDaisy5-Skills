---
name: SDUI5WhatsApp
description: SithasoDaisy5 SDUI5WhatsApp component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# SDUI5WhatsApp

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`SDUI5WhatsApp.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/SDUI5WhatsApp.bas)
- **Demo References** *(a type reference was detected; inspect the page to confirm the component is actually instantiated before treating it as usage evidence)*:
  - [`pgWhatsApp.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWhatsApp.bas)
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
SDUI5WhatsApp is a WhatsApp chat link/button. Use to open WhatsApp chat.
_SDUI5WhatsApp is a SithasoDaisy5 BANano component (daisyUI + Tailwind)._
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
| `ReadMe` | String | Child Item _actions | — | — | — |
| `ParentID` | String | — | — | `setParentID` | `getParentID` |
| `ButtonSize` | String | md | lg, md, none, sm, xl, xs | `setButtonSize` | `getButtonSize` |
| `SideVisible` | Boolean | True | — | `setSideVisible` | `getSideVisible` |
| `SideHeaderVisible` | Boolean | True | — | `setSideHeaderVisible` | `getSideHeaderVisible` |
| `SideBackVisible` | Boolean | False | — | `setSideBackVisible` | `getSideBackVisible` |
| `SideAvatarVisible` | Boolean | True | — | `setSideAvatarVisible` | `getSideAvatarVisible` |
| `SideAvatar` | String | ./assets/avatar.png | — | `setSideAvatar` | `getSideAvatar` |
| `SideSearchVisible` | Boolean | False | — | `setSideSearchVisible` | `getSideSearchVisible` |
| `RightHeaderVisible` | Boolean | True | — | `setRightHeaderVisible` | `getRightHeaderVisible` |
| `RightAvatarVisible` | Boolean | True | — | `setRightAvatarVisible` | `getRightAvatarVisible` |
| `RightAvatar` | String | ./assets/avatar.png | — | `setRightAvatar` | `getRightAvatar` |
| `RightName` | String | Anele Mbanga (Mashy) | — | `setRightName` | `getRightName` |
| `RightStatus` | String | Online | — | `setRightStatus` | `getRightStatus` |
| `AllowAttachments` | Boolean | True | — | `setAllowAttachments` | `getAllowAttachments` |
| `Camera` | Boolean | True | — | `setCamera` | `getCamera` |
| `Emojis` | Boolean | True | — | `setEmojis` | `getEmojis` |
| `Voice` | Boolean | True | — | `setVoice` | `getVoice` |
| `FontSize` | String | 14px | — | `setFontSize` | `getFontSize` |
| `ImageShape` | String | circle | circle, decagon, diamond, heart, hexagon, hexagon-2, none, pentagon, square, squircle, star, star-2, triangle, triangle-2, triangle-3, triangle-4, rounded-2xl, rounded-3xl, rounded, rounded-lg, rounded-md, rounded-sm, rounded-xl | `setImageShape` | `getImageShape` |
| `ImageSize` | String | 12 | — | `setImageSize` | `getImageSize` |
| `IncomingTextColor` | String | — | — | `setIncomingTextColor` | `getIncomingTextColor` |
| `IncomingBackgroundColor` | String | — | — | `setIncomingBackgroundColor` | `getIncomingBackgroundColor` |
| `OutgoingTextColor` | String | — | — | `setOutgoingTextColor` | `getOutgoingTextColor` |
| `OutgoingBackgroundColor` | String | — | — | `setOutgoingBackgroundColor` | `getOutgoingBackgroundColor` |
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
`Back`, `ChatClick`, `Attachments_ItemClick`, `EmojiSelect`, `EmojiClickOutside`, `CancelReply`, `Reply`, `Search`, `ClearSearch`, `Send`, `FileChange`, `RefreshChats`

Wire in parent: `Sub whatsapp_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (59)
- `Initialize(Callback As Object, Name As String, EventName As String)` _(public)_
- `SetProperties(props As Map)` _(public)_
- `GetProperties()` As Map _(public)_
- `AddComponent()` _(public)_
- `Remove()` _(public)_
- `OnEvent(event As String, methodName As String)` _(public)_
- `DesignerCreateView(Target As BANanoElement, Props As Map)` _(public)_
- `TriggerAttach()` _(public)_
- `SetOnline()` As 'ignoredeadcode _(public)_
- `SetOffline()` As 'ignoredeadcode _(public)_
- `SetTextPlaceholder(s As String)` _(public)_
- `EnableEmoji(b As Boolean)` As 'ignoredeadcode _(public)_
- `EnableAttach(b As Boolean)` As 'ignoredeadcode _(public)_
- `EnableSend(b As Boolean)` As 'ignoredeadcode _(public)_
- `EnableVoice(b As Boolean)` As 'ignoredeadcode _(public)_
- `GetFile()` As Map _(public)_
- `GetFileDataURL()` As String _(public)_
- `GetSearchValue()` As String _(public)_
- `SetSearchPlaceholder(s As String)` _(public)_
- `SetSearchValue(s As String)` _(public)_
- `MessageFocus()` _(public)_
- `PrepareEmojis()` As 'ignoredeadcode _(public)_
- `ShowSend()` _(public)_
- `HideSend()` As 'ignoredeadcode _(public)_
- `ShowCancelReply()` _(public)_
- `HideCancelReply()` As 'ignoredeadcode _(public)_
- `AppendEmoji(emoji As Map)` As 'ignoredeadcode _(public)_
- `ClearChats()` _(public)_
- `ClearConversations()` _(public)_
- `IsMessageBlank()` As Boolean _(public)_
- `AddChatList(lst As List)` _(public)_
- `AddChat(chatID As String, chatAvatar As String, chatName As String, chatDelivery As String, cMessage As String, chatUnread As String, chatUser As String)` _(public)_
- `AddEditChat(chatID As String, chatAvatar As String, chatName As String, chatDelivery As String, cMessage As String, chatUnread As String, chatUser As String, bMoveUp As Boolean)` _(public)_
- `SetUnread(chatID As String, chatUnread As String)` _(public)_
- `SetLastMessage(chatID As String, chatMessage As String, chatDelivery As String)` _(public)_
- `RemoveChat(chatID As String)` _(public)_
- `MoveDown(chatID As String)` _(public)_
- `MoveUp(chatID As String)` _(public)_
- `AddMessage(cID As String, cIncoming As Boolean, cType As String, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cFileName As String, cFileURL As String, cFileMimeType As String, cFilePreview As String, cFileSize As String, cQuotedMessage As String, cQuotedID As String, cFooter As String, cReAction As String)` _(public)_
- `AddTextMessage(cID As String, cIncoming As Boolean, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cQuotedMessage As String, cQuotedID As String, cFooter As String, cReaction As String)` _(public)_
- `AddVideoMessage(cID As String, cIncoming As Boolean, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cFileName As String, cFileURL As String, cFileMimeType As String, cFilePreview As String, cFileSize As String, cQuotedMessage As String, cQuotedID As String, cFooter As String, cReaction As String)` _(public)_
- `AddPDFMessage(cID As String, cIncoming As Boolean, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cFileName As String, cFileURL As String, cFileMimeType As String, cFilePreview As String, cFileSize As String, cQuotedMessage As String, cQuotedID As String, cFooter As String, cReaction As String)` _(public)_
- `AddImageMessage(cID As String, cIncoming As Boolean, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cFileName As String, cFileURL As String, cFileSize As String, cQuotedMessage As String, cQuotedID As String, cFooter As String, cReaction As String)` _(public)_
- `RefreshConversations()` _(public)_
- `AddEditTextMessage(cID As String, cIncoming As Boolean, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cReplyMessage As String, cReplyID As String, cReAction As String)` _(public)_
- `AddEditConversation(cID As String, cIncoming As Boolean, cType As String, cSenderImage As String, cSenderName As String, cSenderTime As String, cMessage As String, cFileName As String, cFileURL As String, cFileMimeType As String, cFilePreview As String, cFileSize As String, cReplyMessage As String, cReplyID As String, cFooter As String, cReAction As String)` _(public)_
- `RefreshChats()` _(public)_
- `ClearRightHeader()` _(public)_
- `SetRightHelpAvatar(s As String)` _(public)_
- `SetRightHelpAvatarVisible(b As Boolean)` _(public)_
- `ScrollToLastMessage()` _(public)_
- `ScrollMessageIntoView(cID As String)` _(public)_
- `MessageSent()` _(public)_
- `FileChooserAudio()` _(public)_
- `PrepareForEmoji()` _(public)_
- `PrepareForURL()` _(public)_
- `FileChooserPDF()` _(public)_
- `FileChooserImage()` _(public)_
- `FileChooserVideo()` _(public)_
## Key Setters (41)
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
- `setOnlineVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setOnlineColor(sColor As String)` As 'ignoredeadcode _(public)_
- `setSideBackVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setAllowAttachments(b As Boolean)` As 'ignoredeadcode _(public)_
- `setCamera(b As Boolean)` As 'ignoredeadcode _(public)_
- `setEmojis(b As Boolean)` As 'ignoredeadcode _(public)_
- `setVoice(b As Boolean)` As 'ignoredeadcode _(public)_
- `setButtonSize(s As String)` As 'ignoredeadcode _(public)_
- `setMessage(s As String)` As 'ignoredeadcode _(public)_
- `setRightAvatar(s As String)` As 'ignoredeadcode _(public)_
- `setRightAvatarVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setRightHeaderVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setRightName(s As String)` As 'ignoredeadcode _(public)_
- `setRightStatus(s As String)` As 'ignoredeadcode _(public)_
- `setSideAvatar(s As String)` As 'ignoredeadcode _(public)_
- `setSideAvatarVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSideHeaderVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSideSearchVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setSideVisible(b As Boolean)` As 'ignoredeadcode _(public)_
- `setLastMsgID(s As String)` _(public)_
- `setLastUser(s As String)` _(public)_
- `setActiveImage(s As String)` _(public)_
- `setActiveChatID(s As String)` _(public)_
- `setActiveChatName(s As String)` _(public)_
- `setFontSize(s As String)` _(public)_
- `setImageShape(s As String)` _(public)_
- `setImageSize(s As String)` _(public)_
- `setIncomingBackgroundColor(s As String)` _(public)_
- `setIncomingTextColor(s As String)` _(public)_
- `setOutgoingBackgroundColor(s As String)` _(public)_
- `setOutgoingTextColor(s As String)` _(public)_
## Getters (43)
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
- `getOnlineVisible()` As Boolean			'ignoredeadcode _(public)_
- `getOnlineColor()` As String				'ignoredeadcode _(public)_
- `getSideBackVisible()` As Boolean _(public)_
- `getAllowAttachments()` As Boolean _(public)_
- `getCamera()` As Boolean _(public)_
- `getEmojis()` As Boolean _(public)_
- `getVoice()` As Boolean _(public)_
- `getButtonSize()` As String _(public)_
- `getMessage()` As String _(public)_
- `getRightAvatar()` As String _(public)_
- `getRightAvatarVisible()` As Boolean _(public)_
- `getRightHeaderVisible()` As Boolean _(public)_
- `getRightName()` As String _(public)_
- `getRightStatus()` As String _(public)_
- `getSideAvatar()` As String _(public)_
- `getSideAvatarVisible()` As Boolean _(public)_
- `getSideHeaderVisible()` As Boolean _(public)_
- `getSideSearchVisible()` As Boolean _(public)_
- `getSideVisible()` As Boolean _(public)_
- `getLastMsgID()` As String _(public)_
- `getLastUser()` As String _(public)_
- `getActiveImage()` As String _(public)_
- `getActiveChatID()` As String _(public)_
- `getActiveChatName()` As String _(public)_
- `getFontSize()` As String _(public)_
- `getImageShape()` As String _(public)_
- `getImageSize()` As String _(public)_
- `getIncomingBackgroundColor()` As String _(public)_
- `getIncomingTextColor()` As String _(public)_
- `getOutgoingBackgroundColor()` As String _(public)_
- `getOutgoingTextColor()` As String _(public)_
## Private Methods (1)
- `SetDefaults()` _(private)_
## Verified Demo Usage

Real syntax from [`pgWhatsApp.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J/pgWhatsApp.bas) (verified demo). `SDUI5WhatsApp1` = a SDUI5WhatsApp.

```b4j
	SDUI5WhatsApp1.Initialize(Me, "SDUI5WhatsApp1", "SDUI5WhatsApp1")
	SDUI5WhatsApp1.ParentID = app.PageView
	SDUI5WhatsApp1.Camera = False
	SDUI5WhatsApp1.IncomingBackgroundColor = "#ff00ff"
	SDUI5WhatsApp1.IncomingTextColor = "#000000"
	SDUI5WhatsApp1.OutgoingBackgroundColor = "#0000ff"
	SDUI5WhatsApp1.OutgoingTextColor = "#ffffff"
	SDUI5WhatsApp1.SideBackVisible = True
	SDUI5WhatsApp1.SideSearchVisible = True
	SDUI5WhatsApp1.Voice = False
	BANano.Await(SDUI5WhatsApp1.AddComponent)
```

Builder methods, real call order (from `pgWhatsApp.bas`):

```b4j
	SDUI5WhatsApp1.AddChat("chat-123456789", "./assets/1.jpg", "Chat 1", "10:00", "The last message said.", "1", "./assets/mashy.jpg")
	SDUI5WhatsApp1.AddChat("chat-123456788", "./assets/2.jpg", "Chat 2", "11:00", "The last message said.", "2", "./assets/mashy.jpg")
	SDUI5WhatsApp1.AddChat("chat-123456787", "./assets/3.jpg", "Chat 3", "12:00", "The last message said.", "3", "")
	SDUI5WhatsApp1.AddChat("chat-123456786", "./assets/4.jpg", "Chat 4", "13:00", "The last message said.", "4", "")
	SDUI5WhatsApp1.AddChat("chat-123456785", "./assets/5.jpg", "Chat 5", "14:00", "The last message said.", "5", "./assets/mashy.jpg")
	SDUI5WhatsApp1.AddChat("chat-123456784", "./assets/6.jpg", "Chat 6", "15:00", "The last message said.", "6", "")
	SDUI5WhatsApp1.SetUnread("chat-123456787", "6")
	SDUI5WhatsApp1.SetUnread("chat-123456786", "10")
	SDUI5WhatsApp1.SetUnread("chat-123456784", "0")
	SDUI5WhatsApp1.SetUnread("chat-123456786", "0")
	SDUI5WhatsApp1.SetUnread("chat-123456788", "0")
	SDUI5WhatsApp1.MoveUp("chat-123456789")
	SDUI5WhatsApp1.MoveUp("chat-123456786")
	SDUI5WhatsApp1.MoveDown("chat-123456786")
```

Demo-wired events: `Back`, `ChatClick`, `Copy`, `EmojiClickOutside`, `EmojiSelect`, `Reply`, `Send` — handlers named `SDUI5WhatsApp1_<Event>`.
## Emits (daisyUI classes pushed in DesignerCreateView)
**Classes**: `flex overflow-hidden shadow-sm rounded-box w-full h-full`
## Code Example
<!-- A minimal Initialize → ParentID → AddComponent → wire → mutate snippet. Fill for high-value components. -->
```vb
Dim whatsapp As SDUI5WhatsApp
whatsapp.Initialize(Me, "SDUI5WhatsApp", "SDUI5WhatsApp")
whatsapp.ParentID = "placeholder"
BANano.Await(whatsapp.AddComponent)   ' DesignerCreateView runs internally
```
## Composes With
<!-- Parent containers / child items / sibling components this pairs with. Fill for high-value components. -->
- Inherits base behavior from **SDUI5Component** (Visible/Enabled/Position/Margins/Paddings/RawClasses/RawStyles/RawAttributes/Height/Width/TextSize/BackgroundImage).
- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally.


