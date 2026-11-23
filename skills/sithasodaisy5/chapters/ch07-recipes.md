# SithasoDaisy5 Recipe Crosswalk

Composition rules adapted from the `daisyui-mcp` recipe corpus (MIT, Ralph Schaer,
https://github.com/ralscha/daisyui-mcp), which targets daisyUI 5. The HTML examples are not copied;
each entry is re-expressed as SithasoDaisy5 component guidance. No source code is copied.

Use this chapter when a prompt names a common page pattern. It is a selection and composition aid;
component APIs remain authoritative in `../components/<Name>.md`. Raw recipe HTML is never pasted into
B4J code (`RULE-ANTI-001`); compose the same intent from SDUI5 components.

## High-value recipes

### Accessible form
**When to use**: settings and data-entry forms; break long forms into meaningful sections.
**SDUI5 map**: `SDUI5Form` (`Name`, `Action`, `Method`, `Autocomplete`, `Novalidate`), `SDUI5FieldSet`,
`SDUI5Label`, `SDUI5TextBox` (`Label`, `Hint`, `Required`, `Pattern`, `MinLength`, `MaxLength`,
`Color="error"`), `SDUI5RadioGroup`, `SDUI5Button`, `SDUI5Alert`.
**Accessibility**: visible label per control; `fieldset`/`legend` grouping; focused error summary on failure;
`aria-invalid` only after validation fails; keep submit enabled; use `.Attributes` for
`aria-describedby`/`aria-invalid` after confirming which element the attribute targets.
**Form scope**: validation behavior remains deferred unless reopened; this entry covers structure and accessibility.
**Source**: `accessible-form`.

### Application shell
**When to use**: dashboards and multi-page apps whose primary destinations stay stable across pages.
**SDUI5 map**: `SDUI5Drawer`, `SDUI5NavBar`, `SDUI5Menu`, `SDUI5MenuItem`, `SDUI5Container`, `SDUI5Page`,
`SDUI5Link` for a skip link.
**Accessibility**: skip link before repeated navigation; labelled drawer control; `aria-current="page"` on the active
destination; move focus into the mobile drawer and return it to the trigger; do not hide the desktop sidebar from AT.
**Source**: `application-shell`.

### Dashboard
**When to use**: operational dashboards; prioritize the few metrics that drive decisions.
**SDUI5 map**: `SDUI5NavBar`, `SDUI5Stat` + `SDUI5StatItem`, `SDUI5Card`, `SDUI5Table`, `SDUI5Button`.
**Accessibility**: do not communicate trends or status by color alone; use real headings and table headers;
add text alternatives for charts and expose the data when possible; announce important refreshes only.
**Source**: `dashboard`.

### Dialog
**When to use**: a modal only when the user must decide before continuing; prefer inline confirmation for low-risk actions.
**SDUI5 map**: `SDUI5Modal` (`Open`, `Closable`, `Backdrop`, `ActionType`, title, `_box`/`_title`/`_form`/`_action` slots).
**Accessibility**: `SDUI5Modal` emits `role="dialog"` and `aria-modal="true"`, but it is not a native `<dialog>`;
verify focus trapping, Escape handling, and focus return to the trigger. Focus the least destructive sensible action.
**Source**: `dialog`.

### Empty state
**When to use**: a collection has no records; distinguish first use, an empty search, and a permission problem.
**SDUI5 map**: `SDUI5Card`, `SDUI5Text`, `SDUI5Svg`, `SDUI5Button`, `SDUI5Alert` or `SDUI5Toast` for a status region.
**Accessibility**: the heading explains the state, not just "Nothing here"; one primary recovery action; decorative
illustrations hidden from AT; use a status region when the empty state follows a client-side search.
**Source**: `empty-state`.

### Filterable data table
**When to use**: data sets that benefit from scanning and comparison.
**SDUI5 map**: `SDUI5Table` (`HasFilter`, `Pagination`, `ItemsPerPage`, `BadgesOutlined`, `BadgesSize`, `IsZebra`,
`TableSize`), `SDUI5Select`, `SDUI5TextBox`, `SDUI5Button`.
**Accessibility**: announce the result count after filters change; preserve filter state in the URL where practical;
use table headers, a caption, and record-specific action names; `aria-current="page"` on the active pagination link;
on small screens keep horizontal scrolling or provide a card view.
**Source**: `filterable-data-table`.

### Landing page hero
**When to use**: the top of a product or campaign landing page.
**SDUI5 map**: `SDUI5NavBar`, `SDUI5Hero`, `SDUI5Card`, `SDUI5Stat` + `SDUI5StatItem`, `SDUI5Button`, `SDUI5Footer`.
**Accessibility**: one `h1` stating the page purpose; meaningful image alternative text; explicit CTA labels;
respect reduced-motion preferences if the preview is animated.
**Source**: `landing-page-hero`.

### Notification center
**When to use**: a short preview of recent notifications, with a dedicated history page.
**SDUI5 map**: `SDUI5DropDown`, `SDUI5Menu`, `SDUI5MenuItem`, `SDUI5Avatar`, `SDUI5Badge`, `SDUI5List`,
`SDUI5ListItem`, `SDUI5Toast`.
**Accessibility**: include the unread count in the trigger's accessible name; use text alongside status colors;
announce newly arrived important items politely; do not mark items read merely because the menu opened; keyboard
focus must move through the list and back to the trigger. Critical alerts must not live only in the dropdown.
**Source**: `notification-center`.

### Responsive navigation
**When to use**: small-to-medium site navigation; combine with a drawer for larger information architectures.
**SDUI5 map**: `SDUI5NavBar`, `SDUI5Drawer`, `SDUI5Menu`, `SDUI5MenuItem`, `SDUI5Button`.
**Accessibility**: keep link names and destinations consistent between mobile and desktop; `aria-current="page"`;
label the drawer trigger; avoid clipping the mobile menu with a parent `overflow: hidden`.
**Source**: `responsive-navigation`.

### Search and profile navbar
**When to use**: signed-in applications where global search and account actions must stay available.
**SDUI5 map**: `SDUI5NavBar`, `SDUI5TextBox` (`TypeOf="search"`), `SDUI5DropDown`, `SDUI5Avatar`, `SDUI5Badge`.
**Accessibility**: give search an accessible name; include unread counts in the notification link's name; prefer a
simple disclosure for account actions; narrow screens retain a usable brand, search trigger, and account action.
**Source**: `search-and-profile-navbar`.

## Medium-value recipes

### File upload form
**When to use**: one or a small number of files; add a queue for bulk uploads.
**SDUI5 map**: `SDUI5FileInput`, `SDUI5DropZone`, `SDUI5Alert`, `SDUI5Button`.
**Accessibility**: state accepted formats and limits in visible text; validate file content on the server; announce
meaningful progress changes without flooding a live region; focus the error summary on failure.
**Source**: `file-upload-form`.

### Forgot password
**When to use**: a user cannot access an account.
**SDUI5 map**: `SDUI5Card`, `SDUI5TextBox`, `SDUI5Button`, `SDUI5Alert` or `SDUI5Toast`.
**Accessibility**: use a status region for confirmation; return identical wording for registered and unregistered
addresses; expiry and single-use recovery links; support password managers.
**Source**: `forgot-password`.

### Login form
**When to use**: a dedicated sign-in page or authentication panel.
**SDUI5 map**: `SDUI5Card`, `SDUI5TextBox`, `SDUI5CheckBox`, `SDUI5Button`, `SDUI5Link`, `SDUI5Alert`.
**Accessibility**: persistent labels (not placeholders alone); error summary above the form with focus moved to it;
`aria-invalid="true"` and `aria-describedby` on failed fields; do not block password managers or paste.
**Source**: `login-form`.

### Pricing table
**When to use**: plans differ by a manageable set of features.
**SDUI5 map**: `SDUI5Row`, `SDUI5Column`, `SDUI5Card`, `SDUI5Badge`, `SDUI5Text`, `SDUI5Button`, `SDUI5Table`
for a comparison table.
**Accessibility**: do not signal the recommended plan with border color alone; state billing periods and renewal
behavior; keep feature names consistent; avoid preselecting costly upgrades or hiding limitations.
**Source**: `pricing-table`.

### Registration form
**When to use**: creating a basic account; ask only for what is required at registration.
**SDUI5 map**: `SDUI5Form`, `SDUI5Card`, `SDUI5TextBox`, `SDUI5Button`, `SDUI5Alert`.
**Accessibility**: explain password requirements before validation; keep password-manager support; link errors with
`aria-describedby`; set `aria-invalid` after failure; verify email ownership rather than requiring the email twice.
**Source**: `registration-form`.

### Team grid
**When to use**: a small team or working group; add search/filters for larger organizations.
**SDUI5 map**: `SDUI5Row`, `SDUI5Column`, `SDUI5Card`, `SDUI5Avatar` (`Mask`), `SDUI5Text`, `SDUI5Link`,
`SDUI5Filter` for larger directories.
**Accessibility**: decorative headshots when the name identifies the person; initials contrast and image-failure
fallback; expose the collection as a list; make link names unique by including the person's name.
**Source**: `team-grid`.

## Optional content and commerce patterns

### Checkout summary
**When to use**: a simple checkout; complex flows must preserve entered information and show the current step.
**SDUI5 map**: `SDUI5Steps`, `SDUI5Card`, `SDUI5Table`, `SDUI5Divider`, `SDUI5Button`.
**Accessibility**: `aria-current="step"` and not color alone; currency beside the total; disclose recurring billing;
autocomplete tokens for address/contact fields; preserve values when returning to an earlier step.
**Source**: `checkout-summary`.

### Cookie consent
**When to use**: only when consent is legally or operationally required.
**SDUI5 map**: `SDUI5Toast` or `SDUI5Card` or `SDUI5Alert`, `SDUI5Button`, `SDUI5Link`.
**Accessibility**: accept and reject have comparable prominence and effort; no modal unless required; persist the
choice and provide a way to reopen preferences; do not auto-focus unless the banner blocks interaction.
**Source**: `cookie-consent`.

### FAQ section
**When to use**: a short set of genuinely frequent questions; keep critical policies in permanent documentation.
**SDUI5 map**: `SDUI5Accordion` or `SDUI5Collapse`.
**Accessibility**: descriptive question text that works out of context; no nested interactive controls inside the
summary; allow multiple answers open unless there is a reason not to; native disclosure behavior is preferred.
**Source**: `faq-section`.

### Newsletter signup
**When to use**: near related content or in a footer.
**SDUI5 map**: `SDUI5Card` or `SDUI5Join`, `SDUI5TextBox`, `SDUI5Button`, `SDUI5Alert`.
**Accessibility**: visible label even with a descriptive placeholder; announce results through a status region;
explain double opt-in and privacy handling; stack input and button when translated text no longer fits.
**Source**: `newsletter-signup`.

## Translation rules

- Do not paste recipe HTML. `RULE-ANTI-001` forbids raw HTML; `RawHtml`, `RawClasses`, `RawStyles`, and
  `RawAttributes` are not app-code paths.
- Use `.Classes`, `.Styles`, and `.Attributes` for responsive variants, flex/grid, animation, color, ARIA, and `data-*`.
- Translate static `p-*`/`m-*`/`w-*`/`h-*`/`shadow-*`/`rounded-*`/`relative`/`absolute` to dedicated properties
  (`RULE-PROP-001/002`).
- Compose nested recipe markup with component child slots and `ParentID`; await `AddComponent` before mounting children.
- Forms, validation, keyboard traversal, and IME behavior remain deferred unless reopened; this chapter covers
  structure and accessibility, not validation logic.
- Semantic parity is not automatic: `SDUI5Modal` is a `div role="dialog"`, `SDUI5Collapse` uses radio inputs, and
  `.Attributes` targets the component root. Verify the rendered DOM and ARIA per screen.

## Gaps to track

- No standalone `SDUI5Pagination`; `SDUI5Table` has built-in pagination. Compose standalone pagination with
  `SDUI5Join` plus `SDUI5Button` or `SDUI5Link`.
- No standalone `SDUI5Mask`; `SDUI5Avatar.Mask` covers avatars. Use `.Classes` for image masks.
- No standalone `SDUI5Validator`; use `Required`, `Pattern`, `MinLength`, `MaxLength`, `Color="error"`, `Hint`, and
  `.Attributes`.
- No `SDUI5ThemeController`; theme selection is host-owned (RULE-THEME-001). Compose a control only if the user asks for one.
- No DaisyUI CSS `calendar`; `SDUI5EvoCalendar` is a different JavaScript widget. Verify the target before claiming
  calendar parity.
