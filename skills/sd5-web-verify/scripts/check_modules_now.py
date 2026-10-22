import re
b4j = open(r'C:\b4j\workspace\0SithasoDaisy5\SithasoDaisy5.b4j', encoding='utf-8', errors='replace').read()
for name in ['SDUI5Fab', 'SDUI5FAB', 'SDUI5Textarea', 'SDUI5TextArea']:
    m = re.search(rf'^Module\d+={re.escape(name)}$', b4j, re.MULTILINE)
    print(f'  {name}: {"FOUND" if m else "NOT FOUND"} in b4j')