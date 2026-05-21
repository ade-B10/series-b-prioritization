# Deploy Guide - Base10 · Series A→B Prioritization

The site lives at: https://ade-b10.github.io/series-b-prioritization/
Password: `Base10Automation!`

## Re-encrypting after edits

```bash
cd /Users/ade/Desktop/Urizen/series-b-prioritization-deploy
# Edit source/Series_B_Prioritization.html
./update.sh
git add index.html && git commit -m "Refresh" && git push
```

GitHub Pages re-deploys in ~30s.
