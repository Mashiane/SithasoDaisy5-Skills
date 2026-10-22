import os
from pathlib import Path
files = [f for f in os.listdir(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components') if f.endswith('.md')]
print(f'Total .md: {len(files)}')
print('SDUI5CountDown.md in dir:', 'SDUI5CountDown.md' in files)
# find any file with SDUI5Count
count = [f for f in files if 'CountDown' in f or 'Countdown' in f]
print('count variants:', count)
# Now via Path.glob
skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
globbed = list(skill.glob('*.md'))
print(f'glob found {len(globbed)}')
print('SDUI5CountDown in glob:', any(p.name == 'SDUI5CountDown.md' for p in globbed))