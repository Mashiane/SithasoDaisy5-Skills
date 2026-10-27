# Context-Aware Default Values & Layout Overrides

In SithasoDaisy5, components are designed with built-in default values in their `Designer Properties` / `SetDefaults` routines. These defaults allow components to render visibly when dropped standalone onto an unconstrained canvas in the Visual Designer.

However, in real responsive application development, components are placed inside **Parent Contexts** (e.g. `SDUI5Column`, `SDUI5Row`, `SDUI5Container`, Modals, Drawers). **Unchecked designer defaults frequently conflict with the parent layout contract.**

---

## 1. The Core Conflict: Standalone Defaults vs. Responsive Container Contexts

### The Classic Problem: `SDUI5Card.Width = "96"` inside `SDUI5Column`
* **Default in `SDUI5Card`**: `Width = "96"` (emits Tailwind `w-96`, which is a fixed width of $24\text{rem} = 384\text{px}$).
* **Container Context**: Placed inside an `SDUI5Column` with `SizeMd = "4"` (a 3-column desktop layout where each column might be $320\text{px} - 360\text{px}$ wide, or on a $360\text{px}$ mobile phone).
* **The Conflict**: Because the card is locked to $384\text{px}$ fixed width, it **overflows** its responsive grid column on smaller viewports and fails to stretch on wider viewports!
* **The Context Override**:
  ```b4j
  SDUI5Card1.Initialize(Me, "SDUI5Card1", "SDUI5Card1")
  SDUI5Card1.ParentID = "SDUI5Column1"
  SDUI5Card1.Width = "full"     '<--- MANDATORY: Overrides designer default "96" to fill column
  ```

---

## 2. High-Impact Context Overrides Matrix

| Component | Designer Default | Conflict Scenario | Mandatory Context Override |
|---|---|---|---|
| **`SDUI5Card`** | `Width = "96"` (`w-96` = 384px) | Inside `SDUI5Column` or any grid cell; overflows on mobile/narrow cols. | Set `.Width = "full"` so the card fills 100% of the column cell. |
| **`SDUI5Wizard`** | `Width = "96"` (`w-96` = 384px) | Inside a page container or column; locks to 384px. | Set `.Width = "full"` to expand across its container. |
| **`SDUI5Menu`** | `Width = "56"` (`w-56` = 224px) | Inside a sidebar drawer or column where full width is expected. | Set `.Width = "full"` if filling a drawer or column. |
| **`SDUI5Image`** | `Width = "12"`, `Height = "12"` (48px) | Used as a hero image, product picture, or card banner. | Set explicit `.Width = "full"` or appropriate pixel/Tailwind sizing (`h-48`, `w-full`). |
| **`SDUI5Row`** | `GridCols = "12"` | Child columns specify `SizeMd = 4` expecting a 3-column grid (4 of 12). | If setting row `GridColsMd = 3`, columns must NOT use `SizeMd = 4` (must use `SizeMd = 1` or leave unspanned). Keep `GridCols = "12"` when using standard 12-column spans (`SizeMd = "4"`). |
| **`SDUI5Hero`** | `Rounded` set, `Overlay = True` | Overlay sharp $90^\circ$ corners bleed out past rounded container curves. | Set `SDUI5Hero.Classes = "overflow-hidden"` to clip overlay. |
| **`SDUI5Stat`** | `Direction = "vertical"`, `MDDirection = "horizontal"` | Placed in narrow sidebars or single columns where horizontal layout cramps content. | Set `stat.Direction = "vertical"` and `stat.MDDirection = "vertical"` in narrow columns. |
| **`SDUI5Modal`** | `Width = "700px"`, `Size = "lg"` | Mobile phone screen ($360\text{px}$ - $400\text{px}$). | Use responsive modal classes or override width for compact dialogs. |

---

## 3. How to Determine Component Defaults

Every component's default values are documented in two authoritative locations:
1. **Per-Component Reference Files**: In `skills/sithasodaisy5/components/<Name>.md` under `## Designer Properties`, inspect the `Default` column.
2. **Framework Source Code**: In `03. Source Code/SithasoDaisy5/SDUI5<Name>.bas`, inspect `Public Sub SetDefaults` and `CustProps.Put(...)`.

### The 4 Questions to Ask Before Mounting Any Component:
1. **What is the parent?** (Grid column, row, page container, modal?)
2. **Does this component have a fixed default width/height?** (`Width = "96"`, `Width = "56"`, `Height = "12"`)
3. **Does the parent expect fluid 100% width (`w-full`)?** (Columns, cards, form inputs)
4. **Is an explicit override required?** (e.g. `.Width = "full"`, `.Classes = "overflow-hidden"`)

---

## 4. Verification Check in Conformance Gates

The negative-knowledge pre-scan (`pre-scan.ps1`) checks for cards mounted to columns without explicit width overrides:
* **Rule**: When `SDUI5Card` is mounted to an `SDUI5Column`, it should set `.Width = "full"` to prevent `w-96` overflow.
