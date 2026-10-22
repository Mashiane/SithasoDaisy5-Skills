#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""Enrich component .md files with substantive Core Idea, Code Example, Composes With."""
import argparse
import json
import re
import sys
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8')

WORK = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sd5-book-to-skill\work_2026-08-30')
SKILL = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5')
DEMO = Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J')
COMP_DIR = SKILL / 'components'

HIGH_VALUE = [
    ('SDUI5Button',         'data',  'Primary click action. The workhorse -- one per screen for the main CTA.'),
    ('SDUI5TextBox',        'input', 'Multi-line text input. Use for descriptions, notes, addresses.'),
    ('SDUI5TextArea',       'input', 'Resizable textarea. TextBox = auto-grow, TextArea = scrollable.'),
    ('SDUI5Select',         'input', 'Single-select dropdown. Use for choosing one of N options.'),
    ('SDUI5MultiSelect',    'input', 'Multi-select dropdown. For tag pickers, multi-filter UIs.'),
    ('SDUI5CheckBox',       'input', 'Boolean checkbox. Use for opt-ins and multi-select lists.'),
    ('SDUI5CheckBoxGroup',  'input', 'Group of related checkboxes with shared GroupName.'),
    ('SDUI5Radio',          'input', 'Radio button. Always use inside SDUI5RadioGroup with a GroupName.'),
    ('SDUI5RadioGroup',     'input', 'Container of SDUI5Radio with shared name. Manages the selection state.'),
    ('SDUI5Toggle',         'input', 'Switch-style toggle. Use for on/off settings (notifications, dark mode).'),
    ('SDUI5Range',          'input', 'Slider for numeric value selection. Use From/To for range bounds.'),
    ('SDUI5Rating',         'input', 'Star rating (0-5). Use for feedback, review forms.'),
    ('SDUI5FileInput',      'input', 'File upload. Set Accept to restrict types (e.g. image/*,application/pdf).'),
    ('SDUI5OTP',            'input', 'One-time password input. Use for 2FA flows.'),
    ('SDUI5FieldSet',       'input', 'Group of related form fields with a legend. Reduces visual noise.'),
    ('SDUI5Form',           'input', 'Form wrapper. Submit event fires on submit button click.'),
    ('SDUI5Table',          'data',  'Paged, sortable table for tabular data. Set ItemsPerPage for pagination.'),
    ('SDUI5List',           'data',  'Virtualized list for long collections (>25 items). Set Items directly.'),
    ('SDUI5Stat',           'data',  'Single KPI tile (label + value + desc). Group with SDUI5Row for dashboards.'),
    ('SDUI5StatItem',       'data',  'Inner cell of a stat tile. Use Title, Value, Desc.'),
    ('SDUI5Card',           'data',  'Container card. Use .Image for hero image, .Title, .Content, .Actions.'),
    ('SDUI5Alert',          'feedback', 'In-page persistent alert. Use .Color semantic token, .Soft/.Outline variants.'),
    ('SDUI5Modal',          'feedback', 'Centered overlay dialog. Use Yes/No/Cancel action pattern via ActionType.'),
    ('SDUI5Drawer',         'feedback', 'Side drawer. Open via app.DrawerOpen("drawer_id").'),
    ('SDUI5Toast',          'feedback', 'Bottom-corner toast. Use app.ShowSwalSuccess/Error/Info instead -- lighter.'),
    ('SDUI5Loading',        'feedback', 'Spinner. Use during async fetches.'),
    ('SDUI5Skeleton',       'feedback', 'Skeleton placeholder. Use during initial load.'),
    ('SDUI5NavBar',         'nav',   'Top navigation bar. Use Title, BurgerClick, Back for back button.'),
    ('SDUI5Dock',           'nav',   'Bottom macOS-style dock. Add tabs via AddHomeTab/AddSearchTab/AddProfileTab.'),
    ('SDUI5Tabs',           'nav',   'Tabbed content switcher. Change event fires when tab selected.'),
    ('SDUI5TabsItem',       'nav',   'Individual tab inside SDUI5Tabs.'),
    ('SDUI5Segment',        'nav',   'Segmented control (iOS-style). Use for 2-5 mutually exclusive options.'),
    ('SDUI5BottomNavigation', 'nav', 'Bottom nav bar with icons. 3-5 items, mobile-first.'),
    ('SDUI5Steps',          'nav',   'Wizard steps indicator. Set Active for current step.'),
    ('SDUI5Wizard',         'nav',   'Multi-step wizard. Set Step1 to StepN content per stage.'),
    ('SDUI5BreadCrumbs',    'nav',   'Breadcrumb trail. Use inside SDUI5NavBar slot.'),
    ('SDUI5Footer',         'nav',   'Page footer. Use FooterTitle for column headers.'),
    ('SDUI5ToastChart',     'chart', 'Chart (toast UI). Line/bar/pie via its options.'),
    ('SDUI5TrendChart',     'chart', 'Sparkline. Compact trend for table cells or KPI tiles.'),
    ('SDUI5GenderChart',    'chart', 'Demographic chart (donut + breakdown).'),
    ('SDUI5App',            'app',   'App shell singleton. One per BANano app. Holds theme, UsesX, drawer state.'),
    ('SDUI5Component',      'app',   'Base class. Do not use directly.'),
    ('SDUI5Container',      'layout','Page-level container. One per page. Sets max-width and padding.'),
    ('SDUI5Row',            'layout','Grid row. Use GridColsMd / GridColsSm for responsive columns.'),
    ('SDUI5Column',         'layout','Grid column. Use SizeMd / SizeSm for responsive sizing.'),
    ('SDUI5Form',           'input', 'Form wrapper. Submit event fires on submit button click.'),
    ('SDUI5ChatBubble',     'layout','Single chat message. Use .Color for own-message highlighting.'),
    ('SDUI5BarcodeReader',  'input', 'Camera-based barcode scanner. Triggers ScanSuccess/ScanFailure.'),
    ('SDUI5Hero',           'layout','Hero section. Full-width background image + headline + CTA.'),
    ('SDUI5Image',          'media', 'Responsive image. Set Image (URL/path), Rounded, Shadow.'),
    ('SDUI5Progress',       'data',  'Linear progress bar. Set Value (0-100).'),
    ('SDUI5RadialProgress', 'data',  'Circular progress. Set --value via Value.'),
    ('SDUI5Divider',        'layout','Horizontal divider. Set Dash for dashed style.'),
    ('SDUI5Avatar',         'data',  'User avatar with optional status dot (online/offline).'),
    ('SDUI5AvatarGroup',    'data',  'Stack of overlapping avatars.'),
    ('SDUI5Badge',          'data',  'Inline status badge. Use Color semantic + Size xs/sm/md/lg/xl.'),
    ('SDUI5Indicator',      'data',  'Notification dot on a parent. Use IndicatorItem for the dot itself.'),
    ('SDUI5Aura',           'effect','Glow effect around a child element. One per page.'),
    ('SDUI5Hover3D',        'effect','3D tilt on hover. Use for featured cards.'),
    ('SDUI5HoverGallery',   'effect','Image gallery that swaps on horizontal hover.'),
    ('SDUI5Textrotate',     'effect','Rotating text animation. Use for "Design / Develop / Deploy" hero accents.'),
    ('SDUI5Swap',           'effect','Toggle visibility of two elements via checkbox or class.'),
    ('SDUI5Kbd',            'data',  'Keyboard shortcut badge.'),
    ('SDUI5Link',           'data',  'Anchor with hover underline. Use Color for semantic.'),
    ('SDUI5FullCalendar',   'data',  'FullCalendar.js wrapper. Use EventClick for event handling.'),
    ('SDUI5KanBan',         'data',  'Kanban board with drag-drop.'),
    ('SDUI5Timeline',       'data',  'Vertical/horizontal timeline. Use SDUI5TimelineItem children.'),
    ('SDUI5Collapse',       'data',  'Single show/hide panel. For groups, use SDUI5Accordion.'),
    ('SDUI5Accordion',      'data',  'Multi-item collapse group. Use .AddItem(title, contentPanel).'),
    ('SDUI5Carousel',       'media', 'Scrollable carousel. Use .AddItem(...) for slides.'),
    ('SDUI5Swiper',         'media', 'Touch-friendly swiper with pagination. Like Carousel but mobile-first.'),
    ('SDUI5SpeedDial',      'action','Radial floating-action menu. Use for quick actions.'),
    ('SDUI5FAB',            'action','Floating action button. Fixed bottom-right.'),
    ('SDUI5Join',           'layout','Groups items with shared border (button bar, segmented control).'),
    ('SDUI5Stack',          'layout','Stacks elements on top of each other (z-axis layout).'),
    ('SDUI5FooterTitle',    'nav',   'Footer column title.'),
]


def find_demos(comp_name):
    pattern = re.compile(rf'\bDim\s+\w+\s+As\s+{re.escape(comp_name)}\b')
    found = []
    for pg in sorted(DEMO.glob('pg*.bas')):
        try:
            text = pg.read_text(encoding='utf-8', errors='replace')
        except Exception:
            continue
        if pattern.search(text):
            found.append(pg.name)
    return found


def extract_snippet(text, comp_name, max_lines=12):
    dim_match = re.search(rf'(\s+Dim\s+\w+\s+As\s+{re.escape(comp_name)}\b[^\n]*)', text)
    if not dim_match:
        return ''
    start = dim_match.start()
    lines_after = text[start:].splitlines()
    snippet_end = start
    for i, line in enumerate(lines_after):
        snippet_end = start + sum(len(l)+1 for l in lines_after[:i+1])
        if 'AddComponent' in line or 'DesignerCreateView' in line:
            break
        if i > max_lines:
            break
    return text[start:snippet_end].strip()


def build_code_example(name, c, examples):
    if examples:
        _, snippet = examples[0]
        return snippet + "\n\n_(snippet from real demo; adapt to your page)_"
    var = name.replace('SDUI5', '').lower()
    return f'''Dim {var} As {name}
{var}.Initialize(Me, "{var}", "{var}")
{var}.setParentID("host_id")
{var}.Color = "primary"
BANano.Await({var}.AddComponent)'''


def build_variants(name, archetype):
    if archetype == 'input':
        return '''## Variants (most common)

```vb
component.Required = True
component.Validator = "required"
component.Size = "sm"      ' or xs / md / lg / xl
component.Color = "primary" ' or secondary / accent / info / success / warning / error
component.Ghost = True    ' transparent background
```'''
    elif archetype == 'data':
        return '''## Variants (most common)

```vb
component.ItemsPerPage = 25
component.Bordered = True
component.Zebra = True
component.Size = "sm"
```'''
    elif archetype == 'feedback':
        return '''## Variants (most common)

```vb
component.Soft = True
component.Color = "info"
component.Outline = True
component.Color = "warning"
component.Color = "error"  ' solid, most attention
```'''
    elif archetype == 'nav':
        return '''## Variants (most common)

```vb
component.Title = "Dashboard"
component.TitleCentered = True
component.Classes = "sticky top-0 z-50"
component.Active = True
```'''
    elif archetype == 'chart':
        return '''## Variants (most common)

```vb
component.ChartType = "line"  ' or bar / pie / area / scatter
component.SetData(seriesList, categoriesList)
component.Height = "h-64"
```'''
    elif archetype == 'layout':
        return '''## Variants (most common)

```vb
component.SizeMd = "6"   ' 6/12 of grid width on medium+
component.SizeSm = "12" ' full width on small
component.AlignSelf = "center"
component.AlignHorizontal = "center"
component.PaddingAXYTBLR = "a=4; x=4; y=4; t=0; b=0; l=0; r=0"
```'''
    elif archetype == 'media':
        return '''## Variants (most common)

```vb
component.Image = "./assets/hero.jpg"
component.Classes = "aspect-video object-cover"
component.SetImage("./assets/user.jpg")
component.SetStatus("online")
```'''
    elif archetype == 'effect':
        return '''## Variants (most common)

```vb
component.Classes = "relative"
component.Classes = component.Classes & " text-primary"
```'''
    elif archetype == 'app':
        return '''## Variants (most common)

```vb
app.Initialize(Me)
app.SetTheme(app.THEME_NORD)
Banano.Await(app.UsesDatePicker)
Banano.Await(app.UsesPocketBase)
```'''
    else:
        return '''## Variants (most common)

```vb
component.Color = "primary"
component.Size = "md"
component.Visible = True
component.Enabled = True
```'''


def build_composes(name, archetype):
    custom = {
        'SDUI5Button':       '- Parent: Container > Row > Column\n- For toolbars: **SDUI5Join** with `JoinItem=True`\n- For modals/forms: **SDUI5Modal** or **SDUI5Form** action slots',
        'SDUI5TextBox':      '- Pair with **SDUI5Label** for floating-label\n- Wrap in **SDUI5FieldSet** for grouped inputs\n- For form submission, place inside **SDUI5Form**',
        'SDUI5TextArea':     '- Pair with **SDUI5Label**\n- Wrap in **SDUI5FieldSet** for grouped inputs',
        'SDUI5Select':       '- Pair with **SDUI5Label**\n- For long option lists, also surface as **SDUI5List** for search/sort',
        'SDUI5MultiSelect':  '- For tag pickers. Display selected tags as **SDUI5Badge** chips',
        'SDUI5CheckBox':     '- Always inside a **SDUI5CheckBoxGroup** with `GroupName`\n- For binary settings, prefer **SDUI5Toggle**',
        'SDUI5Radio':        '- Always inside **SDUI5RadioGroup** with `GroupName`\n- One per option',
        'SDUI5Toggle':       '- For settings panels, grouped inside **SDUI5FieldSet**\n- Label via **SDUI5Label**',
        'SDUI5Form':         '- Children: **SDUI5TextBox/TextArea/Select/CheckBox/Radio/Toggle** + submit **SDUI5Button**\n- Wire `Submit` event handler for form-level logic',
        'SDUI5Modal':        '- Body: any content (text, forms, images)\n- Actions: **SDUI5Button** in the action slot\n- Trigger via **SDUI5Button** with `PopOverTarget=<modal_id>`',
        'SDUI5Table':        '- Wrap in `<div class="overflow-x-auto">` for horizontal scroll\n- For row actions, use **SDUI5Button** as last cell\n- For clickable rows, wire `RowClick` event',
        'SDUI5List':         '- Provide `Items` (B4J List of Maps)\n- For actions per item, use `ItemClicked` event',
        'SDUI5Stat':         '- Multiple stats in a **SDUI5Row** with `GridColsMd="4"`\n- For drill-down, wire `Click` event',
        'SDUI5Card':         '- Inside **SDUI5Column** with `SizeMd="4"` for 3-col grid\n- Header actions in `.Actions` slot',
        'SDUI5Alert':        '- For 4-state coverage, swap visibility based on data state\n- For transient toasts, use `app.ShowSwalInfo/Success/Error`',
        'SDUI5NavBar':       '- 1-5 items max (Hick\'s Law)\n- Use **SDUI5BreadCrumbs** in the start slot\n- For bottom nav, prefer **SDUI5BottomNavigation** or **SDUI5Dock**',
        'SDUI5Dock':         '- 3-5 tabs max\n- Add via `AddHomeTab/AddSearchTab/AddProfileTab`\n- Always-visible bottom bar',
        'SDUI5Tabs':         '- 2-7 tabs\n- Use `TabsItem` children\n- Wire `Change` event to switch content panel',
        'SDUI5OTP':          '- Trigger via **SDUI5Button** click, then show **SDUI5OTP**\n- On `Complete` event, verify via your backend',
        'SDUI5BarcodeReader':'- Inside a **SDUI5Container** so the camera view has known dimensions\n- Wire `ScanSuccess` to look up the scanned SKU',
        'SDUI5Accordion':    '- Use `AddItem(title, contentView)` (not direct children)\n- For 2-7 sections; for single show/hide use **SDUI5Collapse**',
        'SDUI5Carousel':     '- Add slides via `.AddItem(slideComponent)`\n- For mobile-friendly, use **SDUI5Swiper**',
        'SDUI5ToastChart':   '- Use its chart options to pick visualization\n- Wrap in **SDUI5Card** for consistent chrome',
    }
    default = '- Add to a parent via `ParentID` then `BANano.Await(AddComponent)` — never call `DesignerCreateView` explicitly; `AddComponent` runs it internally\n- Inherits base behavior from **SDUI5Component**'
    return custom.get(name, default)


def setter_list(setters):
    if not setters:
        return '_(uses base SDUI5Component setters only)_'
    return ', '.join(f'`{s}()`' for s in setters[:20]) + (f', … (+{len(setters)-20} more)' if len(setters) > 20 else '')


def emit_list(classes):
    if not classes:
        return '_(none emitted directly — relies on base/CustProps)_'
    return '**Classes**: ' + ', '.join(f'`{c}`' for c in classes[:10]) + (f', … (+{len(classes)-10} more)' if len(classes) > 10 else '')


def render_enriched(name, c, archetype, hint):
    props = c.get('props') or []
    events = c.get('events') or []
    classes = c.get('designer_classes') or []
    setters = c.get('setters') or []
    init_sig = c.get('init_sig') or ''
    has_dcv = c.get('has_designer_create_view', False)

    prop_rows = []
    for p in props:
        if p['key'] in ('ParentID', 'Visible', 'Enabled'):
            continue
        key = p['key']
        ftype = p['field']
        default = p.get('default', '—') or '—'
        lst = ', '.join(p.get('list') or []) or '—'
        prop_rows.append(f'| `{key}` | {ftype} | {default} | {lst} |')
    prop_table = '\n'.join(prop_rows) if prop_rows else '_(inherits from base — see SDUI5Component)_'

    event_list = ', '.join(f'`{e}`' for e in events) if events else '_(none)_'

    examples = []
    for pg in sorted(DEMO.glob('pg*.bas')):
        text = pg.read_text(encoding='utf-8', errors='replace')
        if re.search(rf'\bDim\s+\w+\s+As\s+{re.escape(name)}\b', text):
            snip = extract_snippet(text, name)
            if snip:
                examples.append((pg.name, snip))
                if len(examples) >= 1:
                    break
    code_example = build_code_example(name, c, examples)

    variants = build_variants(name, archetype)
    composes = build_composes(name, archetype)

    demos = find_demos(name)
    verified = ''
    if demos:
        demo_str = '`, `'.join(demos[:5]) + (f'`, … (+{len(demos)-5} more)' if len(demos) > 5 else '`')
        verified = f'\n**Verified Demo**: `{demo_str}` (reference project only — see `0SithasoDaisy5DemoCode\\B4J\\`)\n'

    return f'''---
name: {name}
description: SithasoDaisy5 {name} component reference — designer properties, events, setters, emitted daisyUI classes, and usage pattern.
---
{verified}
# {name}

## Core Idea
{hint}

## Skeleton Contract
Every SithasoDaisy5 component follows the same shape (see SDUI5Component base):
1. `Initialize(Callback, Name, EventName)` — sets `mCallBack`, `mName`, `mEventName`, calls `SetDefaults`.
2. `setParentID(id)` — attach point in the DOM.
3. `DesignerCreateView(Target, Props)` — reads `CustProps`, pushes daisyUI classes via `UI.AddClassDT/AddColorDT/AddRoundedDT/AddShadowDT`, appends `[BANCLEAN]<tag id="{{name}}">`, wires `UI.OnEvent`.
4. Live setters mutate the DOM via `UI.*ByID("{{name}}_child")`.

**Init signature**: `{init_sig or "Initialize(Callback As Object, Name As String, EventName As String)"}` | **Has DesignerCreateView**: {"Yes" if has_dcv else "No"}

## Designer Properties (most-used subset)
| Key | Type | Default | List |
|---|---|---|---|
{prop_table}

## Events
{event_list}

Wire in parent: `Sub <name>_<eventname>(e As BANanoEvent)` — the handler name is `${{mEventName}}_<eventname>` from `UI.OnEvent`.

## Code Example
```vb
{code_example}
```

{variants}

## Composes With
{composes}

## Key Setters (live DOM mutation, excluding base)
{setter_list(setters)}

## Emits (daisyUI classes pushed in DesignerCreateView)
{emit_list(classes)}
'''


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--target', help='enrich one specific component')
    ap.add_argument('--list', action='store_true', help='list high-value targets')
    ap.add_argument('--dry-run', action='store_true', help='preview without writing')
    args = ap.parse_args()

    if args.list:
        for name, _, _ in HIGH_VALUE:
            md = COMP_DIR / f'{name}.md'
            status = 'EXISTS' if md.exists() else 'MISSING'
            print(f'  {status:10s}  {name:30s}')
        return

    comps_data = json.loads((WORK / 'components.json').read_text(encoding='utf-8'))
    by_name = {c['name']: c for c in comps_data}

    targets = [args.target] if args.target else [name for name, _, _ in HIGH_VALUE]

    written = 0
    skipped_missing = 0
    skipped_no_data = 0
    for name in targets:
        md = COMP_DIR / f'{name}.md'
        if not md.exists():
            print(f'  SKIP (not found): {name}')
            skipped_missing += 1
            continue
        c = by_name.get(name)
        if not c:
            print(f'  SKIP (no extracted data): {name}')
            skipped_no_data += 1
            continue
        hint = next((h for n, _, h in HIGH_VALUE if n == name), f'See {name} reference for details.')
        archetype = next((a for n, a, _ in HIGH_VALUE if n == name), 'data')
        content = render_enriched(name, c, archetype, hint)
        if args.dry_run:
            print(f'  [DRY-RUN] would enrich {name} ({len(content)} chars)')
        else:
            md.write_text(content, encoding='utf-8')
            print(f'  WROTE {name}.md ({len(content)} chars)')
            written += 1

    print()
    print(f'Written: {written}, Missing: {skipped_missing}, No data: {skipped_no_data}')


if __name__ == '__main__':
    main()