# Step 2 — Read the scope source

> **Branch on `engagement_type`:** Client → signed proposal in Onboarding Drive below. Internal product → jump to [Internal product](#internal-product).

## Goal

Internalize the formal scope before writing the project brief. For clients, the signed proposal is authoritative. For internal products, exploratory repo docs replace the proposal.

---

## Client (`engagement_type=client`)

Read the **signed proposal**.

## Where the proposal lives

Proposals are stored in the **Onboarding Shared Drive** on Google Drive:

- **Shared Drive:** [Onboarding](https://drive.google.com/drive/folders/0AOk2FIY4h-9gUk9PVA)
- **Drive ID:** `0AOk2FIY4h-9gUk9PVA`
- **Expected path inside the drive:** `<Client Full Business Name>/proposal/`

Use the Google Drive MCP (`mcp__claude_ai_Google_Drive__search_files`) to locate the file:

```
query: "title contains 'Proposal' and parentId = '<client-folder-id>'"
```

Or browse directly via the Drive URL above. Typical filename: `<Business Name>_Proposal_<Engineer>.pdf` (or `.docx`). There may also be a signed SOW separately.

To read the file once located, use `mcp__claude_ai_Google_Drive__read_file_content` with the file ID returned by the search.

If the proposal isn't in the Onboarding Shared Drive, **stop and ask the operator** — Discovery should not proceed without one. The proposal is what got the client to sign and is non-negotiable as a Discovery input.

> **Migrated 2026-06-15:** Proposals moved from `~/Documents/aaa/Client Docs/<Client Full Business Name>/proposal/` to the Onboarding Shared Drive. The local path no longer contains the source document for any engagement.

## What to extract

- **Defined scope** — what the proposal explicitly committed to deliver. The brief and PRD must respect this; out-of-scope items in the proposal are out-of-scope for Discovery.
- **Deliverables list** — concrete artifacts the client expects (e.g., "deployed agent + admin dashboard + 2-week burn-in support")
- **Timeline expectations** — start date, target launch, any contractual milestones
- **Stakeholders & decision-makers** — names + roles, especially anyone who signs off beyond the primary contact
- **Required client-provided assets** — books, content libraries, historical data, access credentials
- **Compliance constraints** — any regulatory, data residency, or industry constraints called out
- **Integration scope** — which third-party systems the proposal commits to integrating with

## What NOT to extract into tech docs

The proposal contains financial information (pricing, payment terms, invoicing schedule). **Do not surface any of this in the brief, PRD, tech spec, README, Jira, or any other tech artifact.** Per the operator's global rule: tech docs stay technical. Financial content stays in the proposal (on the Onboarding Shared Drive) and the sales conversation only — it never crosses into any technical document.

When you read the proposal in this step, *use* the budget/timeline information to inform your understanding of constraints, but never copy it into a tech doc. The "Timeline" you write in the brief should be in calendar terms (e.g., "2–3 week build window") not in invoicing terms.

## How to read it

PDFs are the most common format. Use `mcp__claude_ai_Google_Drive__read_file_content` with the file ID to retrieve the content — load the tool schema first via `ToolSearch("select:mcp__claude_ai_Google_Drive__read_file_content")`. If you need to extract specific tables (e.g., a milestones list), the Drive MCP returns plain text that Claude can parse directly.

If you find ambiguity between the proposal and the sales call transcripts (e.g., transcript says "we'll do X" but proposal omits X, or vice versa), surface this immediately to the operator. Don't paper over it. The operator decides whether the brief tracks the proposal or the latest verbal agreement.

## What to write down

Like step 1 (sales call transcripts), don't create a new artifact yet. The brief in step 3 is the consolidation. Just make sure you can answer:
- "What did the client formally commit to receive?"
- "What did the client formally commit to provide?"
- "What's explicitly out-of-scope per the proposal?"

## Done when (client)

You have the formal scope and deliverables crisp in your working context, alongside step 1 transcript context. Move to step 3.

## Pitfalls (client)

- **Don't conflate signed proposal with verbal agreement.** If the operator agreed to add or remove something on a later call, the proposal is stale unless an addendum or revised SOW exists. Ask.
- **Don't copy financial figures into the brief or PRD.** Re-read the global rule if you're tempted.
- **Don't skip this step because "the operator already knows what's in it."** The skill's job is to be useful even when the operator hasn't reread the proposal in weeks.

---

## Internal product (`engagement_type=internal_product`)

There is **no signed proposal** and **no Onboarding Drive lookup**. Step 2 reads the repo's exploratory product docs.

### Read (in order)

| File | Purpose |
|---|---|
| `PRODUCT.md` | Users, purpose, design principles, anti-references |
| `spec/product-brief.md` | Problem, aha moment, MVP candidates, CDP boundary |
| `docs/APP-STORY.md` | End-to-end user journey intent |
| `docs/ARTIFACT-CHAIN.md` | Discovery vs build phase boundaries (if present) |
| `docs/PLANS.md` | Open questions — carry forward unresolved items into brief |
| `brainstorm/` | Closed decisions — do not contradict without new numbered file |

If files are missing, note gaps for step 3 brief — do not invent scope.

### What to extract

- Committed product intent vs still-open (`[DRAFT]`, `[OPEN]` markers)
- Architectural decisions already locked (marketing split, backend in CDP)
- Epic-level feature candidates for PRD step 5
- Explicit non-goals

### Done when (internal)

You can answer "what is this product and what's in MVP?" from repo docs + step 1 meeting notes. Move to **step 3** — write `spec/project-brief.md` with `**Client:** AIOS (internal product)`.
