"""Generate an opaque-default palette comparison: python scripts/palette-preview.py."""
from pathlib import Path
import html
import re

source = Path('lua/carbon/palette.lua').read_text()
roles = ['fg', 'comment', 'keyword', 'variable', 'identifier', 'string', 'func', 'number', 'class', 'parameter', 'error', 'warning', 'info', 'hint']
parts = ['<!doctype html><meta charset="utf-8"><title>Carbon palette comparison</title><style>body{background:#888;font:16px monospace}main{display:flex;gap:16px;flex-wrap:wrap}section{padding:24px;min-width:270px}p{padding:8px}span{display:inline-block;width:130px}h2{font-size:18px}</style><h1>Carbon opaque defaults</h1><main>']
for name, body in re.findall(r'M\.(\w+) = \{(.*?)\n\}', source, re.S):
    colors = dict(re.findall(r'^\s*(\w+) = "(#[\da-fA-F]+)"', body, re.M))
    if 'bg' not in colors:
        continue
    parts.append(f'<section style="background:{colors["bg"]};color:{colors["fg"]}"><h2>{html.escape(name)}</h2>')
    for role in roles:
        parts.append(f'<p style="color:{colors[role]}"><span>{role}</span>{colors[role]}</p>')
    for surface in ['float_bg', 'panel_bg', 'cursor_line_bg', 'diff_add_bg', 'diff_remove_bg', 'diff_change_bg', 'selection']:
        parts.append(f'<p style="background:{colors[surface]}">{surface}</p>')
    parts.append('</section>')
Path('previews/palette.html').write_text(''.join(parts) + '</main>')
