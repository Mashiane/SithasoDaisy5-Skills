---
name: component-manifest
description: Live registry inventory of SithasoDaisy5 UI components and support modules, with UI demo coverage and unregistered reference notes.
---

# SithasoDaisy5 Component Manifest

Generated from the framework project's `ModuleN=` registry and the demo app's `pg*.bas` type usage.
A path-qualified module entry is normalized to its final module name. Only registered modules are active.

Component skills link to the tracked framework `.bas` implementation and link to demo page modules with a detected type reference. They also contain reusable, verified B4J usage excerpts. Full demo pages remain in the demo repository; the component manifest below records detected UI usage coverage.

**Known source dependency gaps:** The demo project references external helper modules whose source is absent from the audited checkouts: `SDUIWebSQL` is used by `pgCategories.bas`, `pgContacts.bas`, `pgIndex.bas`, and `pgProvinces.bas`; `SDUI5FakeIT` is used by `pgContacts.bas` and `pgSelect.bas`. Those pages require the external helpers to build; verify the demo repository supplies them before copying those page flows.

**Registered modules**: 159 | **UI components**: 139 | **Support modules**: 20 | **UI demo-backed**: 121 | **UI without a detected demo type declaration**: 18 | **Unregistered reference docs**: 1

## UI Components with Demo Type Usage (121)

A `pg*.bas` file contains an `As SDUI5*` or `New SDUI5*` type reference. This is evidence of demo usage, not a substitute for checking the component API documentation.

| Component | Props | Events | Key daisyUI classes emitted |
|---|---:|---:|---|
| SDUI5Accordion | 17 | 1 | join join-vertical |
| SDUI5AdvancedCheckGroup | 26 | 1 | — |
| SDUI5Alert | 27 | 1 | alert, alert-dash, alert-outline, alert-soft |
| SDUI5App | 0 | 8 | — |
| SDUI5Aura | 14 | 1 | aura |
| SDUI5Avatar | 37 | 1 | avatar, chat-image, rounded-field, avatar-placeholder |
| SDUI5AvatarGroup | 14 | 0 | — |
| SDUI5Badge | 41 | 3 | badge flex-nowrap inline-flex items-center, badge-dash, badge-ghost, badge-outline |
| SDUI5BankCard | 25 | 1 | card |
| SDUI5BarCode | 31 | 1 | — |
| SDUI5BarcodeReader | 21 | 3 | — |
| SDUI5BottomDrawer | 14 | 0 | z-99 |
| SDUI5BottomNavigation | 16 | 1 | — |
| SDUI5BreadCrumbs | 14 | 0 | breadcrumbs |
| SDUI5Browser | 14 | 0 | mockup-browser border-base-300 border |
| SDUI5Button | 74 | 1 | join-item, dock-active, btn-active, rounded-field |
| SDUI5Card | 47 | 0 | card, card-border, card-dash, image-full |
| SDUI5Carousel | 24 | 0 | carousel, rounded-box |
| SDUI5CarouselItem | 22 | 0 | carousel-item, relative |
| SDUI5ChatBubble | 23 | 0 | chat |
| SDUI5CheckBox | 37 | 1 | — |
| SDUI5CheckBoxGroup | 29 | 1 | fieldset, border, rounded-box |
| SDUI5Code | 27 | 4 | rounded-box |
| SDUI5Collapse | 34 | 0 | collapse, border, join-item |
| SDUI5Column | 44 | 0 | p-2 |
| SDUI5Component | 18 | 0 | — |
| SDUI5Container | 40 | 0 | max-w-[100vw] px-6 pb-16 xl:pe-2 relative, container, container-fluid, container-lg |
| SDUI5ContextMenu | 21 | 1 | — |
| SDUI5CountDown | 12 | 0 | countdown |
| SDUI5DatePickerTimeLine | 31 | 1 | carousel rounded-box gap-1 |
| SDUI5Device | 14 | 0 | device |
| SDUI5Diff | 25 | 0 | diff aspect-16/9, rounded-box |
| SDUI5Divider | 16 | 0 | divider |
| SDUI5Dock | 13 | 0 | dock |
| SDUI5Drawer | 29 | 1 | drawer, lg:drawer-open, md:drawer-open, drawer-open |
| SDUI5DrawerUser | 15 | 2 | flex justify-between items-center p-2 |
| SDUI5DropDown | 13 | 0 | dropdown, dropdown-hover, dropdown-open |
| SDUI5DropZone | 24 | 1 | rounded-box, dropzone flex flex-wrap justify-center items-center |
| SDUI5EasyMDE | 12 | 0 | — |
| SDUI5FieldSet | 24 | 0 | fieldset, border, rounded-box |
| SDUI5FileInput | 35 | 1 | — |
| SDUI5Filter | 25 | 1 | w-full |
| SDUI5Footer | 17 | 0 | footer, footer-center |
| SDUI5FooterTitle | 12 | 0 | footer-title |
| SDUI5FullCalendar | 43 | 11 | — |
| SDUI5GenderChart | 25 | 0 | — |
| SDUI5GroupSelect | 28 | 1 | fieldset, border, rounded-box |
| SDUI5Hero | 31 | 0 | hero |
| SDUI5Hover3D | 15 | 1 | — |
| SDUI5HoverGallery | 15 | 0 | hover-gallery |
| SDUI5Image | 31 | 1 | bg-cover, bg-center, bg-no-repeat, rounded-box |
| SDUI5Indicator | 9 | 0 | indicator |
| SDUI5InfoCard | 29 | 1 | cursor-pointer pl-0 rounded-box, cursor-pointer relative rounded-box shadow-md |
| SDUI5Join | 11 | 0 | join, grid |
| SDUI5JsonEditor | 24 | 7 | — |
| SDUI5JsonTree | 20 | 0 | — |
| SDUI5Kbd | 12 | 0 | kbd |
| SDUI5Label | 29 | 0 | floating-label |
| SDUI5Leaflet | 30 | 50 | — |
| SDUI5Link | 22 | 1 | link, link-hover |
| SDUI5List | 16 | 0 | list, rounded-box |
| SDUI5ListItem | 18 | 0 | cursor-pointer, list-row |
| SDUI5Loading | 13 | 0 | loading |
| SDUI5LottiePlayer | 21 | 0 | — |
| SDUI5Menu | 52 | 2 | menu, flex-nowrap, overflow-y-auto, dropdown |
| SDUI5MenuItem | 45 | 0 | menu-active, menu-focus |
| SDUI5Modal | 59 | 7 | card, card-border, card-dash, rounded-box |
| SDUI5NavBar | 50 | 9 | navbar justify-center, glass, sticky |
| SDUI5NoUISlider | 50 | 3 | — |
| SDUI5OfficeRibbon | 19 | 8 | — |
| SDUI5OTP | 13 | 1 | — |
| SDUI5Page | 49 | 0 | glass, container, mx-auto, flex |
| SDUI5Panel | 59 | 0 | grow, shrink, flex, grid |
| SDUI5PDFViewer | 15 | 1 | — |
| SDUI5Phone | 16 | 0 | mockup-phone |
| SDUI5Pivot | 15 | 0 | — |
| SDUI5Preferences | 63 | 22 | card, card-border, w-full bg-base-100 |
| SDUI5Progress | 37 | 0 | — |
| SDUI5QRCode | 21 | 1 | rounded-box |
| SDUI5QuillEditor | 13 | 1 | — |
| SDUI5RadialProgress | 17 | 0 | radial-progress |
| SDUI5Radio | 25 | 1 | — |
| SDUI5RadioGroup | 28 | 1 | fieldset, border, rounded-box |
| SDUI5Range | 31 | 1 | — |
| SDUI5Rating | 30 | 1 | — |
| SDUI5Row | 38 | 0 | grid |
| SDUI5Segment | 21 | 1 | tabs tabs-box inline-flex flex-nowrap whitespace-nowrap |
| SDUI5Select | 42 | 3 | — |
| SDUI5SignaturePad | 33 | 1 | — |
| SDUI5Skeleton | 14 | 0 | skeleton, shrink |
| SDUI5SpeedDial | 30 | 0 | fab flex!, fab-flower |
| SDUI5Stack | 13 | 0 | stack |
| SDUI5Stat | 21 | 0 | stats overflow-hidden, border, rounded-box |
| SDUI5StatItem | 31 | 0 | stat, place-items-center, rounded-box |
| SDUI5Status | 17 | 0 | status, indicator-item |
| SDUI5Steps | 25 | 1 | rounded-box |
| SDUI5StepsItem | 14 | 0 | step |
| SDUI5Svg | 24 | 1 | — |
| SDUI5Swap | 25 | 1 | — |
| SDUI5Swiper | 61 | 1 | swiper |
| SDUI5SwiperSlide | 19 | 2 | swiper-slide |
| SDUI5Table | 96 | 50 | card card-border w-full bg-base-100 |
| SDUI5Tabs | 22 | 1 | tabs whitespace-nowrap |
| SDUI5TabsItem | 23 | 0 | tab-active, tab flex items-center justify-center gap-2 relative |
| SDUI5Text | 46 | 6 | — |
| SDUI5TextArea | 45 | 4 | — |
| SDUI5TextBox | 66 | 7 | — |
| SDUI5TextRotate | 16 | 0 | text-rotate |
| SDUI5Timeline | 17 | 0 | timeline, timeline-compact, timeline-snap-con |
| SDUI5TimelineItem | 25 | 0 | — |
| SDUI5Toast | 3 | 0 | toast |
| SDUI5ToastChart | 36 | 0 | rounded-box |
| SDUI5Toggle | 31 | 1 | — |
| SDUI5ToolTip | 8 | 0 | tooltip, tooltip-open |
| SDUI5TreeSpider | 29 | 0 | — |
| SDUI5TreeView | 36 | 10 | menu, overflow-y-auto |
| SDUI5TrendChart | 49 | 0 | — |
| SDUI5VideoPlayer | 31 | 0 | rounded-box |
| SDUI5WhatsApp | 34 | 12 | flex overflow-hidden shadow-sm rounded-box w-full h-full |
| SDUI5Window | 13 | 0 | mockup-window border-base-300 border |
| SDUI5Wizard | 30 | 1 | card |

## UI Components without Detected Demo Type Usage (18)

The API reference exists, but no matching type declaration was detected in a `pg*.bas` demo file. Verify the source reference before relying on it.

| Component | Props | Events | Key daisyUI classes emitted |
|---|---:|---:|---|
| SDUI5BasicLabel | 46 | 0 | — |
| SDUI5ChatItem | 26 | 1 | list-row flex items-center gap-3 p-2 hover:bg-base-200 cursor-pointer wa-sidebar-chat, rounded-box |
| SDUI5Client | 0 | 0 | — |
| SDUI5Conversation | 23 | 1 | — |
| SDUI5EmojiMart | 21 | 2 | — |
| SDUI5EnjoyHint | 0 | 3 | — |
| SDUI5ExcelReport | 0 | 0 | — |
| SDUI5Fab | 19 | 0 | — |
| SDUI5FAIconPicker | 18 | 2 | — |
| SDUI5Form | 19 | 1 | — |
| SDUI5GoogleAdSense | 18 | 0 | adsbygoogle |
| SDUI5KanBan | 21 | 13 | — |
| SDUI5MDToast | 0 | 0 | — |
| SDUI5MegaMenu | 15 | 1 | megamenu |
| SDUI5MultiSelect | 56 | 4 | — |
| SDUI5Slider | 23 | 2 | — |
| SDUI5SliderItem | 15 | 0 | jcarousel-item |
| SDUI5Swal | 0 | 0 | — |

## Registered Support Modules (20)

These modules are registered in the framework project but are not `SDUI5*` visual components.

| Module | Reference |
|---|---|
| BANanoAnimeJS | [`components/BANanoAnimeJS.md`](../components/BANanoAnimeJS.md) |
| BANanoAnimeJSItem | [`components/BANanoAnimeJSItem.md`](../components/BANanoAnimeJSItem.md) |
| BANanoAnimeJSTimeLine | [`components/BANanoAnimeJSTimeLine.md`](../components/BANanoAnimeJSTimeLine.md) |
| BANanoGreenAPI | [`components/BANanoGreenAPI.md`](../components/BANanoGreenAPI.md) |
| modSD5 | [`components/modSD5.md`](../components/modSD5.md) |
| SDUIDocxTemplator | [`components/SDUIDocxTemplator.md`](../components/SDUIDocxTemplator.md) |
| SDUIExcel | [`components/SDUIExcel.md`](../components/SDUIExcel.md) |
| SDUIFetch | [`components/SDUIFetch.md`](../components/SDUIFetch.md) |
| SDUIGoogleSheetsAPI | [`components/SDUIGoogleSheetsAPI.md`](../components/SDUIGoogleSheetsAPI.md) |
| SDUIJSONQuery | [`components/SDUIJSONQuery.md`](../components/SDUIJSONQuery.md) |
| SDUILocalStorage | [`components/SDUILocalStorage.md`](../components/SDUILocalStorage.md) |
| SDUIMap | [`components/SDUIMap.md`](../components/SDUIMap.md) |
| SDUIMySQLREST | [`components/SDUIMySQLREST.md`](../components/SDUIMySQLREST.md) |
| SDUIMySQLRESTNative | [`components/SDUIMySQLRESTNative.md`](../components/SDUIMySQLRESTNative.md) |
| SDUIPocketBase | [`components/SDUIPocketBase.md`](../components/SDUIPocketBase.md) |
| SDUIPouchDB | [`components/SDUIPouchDB.md`](../components/SDUIPouchDB.md) |
| SDUIRestApi | [`components/SDUIRestApi.md`](../components/SDUIRestApi.md) |
| SDUISQLiteBrowser | [`components/SDUISQLiteBrowser.md`](../components/SDUISQLiteBrowser.md) |
| SithasoDaisy5 | [`components/SithasoDaisy5.md`](../components/SithasoDaisy5.md) |
| UIShared | [`components/UIShared.md`](../components/UIShared.md) |

## Unregistered Reference Docs (1)

These notes are retained for source archaeology. Do not generate app code from them: their classes are not in the framework `ModuleN=` registry.

| Name | Reference |
|---|---|
| SDUI5Calendar | [`components/_unused/SDUI5Calendar.md`](../components/_unused/SDUI5Calendar.md) |

## Regeneration and verification

From the skills repository root, run:

```powershell
py -3 skills/sd5-web-verify/scripts/generate_manifest.py
pwsh -File skills/sd5-web-verify/scripts/check-contract.ps1
```

`check-contract.ps1` enforces exact one-to-one coverage between normalized registered module names and top-level `components/*.md` files. `_unused/` is excluded by design. `generate_component_source_refs.py` checks every active skill against the local framework source tree and refreshes upstream framework/demo links from the audited checkouts.
