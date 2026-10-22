---
name: BANanoGreenAPI
description: SithasoDaisy5 BANanoGreenAPI component reference — designer properties, events, ALL methods (public/private), setters, getters, emitted daisyUI classes, and usage pattern.
---

# BANanoGreenAPI

<!-- GENERATED_SOURCE_REFERENCES_START -->
## Source References

- **Framework Source** *(read-only reference; do not add this `.bas` file to an app that uses the SithasoDaisy5 `.b4xlib`)*: [`BANanoGreenAPI.bas`](https://github.com/Mashiane/SithasoDaisy5/blob/main/03.%20Source%20Code/SithasoDaisy5/BANanoGreenAPI.bas)
- **Demo References**: No direct `As`/`New` type reference was detected in the audited `pg*.bas` demo snapshot.
<!-- GENERATED_SOURCE_REFERENCES_END -->

## Core Idea
_WhatsApp messaging client via Green API (green-api.com) — send text/media messages, manage device registration, webhooks and delayed sends._

This is a **service class**, not a designer component: no `DesignerCreateView`, no designer properties, no daisyUI class emission. Add it to the B4J project and call its methods directly.
## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `ParentID` (property / `setParentID(id)`) — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — INTERNAL (called by `AddComponent`, never from app code); reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{name}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{name}_child")`.

**Init signature**: `Initialize(Callback As Object, EventName As String, myIdInstance As String, myApiTokenInstance As String)` | **Has DesignerCreateView**: No
## Designer Properties
_(inherits from SDUI5Component base — see base contract)_
## Events
_(none declared)_

Wire in parent: `Sub bananogreenapi_<eventname>(e As BANanoEvent)` — the handler name is `${mEventName}_<eventname>` from `UI.OnEvent`.
## Public Methods (60)
- `Initialize(Callback As Object, EventName As String, myIdInstance As String, myApiTokenInstance As String)` _(public)_
- `GetStateInstance()` As String _(public)_
- `ReBoot()` As Boolean _(public)_
- `LogOut()` As Boolean _(public)_
- `GetAuthorizationCode()` As String _(public)_
- `GetWaSettings()` _(public)_
- `QR()` As String _(public)_
- `GetSettings()` _(public)_
- `SetSettings()` As Boolean _(public)_
- `SendMessage(chatId As String, message As String, quotedMessageId As String, linkPreview As Boolean)` As String _(public)_
- `SendFileByUrl(chatId As String, urlFile As String, fileNameChat As String, caption As String, quotedMessageId As String)` As String _(public)_
- `SendFileByUpload(chatId As String, caption As String, fileObj As Object, fileNameChat As String, quotedMessageId As String)` As Map _(public)_
- `SetProfilePicture(fileObj As Object)` As Map _(public)_
- `UploadFile(fileObj As Object)` As String _(public)_
- `ShowMessagesQueue()` As List _(public)_
- `ClearMessagesQueue()` As Boolean _(public)_
- `SendLocation(chatId As String, latitude As Double, longitude As Double, nameLocation As String, Address As String, quotedMessageId As String)` As String _(public)_
- `SendContact(chatId As String, firstName As String, middleName As String, lastName As String, phoneNumber As String, company As String, quotedMessageId As String)` As String _(public)_
- `CheckWhatsApp(sPhone As String)` As Boolean _(public)_
- `GetAvatarFor(sPhone As String)` As String _(public)_
- `GetContacts(groupsOnly As Boolean)` As List _(public)_
- `GetContactsMap(groupsOnly As Boolean)` As Map _(public)_
- `GetContactsWidthAvatar(groupsOnly As Boolean)` As List _(public)_
- `GetContactInfo(chatID As String)` As ContactInfo _(public)_
- `DeleteMessage(chatID As String, idMessage As String)` As Boolean _(public)_
- `ArchiveChat(chatID As String)` As Boolean _(public)_
- `UnarchiveChat(chatID As String)` As Boolean _(public)_
- `SetDisappearingChat(chatID As String, ephemeralExpiration As Int)` As Boolean _(public)_
- `CreateGroup(groupName As String, chatIds As List)` As Map _(public)_
- `UpdateGroupName(groupId As String, groupName As String)` As Boolean _(public)_
- `UpdateGroupSettings(groupId As String, allowParticipantsEditGroupSettings As Boolean, allowParticipantsSendMessages As Boolean)` As Boolean _(public)_
- `GetGroupData(groupId As String)` As GroupData _(public)_
- `AddGroupParticipant(groupId As String, participantChatId As String)` As Boolean _(public)_
- `RemoveGroupParticipant(groupId As String, participantChatId As String)` As Boolean _(public)_
- `SetGroupAdmin(groupId As String, participantChatId As String)` As Boolean _(public)_
- `RemoveAdmin(groupId As String, participantChatId As String)` As Boolean _(public)_
- `SetGroupPicture(groupId As String, fileObj As Object)` As Map _(public)_
- `GetMessage(chatId As String, idMessage As String)` As Message _(public)_
- `LeaveGroup(groupId As String)` As Boolean _(public)_
- `GetChatHistory(chatId As String, icount As Int)` As List _(public)_
- `GetChats()` As List _(public)_
- `ReceiveNotification(receiveTimeout As Int)` As MessageNotification _(public)_
- `DeleteNotification(receiptId As Int)` As Boolean _(public)_
- `ForwardMessages(chatId As String, chatIdFrom As String, messages As List)` As List _(public)_
- `DownloadFile(chatId As String, idMessage As String)` As String _(public)_
- `SendPoll(chatId As String, message As String, options As List, multipleAnswers As Boolean, quotedMessageId As String)` As String _(public)_
- `LastIncomingMessages(minutes As Int)` As List _(public)_
- `LastOutgoingMessages(minutes As Int)` As List _(public)_
- `MessageFromMap(response As Map)` As Message _(public)_
- `LocationFromMap(response As Map)` As MessageLocation _(public)_
- `ContactFromMap(response As Map)` As MessageContact _(public)_
- `ExtendedTextMessageFromMap(response As Map)` As MessageExtendedText _(public)_
- `ExtendedTextDataMessageFromMap(response As Map)` As MessageExtendedTextData _(public)_
- `PollMessageDataFromMap(response As Map)` As MessagePollMessageData _(public)_
- `QuotedMessageFromMap(response As Map)` As MessageQuoted _(public)_
- `PutRecursive(data As Map, path As String, value As Object)` _(public)_
- `GetRecursive(data As Map, path As String)` As Object _(public)_
- `ParticipantInGroup(grpID As String, chatID As String)` As Boolean _(public)_
- `ReadChats(chatId As String)` As Boolean _(public)_
- `ReadChat(chatId As String, idMessage As String)` As Boolean _(public)_
## Key Setters (21)
- `setEditedMessageWebhook(s As String)` _(public)_
- `setDeletedMessageWebhook(s As String)` _(public)_
- `setWebhookUrlToken(s As String)` _(public)_
- `setWebhookUrl(s As String)` _(public)_
- `setStatusInstanceWebhook(s As String)` _(public)_
- `setStateWebhook(s As String)` _(public)_
- `setProxyInstance(s As String)` _(public)_
- `setPollMessageWebhook(s As String)` _(public)_
- `setOutgoingWebhook(s As String)` _(public)_
- `setOutgoingMessageWebhook(s As String)` _(public)_
- `setOutgoingAPIMessageWebhook(s As String)` _(public)_
- `setMarkIncomingMessagesReadedOnReply(s As String)` _(public)_
- `setMarkIncomingMessagesReaded(s As String)` _(public)_
- `setKeepOnlineStatus(s As String)` _(public)_
- `setIncomingWebhook(s As String)` _(public)_
- `setIncomingCallWebhook(s As String)` _(public)_
- `setIncomingBlockWebhook(s As String)` _(public)_
- `setDeviceWebhook(s As String)` _(public)_
- `setDelaySendMessagesMilliseconds(s As Int)` _(public)_
- `setApiUrl(s As String)` _(public)_
- `setMediaUrl(s As String)` _(public)_
## Getters (25)
- `getPhoneNumber()` As Long _(public)_
- `getDeviceID()` As String _(public)_
- `getEditedMessageWebhook()` As String _(public)_
- `getDeletedMessageWebhook()` As String _(public)_
- `getWebhookUrlToken()` As String _(public)_
- `getWebhookUrl()` As String _(public)_
- `getStatusInstanceWebhook()` As String _(public)_
- `getStateWebhook()` As String _(public)_
- `getProxyInstance()` As String _(public)_
- `getPollMessageWebhook()` As String _(public)_
- `getOutgoingWebhook()` As String _(public)_
- `getOutgoingMessageWebhook()` As String _(public)_
- `getOutgoingAPIMessageWebhook()` As String _(public)_
- `getMarkIncomingMessagesReadedOnReply()` As String _(public)_
- `getMarkIncomingMessagesReaded()` As String _(public)_
- `getKeepOnlineStatus()` As String _(public)_
- `getIncomingWebhook()` As String _(public)_
- `getIncomingCallWebhook()` As String _(public)_
- `getIncomingBlockWebhook()` As String _(public)_
- `getDeviceWebhook()` As String _(public)_
- `getDelaySendMessagesMilliseconds()` As Int _(public)_
- `getWid()` As String _(public)_
- `getMediaUrl()` As String _(public)_
- `getApiUrl()` As String _(public)_
- `getAvatar()` As String _(public)_
## Private Methods (0)
_(none)_
## Emits (daisyUI classes pushed in DesignerCreateView)
_(none emitted directly — relies on base/CustProps)_
## Code Example
```b4j
Dim helper As BANanoGreenAPI
helper.Initialize(Callback As Object, EventName As String, myIdInstance As String, myApiTokenInstance As String)
```
## Composes With
- Call from SDUI5 page/component event handlers.


