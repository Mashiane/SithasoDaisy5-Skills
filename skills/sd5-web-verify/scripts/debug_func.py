import sys
sys.path.insert(0, r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sd5-web-verify\scripts')
from add_verified_demo_citations import find_demos_for_component
from pathlib import Path
demos = find_demos_for_component('SDUI5CountDown', Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J'))
print(f'Demos found: {demos}')