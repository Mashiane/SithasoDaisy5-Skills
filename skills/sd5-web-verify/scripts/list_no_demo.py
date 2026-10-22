"""Classify components without Verified Demo citations."""
demo_path = Path = None  # noqa
import re
from pathlib import Path

demo_dir = Path(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J')
skill = Path(r'C:\b4j\workspace\0SithasoDaisy5Skills\skills\sithasodaisy5\components')

no_demo = []
for md in sorted(skill.glob('*.md')):
    text = md.read_text(encoding='utf-8', errors='replace')
    if 'Verified Demo' not in text:
        no_demo.append(md.stem)

# Heuristics for classification
helpers_shells = {'modSD5', 'SDUI5App', 'SDUI5MDToast', 'SDUI5Swal', 'SDUI5EmojiMart', 'SDUI5EmojiMart1',
                  'SDUI5Component', 'SDUI5Container', 'SDUI5Row', 'SDUI5Column', 'SDUI5Pivot',
                  'SDUI5BasicLabel', 'SDUI5ChatItem'}
orphans = {'SDUI5Client', 'SDUI5EnjoyHint', 'SDUI5ExcelReport', 'SDUI5Fab'}
documented_only = {'SDUI5Aura', 'SDUI5Calendar', 'SDUI5Conversation', 'SDUI5EmojiMart',
                    'SDUI5EnjoyHint', 'SDUI5FAIconPicker', 'SDUI5Form', 'SDUI5GoogleAdSense',
                    'SDUI5KanBan', 'SDUI5Megamenu', 'SDUI5MultiSelect', 'SDUI5Slider',
                    'SDUI5SliderItem'}

print(f'No-demo components: {len(no_demo)}')
for n in no_demo:
    cat = '?'
    if n in helpers_shells: cat = 'helper/shell'
    elif n in orphans: cat = 'orphan (not in ModuleN=)'
    elif n in documented_only: cat = 'documented-only'
    print(f'  {n:30s} {cat}')