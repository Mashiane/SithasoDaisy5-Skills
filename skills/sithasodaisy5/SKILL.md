---
name: sithasodaisy5
description: SithasoDaisy5 — B4J/BANano component library (daisyUI + Tailwind) transpiled to JS. Use when building web apps/UIs with SithasoDaisy5 components in B4J/BANano, when you need a component's designer properties, events, setters, emitted daisyUI classes, or the app scaffold (SDUI5App), theme system, UsesX lazy-loaders, or the SDUI5Component skeleton contract. Produces B4J `.bas` code that calls the framework; never raw HTML.
---

# SithasoDaisy5

**Kind**: B4J/BANano UI framework (transpiles to JS) | **Registered UI components**: 139 | **Registered support modules**: 20 | **Source**: [SithasoDaisy5 GitHub repository](https://github.com/Mashiane/SithasoDaisy5) (local checkout: `C:\b4j\workspace\0SithasoDaisy5`) | **Last refreshed**: 2026-10-10 from the current framework registry/source snapshot

## How to Use This Skill

- **Without arguments** — load the core mental model + skeleton contract below.
- **With a component name** — ask `SDUI5Button` or `modal`; I read `components/<Name>.md` and answer props/events/setters/emitted-classes/usage.
- **With a goal** — "build a login form", "make a dashboard"; I compose components per `patterns.md`.
- **Browse** — "which components do X?" → I use the Component/Topic Index below.

When you ask about a component not in Core below, I read its `components/<Name>.md` before answering. Per-component files are **on-demand** — they don't cost tokens until loaded.

---

## Core Mental Model

SithasoDaisy5 is a **daisyUI + Tailwind** wrapper shipped as a B4J `.b4xlib`. You write B4J classes (`.bas`); BANano transpiles them to JS at build (`BANano.BuildAsB4xlib` in `SithasoDaisy5.b4j`). The runtime is the browser. **Output is B4J/BANano code that drives the framework — never raw HTML.**

### The Skeleton Contract (every component shares this)

```
Initialize(Callback, Name, EventName)   ' sets mCallBack/mName/mEventName, UI.Initialize(Me), SetDefaults
ParentID (property / setParentID)        ' attach point in the DOM
AddComponent                             ' resolves "#ParentID" then calls DesignerCreateView internally — THE app-facing mount call
DesignerCreateView(Target, Props)        ' INTERNAL — parse CustProps → push daisyUI classes via UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT → append [BANCLEAN]<tag id="{name}">… → UI.OnEvent. Never call from app code.
setX(value) / getX                       ' live DOM mutation via UI.*ByID("{name}_child")
Remove()                                 ' mElement.remove + BANano.SetMeToNull
```

**To use a component** (the ONLY app pattern — every demo page does this, `DesignerCreateView` is never called explicitly): `Dim x As SDUI5X : x.Initialize(Me,"x","x") : x.ParentID = "host" : x.setText("...") ' props before AddComponent are baked in via CustProps : BANano.Await(x.AddComponent)`. Setters after `AddComponent` mutate the live DOM. Then wire events as `Sub x_click(e As BANanoEvent)` (handler = `${mEventName}_<event>`).

### The Three Layers

1. **modSD5.bas** — static helpers (`CStr`, `CInt`, `CleanID`, `Val`, `PadRight`), `ColorMap`, `Months`/`Days`/`Countries`/`Languages`, global `#if css` (scrollbar-gutter, `.input-group`, `.flatpickr-wrapper`).
2. **UIShared (external, `C:\b4j\shared\UIShared`)** — the DOM engine every component holds as `Public UI As UIShared`. All `UI.AddClassDT/BuildExClass/SetColor/OnEvent/LoadAssetsOnDemand` route here. Single source of truth for class/style/attr assembly.
3. **SDUI5App.bas** — app shell. Initializes `#body`, loader, color/month/day maps, online/offline + dark-mode media listeners, toast (`SDUI5MDToast`), Swal wrappers, drawer helpers, theme application (`html data-theme=`), 35+ daisyUI theme constants, and `UsesX` lazy-loaders (`UsesPocketBase`, `UsesExcel`, `UsesQuill`, `UsesLeaflet`, `UsesDatePicker`, `UsesKanBan`, `UsesSignaturePad`, `UsesQRCode`, `UsesVideoAudioPlayer`, `UsesOfficeRibbon`, …) calling `UI.LoadAssetsOnDemand`.

### Styling Strategy

daisyUI component classes (`btn`, `card`, `modal`, `alert`, `tabs`, `menu`, `drawer`, `badge`, `avatar`, `collapse`,`, `join`, `dock`, `stats`, `timeline`, `hero`, `footer`, `navbar`, `carousel`, `diff`, `kbd`, `progress`, `radial-progress`, `skeleton`, `tooltip`, `swap`, `countdown`, `divider`, `indicator`, `stack`, `mockup-*`) + Tailwind utilities + responsive prefixes (`lg:`/`md:`/`sm:`/`xl:`), all generated from B4J designer properties and the `CustProps` map. No custom CSS.

Prefer a matching typed designer property over an equivalent utility in `.Classes` (for example, `FontWeight`, `Opacity`, `TextAlign`, `Shadow`, `Width`/`Height`, `MarginAXYTBLR`, or `PaddingAXYTBLR` when the exact component exposes it). Keep responsive utilities, inner-region styling, and utilities without a matching property in their appropriate class property. See [patterns.md §P4b](patterns.md#p4b--shared-layout-and-raw-styling-properties) and [component-creation-patterns.md](component-creation-patterns.md#prefer-matching-designer-properties-to-utility-classes).

### Theming

`app.SetTheme("dark")` → sets `html data-theme=`. 35+ themes defined as constants in SDUI5App (`THEME_LIGHT`, `THEME_DARK`, `THEME_CUPCAKE`, `THEME_SYNTHWAVE`, `THEME_DRACULA`, `THEME_NORD`, `THEME_ABYSS`, `THEME_SILK`, …). Colors: `COLOR_PRIMARY/SECONDARY/ACCENT/NEUTRAL/INFO/SUCCESS/WARNING/ERROR/GHOST` + palette (`COLOR_EMERALD`, `COLOR_SKY`, `COLOR_ROSE`, …) with intensities `INTENSITY_50…900`. **Color properties are component-specific**; use the exact Designer Properties list and [color channel guide](references/design-tokens.md#11-color-channels) before assigning a value.

### Asset Registration

External JS/CSS lives in `Files/` (252 assets) and is registered in `SithasoDaisy5.b4j` via `BANano.Header.AddJavascriptFile[ForLater]` / `AddCSSFile[ForLater]`. "For later" = lazy via the matching `UsesX` call in SDUI5App at runtime.

### Icon & Image Asset References (STRICT)

**Every icon/image property that points at a file under `assets/` MUST use the full relative path `./assets/<name>.svg` (extension included).** Bare names or extension-only values (e.g. `LeftIcon = "log-in"`, `LeftIcon = "log-in.svg"`, `LeftIcon = "mail"`) are **forbidden** — the `SVGRenderer` fetches the literal string as a URL, so a missing `./assets/` prefix or extension produces a 404 and the button renders `"Failed to load SVG ..."` instead of the icon. Always write `LeftIcon = "./assets/log-in.svg"`, `Image = "./assets/addfolder.svg"`. This applies to `LeftIcon`, `RightIcon`, `Image`, `RightImage`, and any asset-path property. When an icon name has no matching file in `assets/`, pick an existing one (e.g. `"./assets/door-open-solid.svg"`) or add the file — never drop the `./assets/` prefix or the extension.

### Verified Demo Usage and Source References

  Every registered component skill carries a direct **Framework Source** link to its `.bas` implementation in the public repository. That link is read-only reference: applications consume the SithasoDaisy5 `.b4xlib`; do not add the raw framework `.bas` file to an app project.

  Component skills also carry **Demo References** to B4J page modules in the [same GitHub repository](https://github.com/Mashiane/SithasoDaisy5/tree/main/03.%20Source%20Code/SithasoDaisy5DemoCode/B4J) where the component type was detected, plus reusable B4J code excerpts when an exact usage pattern was verified. A type match is a navigation aid, not proof of construction or behavior; inspect the linked page before making a usage claim. Use the skill’s copyable excerpt when composing a new app. Full demo pages remain in the GitHub repository and are not copied into this skill package.

  **Use the GitHub source when the installed skill is not enough:** open the component’s Framework Source to verify its current API and the linked demo page to inspect a complete real usage flow. For page reproduction, read the whole page module and trace its referenced helper modules, app shell, assets, and data; do not infer missing behavior from the component type match. Treat the repository as source evidence and keep the app-facing API grounded in the component skill and `.b4xlib` contract.

- **Reproduce a component pattern:** use its code block and preserve the demonstrated setup order, `BANano.Await` boundaries, event signatures, and source-specific member names.
- **Create a new app:** use the app/page scaffold and compose from the component skills. Architecture diagrams express design intent; they are not copy-ready B4J or evidence that a demo implements the exact layout.
- A demo page name is evidence only when its source excerpt actually demonstrates the claimed usage. A type declaration or text match alone does not prove a property, event, or behavior.
- If the demo source depends on an unavailable helper module, keep that dependency explicit and do not claim the example builds independently.

### Sourcing Icons (Iconify, MIT/free only)

When an app needs an icon that is not already in `assets/`, source it from **Iconify** (https://iconify.design) or **Iconstack** (https://iconstack.io), preferring the **Tabler** icon set (`tabler` prefix). The Tabler source repo is https://github.com/tabler/tabler-icons (browse/search SVGs there; license MIT). Iconstack aggregates 50,000+ icons from 21 MIT-licensed libraries (Tabler, Lucide, Phosphor, Material, Remix, Bootstrap, etc.) and exposes a free search API + MCP (https://iconstack.io/api). Workflow:
1. Search Iconify (e.g. `https://api.iconify.design/search?query=mail&prefix=tabler`) or Iconstack (https://iconstack.io) or browse the Tabler repo (https://github.com/tabler/tabler-icons/tree/master/icons).
2. **Check the collection's license before adding** — only use sets licensed **MIT** or otherwise completely free for commercial use (Tabler is MIT). Reject sets with restrictive/non-commercial licenses.
3. Download the SVG into the app's `Files/` folder (BANano publishes `Files/` → `assets/` at build time, so dropping it in `Files/` alone is enough; you may also copy it to the published `assets/` folder to verify), e.g. `https://api.iconify.design/tabler/mail.svg` → `Files/mail.svg`.
4. Reference the local file with its extension in code: `LeftIcon = "mail.svg"`. Never hotlink the Iconify URL at runtime — always ship the SVG locally.

---

## Component Index

Use the per-component **Designer Properties** table for both the designer key
and its actual setter/getter method names. A `—` means that component does not
declare a named accessor for that side; it does not imply that the designer
value is ignored at creation time. See [the complete accessor audit](references/designer-property-accessors.md)
for all 3,636 properties, missing accessors, and keys whose methods use a
different name. Preserve those source API names in app code; do not infer
`set<Key>` or `get<Key>` when the table shows another name.

| Component | Props | Events | Key daisyUI classes emitted |
|---|---:|---:|---|
| [SDUI5Accordion](components/SDUI5Accordion.md) | 17 | 1 | join join-vertical |
| [SDUI5AdvancedCheckGroup](components/SDUI5AdvancedCheckGroup.md) | 26 | 1 | — |
| [SDUI5Alert](components/SDUI5Alert.md) | 27 | 1 | alert, alert-dash, alert-outline, alert-soft |
| [SDUI5App](components/SDUI5App.md) | 0 | 8 | — |
| [SDUI5Aura](components/SDUI5Aura.md) | 14 | 1 | aura |
| [SDUI5Avatar](components/SDUI5Avatar.md) | 37 | 1 | avatar, chat-image, rounded-field, avatar-placeholder |
| [SDUI5AvatarGroup](components/SDUI5AvatarGroup.md) | 14 | 0 | — |
| [SDUI5Badge](components/SDUI5Badge.md) | 41 | 3 | badge flex-nowrap inline-flex items-center, badge-dash, badge-ghost, badge-outline |
| [SDUI5BankCard](components/SDUI5BankCard.md) | 25 | 1 | card |
| [SDUI5BarCode](components/SDUI5BarCode.md) | 31 | 1 | — |
| [SDUI5BarcodeReader](components/SDUI5BarcodeReader.md) | 21 | 3 | — |
| [SDUI5BasicLabel](components/SDUI5BasicLabel.md) | 46 | 0 | — |
| [SDUI5BottomDrawer](components/SDUI5BottomDrawer.md) | 14 | 0 | z-99 |
| [SDUI5BottomNavigation](components/SDUI5BottomNavigation.md) | 16 | 1 | — |
| [SDUI5BreadCrumbs](components/SDUI5BreadCrumbs.md) | 14 | 0 | breadcrumbs |
| [SDUI5Browser](components/SDUI5Browser.md) | 14 | 0 | mockup-browser border-base-300 border |
| [SDUI5Button](components/SDUI5Button.md) | 74 | 1 | join-item, dock-active, btn-active, rounded-field |
| [SDUI5Card](components/SDUI5Card.md) | 47 | 0 | card, card-border, card-dash, image-full |
| [SDUI5Carousel](components/SDUI5Carousel.md) | 24 | 0 | carousel, rounded-box |
| [SDUI5CarouselItem](components/SDUI5CarouselItem.md) | 22 | 0 | carousel-item, relative |
| [SDUI5ChatBubble](components/SDUI5ChatBubble.md) | 23 | 0 | chat |
| [SDUI5ChatItem](components/SDUI5ChatItem.md) | 26 | 1 | list-row flex items-center gap-3 p-2 hover:bg-base-200 cursor-pointer wa-sidebar-chat, rounded-box |
| [SDUI5CheckBox](components/SDUI5CheckBox.md) | 37 | 1 | — |
| [SDUI5CheckBoxGroup](components/SDUI5CheckBoxGroup.md) | 29 | 1 | fieldset, border, rounded-box |
| [SDUI5Client](components/SDUI5Client.md) | 0 | 0 | — |
| [SDUI5Code](components/SDUI5Code.md) | 27 | 4 | rounded-box |
| [SDUI5Collapse](components/SDUI5Collapse.md) | 34 | 0 | collapse, border, join-item |
| [SDUI5Column](components/SDUI5Column.md) | 44 | 0 | p-2 |
| [SDUI5Component](components/SDUI5Component.md) | 18 | 0 | — |
| [SDUI5Container](components/SDUI5Container.md) | 40 | 0 | max-w-[100vw] px-6 pb-16 xl:pe-2 relative, container, container-fluid, container-lg |
| [SDUI5ContextMenu](components/SDUI5ContextMenu.md) | 21 | 1 | — |
| [SDUI5Conversation](components/SDUI5Conversation.md) | 23 | 1 | — |
| [SDUI5CountDown](components/SDUI5CountDown.md) | 12 | 0 | countdown |
| [SDUI5DatePickerTimeLine](components/SDUI5DatePickerTimeLine.md) | 31 | 1 | carousel rounded-box gap-1 |
| [SDUI5Device](components/SDUI5Device.md) | 14 | 0 | device |
| [SDUI5Diff](components/SDUI5Diff.md) | 25 | 0 | diff aspect-16/9, rounded-box |
| [SDUI5Divider](components/SDUI5Divider.md) | 16 | 0 | divider |
| [SDUI5Dock](components/SDUI5Dock.md) | 13 | 0 | dock |
| [SDUI5Drawer](components/SDUI5Drawer.md) | 29 | 1 | drawer, lg:drawer-open, md:drawer-open, drawer-open |
| [SDUI5DrawerUser](components/SDUI5DrawerUser.md) | 15 | 2 | flex justify-between items-center p-2 |
| [SDUI5DropDown](components/SDUI5DropDown.md) | 13 | 0 | dropdown, dropdown-hover, dropdown-open |
| [SDUI5DropZone](components/SDUI5DropZone.md) | 24 | 1 | rounded-box, dropzone flex flex-wrap justify-center items-center |
| [SDUI5EasyMDE](components/SDUI5EasyMDE.md) | 12 | 0 | — |
| [SDUI5EmojiMart](components/SDUI5EmojiMart.md) | 21 | 2 | — |
| [SDUI5EnjoyHint](components/SDUI5EnjoyHint.md) | 0 | 3 | — |
| [SDUI5ExcelReport](components/SDUI5ExcelReport.md) | 0 | 0 | — |
| [SDUI5Fab](components/SDUI5Fab.md) | 19 | 0 | — |
| [SDUI5FAIconPicker](components/SDUI5FAIconPicker.md) | 18 | 2 | — |
| [SDUI5FieldSet](components/SDUI5FieldSet.md) | 24 | 0 | fieldset, border, rounded-box |
| [SDUI5FileInput](components/SDUI5FileInput.md) | 35 | 1 | — |
| [SDUI5Filter](components/SDUI5Filter.md) | 25 | 1 | w-full |
| [SDUI5Footer](components/SDUI5Footer.md) | 17 | 0 | footer, footer-center |
| [SDUI5FooterTitle](components/SDUI5FooterTitle.md) | 12 | 0 | footer-title |
| [SDUI5Form](components/SDUI5Form.md) | 19 | 1 | — |
| [SDUI5FullCalendar](components/SDUI5FullCalendar.md) | 43 | 11 | — |
| [SDUI5GenderChart](components/SDUI5GenderChart.md) | 25 | 0 | — |
| [SDUI5GoogleAdSense](components/SDUI5GoogleAdSense.md) | 18 | 0 | adsbygoogle |
| [SDUI5GroupSelect](components/SDUI5GroupSelect.md) | 28 | 1 | fieldset, border, rounded-box |
| [SDUI5Hero](components/SDUI5Hero.md) | 31 | 0 | hero |
| [SDUI5Hover3D](components/SDUI5Hover3D.md) | 15 | 1 | — |
| [SDUI5HoverGallery](components/SDUI5HoverGallery.md) | 15 | 0 | hover-gallery |
| [SDUI5Image](components/SDUI5Image.md) | 31 | 1 | bg-cover, bg-center, bg-no-repeat, rounded-box |
| [SDUI5Indicator](components/SDUI5Indicator.md) | 9 | 0 | indicator |
| [SDUI5InfoCard](components/SDUI5InfoCard.md) | 29 | 1 | cursor-pointer pl-0 rounded-box, cursor-pointer relative rounded-box shadow-md |
| [SDUI5Join](components/SDUI5Join.md) | 11 | 0 | join, grid |
| [SDUI5JsonEditor](components/SDUI5JsonEditor.md) | 24 | 7 | — |
| [SDUI5JsonTree](components/SDUI5JsonTree.md) | 20 | 0 | — |
| [SDUI5KanBan](components/SDUI5KanBan.md) | 21 | 13 | — |
| [SDUI5Kbd](components/SDUI5Kbd.md) | 12 | 0 | kbd |
| [SDUI5Label](components/SDUI5Label.md) | 29 | 0 | floating-label |
| [SDUI5Leaflet](components/SDUI5Leaflet.md) | 30 | 50 | — |
| [SDUI5Link](components/SDUI5Link.md) | 22 | 1 | link, link-hover |
| [SDUI5List](components/SDUI5List.md) | 16 | 0 | list, rounded-box |
| [SDUI5ListItem](components/SDUI5ListItem.md) | 18 | 0 | cursor-pointer, list-row |
| [SDUI5Loading](components/SDUI5Loading.md) | 13 | 0 | loading |
| [SDUI5LottiePlayer](components/SDUI5LottiePlayer.md) | 21 | 0 | — |
| [SDUI5MDToast](components/SDUI5MDToast.md) | 0 | 0 | — |
| [SDUI5MegaMenu](components/SDUI5MegaMenu.md) | 15 | 1 | megamenu |
| [SDUI5Menu](components/SDUI5Menu.md) | 52 | 2 | menu, flex-nowrap, overflow-y-auto, dropdown |
| [SDUI5MenuItem](components/SDUI5MenuItem.md) | 45 | 0 | menu-active, menu-focus |
| [SDUI5Modal](components/SDUI5Modal.md) | 59 | 7 | card, card-border, card-dash, rounded-box |
| [SDUI5MultiSelect](components/SDUI5MultiSelect.md) | 56 | 4 | — |
| [SDUI5NavBar](components/SDUI5NavBar.md) | 50 | 9 | navbar justify-center, glass, sticky |
| [SDUI5NoUISlider](components/SDUI5NoUISlider.md) | 50 | 3 | — |
| [SDUI5OfficeRibbon](components/SDUI5OfficeRibbon.md) | 19 | 8 | — |
| [SDUI5OTP](components/SDUI5OTP.md) | 13 | 1 | — |
| [SDUI5Page](components/SDUI5Page.md) | 49 | 0 | glass, container, mx-auto, flex |
| [SDUI5Panel](components/SDUI5Panel.md) | 59 | 0 | grow, shrink, flex, grid |
| [SDUI5PDFViewer](components/SDUI5PDFViewer.md) | 15 | 1 | — |
| [SDUI5Phone](components/SDUI5Phone.md) | 16 | 0 | mockup-phone |
| [SDUI5Pivot](components/SDUI5Pivot.md) | 15 | 0 | — |
| [SDUI5Preferences](components/SDUI5Preferences.md) | 63 | 22 | card, card-border, w-full bg-base-100 |
| [SDUI5Progress](components/SDUI5Progress.md) | 37 | 0 | — |
| [SDUI5QRCode](components/SDUI5QRCode.md) | 21 | 1 | rounded-box |
| [SDUI5QuillEditor](components/SDUI5QuillEditor.md) | 13 | 1 | — |
| [SDUI5RadialProgress](components/SDUI5RadialProgress.md) | 17 | 0 | radial-progress |
| [SDUI5Radio](components/SDUI5Radio.md) | 25 | 1 | — |
| [SDUI5RadioGroup](components/SDUI5RadioGroup.md) | 28 | 1 | fieldset, border, rounded-box |
| [SDUI5Range](components/SDUI5Range.md) | 31 | 1 | — |
| [SDUI5Rating](components/SDUI5Rating.md) | 30 | 1 | — |
| [SDUI5Row](components/SDUI5Row.md) | 38 | 0 | grid |
| [SDUI5Segment](components/SDUI5Segment.md) | 21 | 1 | tabs tabs-box inline-flex flex-nowrap whitespace-nowrap |
| [SDUI5Select](components/SDUI5Select.md) | 42 | 3 | — |
| [SDUI5SignaturePad](components/SDUI5SignaturePad.md) | 33 | 1 | — |
| [SDUI5Skeleton](components/SDUI5Skeleton.md) | 14 | 0 | skeleton, shrink |
| [SDUI5Slider](components/SDUI5Slider.md) | 23 | 2 | — |
| [SDUI5SliderItem](components/SDUI5SliderItem.md) | 15 | 0 | jcarousel-item |
| [SDUI5SpeedDial](components/SDUI5SpeedDial.md) | 30 | 0 | fab flex!, fab-flower |
| [SDUI5Stack](components/SDUI5Stack.md) | 13 | 0 | stack |
| [SDUI5Stat](components/SDUI5Stat.md) | 21 | 0 | stats overflow-hidden, border, rounded-box |
| [SDUI5StatItem](components/SDUI5StatItem.md) | 31 | 0 | stat, place-items-center, rounded-box |
| [SDUI5Status](components/SDUI5Status.md) | 17 | 0 | status, indicator-item |
| [SDUI5Steps](components/SDUI5Steps.md) | 25 | 1 | rounded-box |
| [SDUI5StepsItem](components/SDUI5StepsItem.md) | 14 | 0 | step |
| [SDUI5Svg](components/SDUI5Svg.md) | 24 | 1 | — |
| [SDUI5Swal](components/SDUI5Swal.md) | 0 | 0 | — |
| [SDUI5Swap](components/SDUI5Swap.md) | 25 | 1 | — |
| [SDUI5Swiper](components/SDUI5Swiper.md) | 61 | 1 | swiper |
| [SDUI5SwiperSlide](components/SDUI5SwiperSlide.md) | 19 | 2 | swiper-slide |
| [SDUI5Table](components/SDUI5Table.md) | 96 | 50 | card card-border w-full bg-base-100 |
| [SDUI5Tabs](components/SDUI5Tabs.md) | 22 | 1 | tabs whitespace-nowrap |
| [SDUI5TabsItem](components/SDUI5TabsItem.md) | 23 | 0 | tab-active, tab flex items-center justify-center gap-2 relative |
| [SDUI5Text](components/SDUI5Text.md) | 46 | 6 | — |
| [SDUI5TextArea](components/SDUI5TextArea.md) | 45 | 4 | — |
| [SDUI5TextBox](components/SDUI5TextBox.md) | 66 | 7 | — |
| [SDUI5TextRotate](components/SDUI5TextRotate.md) | 16 | 0 | text-rotate |
| [SDUI5Timeline](components/SDUI5Timeline.md) | 17 | 0 | timeline, timeline-compact, timeline-snap-con |
| [SDUI5TimelineItem](components/SDUI5TimelineItem.md) | 25 | 0 | — |
| [SDUI5Toast](components/SDUI5Toast.md) | 3 | 0 | toast |
| [SDUI5ToastChart](components/SDUI5ToastChart.md) | 36 | 0 | rounded-box |
| [SDUI5Toggle](components/SDUI5Toggle.md) | 31 | 1 | — |
| [SDUI5ToolTip](components/SDUI5ToolTip.md) | 8 | 0 | tooltip, tooltip-open |
| [SDUI5TreeSpider](components/SDUI5TreeSpider.md) | 29 | 0 | — |
| [SDUI5TreeView](components/SDUI5TreeView.md) | 36 | 10 | menu, overflow-y-auto |
| [SDUI5TrendChart](components/SDUI5TrendChart.md) | 49 | 0 | — |
| [SDUI5VideoPlayer](components/SDUI5VideoPlayer.md) | 31 | 0 | rounded-box |
| [SDUI5WhatsApp](components/SDUI5WhatsApp.md) | 34 | 12 | flex overflow-hidden shadow-sm rounded-box w-full h-full |
| [SDUI5Window](components/SDUI5Window.md) | 13 | 0 | mockup-window border-base-300 border |
| [SDUI5Wizard](components/SDUI5Wizard.md) | 30 | 1 | card |

_Total: 139 registered `SDUI5*` UI classes._

## Registered Support Modules (20)

| Module | Reference |
|---|---|
| BANanoAnimeJS | [components/BANanoAnimeJS.md](components/BANanoAnimeJS.md) |
| BANanoAnimeJSItem | [components/BANanoAnimeJSItem.md](components/BANanoAnimeJSItem.md) |
| BANanoAnimeJSTimeLine | [components/BANanoAnimeJSTimeLine.md](components/BANanoAnimeJSTimeLine.md) |
| BANanoGreenAPI | [components/BANanoGreenAPI.md](components/BANanoGreenAPI.md) |
| modSD5 | [components/modSD5.md](components/modSD5.md) |
| SDUIDocxTemplator | [components/SDUIDocxTemplator.md](components/SDUIDocxTemplator.md) |
| SDUIExcel | [components/SDUIExcel.md](components/SDUIExcel.md) |
| SDUIFetch | [components/SDUIFetch.md](components/SDUIFetch.md) |
| SDUIGoogleSheetsAPI | [components/SDUIGoogleSheetsAPI.md](components/SDUIGoogleSheetsAPI.md) |
| SDUIJSONQuery | [components/SDUIJSONQuery.md](components/SDUIJSONQuery.md) |
| SDUILocalStorage | [components/SDUILocalStorage.md](components/SDUILocalStorage.md) |
| SDUIMap | [components/SDUIMap.md](components/SDUIMap.md) |
| SDUIMySQLREST | [components/SDUIMySQLREST.md](components/SDUIMySQLREST.md) |
| SDUIMySQLRESTNative | [components/SDUIMySQLRESTNative.md](components/SDUIMySQLRESTNative.md) |
| SDUIPocketBase | [components/SDUIPocketBase.md](components/SDUIPocketBase.md) |
| SDUIPouchDB | [components/SDUIPouchDB.md](components/SDUIPouchDB.md) |
| SDUIRestApi | [components/SDUIRestApi.md](components/SDUIRestApi.md) |
| SDUISQLiteBrowser | [components/SDUISQLiteBrowser.md](components/SDUISQLiteBrowser.md) |
| SithasoDaisy5 | [components/SithasoDaisy5.md](components/SithasoDaisy5.md) |
| UIShared | [components/UIShared.md](components/UIShared.md) |

## Topic Index (prop → components)

- **ParentID** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomDrawer, … (+121 more)
- **Visible** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomNavigation, … (+115 more)
- **RawClasses** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomNavigation, … (+113 more)
- **RawStyles** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomNavigation, … (+113 more)
- **RawAttributes** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomNavigation, … (+113 more)
- **MarginAXYTBLR** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BottomNavigation, SDUI5BreadCrumbs, … (+112 more)
- **PaddingAXYTBLR** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BottomNavigation, SDUI5BreadCrumbs, … (+112 more)
- **PositionStyle** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomNavigation, … (+108 more)
- **Position** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BottomNavigation, SDUI5BreadCrumbs, … (+108 more)
- **Enabled** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomNavigation, … (+104 more)
- **Width** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5BottomDrawer, SDUI5Browser, SDUI5Button, SDUI5Card, … (+71 more)
- **Height** → SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Badge, SDUI5BankCard, SDUI5BarCode, SDUI5BarcodeReader, SDUI5BasicLabel, SDUI5Browser, SDUI5Button, SDUI5Card, SDUI5Carousel, SDUI5CarouselItem, … (+62 more)
- **Shadow** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Avatar, SDUI5Badge, SDUI5BankCard, SDUI5BarcodeReader, SDUI5Button, SDUI5Card, SDUI5Carousel, SDUI5ChatItem, SDUI5CheckBox, SDUI5CheckBoxGroup, … (+54 more)
- **BackgroundColor** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5Badge, SDUI5BasicLabel, SDUI5BottomDrawer, SDUI5BottomNavigation, SDUI5Browser, SDUI5Button, SDUI5Card, … (+49 more)
- **Rounded** → SDUI5Accordion, SDUI5AdvancedCheckGroup, SDUI5Badge, SDUI5BankCard, SDUI5BarcodeReader, SDUI5Card, SDUI5Carousel, SDUI5ChatItem, SDUI5Code, SDUI5Collapse, SDUI5Column, SDUI5Container, … (+29 more)
- **Size** → SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5AvatarGroup, SDUI5Badge, SDUI5Button, SDUI5Card, SDUI5CheckBox, SDUI5CheckBoxGroup, SDUI5Column, SDUI5ContextMenu, SDUI5Dock, … (+29 more)
- **RoundedBox** → SDUI5AdvancedCheckGroup, SDUI5BarcodeReader, SDUI5Card, SDUI5Carousel, SDUI5ChatItem, SDUI5CheckBox, SDUI5CheckBoxGroup, SDUI5Code, SDUI5ContextMenu, SDUI5Diff, SDUI5DropZone, SDUI5FieldSet, … (+26 more)
- **Color** → SDUI5AdvancedCheckGroup, SDUI5Alert, SDUI5Badge, SDUI5Button, SDUI5ChatBubble, SDUI5CheckBox, SDUI5CheckBoxGroup, SDUI5Divider, SDUI5Fab, SDUI5FileInput, SDUI5Filter, SDUI5Indicator, … (+22 more)
- **TextColor** → SDUI5Alert, SDUI5Aura, SDUI5Avatar, SDUI5Badge, SDUI5BankCard, SDUI5BasicLabel, SDUI5Button, SDUI5Card, SDUI5ChatBubble, SDUI5Collapse, SDUI5Column, SDUI5Component, … (+21 more)
- **BorderColor** → SDUI5AdvancedCheckGroup, SDUI5BasicLabel, SDUI5CheckBox, SDUI5CheckBoxGroup, SDUI5Collapse, SDUI5FieldSet, SDUI5FileInput, SDUI5Filter, SDUI5GroupSelect, SDUI5MultiSelect, SDUI5NoUISlider, SDUI5Phone, … (+11 more)

## Supporting Files

- [patterns.md](patterns.md) — composition patterns: AddComponent/parentID chain, event wiring, forms, drawers, tabs, lists, responsive sizing
- [cheatsheet.md](cheatsheet.md) — decision rules: pick component X when Y, color/size constants, theme list, asset registration
- [glossary.md](glossary.md) — UIShared API surface, BANano transpile terms, CustProps, DesignerProperty
- [references/app-scaffolds.md](references/app-scaffolds.md) — app shell templates (§1a `.b4j` + §1b Files bundle)
- [references/design-intelligence.md](references/design-intelligence.md) — framework-agnostic decision doctrine (DI-*): hierarchy, density, disclosure, ergonomics, anti-cargo-cult; shared-source with B4XDaisyUIKit-Skills
- [references/prompt-contracts.md](references/prompt-contracts.md) — 10 design prompt contracts (Sleek corpus) → Stage-0 screen contracts; style tiers + channel usage exemplars
- [references/design-tokens.md](references/design-tokens.md) — design token vocabulary and component-specific color contracts; §1.1 color channels, §6 themes, §14 Style Tiers
- [references/Files/](references/Files/) — 11-file asset bundle (sample images referenced by `.bas` source but NOT shipped in the b4xlib; canonical copy-source for new apps)
- [references/file-registry.b4j](references/file-registry.b4j) — matching `FileN=`/`FileGroupN=`/`NumberOfFiles` block
- [references/component-manifest.md](references/component-manifest.md) — generated inventory of registered UI/support modules + demo evidence (authority for demo-backed status)
- [references/component-provenance.json](references/component-provenance.json) — generated per-component provenance: source sha256, registry status, member lists, demo pages (authority for checksums/member lists; regen via `sd5-web-verify/scripts/generate_provenance.py`)
- [references/banano-essentials.md](references/banano-essentials.md) — distilled BANano substrate facts (AppStart/BANano_Ready, ForLater assets, PWA) with page citations to `BANanoEssentialsV1.09.pdf`
- [references/framework-internals.md](references/framework-internals.md) — read-only wrapper mechanics: .b4xlib build, SDUI5Button-traced anatomy, UIShared engine, UsesX bundles, daisyUI upstream mapping, gap protocol
- [references/daisyui-mapping.md](references/daisyui-mapping.md) — study-to-wrapper record: name mapping, class-verification protocol with worked samples, upstream-skill observations

## Scope & Limits

This skill covers the 139 registered `SDUI5*` UI classes and indexes the 20 registered support modules documented under `components/`. It produces B4J/BANano `.bas` code that calls the framework, not raw HTML, React, or Vue.

**Unregistered source notes** live in `components/_unused/`. Do not call those classes from app code unless the framework project registers them in `ModuleN=`.

---

## Core Operating Principles: Truth & Accuracy

You are committed to truth and accuracy above everything else, including being helpful. A wrong answer delivered confidently is worse than no answer. Follow these 7 rules in every response:

1. **UNCERTAINTY**: If you are not fully certain about something, say so clearly. Use phrases like "I am not certain, but..." or "You may want to verify this...". Never state guesses as facts.
2. **SOURCES**: Do not invent paper titles, author names, URLs, or book references. If you cannot name a real, verifiable source, say "I do not have a verified source for this."
3. **STATISTICS**: Flag any number you are not 100 percent confident in. Say "approximately" and recommend the user verify it from a primary source.
4. **RECENT EVENTS**: Remind the user when a topic may have changed since your knowledge cutoff. Do not present outdated info as current.
5. **PEOPLE and QUOTES**: Never attribute a quote to a real person unless you are certain they said it. If unsure, say "I cannot confirm this quote is accurate."
6. **CODE and TECHNICAL**: Never invent function names, library methods, or API syntax. If unsure a function exists, tell the user to verify it in the current docs.
7. **LOGIC GAPS**: Do not fill missing context with assumptions. If something is unclear, ask a clarifying question before answering.

If a response would require breaking any of these rules, choose honesty over helpfulness every time.
