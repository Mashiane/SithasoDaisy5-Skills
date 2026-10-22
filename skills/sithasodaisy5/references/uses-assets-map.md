# Uses ↔ Assets ↔ Components Map

How on-demand assets work in SDUI5 (studied from `0SithasoDaisy5` source):

1. **Components declare** what they need with `BANano.DependsOnAsset("<file>")` in their
   `AddComponent` code. This marks the dependency — it does NOT load the file at runtime.
2. **The app loads** the files by calling a `Uses*` method on `SDUI5App` (e.g. inside
   `pgIndex.Initialize`, step 2 of the boot sequence — see app-scaffolds.md §2). Each
   `Uses*` wraps `UI.LoadAssetsOnDemand("<key>", Array(...))` which is idempotent
   (already-loaded keys return immediately) and fetches `.js`/`.css` from `./scripts/`.
3. **A component whose asset was never loaded will 404 / fail at runtime** — so every
   component listed below requires its `Uses*` call(s) to have run before it mounts.

---

## Uses → files → components that require it

| Uses call                      | Files loaded                                                                                                                                | Requires it (per `DependsOnAsset`)                                  |
| ------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| `App.UsesGenderChart`          | SithasoGenderChart.min.js                                                                                                                    | SDUI5GenderChart                                                     |
| `App.UsesQuill`                | quill.snow.css, highlight.min.css, quill-custom.min.css, highlight.min.js, quill.min.js, purify.min.js, quill-custom.min.js                  | SDUI5QuillEditor                                                     |
| `App.UsesBottomNavigation`     | bottom-navigation.min.js                                                                                                                     | SDUI5BottomNavigation                                                |
| `App.UsesGifPlayer`            | gifsee.min.css, gifsee.min.js                                                                                                                | SDUI5Image                                                           |
| `App.UsesKanBan`               | jkanban.min.css, dragula.min.js, jkanban.min.js                                                                                              | SDUI5KanBan                                                          |
| `App.UsesPocketBase`           | pocketbase.umd.js                                                                                                                            | SDUIPocketBase                                                       |
| `App.UsesDevices`              | device.min.css, html-to-image.js                                                                                                             | SDUI5Device                                                          |
| `App.UsesPivot`                | webdatarocks.min.css, webdatarocks.toolbar.min.js, webdatarocks.js                                                                           | SDUI5Pivot                                                           |
| `App.UsesColorWheel`           | reinvented-color-wheel.min.css, reinvented-color-wheel.min.js                                                                                | SDUI5Preferences, SDUI5TextBox                                       |
| `App.UsesWhatsApp`             | whatsapp.min.css, emojimart.js                                                                                                               | SDUI5WhatsApp, SDUI5EmojiMart (uses the `EmojiMart.Picker` class)    |
| `App.UsesLeaflet`              | leaflet.css, leaflet.js, leaflet.rotatedMarker.js, Leaflet.Coordinates-0.1.5.css, Leaflet.Coordinates-0.1.5.min.js, leaflet-routing-machine.css, leaflet-routing-machine.js | SDUI5Leaflet |
| `App.UsesTreeSpider`           | treeSpider.bundle.min.js, treeSpider.css                                                                                                     | SDUI5TreeSpider                                                      |
| `App.UseAnime`                 | anime.min.js                                                                                                                                 | BANanoAnimeJS / BANanoAnimeJSTimeLine / BANanoAnimeJSItem            |
| `App.UsesExcel`                | jszip.min.js, xlsx.full.min.js, oxml.min.js, exceljs.min.js                                                                                  | SDUIExcel, SDUI5ExcelReport                                          |
| `App.UsesMarkDownEditor`       | easymde.min.css, easymde.min.js                                                                                                              | SDUI5EasyMDE                                                         |
| `App.UsesLottiePlayer`         | lottie-player.js                                                                                                                             | SDUI5LottiePlayer                                                    |
| `App.UsesQRCode`               | qrcode.min.js                                                                                                                                | SDUI5QRCode                                                          |
| `App.UsesBarCodeReader`        | html5-qrcode.min.js                                                                                                                          | SDUI5BarcodeReader                                                   |
| `App.UsesDropZone`             | dropzone.min.js, dropzone.min.css                                                                                                            | SDUI5DropZone                                                        |
| `App.UsesVideoAudioPlayer`     | plyr.css, plyr.js                                                                                                                            | SDUI5VideoPlayer                                                     |
| `App.UsesSQLiteBrowser`        | sql-browser.min.js                                                                                                                           | SDUISQLiteBrowser (app-code utility)                                 |
| `App.UsesHTMLParser`           | htmlParser.min.js                                                                                                                            | app-code utility                                                     |
| `App.UsesDocxTemplate`         | docxtemplater.min.js, pizzip.min.js, pizzip-utils.min.js                                                                                     | SDUIDocxTemplator                                                    |
| `App.UsesCode`                 | prism.min.css, prism.min.js, beautify.min.js, beautify-css.min.js, beautify-html.min.js, prettier.min.js                                     | SDUI5Code                                                            |
| `App.UsesB4JConverter`         | pako.min.js, bjl-converter.js, bjl-renamer.js                                                                                                | SDUI5JsonEditor (its `.bjl` build/preview features)                  |
| `App.UsesSignaturePad`         | signature_pad.umd.min.js                                                                                                                     | SDUI5SignaturePad                                                    |
| `App.UsesLZCompressString`     | lz-string.min.js                                                                                                                             | app-code utility                                                     |
| `App.UsesDatePicker`           | flatpickr.min.css, flatpickr.css, flatpickr.min.js, fplocale.min.js                                                                          | SDUI5TextBox, SDUI5Table, SDUI5Preferences                           |
| `App.UsesSlider`               | SithasoSlider.min.js                                                                                                                         | SDUI5Slider                                                          |
| `App.UsesNoUISlider`           | nouislider.min.css, SithasoNoUISlider.min.css, nouislider.min.js, SithasoNoUISlider.min.js, wNumb.min.js                                     | SDUI5NoUISlider                                                      |
| `App.UsesJQuery`               | jquery-3.7.1.min.js                                                                                                                          | app-code utility (also a prerequisite for UsesEnjoyHint-style libs)  |
| `App.UsesEnjoyHint`            | kinetic.min.js, jquery.scrollTo.min.js, enjoyhint.min.js, enjoyhint.min.css                                                                  | SDUI5EnjoyHint                                                       |
| `App.UsesOfficeRibbon`         | sfribbon.min.css, sfribbon.min.js                                                                                                            | SDUI5OfficeRibbon                                                    |
| `App.UsesFontAwesome`          | fontawesome.min.css                                                                                                                          | any component using FA icons (app choice)                            |
| `App.UsesCSVParser`            | papaparse.min.js                                                                                                                             | app-code utility                                                     |
| `App.UsesJSONEditor`           | jsoneditor.min.css, jsoneditor.min.js                                                                                                        | SDUI5JsonEditor                                                      |
| `App.UsesJSONTree`             | jsontr.ee.js                                                                                                                                 | SDUI5JsonTree                                                        |
| `App.UsesTrendCharts`          | trendchart.js (+ `BANano.ImportWait`)                                                                                                        | SDUI5TrendChart                                                      |
| `App.UsesTreeView`             | daisyuitreeview.umd.js                                                                                                                       | SDUI5TreeView                                                        |
| `App.UsesContextMenu`          | ContextMenu.js (+ `BANano.ImportWait`)                                                                                                       | SDUI5ContextMenu                                                     |
| `App.UsesBarCode`              | JsBarcode.all.js                                                                                                                             | SDUI5BarCode                                                         |
| `App.UsesFullCalendar`         | fc.min.css, fullcalendar.css, fc.min.js, fclocales.min.js                                                                                    | SDUI5FullCalendar                                                    |
| `App.UsesAES`                  | crypto-js.min.js                                                                                                                             | app-code utility                                                     |
| `App.UsesEncryption`           | encryption.min.js                                                                                                                            | app-code utility                                                     |
| `App.UsesClient`               | client.base.min.js                                                                                                                           | SDUI5Client (app-code utility)                                       |
| `App.UsesToastChart`           | toastui-chart.min.css, toastui-chart.min.js                                                                                                  | SDUI5ToastChart                                                      |
| `App.UsesPouchDB`              | pouchdb.min.js, pouchdb.find.js                                                                                                              | SDUIPouchDB                                                          |
| `App.UsesSwiper`               | swiper-bundle.min.css, swiper-bundle.min.js                                                                                                  | SDUI5Swiper                                                          |
| `App.UsesFontAwesomePicker`    | font-awesome-picker.min.js, jszip.min.js                                                                                                     | SDUI5FAIconPicker                                                    |
| `App.UsesMultiSelect`          | daisy-multiselect.min.js                                                                                                                     | SDUI5MultiSelect                                                     |
| `App.UsesInfoBox`              | infobox.min.css, countUp.umd.js                                                                                                              | SDUI5InfoCard                                                        |
| `App.UsesJSONQuery`            | jsonquery.js                                                                                                                                 | SDUIJSONQuery                                                        |
| `App.UsesMath`                 | math.min.js                                                                                                                                  | app-code utility                                                     |

### Components needing MORE THAN ONE Uses call

| Component          | Required Uses calls                                  |
| ------------------ | ---------------------------------------------------- |
| SDUI5JsonEditor    | `UsesJSONEditor` + `UsesB4JConverter`                 |
| SDUI5TextBox       | `UsesDatePicker` + `UsesColorWheel`                   |
| SDUI5Preferences   | `UsesDatePicker` + `UsesColorWheel`                   |
| SDUI5Table         | `UsesDatePicker` (flatpickr columns); see note below  |
| SDUI5EmojiMart     | `UsesWhatsApp` (it ships the `emojimart.js` lib)      |

---

## Assets NOT loaded by a Uses call — the Header split

The app's main `.b4j` `AppStart` registers every asset on `BANano.Header` in two flavors
(studied from `SithasoDaisy5.b4j`):

- **`Header.AddCSSFile` / `AddJavascriptFile`** — loaded immediately on page load.
  These are the core/always-available files, and they cover every asset that has a
  `DependsOnAsset` but **no** `Uses*` method — so those components need no `Uses` call:

  | Always-loaded asset    | Declared by components                                              |
  | ---------------------- | ------------------------------------------------------------------- |
  | `SVGRenderer.min.js`   | SDUI5Alert, Badge, Button, Conversation, Fab, FileInput, GroupSelect, JsonEditor, Link, MenuItem, Modal, NavBar, MultiSelect, Preferences, Select, StatItem, Svg, Table, Text, TextArea, TextBox, TimelineItem, Toggle, WhatsApp |
  | `notyf.min.css/js`     | SDUI5MDToast                                                        |
  | `daisy-sheet.js`       | SDUI5BottomDrawer                                                   |
  | `otp-input.js`         | SDUI5OTP                                                            |
  | `checkbox-group.js`    | SDUI5CheckBoxGroup                                                  |
  | `dayjs.min.js`, `relativeTime.min.js`, `numeral.min.js` | SDUI5Table (formatting columns)    |

  Also always-loaded (no component declares them — the framework itself needs them):
  `loader-1.css`, `colors.js`, `daisyui.min.css`, `daisyuithemes.css`, `typography.css`,
  `tailwind.min.js`, `sweetalert2.min.css`, `sweetalert2.all.min.js`, `fileSaver.min.js`,
  `insert-rule.min.js`, `BANano_r2fFIX.min.js`.

- **`Header.AddCSSFileForLater` / `AddJavascriptFileForLater` / `AddJavascriptES6FileForLater`**
  — registered but deferred. These pair 1:1 with the `Uses*` methods: a `Uses*` call
  (via `UI.LoadAssetsOnDemand`) is what actually pulls the `ForLater` files in.
  ES6 modules (`trendchart.js`, `ContextMenu.js`) use the `ES6` variant, which is why
  their `Uses*` adds a `BANano.ImportWait` after loading.

So the rule of thumb: **always-loaded = plain `Add…File` in `AppStart` (no action
needed), everything `ForLater` = requires its `Uses*` call to have run before use.**
