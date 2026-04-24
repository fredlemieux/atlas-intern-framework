---
name: daybook
description: End-of-session conversational logger. Run at the end of every working session to reflect on what was done, surface blockers early, and evolve the framework.
---

# Session Log

## Trigger

`/daybook`

## Purpose

Conversational end-of-session reflection. Claude already knows what happened in the session — the daybook is about the intern's *perspective* on it: what felt hard, what surprised them, what's still unclear. Claude leads, the intern reacts.

## How It Works

### Step 1: Claude leads with what it observed

Don't ask "what did you work on?" — Claude already knows. Instead, open with a summary of the session from Claude's perspective:

> "Here's what I saw us work on today: [brief summary of tasks, files touched, decisions made]. Does that match how you experienced it? Anything I missed — including things you worked on outside this Claude session?"

This inverts the dynamic: the intern corrects and adds context rather than recapping from scratch. It also captures work done outside Claude (research, meetings, manual testing, etc.).

### Step 2: Probe with follow-ups

Ask 2-3 targeted questions based on the session. Good probes:

- "What felt hardest today — and why?"
- "What surprised you?"
- "Any dead ends worth capturing? Approaches you tried that didn't work?"
- "How are you feeling about the task -- on track, uncertain, blocked?"
- "Did you learn anything about the codebase you didn't know before?"
- "Is there anything you'd do differently if you started this task again?"

The goal is to draw out the things they'd otherwise forget to mention -- the dead ends, the "oh that's how it works" moments, the things that took longer than expected.

### Step 3: Check for shared knowledge

Ask:

> "Did you discover anything that others on the team should know about? Something worth adding to Shared/?"

If yes, remind them to add it (or offer to help write the note).

### Step 4: Write the structured log

Write the log to `$ATLAS_VAULT_PATH/Interns/$ATLAS_USER_NAME/Sessions/YYYY-MM-DD.md` with these sections:

```markdown
# Session Log -- YYYY-MM-DD

## What we worked on
[Claude's summary of the session, corrected and extended by the intern]

## Outside Claude
[Work done outside this Claude session — research, meetings, manual testing, etc. "Nothing" if not applicable]

## Stuck points
[What they got stuck on, how they resolved it or what's still blocking]

## Surprises and dead ends
[Approaches that didn't work, unexpected discoveries, things that took longer than expected]

## Shared
[Anything added to vault/Shared/, or "Nothing today"]

## Tomorrow
[What they plan to work on next]
```

### Step 5: Flag framework improvements (manager-reviewed)

After writing the log, review the conversation for genuine ATLAS improvements: a guardrail that was missing, a skill that could be clearer, a pattern worth formalising.

If something surfaces that would genuinely improve the framework — not just friction specific to this intern or project — flag it:

> "I noticed [specific insight]. This looks like it could improve the ATLAS framework itself — not just your local setup. Would you like me to raise a PR against the upstream ATLAS repo?"

If yes: draft the PR with a clear description of the change and the session context that motivated it. Apply the improvement to the local ATLAS instance immediately, regardless of whether the PR is raised.

If no: still apply the improvement locally and note it in `vault/Shared/Decisions/`.

### Step 6: Remind to push

After writing the log:

> "Don't forget to `git add` and `git push` before you close out. Your manager reads these logs async."

## Notes

- The intern's name comes from `$ATLAS_USER_NAME` (set during install). If the env var is missing, ask: "What's your name?" and remind them to run `./scripts/install.sh`.
- If a log already exists for today's date, append to it with a `---` separator and a timestamp.
- Keep the tone conversational and supportive. This is a debrief, not an interrogation.
- Framework improvement PRs are suggestions, not auto-merges. The manager reviews before anything lands upstream.

## Auto-Trigger: Morning Nudge via Session-Start Hook

Rather than triggering on session exit (which fires multiple times for multi-session users), ATLAS uses a **session-start check** instead.

When Claude opens, a startup script checks whether yesterday's session log exists. If it's missing, a one-time reminder appears at the top of the session — not blocking, not repeated on every message.

This is configured in `.claude/settings.json` (included in the repo):

```json
{
  "hooks": {
    "UserPromptSubmit": [
      {
        "type": "command",
        "command": "bash scripts/check-daybook.sh"
      }
    ]
  }
}
```

The `check-daybook.sh` script uses a `/tmp` flag file so it only fires once per calendar day, not once per message.
