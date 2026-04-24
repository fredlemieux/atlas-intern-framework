#!/usr/bin/env bash
# ATLAS — Morning daybook nudge
#
# Checks whether yesterday's session log was filed. If not, prints a one-line
# reminder. Uses a /tmp flag file so it only fires once per calendar day —
# not on every message submission.
#
# Called by the UserPromptSubmit hook in .claude/settings.json.
# Only active for interns (ATLAS_ROLE=intern). Managers are skipped.

set -euo pipefail

ROLE="${ATLAS_ROLE:-intern}"
VAULT_PATH="${ATLAS_VAULT_PATH:-}"
USER_NAME="${ATLAS_USER_NAME:-}"

# Only run for interns
if [[ "$ROLE" != "intern" ]]; then
  exit 0
fi

# Skip if config is missing (not yet set up)
if [[ -z "$VAULT_PATH" || -z "$USER_NAME" ]]; then
  exit 0
fi

# One-per-day guard — use a /tmp flag file dated today
TODAY=$(date +%Y-%m-%d)
FLAG_FILE="/tmp/atlas-daybook-checked-$TODAY"

if [[ -f "$FLAG_FILE" ]]; then
  exit 0
fi

# Mark as checked for today (regardless of outcome)
touch "$FLAG_FILE"

# Compute yesterday's date (cross-platform: macOS + Linux)
YESTERDAY=$(date -d "yesterday" +%Y-%m-%d 2>/dev/null || date -v-1d +%Y-%m-%d)

SESSION_FILE="$VAULT_PATH/Interns/$USER_NAME/Sessions/$YESTERDAY.md"

if [[ ! -f "$SESSION_FILE" ]]; then
  echo "📋 Yesterday's session log is missing. Run /daybook when you have a moment."
fi
