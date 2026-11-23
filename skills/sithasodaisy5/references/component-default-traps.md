---
name: component-default-traps
description: Inventory of silent component defaults that emit placeholder text, omit visual structure, or fix layout sizes. Audited from all 162 framework modules; use before composing and verify the rendered result.
---

# Component Default Traps (silent placeholder / structure / size)

Audited 2026-11-11 from `#DesignerProperty` defaults in all 162 registered modules: **3,718 properties**, of which
**58 content defaults**, **82 structural flags defaulting to False**, and **146 size defaults** can change the rendered result.
None of these throw or fail static gates. The tables below list the ones that matter; verify the render, not only the source.

## 1. Placeholder content defaults

Every row renders literal text when the property is left unset. Set the property explicitly; use `""` where the component supports an empty value.

| Component.property | Default |
|---|---|
| `SDUI5Alert.Title` / `.Text` | `Alert Title` / `Alert Text` |
| `SDUI5Avatar.Placeholder` | `S` |
| `SDUI5Badge.Text` | `Badge` |
| `SDUI5BankCard.BankName` / `.CardHolder` | `BANK OF LATVERIA` / `CARD HOLDER` |
| `SDUI5BarCode.Text` | `JsBarCode` |
| `SDUI5Button.Text` | `Button` |
| `SDUI5Card.Title` / `.RawContent` | `Card Title` / `Card Content` |
| `SDUI5ChatBubble.Message` / `.MessageFrom` / `.Footer` | `Welcome to SithasoDaisy5` / `Mashy` / `Delivered` |
| `SDUI5ChatItem.FromName` / `.Message` | `From Name` / `Message` |
| `SDUI5CheckBox.Label` / `.Legend` | `CheckBox` / `Options` |
| `SDUI5CheckBoxGroup.Label` | `CheckBox Group` |
| `SDUI5Code.Caption` / `.FileName` | `Source Code` / `code.bas` |
| `SDUI5Collapse.Title` / `.RawContent` | `Collapse` / `Collapse Content` |
| `SDUI5Component.Text` | `Component` |
| `SDUI5Diff.Text1` / `.Text2` | `SITHASODAISY5` |
| `SDUI5Divider.Text` | `Divider` |
| `SDUI5FieldSet.Label` / `.Legend` | `Label` / `Legend` |
| `SDUI5FileInput.Label` | `Please select a file` |
| `SDUI5Filter.Label` | `CheckBox Group` |
| `SDUI5FooterTitle.Text` | `Footer Title` |
| `SDUI5GroupSelect.Label` | `Group Select` |
| `SDUI5InfoCard.Title` | `Employees` |
| `SDUI5Kbd.Text` | `A` |
| `SDUI5Label.Label` | `Label` |
| `SDUI5Link.Text` | `Link` |
| `SDUI5Modal.Title` | `Modal Dialog` |
| `SDUI5MultiSelect.Label` / `.Placeholder` | `Select` / `Select an element` |
| `SDUI5NavBar.Title` | `NavBar` |
| `SDUI5NoUISlider.Label` | `NoUISlider` |
| `SDUI5Page.Title` | `My SDUIPage` |
| `SDUI5Preferences.Title` | `Property Bag` |
| `SDUI5Progress.Label` | `Range` |
| `SDUI5QRCode.Text` | `SithasoDaisy5` |
| `SDUI5QuillEditor.Placeholder` | `Start typing...` |
| `SDUI5Radio.Legend` | `Toggle` |
| `SDUI5RadioGroup.Label` | `Radio Group` |
| `SDUI5Range.Label` | `Range` |
| `SDUI5Rating.Label` | `Rating` |
| `SDUI5Select.Label` / `.Placeholder` | `Select` / `Select an element` |
| `SDUI5SignaturePad.Caption` | `Signature` |
| `SDUI5StatItem.Title` | `Total Page Views` |
| `SDUI5Table.Title` | `Table` |
| `SDUI5TextArea.Label` | `Text Area` |
| `SDUI5TextRotate.Text` | `Text Rotate` |
| `SDUI5Toggle.Label` / `.Legend` | `Turn On` / `Toggle` |
| `SDUI5Wizard.Title` | `Subscription` |

Also: `SDUI5AdvancedCheckGroup.LegendLabel = "Checkbox Group"`, `SDUI5DatePickerTimeLine` has no text default, and
`SDUI5Tabs` renders a per-item `${Text} Content` panel (NEG-049).

## 2. Structural flags that default to off

| Component.property | Default | Symptom if left alone | Override |
|---|---|---|---|
| `SDUI5TimelineItem.StartJoinPrefix` / `.EndJoinSuffix` | False | Isolated icons, no connector (NEG-047) | Enable per item position |
| `SDUI5SpeedDial.MainButtonIcon` | `""` | Main action renders an empty circle | Set an icon/text or `MainButtonType = "none"` |
| `SDUI5SpeedDial.CenterChildren` | False | Child action buttons are not centered under the FAB | `True` |
| `SDUI5Progress.TextVisible` | False | No percentage label | `True` |
| `SDUI5Button.IndicatorVisible` | False | No indicator badge | `True` |
| `SDUI5Modal.IconVisible` | False | No modal icon | `True` |
| `SDUI5Tabs` item content | placeholder panel | Literal "… Content" | `ClearContents = True` |
| `SDUI5Row`/`Column`/`Container`/`Page`/`Panel`/`Text.CenterChildren` | False | Children left-aligned | `True` when centering is intended |
| `SDUI5Table.HasFilter`/`HasSearch`/`HasDownload`/`HasExpand`/`HasMenu`/`HasGrid`/`HasHelp` | False | Expected toolbar controls absent | Enable the ones the contract lists |
| `SDUI5NavBar.HasBackButton`/`HasSearch`/`HasLogo`/`HasFile` | False | Expected navbar chrome absent | Enable as needed |
| `SDUI5Select`/`TextBox`/`TextArea`/`MultiSelect.PrependVisible`/`AppendVisible`, `TextBox.ShowEyes` | False | Affix/eye controls absent | Enable as needed |
| `SDUI5Slider.ShowButtons`, `SDUI5Swiper.HasNavigation`/`HasScrollbar` | False | Expected controls absent | Enable as needed |
| `SDUI5TreeView.HasCheckbox`, `SDUI5ToolTip.HasContent` | False | Checkbox/tooltip content missing | Enable / set content |

## 3. Fixed-size defaults that break responsive layouts

| Component.property | Default | Consequence | Override |
|---|---|---|---|
| `SDUI5FieldSet.Width` | `xs` (320px) | Form shrinks inside a wide card (NEG-044) | `full` |
| `SDUI5Card.Width` / `SDUI5Alert.Width` / `SDUI5Wizard.Width` | `96` (384px) | Fixed width inside columns | `full` |
| `SDUI5Menu` / `ContextMenu` / `Browser` / `Window.Width` | `56` (224px) | Narrow panel | `full` / explicit |
| `SDUI5NavBar.Height` | `16` (64px) | Fixed header height | explicit / `auto` |
| `SDUI5BankCard.Width` / `Hover3D.Width` | `100` (400px) | Fixed-width card | `full` |
| `SDUI5Drawer.Width` | `80` (320px) | Fixed drawer | explicit |
| `SDUI5TreeView.Width` | `200px` | Fixed sidebar | explicit / `full` |
| `SDUI5Carousel.Width`/`Height` | `900px` / `500px` | Fixed canvas, empty band when few slides | `full` + item sizing |
| `SDUI5CarouselItem.Width`/`Height` | `80` (320px) | Slides do not fill the carousel | size per slide count |
| `SDUI5Slider.Width`/`Height` | `900px` / `500px` | Fixed canvas | `full` |
| `SDUI5Swiper.Height` | `300px` | Fixed height | explicit |
| `SDUI5SignaturePad.Width`/`Height` | `400` / `200` | Fixed pad | explicit |
| `SDUI5Image`/`Skeleton.Width`/`Height` | `12` (48px) | Fixed placeholder box | explicit / `full` |
| `SDUI5DatePickerTimeLine.Width` | `full` + daisyUI carousel hides the scrollbar | Appears not to scroll; an `overflow-x-auto` wrapper cannot scroll (NEG-051) | Size the pane, add scroll buttons, or reduce `DaysCount` |

## 4. SpeedDial specifics (components/SDUI5SpeedDial.md)

- `Icon`, `ChildIcons`, `MainButtonIcon` are **asset paths**, not icon names. Bare names (`edit`, `share-2`) render broken.
- `ChildIcons` uses `key=path` pairs: `compose=./assets/pencil-solid.svg; share=./assets/arrow-up-from-bracket-solid.svg`.
- `MainButtonType = "main"` or `"close"` shows `_main`; without `MainButtonIcon`/`MainButtonText` it is an empty circle.
- Known source issues: `setChildIcons` sets width twice and never height (`SDUI5SpeedDial.bas` lines 549-550); the icon renderer is not
  explicitly centered inside the `btn` circle (measured ~5px left at 48px). Workaround: square `IconSize` and `CenterChildren = True`.

## 5. API-order traps

These methods mutate the DOM immediately; calling them before `AddComponent` fails silently.

| Call | Order requirement | Symptom |
|---|---|---|
| `table.AddColumn*` | after `BANano.Await(table.AddComponent)` | Rows render with an empty `<thead>`; filter cells missing (NEG-052, RULE-TABLE-001) |

## 6. Modal specifics (components/SDUI5Modal.md)

- `Html` (designer key `RawHtml`) defaults to empty: only the title and actions render until body copy is set.
- `ActionType` buttons only raise `<modal>_ok_click` / `<modal>_cancel_click`; they do not close. Call `Close` in the handler.
- `CancelColor` defaults to `gray`, which is not a daisyUI token; use `neutral`. Action text defaults to white: use `success-content` / `neutral-content`.
- `Width` is capped by `.modal-box` max-width (~512px), so `700px` does not render at 700px.

Related: NEG-039, NEG-041, NEG-044, NEG-045, NEG-046, NEG-047, NEG-048, NEG-049, NEG-050, NEG-052, NEG-053.
