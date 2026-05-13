# Getting Started with aaa-discovery

A Claude Code skill that runs you through a 15-step Discovery Phase — the sequence that turns a signed client engagement into a fully scoped, ticketed, client-ready project before any code is written.

**Target:** ≤ 5 business days from signed SOW to step 15 complete.

---

## Install (5 minutes)

**1. Download** the latest release zip:
`https://github.com/Automation-Architecture/aaa-discovery-template/releases/latest`

**2. Customize** — open `CUSTOMIZE.md` and find-and-replace each placeholder across `SKILL.md` and `references/`:

| Placeholder | What to enter |
|---|---|
| `<YOUR_WORKSPACE>` | Root path where client project repos live (e.g. `~/Documents/work`) |
| `<YOUR_CLIENT_DOCS_DIR>` | Where DOCX/PDF deliverables are saved |
| `<YOUR_GITHUB_ORG>` | Your GitHub org name |
| `<YOUR_ORG>.atlassian.net` | Your Jira Cloud subdomain |
| `<YOUR_DASHBOARD_URL>` | Where clients check project status |
| `<OPERATOR_EMAIL>` | The email client comms come from |
| `<Your Organization Name>` | Your org name (used in the brief template) |

**3. Install:**
```bash
./install.sh
```

**4. Restart Claude Code** so the skill reloads.

---

## Run it

Open Claude Code in your project directory:

```
/aaa-discovery
```

Or just describe the situation — Claude will recognize the trigger:

> "I just wrapped a sales call with a new client. Let's kick off discovery."

Claude will ask for kickoff inputs (client name, slug, assigned engineer, transcript location), add all 15 steps to the task list, and walk through them sequentially.

---

## The 15 steps

| # | Step | Produces |
|---|------|----------|
| 1 | Read sales call transcripts | Internal context |
| 2 | Read signed proposal | Internal context |
| 3 | Write project brief | `spec/project-brief.md` |
| 4 | `/grill-me` on brief — product scope (operator-led) | Locked product decisions |
| 5 | Write PRD via `/to-prd` | `spec/prd.md` |
| 6 | Create Jira project + board | Jira project |
| 7 | Create GitHub repo | `<org>/<slug>` |
| 8 | Send brief + PRD to team for feedback | Slack post to team channel |
| 9 | Revise specs with team feedback | Brief v1.1, PRD v1.1 |
| 10 | `/grill-me` on architecture — **engineer-led** | Locked architecture decisions |
| 11 | Write tech spec | `spec/tech-spec.md` |
| 12 | Populate Jira board via `board-nanny` | Epics + Tasks |
| 13 | Provision client-facing status artifact | Client URL |
| 14 | Generate DOCX deliverables | Brief, PRD, Tech Spec DOCX |
| 15 | Write client handoff email | `client-comms/email-to-<client>-handoff.md` |

---

## Four rules that matter

1. **Don't skip steps.** The sequence catches order-dependent gotchas that bite when you freelance it.
2. **Step 10 is engineer-led.** The assigned engineer drives the architecture grill — not the operator. If the engineer isn't assigned yet, assign them before step 10.
3. **DOCX deliverables never go in the repo.** They go in your client docs directory. The repo holds markdown source only.
4. **No financial info in tech docs.** Brief, PRD, tech spec, Jira — none of them ever contain pricing or payment details.

---

## Other skills this needs

Install these separately for the full stack:

| Skill | Used in |
|---|---|
| `/grill-me` | Steps 4, 10 |
| `/to-prd` | Step 5 |
| `board-nanny` agent | Step 12 |

---

Full reference: `SKILL.md` and the `references/` folder.
