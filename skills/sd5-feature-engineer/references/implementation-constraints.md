# Implementation Constraint Checklist

Apply these checks while composing a slice. The normative definitions live in
[rules-enforcer.md](../../sithasodaisy5/references/rules-enforcer.md); this page is the
operational checklist, not a second rulebook.

## Before writing code

- [ ] Contracts read: application, feature, screen, data, navigation, acceptance.
- [ ] Existing app inspected: `.b4j`, `pgIndex`, affected pages, shared helpers, nearest demo.
- [ ] Component inventory rows carry manifest status, provenance confirmation, and date.
- [ ] Every component name, property, method, event, and loader verified in source and demo.

## Mount order (RULE-LAYOUT-005)

- [ ] Parent container initialized, configured, and awaited before any child.
- [ ] Child mounted with `ParentID = parentID` then `BANano.Await(child.AddComponent)`.
- [ ] Companion children use their designated parent, not `SDUI5Container` / `app.PageView`.
- [ ] No invented `.AddItem()` / `.Refresh()` calls.

## Styling (RULE-PROP-001/002)

- [ ] Layout, spacing, size, elevation, and positioning use designer properties.
- [ ] `.Classes` holds only responsive overrides, transitions/animations, flex/grid tokens, and unmanaged utilities.
- [ ] `Width`/`Height`/`Shadow`/`Rounded` use suffixes (`"full"`, `"64"`, `"md"`, `"box"`), never `"w-64"`, `"shadow-md"`.
- [ ] No capital `Set*` designer methods; use `.Property = value`.
- [ ] `.Rounded` is checked against the component; `SDUI5Button` uses `.Shape`.

## Defaults (RULE-DEFAULTS-001)

- [ ] Defaults audited in `component-default-setters.md`.
- [ ] Cards/wizards in columns set `.Width = "full"`.
- [ ] Border, surface color, and direction match the prompt.
- [ ] Placeholder select/radio options replaced with real options.

## Code syntax and encoding (RULE-ENCODING-001/002/003)

- [ ] No `Raw*` properties or `ReadMe` in code.
- [ ] Component globals suffixed with `'ignore`.
- [ ] Self-invocation is `BANano.Await(Show)`.
- [ ] Files saved UTF-8 without BOM; string literals pure ASCII.
- [ ] No raw emojis, arrows, em dashes, or smart quotes in `.bas`.

## Assets (RULE-ASSET-001)

- [ ] Local icon/image paths use `./assets/<name>.svg` with the extension.
- [ ] Files exist under `Files/` and are registered in the `.b4j`.
- [ ] No runtime hotlinks to remote icon services.

## States and evidence

- [ ] Contracted states implemented or explicitly marked not applicable.
- [ ] Failures visible through the component's alert/toast/error path.
- [ ] Traceability rows updated: `REQ -> FEATURE -> RULE/BR -> SCREEN -> COMPONENT -> CODE -> TEST`.
- [ ] `pre-scan.ps1` and `verify-conformance.ps1` re-ran for the slice.
