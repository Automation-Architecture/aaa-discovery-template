---
name: aaa-discovery
description: Walks the operator through the Automation Architecture (AAA) Discovery Phase — a 13-step sequence that produces a fully scoped, ticketed project before any engineer writes code. Supports two engagement types — client (external) and internal_product (AAA-owned, e.g. AIOS products). Trigger on "kick off discovery", "start a new client", "new client engagement", "new AIOS product", "internal product discovery", "spin up a new project", "let's begin discovery", or `/aaa-discovery`. Also trigger when referencing "the 13 steps", "the AAA discovery flow", or "the canonical sequence". Orchestrates grill-me, to-prd, aaa-client-init, cto-technical-architect, and board-nanny in the right order.
---

# AAA Discovery Phase

## What this skill does

Discovery turns pre-build context into a fully ticketed project ready for engineers. It is **13 sequential steps**, run end-to-end, **before any feature code is written**. The skill:

- Tracks progress through the 13 steps using the operator's task list
- Branches on **`engagement_type`** (`client` | `internal_product`) for steps 1–2 and 11–12
- Hands off to other skills (`/grill-me`, `/to-prd`, `/aaa-client-init`) and agents (`cto-technical-architect`, `board-nanny`) at the right moments
- Enforces output-location conventions (markdown in repo at `spec/`, DOCX in Onboarding Drive for clients only, no financial info in tech docs)
- Catches order-dependent gotchas (project-key changes, version bumps, draft refreshes)

Discovery ends with a `#po` digest (step 13). **Build Phase** — per-feature SRS, app code, CDP backend — begins after step 13. See `references/build-phase-handoff.md`.

## Engagement type (set at kickoff)

**Ask first:** Is this a **client engagement** or an **internal product**?

| `engagement_type` | Examples | Steps 11–12 |
|---|---|---|
| `client` (default) | Kidneyhood Zendesk Agent | Dashboard + Onboarding Drive DOCX |
| `internal_product` | AIOS Second Brain, new AIOS product | **Skip** — mark N/A in digest |

Full matrix: `references/engagement-types.md`

## Throughput target

**48 hours from kickoff to step 13 complete.** For client projects, kickoff = Brad's `#po` Slack message. For internal products, kickoff = operator starts `/aaa-discovery` with repo + product intent docs ready.

Main external dependency: step 7 (engineer-led architecture grill ≤ 16 hours from `#po` notification). Slip past 72 hours end-to-end → post-mortem in `docs/throughput-log.md`. Rationale: `docs/why.md`.

## How discovery is triggered

### Client (`engagement_type=client`)

Brad completes three pre-discovery actions:

1. Creates the GitHub repo under `Automation-Architecture/<slug>` (private, with README)
2. Uploads the signed proposal to Onboarding Shared Drive (`0AOk2FIY4h-9gUk9PVA`) under `<Client Full Business Name>/proposal/`
3. Sends Slack to `#po` tagging Elsa with client name, slug, repo URL, 48-hour clock start

### Internal product (`engagement_type=internal_product`)

Operator confirms:

1. GitHub repo exists under `Automation-Architecture/<slug>`
2. Exploratory product docs in repo (`PRODUCT.md`, `spec/product-brief.md`, `docs/APP-STORY.md` — at least one)
3. Jira project key proposed or confirmed
4. Assigned engineer identified before step 7

No Onboarding Drive proposal. No client dashboard (steps 11–12 skipped).

## What you need at kickoff

See `references/engagement-types.md` for full checklists per type.

**Always gather:**

- **Project / product name**
- **Slug** (kebab-case)
- **GitHub repo URL**
- **`engagement_type`** — `client` or `internal_product`
- **Assigned engineer** (name + Slack user ID) — before step 7
- **Context pointer** — transcripts (client or internal meetings) and/or repo docs

**Client only:** client business name, primary contact, `#<slug>-sprint` channel, signed proposal in Drive.

**Internal only:** optional prototype repos to read (e.g. productize patterns from a client engagement).

If anything is unclear, ask before starting. Don't infer slugs — they bake into URLs, Jira keys, and routes.

## The 13 steps

Each step has a reference file under `references/step-NN-<name>.md`.

| # | Step | Reference | Output |
|---|------|-----------|--------|
| 1 | Read context (transcripts / repo docs) | `references/step-01-read-transcripts.md` | Internal context, no artifact |
| 2 | Read scope source (proposal or product docs) | `references/step-02-read-proposal.md` | Internal context, no artifact |
| 3 | Write the project brief | `references/step-03-write-brief.md` | `spec/project-brief.md` (v1.0) + DOCX to Drive (**client only**) |
| 4 | Autonomous product scope grill | `references/step-04-grill-me-brief.md` | `spec/GRILL_SESSION.md` Round 1 complete |
| 5 | Write the PRD via `/to-prd` | `references/step-05-write-prd.md` | `spec/prd.md` (v1.0) + DOCX to Drive (**client only**) |
| 6 | Create Jira board + epics | `references/step-06-create-jira.md` | Jira project, epics created |
| 7 | Architecture grill (engineer-led) | `references/step-07-grill-me-arch.md` | Slack to `#po`; `GRILL_SESSION.md` Round 2; epic updates |
| 8 | Write tech spec | `references/step-08-tech-spec.md` | `spec/tech-spec.md` + DOCX to Drive (**client only**) |
| 9 | Discovery document evaluation | `references/step-09-discovery-eval.md` | Scorecard (PASS or WARNs acknowledged) |
| 10 | Populate Jira board with tasks | `references/step-10-board-nanny.md` | Tasks under epics |
| 11 | Client dashboard | `references/step-11-client-dashboard.md` | Dashboard live — **client only; skip internal** |
| 12 | Verify DOCX in Drive | `references/step-12-spec-docx.md` | Three DOCXs confirmed — **client only; skip internal** |
| 13 | Post discovery digest to `#po` | `references/step-13-discovery-digest.md` | Slack digest; Discovery complete |

## Progress tracking

Add the 13 steps to the task list at kickoff. Mark each `in_progress` when started, `completed` when landed — don't batch. For internal products, mark steps 11–12 completed with note "N/A — internal product".

## Output-location conventions (non-negotiable)

- **Markdown source of truth** — project repo `spec/`: `project-brief.md`, `prd.md`, `tech-spec.md`, `GRILL_SESSION.md`
- **Client transcripts** — Fireflies/Granola MCP (step 1)
- **Client proposal** — Onboarding Shared Drive `0AOk2FIY4h-9gUk9PVA` (step 2, client only)
- **Internal product scope** — repo docs: `PRODUCT.md`, `spec/product-brief.md`, `docs/APP-STORY.md` (step 2, internal only)
- **DOCX deliverables** — pandoc to `/tmp/`, upload via Drive MCP to Onboarding Shared Drive `deliverables/` — **client only**. Never commit DOCX to git.
- **Memory** — `~/.claude/projects/-Users-brad-Documents-aaa-client-projects/memory/` (client) or project-appropriate path (internal)
- **No financial information** in any technical doc

## Tools and skills used

| Tool / skill / agent | Steps |
|----------------------|-------|
| Fireflies MCP, Granola MCP | 1 |
| Google Drive MCP | 2 (client), 3/5/8/12 DOCX (client) |
| `/to-prd` | 5 |
| Two-agent grill | 4 |
| Atlassian MCP (Jira) | 6, 7, 10 |
| `board-nanny` | 6, 10 |
| Slack MCP | 7, 13 |
| `cto-technical-architect` | 8 |
| Eval agent | 9 |
| `/aaa-client-init` | 11 (client only) |

## Phase boundary

Discovery ends after step 13. **Build Phase** follows — see `references/build-phase-handoff.md`. Do not roll Build steps into this skill.

## Common pitfalls

1. **Project key churn** — sweep codebase + memory + DOCX for stale Jira keys after recreation
2. **DOCX path discipline** — client only; inline upload at steps 3/5/8; step 12 verifies
3. **Product grill (step 4) is autonomous; architecture grill (step 7) is engineer-led**
4. **Version bumps signal substantive changes** — not cosmetic edits
5. **Don't skip steps 3–10 for internal products** — only 11–12 are N/A

## How to kick off

1. Confirm kickoff inputs + **`engagement_type`**
2. Read `references/engagement-types.md`
3. Add 13 steps to task list
4. Read `references/step-01-read-transcripts.md` and start step 1
5. Move sequentially — artifacts feed forward
6. After step 13, read `references/build-phase-handoff.md` before Build Phase

If the operator wants to deviate (skip a step, reorder), pause and ask. Out-of-order work caused rework on prior projects.

Begin.
