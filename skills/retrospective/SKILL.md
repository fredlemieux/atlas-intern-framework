---
name: retrospective
description: Weekly or monthly progress assessment. Reads session logs and git history to produce a structured report.
---

# Retrospective

## Trigger

`/retrospective` -- your own retrospective for the past 7 days
`/retrospective @intern-name` -- retrospective for a specific intern
`/retrospective --all` -- manager mode: cohort summary across all interns

## Purpose

Reads session logs and git history to produce a structured progress report. Used for weekly reviews between intern and manager, and for monthly cohort assessments.

## How It Works

### Step 1: Gather session logs

Read all session logs from `$ATLAS_VAULT_PATH/Interns/$ATLAS_USER_NAME/Sessions/` for the relevant time period (default: past 7 days).

If no logs exist for the period, flag this immediately -- missing logs is a signal worth surfacing.

### Step 2: Gather git history

Run `git log --oneline --author="$ATLAS_USER_NAME" --since="7 days ago"` to see the intern's commits over the same period.

Also check for PRs: `git log --oneline --author="$ATLAS_USER_NAME" --since="7 days ago" --merges` or review open/merged PRs if using GitHub.

### Step 3: Produce the report

Write to `$ATLAS_VAULT_PATH/Interns/$ATLAS_USER_NAME/Retrospectives/YYYY-WW.md` (year-week format):

```markdown
# Retrospective -- Week WW, YYYY

## Velocity
- Commits: [count]
- Tasks completed: [list]
- PRs raised: [count and titles]
- Days with session logs: [N/5]

## Learning
- Themes from session logs: [recurring topics, skills being developed]
- Recurring stuck points: [patterns in what blocks them]
- Breakthroughs: [moments of understanding captured in logs]

## Knowledge Contribution
- Items added to Shared/: [list, or "none this week"]
- Quality of contributions: [brief assessment]

## Patterns
### Good habits observed
- [specific positive patterns from logs and git]

### Areas for improvement
- [specific areas with actionable suggestions]

## Next Week
- Suggested focus areas: [based on patterns observed]
- Stuck points to address: [unresolved blockers from this week]
- Skills to develop: [based on recurring challenges]
```

### Step 4: Present the report

Share the report with the intern (or manager, in `--all` mode) for discussion during the weekly review.

## Manager Mode (`/retrospective --all`)

When run with `--all`, produce a cohort summary:

1. Read all interns' session logs and git history
2. Produce individual retrospectives for each intern
3. Add a cohort summary section:

```markdown
# Cohort Retrospective -- Week WW, YYYY

## Individual Summaries
[One paragraph per intern: velocity, key learning, blockers]

## Cohort Patterns
- Common stuck points across interns
- Knowledge gaps appearing in multiple logs
- Shared/ contribution rate

## Manager Actions
- Topics to address in team sessions
- Interns who may need extra support
- Knowledge worth promoting to Company/Standards/
```

## Notes

- The intern's name comes from `$ATLAS_USER_NAME` (set during install). If missing, ask and remind them to run `./scripts/install.sh`
- Week numbers use ISO format (Monday start)
- Create the `Retrospectives/` folder if it doesn't exist
- Previous retrospectives in the folder provide useful comparison context
