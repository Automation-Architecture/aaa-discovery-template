# Sync — skills shelf → public template

**Canonical source:** `Automation-Architecture/claude-skills-shelf` → `workflow/aaa-discovery/`

**Public export:** [`Automation-Architecture/aaa-discovery-template`](https://github.com/Automation-Architecture/aaa-discovery-template)

---

## When to sync

After merging any PR that changes this skill in `claude-skills-shelf`.

---

## Steps

1. Clone or update the template repo:
   ```bash
   gh repo clone Automation-Architecture/aaa-discovery-template /tmp/aaa-discovery-template
   cd /tmp/aaa-discovery-template && git pull
   ```

2. Sync skill content (from skills shelf repo root):
   ```bash
   SHELF=workflow/aaa-discovery
   TARGET=/tmp/aaa-discovery-template
   rsync -a --delete \
     --exclude '.github' \
     "${SHELF}/SKILL.md" "${SHELF}/docs" "${SHELF}/references" "${SHELF}/templates" "${SHELF}/SYNC.md" \
     "${TARGET}/"
   ```
   Preserves in template: `install.sh`, `README.md`, `CUSTOMIZE.md`, `ONBOARDING.md`, `.github/`

3. Review diff in the template repo — packaging files (`install.sh`, `README.md`, `CUSTOMIZE.md`, `ONBOARDING.md`) are preserved; skill content is overwritten from shelf.

4. Open PR on `aaa-discovery-template`. Ensure README says **13 steps** and documents `engagement_type` (`client` | `internal_product`).

5. Re-install locally after template merge:
   ```bash
   cd /tmp/aaa-discovery-template && ./install.sh
   ```
   Or from skills shelf:
   ```bash
   cd claude-skills-shelf && ./install.sh aaa-discovery --global
   ```

---

## Do not edit both copies independently

Changes land in **skills shelf first**, then sync to template. The template is a distribution artifact, not a second source of truth.
