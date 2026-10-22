# SithasoDaisy5 — Glossary

Terms, engine API, and framework vocabulary. `(C = component, S = shell/static)`.

## Framework core

- **BANano** — B4J library that transpiles B4J classes to JS at build; the runtime is the browser. Entry `BANano_Ready`. Build via `BANano.BuildAsB4xlib(version)`.
- **.b4xlib** — the packaged B4J library artifact (SithasoDaisy5 v57.17).
- **UIShared** — external DOM-engine class (`C:\b4j\shared\UIShared`); every component holds `Public UI As UIShared`. All class/style/attr/event/asset ops route here.
- **modSD5** — static code module: helpers (`CStr/CInt/CleanID/Val/PadRight`), `ColorMap`, `Months`/`Days`/`Countries`/`Languages`, global `#if css`.
- **SDUI5App** — app shell class; initializes `#body`, loader, maps, listeners, toast, Swal, drawers, themes, `UsesX` loaders. (S)
- **SDUI5Component** — base class every component extends via the skeleton contract; 18 base props (ParentID, TagName, Text, Visible, Enabled, Position*, Margin/PaddingAXYTBLR, RawClasses/Styles/Attributes, Height/Width/TextSize/BackgroundImage). (C)

## The skeleton contract (per component)

- **Initialize(Callback, Name, EventName)** — `UI.Initialize(Me)`, set `mCallBack/mName/mEventName`, `CustProps.Initialize`, `SetDefaults`.
- **SetDefaults** — seed `CustProps` map with default values for every designer prop.
- **DesignerCreateView(Target, Props)** — INTERNAL mount logic (not called from app code): read Props → push daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT` → build `[BANCLEAN]<tag id="{name}">…` → `mTarget.Append(...).Get("#"+name)` → wire `UI.OnEvent`.
- **AddComponent** — the app-facing mount call: resolves `"#" & sParentID`, then calls DesignerCreateView internally. App pattern: `x.ParentID = "host" : BANano.Await(x.AddComponent)`.
- **setX/getX** — live DOM mutation/reads via `UI.*ByID("{name}_child")`.
- **Remove** — `mElement.remove` + `BANano.SetMeToNull`.
- **CustProps** — `Map` holding current property values; the serialization surface for designer props.
- **#DesignerProperty** — B4J attribute declaring a designer-visible prop (`Key, DisplayName, FieldType, DefaultValue, Description, List`). Parsed by the extractor into per-component prop tables.
- **#Event** — B4J attribute declaring an event the component raises (e.g. `#Event: Click (e As BANanoEvent)`); handler in parent = `Sub ${mEventName}_<event>(e As BANanoEvent)`.
- **mElement / mTarget / mName / mEventName / mCallBack** — standard privates across all components.
- **Tag** — generic `Object` slot on every component for user payload.
- **getHere()** — returns `"#"+mName`; the CSS selector for the component root.

## UIShared API surface (the engine — most-used methods)

- **Class/style/attr**: `AddClass(el,c)`, `RemoveClass(el,c)`, `SetClasses(el,s)`, `AddColorDT(prefix,color)` / `SetColor(el,kind,prefix,color)`, `AddRoundedDT(s)`, `AddShadowDT(s)`, `AddHeightDT/AddWidthDT(s)`, `AddTextSizeDT(s)`, `AddBackgroundImageDT(s)`, `SetStyle(el,k,v)`, `SetStyles(el,s)`, `AddStyleMap(el,m)`, `SetAttr(el,k,v)`, `AddAttrMap(el,m)`, `RemoveAttr(el,k)`, `SetAttributes(el,s)`, `AddDataAttr(el,k,v)`.
- **ByID helpers**: `*ByID("{id}", ...)` variants — `SetVisibleByID`, `SetTextByID`, `SetColorByID`, `SetTextColorByID`, `SetSizeByID`, `SetRounded`, `SetShadow`, `SetWidthByID`, `SetHeightByID`, `SetIconNameByID`, `SetIconColorByID`, `ResizeIconByID`, `SizeIconByID`, `RemoveElementByID`, `ClearByID`, `SetCheckedByID`, `GetCheckedByID`, `UpdateClassByID`, `UpdateClass(mElement,"size","btn-md")`.
- **Build (design-time, pushed before DCV append)**: `AddClassDT`, `AddColorDT`, `AddRoundedDT`, `AddShadowDT`, `AddHeightDT`, `AddWidthDT`, `AddTextSizeDT`, `AddBackgroundImageDT`, then `BuildExClass()` / `BuildExStyle()` / `BuildExAttributes()` → injected into the `[BANCLEAN]` template.
- **Props**: `SetProps(PropsMap)`, `ExcludeTextColor`, `ExcludeBackgroundColor`.
- **Events**: `OnEvent(el, type, callback, handlerName)`, `OnEventByID(id, type, callback, handlerName)`, `Trigger(el, event, params)`.
- **Assets**: `LoadAssetsOnDemand(group, files List)` — lazy JS/CSS load; wrapped by `app.UsesX`.
- **Utilities**: `CBool(o)`, `CStr(o)`, `CleanID(s)`, `Join(sep, list)`, `mvfield(s, n, delim)`, `SetVisible/SetEnabled/SetPosition/SetMarginAXYTBLR/SetPaddingAXYTBLR`, `ResponsiveClass(el, className, xs, sm, md, lg)`.
- **HTML**: `Append(el, html)`, `SetHTML(el, html)`, `SetText(el, t)`, `GetTextByID(id)`, `SetImage(el, src)`.

## Props / layout vocabulary

- **ParentID** — id (no `#`) of the host element; `setParentID` cleans it via `UI.CleanID`.
- **TagName** — the HTML tag to emit (default `div`); buttons override to `button`, modals to `dialog`, etc.
- **MarginAXYTBLR / PaddingAXYTBLR** — `a=?;x=?;y=?;t=?;b=?;l=?;r=?` string → Tailwind `m-*`/`p-*` utilities (a=all, x=left-right, y=top-bottom, then individuals).
- **PositionStyle** — `none|static|relative|fixed|absolute|sticky`; **Position** — `t=?;b=?;r=?;l=?`.
- **RawClasses / RawStyles / RawAttributes** — escape hatch for arbitrary Tailwind classes, inline styles (JSON `k=v;`), attributes (JSON).
- **ReadMe** — a designer-only prop some components use to document child id slots (e.g. Modal `_box|_title|_form|_action`).

## Theming & assets

- **data-theme** — daisyUI theme attribute on `<html>`; set via `app.SetTheme(name)`.
- **UsesX** — `SDUI5App` lazy-loader subs (`UsesPocketBase`, `UsesExcel`, `UsesQuill`, `UsesLeaflet`, `UsesDatePicker`, `UsesKanBan`, `UsesSignaturePad`, `UsesQRCode`, `UsesBarCodeReader`, `UsesDropZone`, `UsesVideoAudioPlayer`, `UsesOfficeRibbon`, `UsesCode`, `UsesMarkDownEditor`, `UsesLottiePlayer`, `UsesSQLiteBrowser`, `UsesHTMLParser`, `UsesDocxTemplate`, `UsesB4JConverter`, `UsesLZCompressString`, `UsesPivot`, `UsesTreeSpider`, `UsesWhatsApp`, `UsesColorWheel`, `UsesDevices`, `UsesGifPlayer`, `UsesBottomNavigation`, `UsesSlider`, `UsesNoUISlider`, `UsesJQuery`, `UsesEnjoyHint`, `UsesFontAwesome`, `UsesGenderChart`). Each calls `UI.LoadAssetsOnDemand`.
- **AddJavascriptFileForLater / AddCSSFileForLater** — BANano header registration for lazy assets in `SithasoDaisy5.b4j`; counterpart to eager `AddJavascriptFile`/`AddCSSFile`.

## Validation / forms

- **Validator** — prop on `SDUI5Label/Label1/CheckBox/FileInput/MultiSelect` naming a validation rule (e.g. `"email"`); enforced by the framework form machinery.
- **Required** — boolean prop driving required-attribute + form-submit gating.
- **SDUI5Form** — emits `Submit` event; iterate children / read values in `Sub frm_submit`.

## Misc components worth naming

- **SDUI5Swal** — SweetAlert2 wrapper (0 designer props; driven via code: `swal.title(...).icon(...).fire`). (S)
- **SDUI5MDToast** — material-design toast used by `app.ShowToast*`. (S)
- **SDUI5Page** — a page surface (`glass, container, mx-auto, flex`); one per BANano page.
- **SDUI5Preferences** — key/value settings panels (`card, card-border`).
- **SDUI5ContextMenu** — right-click menu; fires `ItemClick`.
- **SDUI5Hover3D / SDUI5HoverGallery** — interaction effects.
- **SDUI5TextRotate** — rotating text marquee (`textrotate`).
- **SDUI5Diff** — before/after image slider (`diff`).
- **SDUI5SpeedDial / SDUI5FAB** — floating action buttons.
- **SDUI5OfficeRibbon** — Microsoft-style ribbon (needs `UsesOfficeRibbon`).
- **SDUI5Client** — connectivity helper. (S)
- **SDUIRestApi / SDUIMySQLREST / SDUIMySQLRESTNative / SDUIGoogleSheetsAPI / SDUIPocketBase / SDUIPouchDB** — backend helpers. (S)
