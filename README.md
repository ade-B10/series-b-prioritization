# Base10 · Series A→B Prioritization (Password-Protected GitHub Pages)

Series B leaning-in prioritization across the Series A → B sheet. Ranked top-15 with bull/bear per. Internal Base10.

Live URL: https://ade-b10.github.io/series-b-prioritization/
Password: `Base10Automation!`

## What's here

- `index.html` - encrypted page (committed to GitHub)
- `source/Series_B_Prioritization.html` - unencrypted source (gitignored)
- `update.sh` - re-encrypt + push helper
- `.staticrypt.json` - salt (DO NOT change; password hash depends on it)

## Update workflow

1. Edit the source HTML at `source/Series_B_Prioritization.html`
2. `./update.sh` (re-encrypts using the committed salt)
3. `git add index.html && git commit -m "Refresh" && git push`

GitHub Pages auto-deploys in ~30 seconds.
