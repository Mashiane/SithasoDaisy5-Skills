import sys, os
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from pathlib import Path
from add_verified_demo_citations import find_demos_for_component

skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
demo = Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J')
for name in ['SDUI5CountDown', 'SDUI5TextArea', 'SDUI5Fab']:
    md_file = skill / f'{name}.md'
    print(f'File exists: {md_file.exists()}')
    if md_file.exists():
        text = md_file.read_text(encoding='utf-8', errors='replace')
        print(f'  has Verified Demo: {"Verified Demo" in text}')
        demos = find_demos_for_component(name, demo)
        print(f'  demos found: {demos}')