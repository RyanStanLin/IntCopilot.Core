import argparse
import json
import re
from pathlib import Path
from urllib.parse import parse_qs, urlsplit

PARSER = argparse.ArgumentParser()
PARSER.add_argument('--private-captures', type=Path)
ARGS = PARSER.parse_args()
ROOT = Path(__file__).resolve().parents[1]
ALLOWED_HOSTS = {'github.com', 'docs.github.com', 'example.invalid', 'pcd.intschool.cn', 'teacher.intschool.cn', 'kcschengdu.dipont.com', 'njstatic.dipont.com', 'swift.org', 'www.swift.org', 'developer.apple.com'}
PRIVATE_VALUES = set()
if ARGS.private_captures:
    def collect(value):
        if isinstance(value, dict):
            for key, item in value.items():
                if key.lower() in {'password', 'account', 'username', 'token', 'accesstoken', 'access_token', 'email', 'mobile', 'idnum', 'cardnum'} and isinstance(item, str) and len(item) >= (4 if key.lower() == 'password' else 8):
                    PRIVATE_VALUES.add(item)
                collect(item)
        elif isinstance(value, list):
            for item in value: collect(item)
    for file in ARGS.private_captures.rglob('*.txt'):
        text = file.read_text(errors='replace').replace('\r\n', '\n')
        header, _, body = text.partition('\n\n')
        for line in header.splitlines():
            if re.match(r'(?i)^(?:x-token|cookie|set-cookie):', line):
                value = line.split(':', 1)[1].strip()
                if len(value) >= 16: PRIVATE_VALUES.add(value)
        try: collect(json.loads(body))
        except (json.JSONDecodeError, ValueError):
            for key, values in parse_qs(body).items():
                if key in {'password', 'username'}:
                    PRIVATE_VALUES.update(v for v in values if len(v) >= (4 if key == 'password' else 8))

findings = []
files = [p for p in ROOT.rglob('*') if p.is_file() and not any(part in {'.git', '.build', '.swiftpm', '__pycache__'} for part in p.relative_to(ROOT).parts)]
for file in files:
    relative = str(file.relative_to(ROOT))
    if file.suffix in {'.har', '.private'} or relative.startswith(('research/', 'captures/')) or '.private.' in file.name:
        findings.append((relative, 'private artifact path'))
    if file.suffix not in {'.swift', '.json', '.py', '.md', '.yml', '.yaml', '.txt'}: continue
    text = file.read_text(errors='replace')
    if re.search(r'eyJ[A-Za-z0-9_-]{12,}\.[A-Za-z0-9_-]{12,}\.[A-Za-z0-9_-]{12,}', text): findings.append((relative, 'JWT value'))
    if any(value in text for value in PRIVATE_VALUES): findings.append((relative, 'matches private credential/contact value'))
    for url in re.findall(r'https?://[^\s<>"\)\]}]+', text):
        host = urlsplit(url.rstrip("'.,;")).hostname
        if host and host not in ALLOWED_HOSTS and not host.endswith('.invalid'): findings.append((relative, 'unapproved external URL host'))
    if re.search(r'(?i)(?:X-Token|JSESSIONID)\s*[:=]\s*["\']?[A-Za-z0-9_-]{40,}', text): findings.append((relative, 'authentication material'))
if findings:
    for filename, category in sorted(set(findings)): print(filename + ': ' + category)
    raise SystemExit(1)
print(json.dumps({'filesAudited': len(files), 'privateValuesChecked': len(PRIVATE_VALUES), 'findings': 0}))
