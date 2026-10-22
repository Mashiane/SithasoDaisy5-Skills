#!/usr/bin/env python3
"""Fix the 2 case-drift files identified by the daisyUI cross-reference.

SDUI5Fab.md    -> SDUI5FAB.md    (normalize content to CamelCase)
SDUI5TextArea.md -> SDUI5Textarea.md (normalize content to camelCase)
"""
import re
from pathlib import Path

skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')

RENAMES = [
    # (current_filename, target_filename, internal_casing_to_replace)
    ('SDUI5Fab.md',     'SDUI5FAB.md',     'SDUI5Fab'),
    ('SDUI5TextArea.md','SDUI5Textarea.md','SDUI5TextArea'),
]

for current, target, internal in RENAMES:
    src = skill / current
    if not src.exists():
        print(f'  SKIP {current} (not found)')
        continue
    # Update content: frontmatter name: and heading
    text = src.read_text(encoding='utf-8', errors='replace')
    new = text
    new = re.sub(rf'^name:\s*{re.escape(internal)}\s*$', f'name: {target[:-3]}', new, count=1, flags=re.MULTILINE)
    new = re.sub(rf'^#\s*{re.escape(internal)}\s*$', f'# {target[:-3]}', new, count=1, flags=re.MULTILINE)
    # Rename file
    dst = skill / target
    dst.write_text(new, encoding='utf-8')
    src.unlink()
    print(f'  RENAMED {current} -> {target}')

# Verify
print()
print('Audit:')
for _, target, _ in RENAMES:
    f = skill / target
    text = f.read_text(encoding='utf-8', errors='replace')
    m = re.search(r'^name:\s*(\S+)', text, re.MULTILINE)
    print(f'  {target}: name={m.group(1) if m else "?"}')