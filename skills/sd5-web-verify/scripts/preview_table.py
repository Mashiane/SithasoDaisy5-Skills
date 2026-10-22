import sys
sys.path.insert(0, '.')
from enrich_components import render_enriched, HIGH_VALUE
import json
WORK = r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sd5-book-to-skill\work_2026-08-30'
comps = json.load(open(WORK + '\\components.json', encoding='utf-8'))
by_name = {c['name']: c for c in comps}
hint = next((h for n,_,h in HIGH_VALUE if n == 'SDUI5Table'), '')
archetype = next((a for n,a,_ in HIGH_VALUE if n == 'SDUI5Table'), 'data')
content = render_enriched('SDUI5Table', by_name['SDUI5Table'], archetype, hint)
print(content)