#!/usr/bin/env python3
"""Add verified-demo citations to each components/<Name>.md.

For each SDUI5* component with a matching pgXxx.bas demo, prepend a 'Verified Demo'
line to the .md file's Overview section.

Strategy:
1. Auto-detect: find all pg*.bas files that declare `Dim X As <ComponentName>` — those are demos for that component.
2. Add the citation to each components/<Name>.md if it has at least one such demo.
3. Skip if already has 'Verified Demo' line.
"""
import os, re, sys
from pathlib import Path


def find_demos_for_component(comp_name: str, demo_dir: Path) -> list:
    """Return sorted list of pg*.bas files that declare comp_name as a type.

    Matches both `Dim X As <Name>` and `Private X As <Name>` (used in Process_Globals).
    """
    refs = []
    if not demo_dir.exists():
        return refs
    pattern = re.compile(rf'\b(?:Dim|Private|Public)\s+\w+\s+As\s+{re.escape(comp_name)}\b')
    for pg in sorted(demo_dir.glob('pg*.bas')):
        try:
            text = pg.read_text(encoding='utf-8', errors='replace')
        except Exception:
            continue
        if pattern.search(text):
            refs.append(pg.name)
    return refs


def main():
    skill_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5')
    demo_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J')
    components_dir = skill_dir / 'components'

    if not components_dir.exists():
        print(f'FAIL: components dir not found: {components_dir}')
        return 2

    touched = 0
    skipped = 0
    no_demo = 0
    no_demo_names = []
    for md_file in sorted(components_dir.glob('*.md')):
        comp_name = md_file.stem
        text = md_file.read_text(encoding='utf-8', errors='replace')
        if 'Verified Demo' in text:
            skipped += 1
            continue
        demos = find_demos_for_component(comp_name, demo_dir)
        if not demos:
            no_demo += 1
            no_demo_names.append(comp_name)
            continue
        cite = f'**Verified Demo**: `' + '`, `'.join(demos[:5]) + (f'`, … (+{len(demos)-5} more)' if len(demos) > 5 else '`') + ' (reference project only — see `0SithasoDaisy5DemoCode\\B4J\\`)\n'
        lines = text.splitlines()
        # Find first "# <comp_name>" line (case-insensitive — some legacy .md files have case drift)
        h1_idx = None
        for i, line in enumerate(lines):
            if line.lstrip('#').strip().lower() == comp_name.lower():
                h1_idx = i
                break
        if h1_idx is None:
            continue
        lines.insert(h1_idx, '')
        lines.insert(h1_idx + 1, cite)
        md_file.write_text('\n'.join(lines), encoding='utf-8')
        touched += 1

    print(f'Touched {touched} .md files; skipped {skipped} (already had line); no demo for {no_demo}: {no_demo_names[:20]}')


if __name__ == '__main__':
    main()