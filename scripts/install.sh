#!/usr/bin/env bash
# ATLAS setup script
# Copies skills to ~/.claude/skills/ and sets up vault

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_SRC="$REPO_DIR/skills"
SKILLS_DST="$HOME/.claude/skills"
VAULT_TEMPLATE="$REPO_DIR/vault-template"
VAULT_DST="$REPO_DIR/vault"

echo "ATLAS Setup"
echo "==========="
echo ""

# --- Skills ---
echo "Installing skills to $SKILLS_DST ..."
mkdir -p "$SKILLS_DST"

for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DST/$skill_name"
  if [ -d "$dest" ]; then
    echo "  [skip] $skill_name (already exists)"
  else
    cp -r "$skill_dir" "$dest"
    echo "  [installed] $skill_name"
  fi
done

echo ""

# --- Vault ---
if [ -d "$VAULT_DST" ]; then
  echo "Vault already exists at $VAULT_DST -- skipping."
else
  echo "Creating vault from template ..."
  cp -r "$VAULT_TEMPLATE" "$VAULT_DST"
  echo "Vault created at $VAULT_DST"
fi

echo ""
echo "Done! Next steps:"
echo ""
echo "  1. Open vault/ in Obsidian"
echo "  2. Copy your intern folder:  cp -r vault/Interns/_TEMPLATE vault/Interns/YourName"
echo "  3. Run 'gh auth login' if you haven't already"
echo "  4. Run 'claude' in the repo root to start"
echo ""
echo "See setup/SETUP.md for the full walkthrough."
