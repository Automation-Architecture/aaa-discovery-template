# Step 13 — Provision client-facing status artifact

## Goal

Give the client a stable URL or document where they can see live project status — sprint progress, upcoming milestones, document library, launch horizon.

By this point the client has signed off on scope and you're about to hand off to build. They need a single place to check in without emailing you every time.

## Choose your delivery mechanism

The right option depends on your infrastructure. Pick one and note the URL in the project brief.

### Option A — Project management tool (Jira / Linear)

Grant the client view-only access to the project board. Simple, zero maintenance, shows real sprint state.

**Steps:**
1. In Jira/Linear, create a client user or generate a shareable read-only link
2. Share the board URL with the client
3. Note it in the brief as the "Client Status URL"

### Option B — Shared Notion or Google Doc hub

Create a project page with:
- Links to Brief, PRD, Tech Spec (as PDF or shared Doc)
- "Current Status" section (update weekly)
- "What's coming next" section

Works well for non-technical clients who don't want to read a sprint board.

### Option C — Custom client portal

If you manage multiple concurrent client projects and want a unified status view, build or use a client portal product. AAA built `<YOUR_DASHBOARD_URL>` on Next.js + Supabase with a Jira sync workflow — but any hosted status page works.

### Option D — Regular email updates

Schedule a standing weekly update email instead of a dashboard. Lower-tech, higher-trust, minimal maintenance overhead during Discovery.

## Regardless of option

- Confirm with the client that they know where to check status
- Record the URL in the project brief's header block
- Mark this step done in the brief's discovery sequence table

## Don't do this

- **Don't give the client edit access to spec docs.** Read-only only. Discovery documents are internal-first.
- **Don't skip this step.** Clients without a status URL send more emails. The 15 minutes this takes saves hours of async status fielding.

## Done when

Client has a stable way to see project status, URL recorded in the brief. Move to step 14.
