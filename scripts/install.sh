#!/usr/bin/env bash
# ATLAS setup script
# Prompts for your name and vault location, creates your intern folder,
# installs skills to ~/.claude/skills/, and saves config to ~/.claude/.env

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SKILLS_SRC="$REPO_DIR/skills"
SKILLS_DST="$HOME/.claude/skills"
VAULT_TEMPLATE="$REPO_DIR/vault-template"
ENV_FILE="$HOME/.claude/.env"

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   ATLAS — AI Intern Framework Setup      ║"
echo "╚══════════════════════════════════════════╝"
echo ""

# ── 1. Name ──────────────────────────────────────────────────────────────────
read -rp "Your name (used for vault folder): " ATLAS_USER_NAME
if [[ -z "$ATLAS_USER_NAME" ]]; then
  echo "Error: name cannot be empty." >&2
  exit 1
fi

# ── 2. Vault location ────────────────────────────────────────────────────────
# Try to detect Google Drive path on macOS
GDRIVE_DEFAULT=""
if [[ -d "$HOME/Library/CloudStorage" ]]; then
  GDRIVE_GUESS=$(find "$HOME/Library/CloudStorage" -maxdepth 2 -name "Obsidian" -type d 2>/dev/null | head -1)
  if [[ -n "$GDRIVE_GUESS" ]]; then
    GDRIVE_DEFAULT="$GDRIVE_GUESS"
  fi
fi

if [[ -n "$GDRIVE_DEFAULT" ]]; then
  echo ""
  echo "Detected Obsidian vault at: $GDRIVE_DEFAULT"
  read -rp "Vault path [press Enter to use above, or type a different path]: " ATLAS_VAULT_INPUT
  ATLAS_VAULT_PATH="${ATLAS_VAULT_INPUT:-$GDRIVE_DEFAULT}"
else
  echo ""
  echo "Where is your Obsidian vault? (e.g. ~/Documents/MyVault or a Google Drive path)"
  read -rp "Vault path: " ATLAS_VAULT_PATH
  if [[ -z "$ATLAS_VAULT_PATH" ]]; then
    echo "Error: vault path cannot be empty." >&2
    exit 1
  fi
fi

# Expand ~ if present
ATLAS_VAULT_PATH="${ATLAS_VAULT_PATH/#\~/$HOME}"

if [[ ! -d "$ATLAS_VAULT_PATH" ]]; then
  echo ""
  echo "Warning: '$ATLAS_VAULT_PATH' does not exist yet."
  read -rp "Create it? (y/N): " CREATE_VAULT
  if [[ "$CREATE_VAULT" =~ ^[Yy]$ ]]; then
    mkdir -p "$ATLAS_VAULT_PATH"
    echo "Created: $ATLAS_VAULT_PATH"
  else
    echo "Skipping vault creation. You can run this script again once the path exists."
  fi
fi

# ── 3. Create intern folder structure in vault ───────────────────────────────
INTERN_DIR="$ATLAS_VAULT_PATH/Interns/$ATLAS_USER_NAME"

if [[ -d "$INTERN_DIR" ]]; then
  echo ""
  echo "Intern folder already exists at: $INTERN_DIR — skipping."
else
  echo ""
  echo "Creating intern folder structure in vault..."
  mkdir -p "$INTERN_DIR/Sessions"
  mkdir -p "$INTERN_DIR/Research"
  mkdir -p "$INTERN_DIR/Scratchpad"
  mkdir -p "$INTERN_DIR/Retrospectives"

  # Shared and Company layers (only if they don't exist)
  mkdir -p "$ATLAS_VAULT_PATH/Shared/Research"
  mkdir -p "$ATLAS_VAULT_PATH/Shared/Patterns"
  mkdir -p "$ATLAS_VAULT_PATH/Shared/Decisions"
  mkdir -p "$ATLAS_VAULT_PATH/Company/Standards"
  mkdir -p "$ATLAS_VAULT_PATH/Company/Onboarding"

  # Copy welcome note if it doesn't exist
  WELCOME_SRC="$VAULT_TEMPLATE/Company/Onboarding/WELCOME.md"
  WELCOME_DST="$ATLAS_VAULT_PATH/Company/Onboarding/WELCOME.md"
  if [[ -f "$WELCOME_SRC" && ! -f "$WELCOME_DST" ]]; then
    cp "$WELCOME_SRC" "$WELCOME_DST"
  fi

  echo "  Created: $INTERN_DIR/{Sessions, Research, Scratchpad, Retrospectives}"
  echo "  Created: Shared/{Research, Patterns, Decisions}"
  echo "  Created: Company/{Standards, Onboarding}"
fi

# ── 4. Save config to ~/.claude/.env ─────────────────────────────────────────
echo ""
echo "Saving config to $ENV_FILE ..."
mkdir -p "$(dirname "$ENV_FILE")"
touch "$ENV_FILE"

# Remove any existing ATLAS_ lines, then append fresh values
TMPFILE=$(mktemp)
grep -v '^ATLAS_' "$ENV_FILE" > "$TMPFILE" || true
{
  echo "ATLAS_USER_NAME=$ATLAS_USER_NAME"
  echo "ATLAS_VAULT_PATH=$ATLAS_VAULT_PATH"
} >> "$TMPFILE"
mv "$TMPFILE" "$ENV_FILE"

echo "  ATLAS_USER_NAME=$ATLAS_USER_NAME"
echo "  ATLAS_VAULT_PATH=$ATLAS_VAULT_PATH"

# ── 5. Install skills ─────────────────────────────────────────────────────────
echo ""
echo "Installing skills to $SKILLS_DST ..."
mkdir -p "$SKILLS_DST"

for skill_dir in "$SKILLS_SRC"/*/; do
  skill_name="$(basename "$skill_dir")"
  dest="$SKILLS_DST/$skill_name"
  if [[ -d "$dest" ]]; then
    echo "  [skip] $skill_name (already exists — delete $dest to reinstall)"
  else
    cp -r "$skill_dir" "$dest"
    echo "  [installed] $skill_name"
  fi
done

# ── 6. CLAUDE.md guidance ────────────────────────────────────────────────────
echo ""
TEMPLATE_SRC="$REPO_DIR/CLAUDE.template.md"
echo "CLAUDE.md setup:"

read -rp "Path to your project repo (where you'll run 'claude'): " PROJECT_REPO
PROJECT_REPO="${PROJECT_REPO/#\~/$HOME}"

if [[ -n "$PROJECT_REPO" && -d "$PROJECT_REPO" ]]; then
  PROJECT_CLAUDE="$PROJECT_REPO/CLAUDE.md"
  if [[ -f "$PROJECT_CLAUDE" ]]; then
    echo ""
    echo "  ⚠️  A CLAUDE.md already exists at $PROJECT_CLAUDE"
    echo "  The ATLAS template will NOT overwrite it."
    echo ""
    echo "  To merge, run 'claude' in your project repo and say:"
    echo "  \"Please incorporate the ATLAS sections from $TEMPLATE_SRC into my CLAUDE.md\""
  else
    cp "$TEMPLATE_SRC" "$PROJECT_CLAUDE"
    # Replace placeholder name
    sed -i '' "s/{YOUR_NAME}/$ATLAS_USER_NAME/g" "$PROJECT_CLAUDE"
    echo "  [created] $PROJECT_CLAUDE (with your name pre-filled)"
    echo "  Review it before your first session — it's your Claude Code instructions."
  fi
else
  echo "  [skipped] No project path given."
  echo "  When you're ready, copy $TEMPLATE_SRC to your project repo as CLAUDE.md"
  echo "  Or run 'claude' in your project and ask it to incorporate the template."
fi

# ── Done ──────────────────────────────────────────────────────────────────────
echo ""
echo "╔══════════════════════════════════════════╗"
echo "║   Setup complete!                        ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. Open your vault in Obsidian: $ATLAS_VAULT_PATH"
echo "  2. Run 'gh auth login' if you haven't already"
echo "  3. Run 'claude' in your project repo to start"
echo "  4. Run /daybook at the end of each session"
echo ""
echo "Skills available in Claude Code:"
echo "  /crispy        — structured problem-solving before coding"
echo "  /debug         — systematic debugging"
echo "  /review        — two-stage code review"
echo "  /daybook       — end-of-session log"
echo "  /retrospective — weekly progress report"
echo "  /sensei        — learning mode (opt-in, great for your first few weeks)"
echo ""
echo "See setup/SETUP.md for the full walkthrough."
