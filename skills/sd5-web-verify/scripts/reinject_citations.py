"""Re-inject Verified Demo citations on enriched components.

The enricher overwrote the .md files and dropped the existing Verified Demo
line (added earlier by add_verified_demo_citations.py). This script re-adds
that line on every components/*.md that doesn't already have it.
"""
import os
import re
from pathlib import Path

DEMO_DIR = Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J')
COMP_DIR = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')


def find_demos(comp_name):
    # Match both Dim and Private (used in Process_Globals)
    pattern = re.compile(rf'\b(?:Dim|Private|Public)\s+\w+\s+As\s+{re.escape(comp_name)}\b')
    found = []
    for pg in sorted(DEMO_DIR.glob('pg*.bas')):
        try:
            text = pg.read_text(encoding='utf-8', errors='replace')
        except Exception:
            continue
        if pattern.search(text):
            found.append(pg.name)
    return found


def main():
    touched = 0
    skipped = 0
    no_demo = 0
    for md in sorted(COMP_DIR.glob('*.md')):
        text = md.read_text(encoding='utf-8', errors='replace')
        if 'Verified Demo' in text:
            skipped += 1
            continue
        comp_name = md.stem
        demos = find_demos(comp_name)
        if not demos:
            no_demo += 1
            continue
        demo_str = '`, `'.join(demos[:5]) + (f'`, … (+{len(demos)-5} more)' if len(demos) > 5 else '`')
        cite = f'\n**Verified Demo**: `{demo_str}` (reference project only — see `0SithasoDaisy5DemoCode\\B4J\\`)\n'
        # Insert after the frontmatter closing ---
        lines = text.splitlines()
        fm_count = 0
        insert_idx = None
        for i, line in enumerate(lines):
            if line.strip() == '---':
                fm_count += 1
                if fm_count == 2:
                    insert_idx = i + 1
                    break
        if insert_idx is None:
            continue
        lines.insert(insert_idx, cite.rstrip())
        lines.insert(insert_idx + 1, '')
        md.write_text('\n'.join(lines), encoding='utf-8')
        touched += 1
    print(f'Re-injected: {touched}, Already had: {skipped}, No demo: {no_demo}')


if __name__ == '__main__':
    main()