from pathlib import Path
skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')
target = next((p for p in skill.glob('*.md') if p.stem == 'SDUI5CountDown'), None)
print('Found via glob:', target)
if target:
    print('Has Verified Demo:', 'Verified Demo' in target.read_text(encoding='utf-8', errors='replace'))
    print('First 15 lines:')
    for line in target.read_text(encoding='utf-8', errors='replace').splitlines()[:15]:
        print(f'  {line}')