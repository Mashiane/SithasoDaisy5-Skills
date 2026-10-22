---
name: negative-knowledge
description: Anti-hallucination rules for SithasoDaisy5. Documented anti-patterns, common agent mistakes, and the corrected way. Cite NEG-* IDs in your reasoning trace.
---

# SithasoDaisy5 — Negative Knowledge

Documented anti-patterns and common agent mistakes. Each item: **the wrong thing** agents tend to produce, **why it's wrong**, and **the correct pattern**. Cite `NEG-*` IDs when correcting.

Grounded in: 139 registered `SDUI5*` UI classes + 121 demo files with matching UI type usage + audit of common LLM outputs.

---

## 1. Setter & Property Anti-Patterns

### NEG-001 — Inventing Setter Names

**Wrong**: `btn.setRequired(True)` / `input.setValidator(...)` / `form.setLabel(...)`  
**Reality**: SithasoDaisy5 uses **direct property assignment** (`.Required = True`, `.Validator = ...`, `.Label = ...`), not the `setX` / `getX` convention some agents assume from Java/Swift naming.  
**Correct**: Read `components/<Name>.md` and use the listed setter pattern. Most setters are direct fields.

### NEG-002 — Inventing Method Names

**Wrong**: `comp.SetValue("x")` / `comp.UpdateContent(...)`  
**Reality**: Method names must match the `.bas` source exactly.  
**Correct**: Consult `components/<Name>.md` Methods section before calling any method. If it's not listed, it doesn't exist.

### NEG-003 — Treating every `.Color` as the same API

**Wrong**: Assuming any component's `.Color` accepts the same values or has the same effect.
**Reality**: `.Color` may be a semantic variant, nested-child color, HTML attribute, or raw CSS color. Shared `BackgroundColor`/`TextColor`/`BorderColor` helpers use `UIShared.FixColor`; it wraps `#hex` as a Tailwind arbitrary class but does not convert CSS `rgb(...)`/`rgba(...)` strings into valid arbitrary syntax.
**Correct**: Check the exact property's designer list, component reference, and setter. Use listed semantic values for variant properties; use literal CSS colors only in documented raw-CSS channels. See `design-tokens.md` §1.1.

### NEG-004 — Numeric Pixel Dimensions

**Wrong**: `card.Width = 320`, `card.Height = 200`  
**Reality**: Numeric pixels are not accepted by `SDUI5*` width/height setters.  
**Correct**: `.Width = "full"` or `.Classes = "w-80 max-w-sm"` (Tailwind utilities on `.Classes`).

### NEG-005 — Capitalised Tokens

**Wrong**: `.Color = "Primary"` / `.Size = "MD"`  
**Reality**: Tokens are lowercase.  
**Correct**: `.Color = "primary"`, `.Size = "md"`.

---

## 2. Lifecycle Anti-Patterns

### NEG-006 — Missing `ClearPageView`

**Wrong**:
```b4j
Sub Show
    app = pgIndex.App
    ' ... mount components directly ...
End Sub
```
**Reality**: Without `BANano.Await(app.ClearPageView)` first, stale views from the previous page persist, causing duplicate child stacking on resize.  
**Correct**: `BANano.Await(app.ClearPageView)` is the **first statement** after `app = pgIndex.App`.

### NEG-007 — Missing `UpdateTitle`

**Wrong**: `Sub Show` ends without `pgIndex.UpdateTitle("...")`.  
**Reality**: Browser tab title stays stale.  
**Correct**: `pgIndex.UpdateTitle("...")` is the **last statement** before `End Sub`.

### NEG-008 — DOM Mutation Without Parent Mount

**Wrong**:
```b4j
SDUI5Row1.Initialize(Me, "SDUI5Row1", "SDUI5Row1")
SDUI5Button1.ParentID = "SDUI5Row1"   ' Row hasn't called AddComponent yet!
BANano.Await(SDUI5Button1.AddComponent)
```
**Reality**: Child's `ParentID` must reference a parent that has already called `AddComponent`. Otherwise runtime error.  
**Correct**: Always `AddComponent` the parent before setting child `ParentID`.

---

## 3. Architecture Anti-Patterns

### NEG-009 — Skipping the Hierarchy

**Wrong**: Components added directly to a container without `SDUI5Row`/`SDUI5Column` between.  
**Reality**: No grid, no responsive behavior, layout collapses on mobile.  
**Correct**: Always go `SDUI5Container` → `SDUI5Row` → `SDUI5Column` → leaf.

### NEG-010 — No State Coverage

**Wrong**: Data-driven view only renders the happy path:
```b4j
If data.Size > 0 Then
    table.SetItems(data)
End If
```
**Reality**: When `data.Size = 0`, the user sees a blank screen. When fetch fails, same.  
**Correct**: Core 4 states — Loading + Populated + Empty + Error. Use `SDUI5Loading` or `SDUI5Skeleton` for loading, `SDUI5Text` with an optional `SDUI5Button` for empty data, and `SDUI5Alert` for errors. Extended states (offline, permission denied, validation, partial data, first-use) must be declared in the screen contract (RULE-INTERACT-003).

### NEG-011 — Top-Level Nav with 6+ Items

**Wrong**: Navbar with 6 tabs at the top.  
**Reality**: Hick's Law. Cognitive friction scales with choice count.  
**Correct**: ≤ 5 top-level items. Overflow behind a "More" menu / `SDUI5Dropdown`.

### NEG-012 — Touch Targets Smaller Than 48px

**Wrong**: Tiny icon button without size padding.  
**Reality**: Fitts's Law + WCAG 2.5.5. Sub-48px targets fail.  
**Correct**: `.Classes = "min-h-12 min-w-12"` or use `SDUI5IconButton` if it exists for your use case.

### NEG-013 — Multiple Primary CTAs on One Screen

**Wrong**: Two buttons both with `.Color = "primary"`.  
**Reality**: Visual hierarchy collapses. User can't tell which to click.  
**Correct**: One primary per screen (`.Color = "primary"`, `.Size = "lg"`). Others use `neutral`, `ghost`, or `secondary`.

### NEG-014 — Destructive Actions Without Confirmation

**Wrong**: Delete button that fires the destructive action on click.  
**Reality**: One-tap destruction is hostile UX.  
**Correct**: `app.ShowSwalConfirm(message)` async before executing.

---

## 4. Web → SithasoDaisy5 Translation Anti-Patterns

### NEG-015 — `<div onclick="...">`

**Wrong**: Producing `<div class="row" onclick="fn()">` HTML.  
**Reality**: Not keyboard-navigable. WCAG 2.1.1 fail.  
**Correct**: Use `SDUI5Button` (real `<button>`) or another interactive component.

### NEG-016 — Custom `<style>` Blocks in Page Modules

**Wrong**: Producing `<style>.my-class { color: red; }</style>` inside pg*.bas component code.  
**Reality**: Component styling belongs in framework channels. One-off raw `<style>` blocks scattered per page fragment theming and get duplicated on navigation.  
**Correct**: `.Classes` (Tailwind, incl. arbitrary values), `.Styles` (inline CSS — first-class, never blocked), or app-level theme CSS for global rules (fonts, keyframes) loaded once via `UI.LoadAssetsOnDemand` / stylesheet.

### NEG-017 — Bypassing Framework Channels for Styling

**Wrong**: Emitting HTML strings with `style="..."` attributes to style components.  
**Reality**: Unnecessary — the framework has a first-class inline-style channel.  
**Correct**: `.Styles = "display: flex; gap: 16px"` on the SDUI5 component (base-class `setStyles`, `SDUI5Component.bas`) or `.Classes = "flex gap-4"`. Both allowed; prefer `.Classes` so Tailwind handles responsive variants.

### NEG-018 — Adding `localStorage.setItem`

**Wrong**: Direct browser storage API.  
**Reality**: Bypasses framework helpers (`app.LocalStorageSet/Get` add namespacing, JSON serialization, expiry).  
**Correct**: `app.LocalStorageSet(key, value)` / `app.LocalStorageGet(key, defaultValue)`.

### NEG-019 — React-style `useState` / `useEffect`

**Wrong**: Trying to mirror React state machinery.  
**Reality**: SDUI5 components are live objects; you mutate directly with setters.  
**Correct**: Set `.X = value` on the component instance; the framework re-renders that node.

### NEG-020 — Routing with `<a href>` Page Reloads

**Wrong**: Producing `<a href="login.html">Login</a>` to switch pages.  
**Reality**: Causes full page reload, loses app state.  
**Correct**: `BANano.Await(pgLogin.Show)` — pages navigate by calling the target page's `Show` directly.

### NEG-021 — JSON.parse for What `app` Provides

**Wrong**: Manually `JSON.parse(...)` for app data.  
**Reality**: `app` exposes typed wrappers.  
**Correct**: `app.LocalStorageGet` (already JSON-aware), `app.PBCollection(...)` for PocketBase, etc.

---

## 5. Data Display Anti-Patterns

### NEG-022 — Showing All Rows in an Unbounded Table

**Wrong**: `SDUI5Table.SetItems(thousandsOfRows)`  
**Reality**: Performance collapse, broken scroll.  
**Correct**: Paginate to 10–25 visible rows, or use `SDUI5List` for virtualization.

### NEG-023 — Forgetting `.Soft` / `.Outline` on Alters

**Wrong**: Every alert uses default `solid` styling.  
**Reality**: Visual fatigue; alert priority is unclear.  
**Correct**: Use `.Soft` for informational, `.Outline` for context, `.Solid` only for critical errors.

### NEG-024 — Infinite-Scroll-Without-Skeleton

**Wrong**: Table loads with no skeleton, then jumps from empty to populated.  
**Reality**: Layout shift (CLS) hurts perceived performance.  
**Correct**: Show `SDUI5Skeleton` (or `SDUI5Loading`) during fetch.

---

## 6. Theme & Color Anti-Patterns

### NEG-025 — Hex on Themed Components That Should Follow the Theme

**Wrong**: `.Classes = "bg-[#FF6B35]"` on a button that represents the app's primary action.  
**Reality**: Breaks theme switching — the component stops following `data-theme` and becomes a 1-theme app.  
**Correct**: For brand identity, configure it as the theme's `primary` (daisyUI CSS vars) + `.Color = "primary"`. Hex via `.Classes`/`.Styles` is fine for accents, decorative surfaces, and one-off designs where theme-following isn't the intent.

### NEG-026 — Different Colors for Same Semantic

**Wrong**: `.Color = "success"` on one button, `.Color = "primary"` on another "confirm" button.  
**Reality**: Same semantic = same color. Confuses users.  
**Correct**: Pick a token per semantic and stick to it across the app.

### NEG-027 — Background Colors on Text

**Wrong**: Light grey text on white background (`text-base-100` on `bg-base-100`).  
**Reality**: Insufficient contrast. WCAG fail.  
**Correct**: Match content to container (`text-base-content` on `bg-base-100`, `text-primary-content` on `bg-primary`).

---

## 7. Build / Wiring Anti-Patterns

### NEG-028 — Editing `0SithasoDaisy5\*.bas`

**Wrong**: Adding a method to `SDUI5Button.bas` to fix a missing setter.  
**Reality**: Your edit is in the source but not in `SithasoDaisy5.b4xlib` — it's lost on next build.  
**Correct**: Compose with existing public APIs only. If something is missing, request it upstream.

### NEG-029 — Forgetting `ModuleN=` for New Pages

**Wrong**: Adding `pgNewPage.bas` but not editing `<App>.b4j` to add `ModuleN=pgNewPage`.  
**Reality**: Unwired pages are silently omitted from the build.  
**Correct**: Add `ModuleN=pgNewPage` + bump `NumberOfModules` in your app's `.b4j`.

### NEG-030 — Custom Asset Missing `FileGroupN`

**Wrong**: `FileN=my-icon.svg` without `FileGroupN=Default Group`.  
**Reality**: Build crash with `ResourcesNotFoundException`.  
**Correct**: Both entries in `<App>.b4j`.

---

## 8. Web-Style Anti-Patterns

### NEG-031 — Using Web Framework Vocabulary

**Wrong**: "I'll mount a `<Portal>` to render this" / "wrap with `<Suspense>`".  
**Reality**: There is no portal/suspense in BANano.  
**Correct**: Use `app.ShowSwalXxx(...)` for async feedback; component visibility (`.Visible = True/False`) for show/hide.

### NEG-032 — Using HTML `title=` Attribute

**Wrong**: `<button title="Click me">×</button>`  
**Reality**: HTML `title` is OS-tooltip, not part of daisyUI tooltip system. Accessibility separate.  
**Correct**: `SDUI5ToolTip` with `.Title="Click me"` + component initialization.

### NEG-033 — Tailwind `bg-primary-content` on Buttons

**Wrong**: `.Classes = "bg-primary text-primary-content"` (manually applying the content pair).  
**Reality**: daisyUI's `btn-primary` class already applies the right content color. Manually adding it doubles up.  
**Correct**: Use semantic tokens only; trust daisyUI's built-in pairings.

---

## 9. Error Recovery Anti-Patterns

### NEG-034 — Swallowing Exceptions

**Wrong**:
```b4j
Try
    DoSomething
Catch
    ' silently do nothing
End Try
```
**Reality**: User has no idea why the screen is broken.  
**Correct**:
```b4j
Try
    DoSomething
Catch
    Log("pgXxx.DoSomething: " & LastException.Message)
    app.ShowSwalError(LastException.Message)
End Try
```

### NEG-035 — No Retry on Failed Fetch

**Wrong**: Error state shows "Failed to load" with no action.  
**Reality**: User has no way to recover.  
**Correct**: Add a "Retry" button (`SDUI5Button`) that re-invokes the load sub.

### NEG-036 — Component Cargo-Culting (screenshot/mockup literalism)

**Wrong**: Translating a mockup literally — "there is a card, therefore `SDUI5Card`", "there is a round thing, therefore `btn-circle`".  
**Reality**: Visual patterns in prompts/mockups are hypotheses, not specs. 1:1 pixel-to-component mapping produces semantically wrong markup (cards used as incidental groupers, divs-as-buttons, icons-as-buttons) and fights theme/accessibility.  
**Correct**: Extract function first, structure second, style last (design-intelligence.md DI-12). "There is a card" → "there is a grouped visual region representing related information" → then decide whether `SDUI5Card`, `SDUI5FieldSet`, `SDUI5ListItem`, `SDUI5Panel`, or plain layout is semantically right. Cite DI-12 in the trace when deviating from the literal mockup.

---

## 10. Quick Red Reference Table

| Mistake | Rule violated | Citation |
|---|---|---|
| `btn.setRequired(True)` | NEG-001 | Inventing setter names |
| `btn.Color = "#FF6B35"` | NEG-003 | Hex in `.Color` (setter contract) |
| `<button onclick="...">` | NEG-015 | Not keyboard-accessible |
| `<style>.x{}</style>` in pg*.bas | NEG-016 | Fragments theming — use .Classes/.Styles/app-level CSS |
| Skip hierarchy | NEG-009 | Layout collapse |
| No Empty state | NEG-010 | Blank screen on zero data |
| 6 tabs in navbar | NEG-011 | Hick's Law |
| Tiny icon button | NEG-012 | Fitts's Law + WCAG |
| Delete without confirm | NEG-014 | Hostile UX |
| Use `localStorage` directly | NEG-018 | Bypasses helpers |
| Hardcode theme-following component colors | NEG-025 | Breaks theme switching |
| Edit lib `.bas` | NEG-028 | Lost on next build |
| Missing `ModuleN=` | NEG-029 | Page silently omitted |
| Swallow exceptions | NEG-034 | User has no feedback |
| Mockup-mapped components 1:1 | NEG-036 | Component cargo-culting (DI-12) |

---

## 11. When You Spot One of These Mid-Generation

1. **Stop and correct** the code you're about to emit
2. **Cite the `NEG-*` ID** in your reasoning trace
3. **If the user's request mandates the violation**, document the trade-off explicitly
4. **Update the skill** (this file) if the anti-pattern is novel — add a new `NEG-XXX`

---

## 12. References

- `rules-enforcer.md` — the L1–L5 rules that turn some of these NEGs into hard gates
- `daisyui-compatibility.md` — the web → SDUI5 translation table; use it instead of guessing
- `component-manifest.md` — every component + status, so you know what's safe to use
- `ux-master-doctrine.md` — quantitative laws underpinning the NEGs above
