import re
text = open(r'C:\b4j\workspace\0SithasoDaisy5DemoCode\B4J\pgModal.bas', encoding='utf-8', errors='replace').read()
pattern = re.compile(r'\bDim\s+\w+\s+As\s+SDUI5Modal\b')
matches = pattern.findall(text)
print('Matches:', len(matches))
# Also try the more general 'private' variant
pattern2 = re.compile(r'\b(?:Dim|Private|Public)\s+\w+\s+As\s+SDUI5Modal\b')
matches2 = pattern2.findall(text)
print('Matches2:', len(matches2))