# aaa-discovery — Discovery Phase Skill for Claude Code

A [Claude Code](https://claude.ai/code) skill that walks an operator through a 15-step Discovery Phase — the structured sequence that turns a closed sale into a fully ticketed, team-reviewed, client-informed project before any engineer writes code.

Built by [Automation Architecture AI](https://automationarchitecture.ai). Shared as a template for other agencies and consultancies running AI engineering engagements.

---

## What it does

Discovery is the workflow that answers: *what exactly are we building, and is everyone aligned before we write a line of code?*

The skill:
- Tracks progress through 15 sequential steps using Claude Code's task list
- Hands off to other skills (`/grill-me`, `/to-prd`) and agents (`cto-technical-architect`, `board-nanny`) at the right moments
- Enforces output-location conventions so DOCX deliverables, markdown sources, and financial docs never end up in the wrong place
- Catches the order-dependent gotchas that come up on every project when you don't run this sequence

**The phase ends with:** work fully scoped, all tickets created, client dashboard live, spec DOCX deliverables generated, and a client handoff email staged. Build phase only begins after step 15.

## The 15 steps

| # | Step | Output |
|---|------|--------|
| 1 | Read sales call transcripts | Internal context |
| 2 | Read signed proposal | Internal context |
| 3 | Write project brief | `spec/project-brief.md` |
| 4 | `/grill-me` on brief (product scope) | Locked product decisions |
| 5 | Write PRD via `/to-prd` | `spec/prd.md` |
| 6 | Create Jira space + board | Jira project + board |
| 7 | Create GitHub repo | `<YOUR_GITHUB_ORG>/<slug>` |
| 8 | Send brief + PRD to team for feedback | Slack post |
| 9 | Update specs with team feedback | Brief v1.1, PRD v1.1 |
| 10 | `/grill-me` on architecture (**engineer-led**) | Locked architecture decisions |
| 11 | Write tech spec | `spec/tech-spec.md` |
| 12 | Populate Jira board (`board-nanny`) | Tickets created |
| 13 | Provision client-facing status artifact | Client URL |
| 14 | Generate spec DOCX deliverables | Brief, PRD, Tech Spec DOCX |
| 15 | Write client handoff email markdown | `client-comms/email-to-<client>-handoff.md` |

## Install

1. **Download** — [latest release](https://github.com/Automation-Architecture/aaa-discovery-template/releases/latest) → `aaa-discovery-template.zip` → unzip
2. **Customize** — open `CUSTOMIZE.md` and replace each placeholder with your org's values
3. **Install** — `./install.sh`
4. **Reload** — restart Claude Code

The skill installs to `~/.claude/skills/aaa-discovery/` — Claude Code's global skill directory.

## Invoke

From any project directory in Claude Code:

```
/aaa-discovery
```

Or just describe what you're doing:

> "I just got off a discovery call with a new client. Let's kick off discovery."

## Customize to your org

See `CUSTOMIZE.md` for the full list of placeholders. The main things you'll want to set:
- Your workspace path (where client project repos live)
- Your GitHub org
- Your Jira/Atlassian URL
- Step 13 (client dashboard) — replace with your own client delivery mechanism

## What's in this repo

| Path | What it is |
|---|---|
| `SKILL.md` | The skill entry point — 15-step overview, conventions, pitfalls |
| `references/` | One reference file per step with full playbook, commands, gotchas |
| `templates/` | Bundled templates (project brief, grill session, tech spec) |
| `install.sh` | Installs skill to `~/.claude/skills/aaa-discovery/` |
| `CUSTOMIZE.md` | All placeholders and what to replace them with |

## Related skills

This skill orchestrates three other skills. Install them separately if you want the full stack:

- [`grill-me`](https://github.com/Automation-Architecture/grill-me) — structured interview skill for stress-testing plans
- [`to-prd`](https://github.com/Automation-Architecture/to-prd) — converts a grill session into a PRD
- [`board-nanny`](https://github.com/Automation-Architecture/board-nanny) — populates a Jira board from a tech spec

## License

MIT
