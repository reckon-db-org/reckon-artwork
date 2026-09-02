#!/usr/bin/env bash
# Create the GitHub repo for this artwork checkout (if missing) and push main.
# Needs the GitHub CLI (`gh`) authenticated with repo-creation rights.
set -euo pipefail

ORG="${ORG:-reckon-db-org}"
REPO="${REPO:-reckon-artwork}"
cd "$(dirname "$0")/.."

command -v gh >/dev/null || { echo "gh (GitHub CLI) is required" >&2; exit 64; }

if gh repo view "$ORG/$REPO" >/dev/null 2>&1; then
    echo "$ORG/$REPO already exists on GitHub"
else
    echo "Creating $ORG/$REPO on GitHub..."
    gh repo create "$ORG/$REPO" --public --description "Reckon brand assets"
fi

git remote get-url origin >/dev/null 2>&1 || git remote add origin "git@github.com:$ORG/$REPO.git"
git push -u origin main
echo "Done: https://github.com/$ORG/$REPO"
