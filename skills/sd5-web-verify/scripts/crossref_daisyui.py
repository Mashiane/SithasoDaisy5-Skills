#!/usr/bin/env python3
# -*- coding: utf-8 -*-
r"""Cross-reference daisyUI 5.7 components against SithasoDaisy5 SDUI5* components.

Locates each daisyUI component in our skill (components/ or _unused/) and reports:
- matches: daisyUI X -> SDUI5X (in components/)
- gaps: daisyUI X has no SDUI5 equivalent (in components/)
- orphaned-or-renamed: daisyUI X maps to a file in _unused/ (needs restoring)
- case-mismatched: daisyUI X maps to SDUI5X but file is mis-cased

Source of truth:
- daisyUI: C:\b4a\workspace\0SithasoDaisyUIKit\daisyui-master\skills\daisyui\components\*.md
- SDUI5: C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components\*.md
            C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components\_unused\*.md
"""
import re, sys, json
from pathlib import Path

sys.stdout.reconfigure(encoding='utf-8')

daisyui_dir = Path(r'C:\b4a\workspace\0SithasoDaisyUIKit\daisyui-master\skills\daisyui\components')
sd5_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
sd5_unused_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components\_unused')

daisyui = sorted([f.stem for f in daisyui_dir.glob('*.md')])

# Helper: find the SDUI5 file (any case) in either components/ or _unused/
def find_sd5(expected_name: str) -> str:
    """Return path string if found, else None. Case-insensitive lookup."""
    for sd5_file in sd5_dir.iterdir():
        if sd5_file.stem.lower() == expected_name.lower():
            return f'components/{sd5_file.name}'
    for sd5_file in sd5_unused_dir.iterdir():
        if sd5_file.stem.lower() == expected_name.lower():
            return f'_unused/{sd5_file.name}'
    return None

# Manual mapping (curated): daisyUI name -> expected SDUI5 file
manual_map = {
    'accordion': 'SDUI5Accordion',
    'alert': 'SDUI5Alert',
    'aura': 'SDUI5Aura',
    'avatar': 'SDUI5Avatar',
    'badge': 'SDUI5Badge',
    'breadcrumbs': 'SDUI5BreadCrumbs',
    'button': 'SDUI5Button',
    # SDUI5Calendar has source notes, but is not registered in ModuleN=.
    'calendar': None,
    'card': 'SDUI5Card',
    'carousel': 'SDUI5Carousel',
    'chat': 'SDUI5ChatBubble',
    'checkbox': 'SDUI5CheckBox',
    'collapse': 'SDUI5Collapse',
    'countdown': 'SDUI5CountDown',
    'diff': 'SDUI5Diff',
    'divider': 'SDUI5Divider',
    'dock': 'SDUI5Dock',
    'drawer': 'SDUI5Drawer',
    'dropdown': 'SDUI5DropDown',
    'fab': 'SDUI5Fab',
    'fieldset': 'SDUI5FieldSet',
    'file-input': 'SDUI5FileInput',
    'filter': 'SDUI5Filter',
    'footer': 'SDUI5Footer',
    'hero': 'SDUI5Hero',
    'hover-3d': 'SDUI5Hover3D',
    'hover-gallery': 'SDUI5HoverGallery',
    'indicator': 'SDUI5Indicator',
    'input': 'SDUI5TextBox',
    'join': 'SDUI5Join',
    'kbd': 'SDUI5Kbd',
    'label': 'SDUI5Label',
    'link': 'SDUI5Link',
    'list': 'SDUI5List',
    'loading': 'SDUI5Loading',
    'megamenu': 'SDUI5MegaMenu',
    'menu': 'SDUI5Menu',
    'mockup-browser': 'SDUI5Browser',
    'mockup-code': None,                 # NO SDUI5 equivalent
    'mockup-phone': 'SDUI5Phone',
    'mockup-window': 'SDUI5Window',
    'modal': 'SDUI5Modal',
    'navbar': 'SDUI5NavBar',
    'otp': 'SDUI5OTP',
    'pagination': None,                 # no registered pagination component
    'progress': 'SDUI5Progress',
    'radial-progress': 'SDUI5RadialProgress',
    'radio': 'SDUI5Radio',
    'range': 'SDUI5Range',
    'rating': 'SDUI5Rating',
    'select': 'SDUI5Select',
    'skeleton': 'SDUI5Skeleton',
    'stack': 'SDUI5Stack',
    'stat': 'SDUI5Stat',
    'status': 'SDUI5Status',
    'steps': 'SDUI5Steps',
    'swap': 'SDUI5Swap',
    'tab': 'SDUI5Tabs',
    'table': 'SDUI5Table',
    'text-rotate': 'SDUI5TextRotate',
    'textarea': 'SDUI5TextArea',
    'theme-controller': None,            # NO SDUI5 equivalent
    'timeline': 'SDUI5Timeline',
    'toast': 'SDUI5Toast',
    'toggle': 'SDUI5Toggle',
    'tooltip': 'SDUI5ToolTip',
    'validator': None,                  # NO SDUI5 equivalent
    # Utility class capability exposed through component .Mask properties,
    # not through a standalone component.
    'mask': 'SDUI5Avatar',
}

matches = []
needs_action = []
no_sd5 = []
for d in daisyui:
    expected = manual_map.get(d)
    if expected is None:
        no_sd5.append(d)
        continue
    path = find_sd5(expected)
    if path and path.startswith('components/'):
        # Check case match
        actual = path[len('components/'):-3]  # strip .md
        if actual == expected:
            matches.append((d, expected, 'OK'))
        else:
            matches.append((d, expected, f'CASE-DRIFT (file: {actual})'))
    elif path and path.startswith('_unused/'):
        needs_action.append((d, expected, 'IN_UNUSED (orphan)'))
    else:
        needs_action.append((d, expected, 'MISSING'))

# SDUI5 components without a daisyUI root (SithasoDaisy5 extensions beyond daisyUI)
sd5_norm_to_daisyui = {}
for d in daisyui:
    norm = d.replace('-', '').replace('_', '')
    sd5_norm_to_daisyui[norm] = d

def sd5_to_daisyui(name: str) -> str:
    n = re.sub(r'^SDUI5?', '', name)
    n = re.sub(r'([a-z])([A-Z])', r'\1-\2', n)
    n = re.sub(r'([A-Z]+)([A-Z][a-z])', r'\1-\2', n)
    return n.lower().replace('-', '').replace('_', '')

all_sd5 = {f.stem for f in sd5_dir.glob('*.md') if f.stem.startswith('SDUI5')}
unregistered_notes = {f.stem for f in sd5_unused_dir.glob('*.md')}
sd5_extensions = sorted(s for s in all_sd5 if sd5_to_daisyui(s) not in sd5_norm_to_daisyui)

# Print report
print('=' * 78)
print('daisyUI 5.7 vs SithasoDaisy5 SDUI5* Cross-Reference')
print('=' * 78)
print(f'daisyUI components:        {len(daisyui)}')
print(f'SDUI5 components (registered): {len(all_sd5)}')
print(f'Unregistered source notes: {len(unregistered_notes)}')
print()
print(f'--- 1:1 MATCHES ({len(matches)}) ---')
for d, s, status in matches:
    flag = '' if status == 'OK' else f'  [{status}]'
    print(f'  {d:25s} -> {s}{flag}')
print()
print(f'--- NEEDS ACTION ({len(needs_action)}) ---')
for d, s, issue in needs_action:
    print(f'  {d:25s} expected={s}   [{issue}]')
print()
print(f'--- daisyUI components WITHOUT SDUI5 equivalent ({len(no_sd5)}) ---')
for d in no_sd5:
    print(f'  {d}')
print()
print(f'--- SDUI5 EXTENSIONS beyond daisyUI core ({len(sd5_extensions)}) ---')
for s in sd5_extensions:
    nice = re.sub(r'^SDUI5?', '', s)
    in_main = (sd5_dir / f'{s}.md').exists()
    location = 'components/' if in_main else '_unused/'
    print(f'  {location}{s}.md  ({nice})')

# Save JSON for the report
report = {
    'daisyui_count': len(daisyui),
    'sd5_count': len(all_sd5),
    'unregistered_notes': sorted(unregistered_notes),
    'matches': [{'daisyui': d, 'sd5': s, 'status': st} for d, s, st in matches],
    'needs_action': [{'daisyui': d, 'expected_sd5': s, 'issue': i} for d, s, i in needs_action],
    'no_sd5_equivalent': no_sd5,
    'sd5_extensions': sd5_extensions,
}
Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sd5-web-verify\scripts\crossref_report.json').write_text(
    json.dumps(report, indent=2, ensure_ascii=False), encoding='utf-8'
)
print()
print(f'JSON report saved: crossref_report.json')
