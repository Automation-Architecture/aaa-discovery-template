# Step 1 — Read discovery context

> **Branch on `engagement_type`:** Client → sales/discovery call transcripts below. Internal product → jump to [Internal product](#internal-product) — skip Fireflies client search unless internal meetings exist.

## Goal

Build internal context before drafting the brief. For clients, the sales call is where vision, pain, and constraints were verbalized. For internal products, discovery meetings and existing repo docs serve the same role.

---

## Client (`engagement_type=client`)

Find and read the **sales call transcript**.

## How to find the transcript

You need two inputs: the **business name** and the **name of the attendee** (typically the primary client contact). Use these to search Fireflies first, then fall back to Granola.

### Fireflies (primary)

Use `mcp__claude_ai_Fireflies__fireflies_search` with a keyword query combining the business name and attendee name:

```
keyword:"<Business Name>" scope:all limit:10
```

Or search by participant email if known:
```
participants:<attendee-email> limit:10
```

Scan the results for the discovery/sales call — look for the meeting title, date, and attendees list to confirm it's the right one. Then use `mcp__claude_ai_Fireflies__fireflies_get_transcript` with the meeting ID to pull the full transcript.

### Granola (fallback)

Use `mcp__claude_ai_Granola__query_granola_meetings` with a natural-language query:

```
"<Business Name> discovery call with <Attendee Name>"
```

### Local files (last resort — exported recordings only)

Files at `~/Documents/aaa/client_projects/<initials>/docs/client-comms/` named like `YYYY-MM-DD-<topic>-fireflies.md`. Only valid if exported from a recording — a notes file typed after the call does not count as a transcript.

If no transcript is found via any of the above, **stop and ask the operator** — Discovery must not proceed on memory of a call.

### Email threads

Sometimes there's a discovery-phase email exchange. Check Gmail for `from:<client-email>` if relevant context is missing from the transcript.

## What to extract

- The **problem the client is trying to solve**, in their own words
- **Existing systems** they're using (Zendesk, Salesforce, etc.) — these become integrations
- **Stakeholders** mentioned (who decides, who approves, who reviews)
- **Constraints** — budget hints, timeline expectations, compliance posture, data residency, language preferences
- **Existing assets** — books, prior projects, content libraries, historical data
- **Risks the client is aware of** — copyright, regulatory, internal political
- **What "done" looks like to them**

## What to write down

Take notes in your working context. Don't create a new artifact yet — the brief (step 2) is the consolidation. Just be sure you can answer "what did the client actually say?" when drafting it.

## Done when (client)

You can describe the client's problem, rough scope, and constraints in two paragraphs without re-reading the transcript. Move to **step 2 (read the signed proposal)**.

---

## Internal product (`engagement_type=internal_product`)

### Sources (read all that exist)

1. **Internal discovery meetings** — Fireflies/Granola search by product name, attendee names, or "Second Brain" / "AIOS" keywords
2. **Repo exploratory docs** (in the product repo):
   - `PRODUCT.md` — register: users, principles
   - `spec/product-brief.md` — early product thinking
   - `docs/APP-STORY.md` — target user journey
   - `docs/PLANS.md` — open questions
   - `brainstorm/` — closed decisions
3. **Prototype / prior art repos** — e.g. client engagement code to productize (`kh-second-brain`), noted at kickoff

### What to extract

- Problem the product solves (internal AAA perspective)
- Relationship to AIOS family (IQ, Coffee, CDP, Flagship)
- MVP scope candidates and explicit non-goals
- Architecture constraints already decided (e.g. separate marketing repo, CDP backend)
- Open questions that step 3 brief must resolve or flag

### Done when (internal)

You can describe the product problem, wedge user, and scope boundaries in two paragraphs. Move to **step 2 (read product docs in repo)** — no Onboarding Drive proposal.
