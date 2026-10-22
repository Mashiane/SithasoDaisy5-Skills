import re
from pathlib import Path
COMP = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
print('Files with Verified Demo line:')
n = 0
for f in sorted(COMP.glob('*.md')):
    text = f.read_text(encoding='utf-8', errors='replace')
    if 'Verified Demo' in text:
        n += 1
print(f'  {n}')