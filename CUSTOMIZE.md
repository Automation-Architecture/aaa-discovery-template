# Customization Guide

Before running `install.sh`, open `SKILL.md` and the files in `references/` and replace each placeholder with your org's real values. This file lists them all.

## Required placeholders

| Placeholder | What to put there | Example |
|---|---|---|
| `<YOUR_WORKSPACE>` | Root directory where your client projects live | `~/Documents/work` |
| `<YOUR_CLIENT_DOCS_DIR>` | Directory where client deliverables (DOCX, PDFs) live | `~/Documents/work/client-docs` |
| `<YOUR_GITHUB_ORG>` | Your GitHub organization name | `my-agency` |
| `<YOUR_ORG>.atlassian.net` | Your Atlassian Cloud subdomain | `mycompany.atlassian.net` |
| `<YOUR_DASHBOARD_URL>` | URL where clients check project status | `https://status.mycompany.com` or a Notion URL |
| `<OPERATOR_EMAIL>` | The email address discovery emails come from | `alice@mycompany.com` |
| `<Your Organization Name>` | Your org name (appears in brief template) | `My Agency LLC` |

## Optional

- **`#next`** — this is the Slack channel where the internal team reviews the brief and PRD. Rename to whatever your team uses.
- **`#client-comms`** — the client-facing Slack channel. Rename if yours is different.
- **Step 13** — the client dashboard step is described generically in this template. If you build your own client portal, replace that step with your provisioning workflow.

## After customizing

Run `./install.sh --dry-run` to preview, then `./install.sh` to install.
