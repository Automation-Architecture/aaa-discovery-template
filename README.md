# aaa-discovery — Discovery Phase Skill for Claude Code

A [Claude Code](https://claude.ai/code) skill that walks an operator through a **13-step Discovery Phase** — the structured sequence that turns pre-build context into a fully scoped, ticketed project before any engineer writes code.

Supports two **engagement types**: `client` (external) and `internal_product` (org-owned products).

Built by [Automation Architecture AI](https://automationarchitecture.ai). Shared as a template for other agencies and consultancies running AI engineering engagements.

---

## What it does

Discovery answers: *what exactly are we building, and is everyone aligned before we write a line of code?*

The skill:
- Tracks progress through **13 sequential steps** using Claude Code's task list
- Branches on **`engagement_type`** for steps 1–2 and 11–12
- Hands off to other skills (`/grill-me`, `/to-prd`) and agents (`cto-technical-architect`, `board-nanny`) at the right moments
- Enforces output-location conventions (markdown in `spec/`, DOCX to client Drive for `client` only)
- Documents **Build Phase** handoff (per-feature SRS via ba-kit) after step 13

**The phase ends with:** work fully scoped, Jira populated, `#po` digest sent. Build phase begins after step 13.

## Engagement types

| Type | When | Steps 11–12 |
|---|---|---|
| `client` | External client engagement | Client dashboard + DOCX to Drive |
| `internal_product` | Org-owned product (e.g. AIOS) | **Skip** — N/A in digest |

See `references/engagement-types.md` for full matrix.

## The 13 steps

| # | Step | Output |
|---|------|--------|
| 1 | Read discovery context | Internal context |
| 2 | Read scope source (proposal or product docs) | Internal context |
| 3 | Write project brief | `spec/project-brief.md` |
| 4 | Product scope grill (autonomous) | `spec/GRILL_SESSION.md` Round 1 |
| 5 | Write PRD via `/to-prd` | `spec/prd.md` |
| 6 | Create Jira board + epics | Jira project + epics |
| 7 | Architecture grill (**engineer-led**) | `GRILL_SESSION.md` Round 2 |
| 8 | Write tech spec | `spec/tech-spec.md` |
| 9 | Discovery document evaluation | Scorecard |
| 10 | Populate Jira board (`board-nanny`) | Tasks created |
| 11 | Client dashboard (`client` only) | Dashboard live |
| 12 | Verify DOCX in Drive (`client` only) | Three DOCXs confirmed |
| 13 | Post discovery digest to `#po` | Discovery complete |

## Install

1. **Download** — [latest release](https://github.com/Automation-Architecture/aaa-discovery-template/releases/latest) → unzip
2. **Customize** — open `CUSTOMIZE.md` and replace placeholders
3. **Install** — `./install.sh`
4. **Reload** — restart Claude Code

Installs to `~/.claude/skills/aaa-discovery/`.

## Invoke

```
/aaa-discovery
```

Set `engagement_type` at kickoff: `client` or `internal_product`.

## Customize to your org

See `CUSTOMIZE.md` for placeholders (`<YOUR_GITHUB_ORG>`, Jira subdomain, Drive paths, etc.).

## Four rules worth knowing

1. **Don't skip steps 3–10.** Order-dependent gotchas bite when you freelance it.
2. **Step 7 is engineer-led.** Assign the engineer before the architecture grill.
3. **DOCX never goes in the repo** (`client` engagements only).
4. **No financial info in tech docs.**

## What's in this repo

| Path | What it is |
|---|---|
| `SKILL.md` | Skill entry point — 13-step overview, engagement types, conventions |
| `references/` | One reference file per step + `engagement-types.md`, `build-phase-handoff.md` |
| `templates/` | Project brief, grill session, tech spec |
| `SYNC.md` | How Automation Architecture syncs from `claude-skills-shelf` |
| `install.sh` | Installs to `~/.claude/skills/aaa-discovery/` |

## License

MIT
