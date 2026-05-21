#!/usr/bin/env bash
set -euo pipefail
PASSWORD='Base10Automation!'
SOURCE_FILE="source/Series_B_Prioritization.html"
OUTPUT_FILE="index.html"
TEMPLATE_TITLE="Base10 · Series A→B Prioritization"
INSTRUCTIONS="Enter the password to access Base10 · Series A→B Prioritization."
TPL="../skills/password-protected-site/templates/b10_password_template.html"
REMEMBER_DAYS=14

if [ ! -f "$SOURCE_FILE" ]; then
  echo "ERROR: $SOURCE_FILE not found. Drop the unencrypted source HTML there first."
  exit 1
fi

SALT=$(python3 -c "import json; print(json.load(open('.staticrypt.json'))['salt'])")

npx -y -p staticrypt staticrypt \
  "$SOURCE_FILE" \
  -p "$PASSWORD" \
  --short --remember "$REMEMBER_DAYS" \
  --template-title "$TEMPLATE_TITLE" \
  --template-instructions "$INSTRUCTIONS" \
  --template "$TPL" \
  --template-color-primary "#45AEEB" \
  --template-color-secondary "#F4F8FB" \
  -s "$SALT" \
  -c false \
  -d ./_tmp_encrypted

SOURCE_BASENAME=$(basename "$SOURCE_FILE")
mv "./_tmp_encrypted/$SOURCE_BASENAME" "$OUTPUT_FILE"
sed -i.bak "s|<title>Protected Page</title>|<title>$TEMPLATE_TITLE</title>|" "$OUTPUT_FILE"
rm -f "${OUTPUT_FILE}.bak"
rm -rf ./_tmp_encrypted

echo "Done. $OUTPUT_FILE updated. Now: git add index.html && git commit && git push"
