"""Audit which component .md files are enriched vs stub."""
import os
from pathlib import Path

skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')

enriched = []
stub = []
for f in sorted(skill.glob('*.md')):
    text = f.read_text(encoding='utf-8', errors='replace')
    if '<!-- 1-2 sentences:' in text:
        stub.append(f.stem)
    else:
        enriched.append(f.stem)

print(f'Enriched: {len(enriched)} / {len(enriched)+len(stub)}')
print(f'Stub:     {len(stub)}')