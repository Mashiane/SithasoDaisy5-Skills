"""Find components/*.md files whose internal 'name:' doesn't match the filename."""
import os, re
from pathlib import Path

comp_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
mismatches = []
for md in sorted(comp_dir.glob('*.md')):
    text = md.read_text(encoding='utf-8', errors='replace')
    # Find `name: X` in frontmatter
    m = re.search(r'^name:\s*(\S+)', text, re.MULTILINE)
    if not m:
        continue
    internal = m.group(1).strip()
    file = md.stem
    if internal != file:
        mismatches.append((file, internal))
print(f'Case mismatches (filename vs frontmatter name:): {len(mismatches)}')
for f, n in mismatches:
    print(f'  file={f!r:30s}  name={n!r}')