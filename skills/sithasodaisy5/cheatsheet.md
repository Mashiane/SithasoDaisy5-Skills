# SithasoDaisy5 — Decision Cheatsheet

Decision rules, not term definitions (see glossary.md for terms). Pick by what you're building.

## Pick a component when…

| You need… | Use | Because |
|---|---|---|
| A button | `SDUI5Button` | only btn emitter; 73 props, indicator/badge/icons/tooltip built-in |
| An icon-only button | `SDUI5Button` w/ `ButtonIcon=True` | auto `btn-circle`, strips text |
| A primary surface | `SDUI5Card` / `SDUI5Form` / `SDUI5Panel` | card if static, Form if it has yes/no/cancel actions, Panel if flex/grid region |
| A dialog | `SDUI5Modal` | native modal w/ 8 action types; use `app.ShowSwalConfirmWait` for one-shot async confirm |
| A toast | `app.ShowToast*` or `SDUI5Toast` | app-level for transient, SDUI5Toast for embedded `toast` slot |
| A drawer | `SDUI5Drawer` (+ `SDUI5DrawerUser` for the user chip) | only drawer emitter; toggle via `app.OpenDrawer/ToggleDrawer/ForceCloseDrawer` |
| Top nav | `SDUI5NavBar` | `navbar glass sticky`; fires TitleClick/BurgerClick/Back |
| Bottom nav | `SDUI5BottomNavigation` or `SDUI5Dock` | BottomNavigation for mobile tabs, Dock for mac-style dock |
| Tabs | `SDUI5Tabs`+`SDUI5TabsItem` (underline) / `SDUI5Segment` (pill box) | Segment emits `tabs tabs-box` |
| A collapsible | `SDUI5Collapse` | only `collapse` emitter; pair with `join-item` for accordion |
| An accordion | `SDUI5Accordion` | wraps collapse group; fires Change |
| A list | `SDUI5List`+`SDUI5ListItem` |
| A menu | `SDUI5Menu`+`SDUI5MenuItem` | `menu`, 52 props, ItemClick; for trees use SDUI5TreeView/TreeSpider |
| A form field | `SDUI5TextBox` (text/email/validator, Append/Prepend) / `SDUI5TextArea` (multiline) | TextBox for input groups |
| A label | `SDUI5Label` / `SDUI5BasicLabel` (44 props, plain) | floating-label uses `SDUI5Label` |
| A selection | `SDUI5Select` (single) / `SDUI5MultiSelect` (55 props) / `SDUI5GroupSelect` (optgroup) | MultiSelect for tags |
| A checkbox/radio group | `SDUI5CheckBoxGroup` / `SDUI5RadioGroup` / `SDUI5AdvancedCheckGroup` | all emit `fieldset, border, rounded-box` |
| A date | `SDUI5DatePickerTimeLine` (carousel wheel) | TimeLine for drum-style mobile |
| A number range | `SDUI5Range` (native) / `SDUI5NoUISlider` (49 props, needs `UsesNoUISlider`) / `SDUI5Slider` (carousel pager, different thing) | NoUISlider for two-handle/step; Slider is paging — read the name carefully |
| A rating | `SDUI5Rating` | only rating emitter |
| A toggle | `SDUI5Toggle` | only toggle emitter; fires Change |
| An OTP | `SDUI5OTP` | 6-digit, fires Complete |
| A file drop | `SDUI5DropZone` (drag UI) / `SDUI5FileInput` (validated input) | DropZone for drag-drop w/ Complete; FileInput for form-submittable |
| A signature | `SDUI5SignaturePad` (needs `UsesSignaturePad`) | fires Save |
| A barcode/QR | `SDUI5QRCode` (gen) / `SDUI5BarCode` (gen) / `SDUI5BarcodeReader` (scan, needs `UsesBarCodeReader`) | |
| A table | `SDUI5Table` (95 props) | only full table; fires AlphaClick/RowClick/HeaderClick |
| A stat tile | `SDUI5Stat`+`SDUI5StatItem` | `stats` + `stat` |
| A chart | `SDUI5ToastChart` (toast UI) / `SDUI5TrendChart` (spark) / `SDUI5GenderChart` (demographic) | |
| A pivot | `SDUI5Pivot` (needs `UsesPivot`) | webdatarocks |
| A calendar | `SDUI5FullCalendar` (requires its registered FullCalendar assets) | |
| A kanban | `SDUI5KanBan` (needs `UsesKanBan`) | jkanban |
| A carousel | `SDUI5Carousel`+`SDUI5CarouselItem` (daisyUI) / `SDUI5Swiper`+`SDUI5SwiperSlide` (swiper, needs `UsesSwiper`) | Swiper for touch/rich |
| A timeline | `SDUI5Timeline`+`SDUI5TimelineItem` | |
| A wizard | `SDUI5Wizard` | card-based, fires Change |
| Steps | `SDUI5Steps`+`SDUI5StepsItem` | `step` |
| A map | `SDUI5Leaflet` (needs `UsesLeaflet`) | |
| A video | `SDUI5VideoPlayer` (needs `UsesVideoAudioPlayer`) | plyr |
| Code editor | `SDUI5Code` (needs `UsesCode`) / `SDUI5EasyMDE` (markdown, `UsesMarkDownEditor`) / `SDUI5QuillEditor` (rich, `UsesQuill`) | |
| JSON | `SDUI5JsonEditor` / `SDUI5JsonTree` | |
| A mockup | `SDUI5Browser` / `SDUI5Phone` / `SDUI5Window` / `SDUI5Device` | |
| Loading state | `SDUI5Loading` (`loading`) / `SDUI5Skeleton` (`skeleton`) / `SDUI5Progress` / `SDUI5RadialProgress` | |
| Layout region | `SDUI5Container`→`SDUI5Row`→`SDUI5Column` (grid) / `SDUI5Stack` (z-stack) / `SDUI5Join` (joined group) / `SDUI5Hero` / `SDUI5Footer`(+`FooterTitle`) | |
| Badge/indicator | `SDUI5Badge` (41 props) / `SDUI5Indicator` / `SDUI5Status` | |
| Avatar | `SDUI5Avatar` / `SDUI5AvatarGroup` | |

## Color & size constants (from SDUI5App)

- **Semantic**: `COLOR_PRIMARY`, `COLOR_SECONDARY`, `COLOR_ACCENT`, `COLOR_NEUTRAL`, `COLOR_INFO`, `COLOR_SUCCESS`, `COLOR_WARNING`, `COLOR_ERROR`, `COLOR_GHOST`, `COLOR_BASE`.
- **Palette**: `COLOR_EMERALD`, `COLOR_SKY`, `COLOR_ROSE`, `COLOR_AMBER`, `COLOR_SLATE`, `COLOR_ZINC`, `COLOR_STONE`, `COLOR_NEUTRAL`, `COLOR_VIOLET`, `COLOR_FUCHSIA`, `COLOR_PINK` (see SDUI5App for full list; red/blue/green/etc. also in modSD5.ColorMap with hex).
- **Intensity**: `INTENSITY_50`…`INTENSITY_900`, `INTENSITY_NORMAL` (= "").
- **Size**: `SIZE_XS`, `SIZE_SM`, `SIZE_MD` (default), `SIZE_LG`, `SIZE_XL`, `SIZE_NONE`, `SIZE_FULL`, `SIZE_2XL`…`SIZE_9XL`, `SIZE_BASE`.
- **TextSize**: `TEXTSIZE_XS`…`TEXTSIZE_9XL`, `TEXTSIZE_BASE`, `TEXTSIZE_NONE`.
- **Rounded**: `ROUNDED_NONE`, `ROUNDED_SM`, `ROUNDED_MD`, `ROUNDED_LG`, `ROUNDED_XL`, `ROUNDED_2XL`, `ROUNDED_3XL`, `ROUNDED_FULL`, `ROUNDED_ROUNDED`, `ROUNDED_DEFAULT`.
- **Shadow**: `SHADOW_NONE`, `SHADOW_SM`, `SHADOW_MD`, `SHADOW_LG`, `SHADOW_XL`, `SHADOW_2XL`, `SHADOW_INNER`, `SHADOW_SHADOW`.
- **Mask** (avatars): `MASK_NONE`, `MASK_CIRCLE`, `MASK_SQUARE`, `MASK_SQUIRCLE`, `MASK_HEXAGON`, `MASK_HEXAGON_2`, `MASK_DIAMOND`, `MASK_HEART`, `MASK_STAR`, `MASK_STAR_2`, `MASK_PENTAGON`, `MASK_DECAGON`, `MASK_TRIANGLE`, `MASK_TRIANGLE_2/3/4`.

## Themes (35+, from SDUI5App)

`THEME_LIGHT`, `THEME_DARK`, `THEME_CUPCAKE`, `THEME_BUMBLEBEE`, `THEME_EMERALD`, `THEME_CORPORATE`, `THEME_SYNTHWAVE`, `THEME_RETRO`, `THEME_CYBERPUNK`, `THEME_VALENTINE`, `THEME_HALLOWEEN`, `THEME_GARDEN`, `THEME_FOREST`, `THEME_AQUA`, `THEME_LOFI`, `THEME_PASTEL`, `THEME_FANTASY`, `THEME_WIREFRAME`, `THEME_BLACK`, `THEME_LUXURY`, `THEME_DRACULA`, `THEME_CMYK`, `THEME_AUTUMN`, `THEME_BUSINESS`, `THEME_ACID`, `THEME_LEMONADE`, `THEME_NIGHT`, `THEME_COFFEE`, `THEME_WINTER`, `THEME_DIM`, `THEME_NORD`, `THEME_SUNSET`, `THEME_CARAMELLATTE`, `THEME_ABYSS`, `THEME_SILK`.

Apply: `app.SetTheme(THEME_NORD)`. Detect dark mode: `app.IsDarkMode`.

## Asset registration (SithasoDaisy5.b4j)

New external lib = add file to `Files/` + `BANano.Header.AddJavascriptFileForLater(...)` (or `AddCSSFileForLater`) in `SithasoDaisy5.b4j` + expose a `UsesX` sub in `SDUI5App` calling `UI.LoadAssetsOnDemand`. "For later" = not loaded at startup; the `UsesX` call loads it on demand.

## B4X Code Property vs Designer Key Golden Rules

In B4X, property assignments (e.g. `obj.Property = value`) map to setter subs (`setProperty(value)`). The **Designer Key** in `.bas` files is an internal key for the visual designer, which often differs from the B4X code setter!

### 1. The `Raw*` Stripping Rule
Whenever a Designer Key begins with `Raw`, the B4X code property is ALWAYS stripped of `Raw`:
| Designer Key (Layouts only) | B4X Code Property | Setter Sub | Example |
|---|---|---|---|
| `RawContent` | `.Content` | `setContent` | `card.Content = "Card body text"` |
| `RawSteps` | `.Steps` | `setSteps` | `steps.Steps = "Step 1;Step 2;Step 3"` |
| `RawOptions` | `.Options` | `setOptions` | `select.Options = "Option 1;Option 2"` |
| `RawChildKeys` | `.ChildKeys` | `setChildKeys` | `speeddial.ChildKeys = "edit;delete;share"` |
| `RawChildIcons` | `.ChildIcons` | `setChildIcons` | `speeddial.ChildIcons = "pencil;trash;share"` |
| `RawImages` | `.Images` | `setImages` | `avatargroup.Images = "img1.jpg;img2.jpg"` |
| `RawClasses` | `.Classes` | `setClasses` | `btn.Classes = "shadow-lg"` |
| `RawStyles` | `.Styles` | `setStyles` | `btn.Styles = "z-index: 10;"` |
| `RawAttributes` | `.Attributes` | `setAttributes` | `btn.Attributes = "data-test=cta"` |

*Calling `.RawContent`, `.RawSteps`, `.RawOptions`, etc. in B4X code immediately fails with `Method not found: setRawX`!*

### 2. High-Frequency Component API Traps (Source-Grounded)
| Component | What Fails (Do NOT write) | What Works (Verified B4X Code) | Reason / Source |
|---|---|---|---|
| `SDUI5Card` | `card.Color = "base-200"` | `card.BackgroundColor = "base-200"` | Has `setBackgroundColor`, no `setColor` |
| `SDUI5Card` | `card.RawContent = "..."` | `card.Content = "..."` | Setter is `setContent` |
| `SDUI5StatItem` | `stat.Description = "..."` | `stat.Desc = "..."` | Setter is `setDesc` |
| `SDUI5StatItem` | `stat.Color = "primary"` | `stat.ValueTextColor = "primary"` or `.TitleTextColor` | No generic `.Color` property |
| `SDUI5ListItem` | `item.Title = "..."`, `item.Color = ...` | `item.Text = "..."` | `SDUI5ListItem` only has `.Text`, `.CursorPointer`, `.ListRow`, `.Opacity`, `.TextSize`, `.TextColor` |
| `SDUI5Steps` | `steps.StepsColor = "primary"` | `item.Color = "primary"` on `SDUI5StepsItem` | `SDUI5Steps` has NO setter for `StepsColor` |
| `SDUI5Steps` | `steps.RawSteps = "..."` | `steps.Steps = "..."` | Setter is `setSteps` |
| `SDUI5RadialProgress` | `rad.Size = "5rem"`, `rad.Thickness = "2px"` | `rad.ProgressSize = "5rem"`, `rad.ProgressThickness = "2px"` | Setters are `setProgressSize` and `setProgressThickness` |
| `SDUI5DropDown` | `dd.Options = "..."` | Mount trigger button + menu inside `dd` | `SDUI5DropDown` is a pure container `<div>`, no options |
| `SDUI5Divider` | `divider.Title = "..."` | `divider.Text = "..."` | Setter is `setText` |
| `SDUI5Drawer` | `ParentID = "drawer"` | `ParentID = "drawer_sidecontent"` | Children mount to sub-container `_sidecontent` |

### 3. Module Self-Invocation Scope Gotcha
Inside any static code module `pgFoo.bas`, calling `BANano.Await(pgFoo.Show)` causes B4J compiler error: `Undeclared variable 'pgfoo'`. Inside the module itself, invoke directly: `BANano.Await(Show)`.

## Tells & smells

- **`SDUI5Slider` ≠ slider input** — it's a carousel pager (`jcarousel-item`). For a range slider use `SDUI5Range` or `SDUI5NoUISlider`.
- **`SDUI5Label1` is not registered** — use `SDUI5Label` or `SDUI5BasicLabel` from the active catalog.
- **Never call `DesignerCreateView` from app code** — it's internal; mount with `BANano.Await(x.AddComponent)` after setting `ParentID` (no explicit call exists in any demo page).
- **Don't emit raw HTML** — you're writing B4J that drives the framework; use components.
- **Every `UsesX` is `Banano.Await`-able** — wrap in `Banano.Await(app.UsesX)` before first use of the dependent component.
- **Handler name is `${mEventName}_${event}`**, not `${mName}_${event}` — they usually match but EventName is the authority.
- **Never write `.RawX = ...`** — always use the stripped property name (`.Content`, `.Steps`, `.Options`).
- **Never guess properties on `SDUI5ListItem`** — for rich cards/avatars in a list, mount child components or use `.Text`.

