# Getting Started with aaa-discovery

A Claude Code skill that runs you through a **13-step Discovery Phase** — scoped, ticketed, build-ready projects before any feature code is written.

Supports **`client`** (external) and **`internal_product`** (org-owned) engagement types.

**Target:** ≤ 48 hours from kickoff to step 13 complete.

---

## Install (5 minutes)

**1. Download** the latest release zip from this repo's releases page.

**2. Customize** — open `CUSTOMIZE.md` and replace placeholders in `SKILL.md` and `references/`.

**3. Install:**

```bash
./install.sh
```

**4. Restart Claude Code** so the skill reloads.

---

## Run it

```
/aaa-discovery
```

Claude will ask for kickoff inputs including **`engagement_type`** (`client` or `internal_product`), add all 13 steps to the task list, and walk through them sequentially.

---

## The 13 steps

| # | Step | Produces |
|---|------|----------|
| 1 | Read discovery context | Internal context |
| 2 | Read scope source | Internal context |
| 3 | Write project brief | `spec/project-brief.md` |
| 4 | Product scope grill (autonomous) | `GRILL_SESSION.md` Round 1 |
| 5 | Write PRD via `/to-prd` | `spec/prd.md` |
| 6 | Create Jira board + epics | Jira project |
| 7 | Architecture grill (**engineer-led**) | `GRILL_SESSION.md` Round 2 |
| 8 | Write tech spec | `spec/tech-spec.md` |
| 9 | Discovery eval | Scorecard |
| 10 | Populate Jira (`board-nanny`) | Tasks |
| 11 | Client dashboard (`client` only) | Dashboard URL |
| 12 | Verify DOCX in Drive (`client` only) | Three DOCXs |
| 13 | Post digest to `#po` | Discovery complete |

For `internal_product`, steps 11–12 are skipped (N/A in digest).

---

## Four rules that matter

1. **Don't skip steps 3–10.** Order-dependent gotchas bite when you freelance it.
2. **Step 7 is engineer-led.** Assign the engineer before the architecture grill.
3. **DOCX never goes in the repo** (client engagements only).
4. **No financial info in tech docs.**

---

## After discovery

See `references/build-phase-handoff.md` for Build Phase (per-feature SRS, implementation).
