import re
from pathlib import Path
demo_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J')
for name in ['SDUI5CountDown', 'SDUI5TextArea', 'SDUI5Textrotate', 'SDUIGoogleSheetsAPI', 'SDUIRestApi', 'SithasoDaisy5']:
    found = []
    for pg in demo_dir.glob('pg*.bas'):
        text = pg.read_text(encoding='utf-8', errors='replace')
        if re.search(rf'\b(?:Dim|Private|Public)\s+\w+\s+As\s+{re.escape(name)}\b', text):
            found.append(pg.name)
    print(f'{name:30s} found in: {found}')