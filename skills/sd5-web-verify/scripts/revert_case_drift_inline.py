import re
from pathlib import Path

skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')

RENAMES = [
    ('SDUI5FAB.md',      'SDUI5Fab.md',      'SDUI5FAB'),
    ('SDUI5Textarea.md', 'SDUI5TextArea.md', 'SDUI5Textarea'),
]

for current, target, internal in RENAMES:
    src = skill / current
    if not src.exists():
        print(f'  SKIP {current} (not found)')
        continue
    text = src.read_text(encoding='utf-8', errors='replace')
    new_name = target[:-3]
    new = re.sub(r'^name:\s*' + re.escape(internal) + r'\s*$', f'name: {new_name}', text, count=1, flags=re.MULTILINE)
    new = re.sub(r'^#\s*' + re.escape(internal) + r'\s*$', f'# {new_name}', new, count=1, flags=re.MULTILINE)
    tmp = skill / ('_tmp_' + current)
    tmp.write_text(new, encoding='utf-8')
    src.unlink()
    tmp.rename(skill / target)
    print(f'  REVERTED {current} -> {target}')

print()
print('Audit:')
for _, target, _ in RENAMES:
    f = skill / target
    if f.exists():
        text = f.read_text(encoding='utf-8', errors='replace')
        m = re.search(r'^name:\s*(\S+)', text, re.MULTILINE)
        print(f'  {target}: name={m.group(1) if m else "?"}')
    else:
        print(f'  {target}: MISSING')