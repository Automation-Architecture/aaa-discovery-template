# Engagement types

Every `/aaa-discovery` run starts by setting **`engagement_type`**. It controls which inputs apply in steps 1–2 and whether steps 11–12 run.

| Value | When to use |
|---|---|
| `client` | External client engagement — signed proposal, client dashboard, DOCX to Onboarding Drive |
| `internal_product` | AAA-owned product (e.g. AIOS Second Brain) — no client, no dashboard, no Onboarding Drive DOCX |

Default if not specified: **`client`**. Ask the operator if unclear.

---

## Side-by-side matrix

| Step | `client` | `internal_product` |
|---|---|---|
| **Kickoff trigger** | Brad: repo + proposal in Drive + `#po` Slack | Operator: repo exists + product intent docs in repo |
| **1 — Context** | Sales/discovery call transcripts (Fireflies/Granola) | Internal discovery meetings + repo docs (`PRODUCT.md`, `spec/product-brief.md`, `docs/APP-STORY.md`, related prototypes) |
| **2 — Scope source** | Signed proposal (Onboarding Shared Drive) | `spec/product-brief.md` + `PRODUCT.md` + `docs/APP-STORY.md` — **no Drive proposal** |
| **3–10** | Full sequence — identical | Full sequence — identical |
| **11 — Dashboard** | `/aaa-client-init` | **Skip** — mark N/A |
| **12 — DOCX verify** | Verify/upload to Onboarding Drive | **Skip** — mark N/A |
| **13 — Digest** | Full checklist + dashboard + DOCX links | Same digest; steps 11–12 show `N/A (internal product)` |

Steps 3–10 are **never skipped** for internal products. The spec quality floor (grill rounds, PRD, tech spec, Jira) is the same.

---

## Kickoff checklist — `client`

- Client business name (full)
- Client primary contact (name + email)
- Project name
- Slug (kebab-case)
- GitHub repo URL
- `#<slug>-sprint` channel exists
- Assigned engineer (name + Slack user ID) — required before step 7
- Sales call transcript pointer (Fireflies / Granola / `docs/client-comms/`)

---

## Kickoff checklist — `internal_product`

- Product name (e.g. "AIOS Second Brain")
- Slug (e.g. `aios-second-brain`)
- GitHub repo URL (`Automation-Architecture/<slug>`)
- Jira project key (proposed or confirmed)
- Assigned engineer (name + Slack user ID) — required before step 7
- Discovery context pointers:
  - Internal meeting transcripts (Fireflies/Granola), and/or
  - Repo exploratory docs: `PRODUCT.md`, `spec/product-brief.md`, `docs/APP-STORY.md`
  - Optional prototype repos to read (e.g. client engagement code to productize)
- Marketing repo URL (if separate — IQ pattern)
- **`engagement_type=internal_product`** recorded in session / `docs/PLANS.md` if the repo has one

---

## Project brief header — internal products

In `spec/project-brief.md` step 3, use:

```markdown
**Client:** AIOS (internal product)
```

Do not invent an external client name.

---

## Digest — internal product steps 11–12

In the step 13 checklist, render:

```
⏭ 11 — Client dashboard (N/A — internal product)
⏭ 12 — DOCX deliverables in Drive (N/A — internal product)
```

Omit dashboard and DOCX lines from the Key artifacts block, or note "N/A — internal product".
