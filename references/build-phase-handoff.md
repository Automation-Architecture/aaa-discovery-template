# Build Phase handoff

Discovery ends when step 13 (`#po` digest) is sent. **Build Phase** is separate — engineers write code against discovery artifacts plus per-feature SRS.

Do not roll Build steps into `/aaa-discovery`.

---

## What Discovery produces

| Artifact | Path | Used in Build for |
|---|---|---|
| Project brief | `spec/project-brief.md` | Context, scope boundaries |
| Grill decisions | `spec/GRILL_SESSION.md` | Locked product + architecture choices |
| PRD (epics) | `spec/prd.md` | Epic list → Jira → feature breakdown |
| Tech spec | `spec/tech-spec.md` | Architecture, API shapes, stack |
| Jira board | SB-### / client key | Work status |

Discovery does **not** produce per-feature binding specs or application code.

---

## Build Phase chain (product repos)

Typical AIOS product repo (e.g. `aios-second-brain`):

```
spec/prd.md epics
    ↓
docs/ba/_product/prd.md (optional /prd Feature Map) OR direct docs/ba/{feature}/
    ↓
Per feature: URD → BRD → PRD-epic → srs/{feature}-spec.md  (ba-kit)
    ↓
docs/pm/jira/ + Jira tasks
    ↓
app/ (frontend) + docs/be-quest/ → aios-cdp/apps/{product}/ (backend)
```

**SPEC gate:** No feature implementation without `docs/ba/{feature}/srs/{feature}-spec.md` at `approved` (or explicit operator waiver).

---

## ba-kit setup (first Build Phase task)

Vendor from [`aaa-aiosiq`](https://github.com/Automation-Architecture/aaa-aiosiq) if not already present:

1. Copy `.claude/` (skills, rules, templates, hooks) into the product repo
2. Copy `docs/ba/KIT-GUIDE.md` into the product repo
3. Document in repo `AGENTS.md` + `docs/ARTIFACT-CHAIN.md`

Run `/prd` at project level only if the Feature Map in `docs/ba/_product/prd.md` is still a stub — discovery's `spec/prd.md` epics may map 1:1 to features.

---

## AIOS product repo conventions

| Piece | Location |
|---|---|
| App frontend | Product repo (`app/`) |
| Marketing site | **Separate repo** (IQ pattern — not in app repo `/`) |
| CDP backend | `aios-cdp/apps/{product}/` |
| Backend requests | Product repo `docs/be-quest/` |

Example reference: [`aios-second-brain/docs/ARTIFACT-CHAIN.md`](https://github.com/Automation-Architecture/aios-second-brain/blob/main/docs/ARTIFACT-CHAIN.md)

---

## Build Phase milestones (high level)

Not part of this skill — project-specific. Typical pattern:

1. **Phase 1 build** — supervised; first epic(s) with SRS approved
2. **Burn-in** — staging validation
3. **Phase 2 launch** — remaining epics + production

Engineer picks up the Jira sprint board after the step 13 digest.
