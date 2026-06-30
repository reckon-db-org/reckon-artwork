#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ORG="reckon-db-org"
REPO="reckon-artwork"

# Create repo on Codeberg
echo "Creating $ORG/$REPO on Codeberg..."
curl -sf -X POST "https://codeberg.org/api/v1/orgs/$ORG/repos" \
  -H "Authorization: token $CODEBERG_GOD_TOKEN" \
  -H "Content-Type: application/json" \
  -d "{
    \"name\": \"$REPO\",
    \"description\": \"Official ReckonDB brand assets — logos, icons, colour palette\",
    \"private\": false,
    \"auto_init\": false,
    \"default_branch\": \"main\"
  }" | python3 -c "import sys,json; d=json.load(sys.stdin); print('Created:', d['html_url'])"

# Init git and push
cd "$REPO_DIR"
git init -b main
git add -A
git commit -m "chore: initial artwork — logos, favicon, palette"
git remote add origin "https://codeberg.org/$ORG/$REPO.git"
git push -u origin main

echo "Done: https://codeberg.org/$ORG/$REPO"
