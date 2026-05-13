#!/usr/bin/env bash
#
# Install the aaa-discovery skill into Claude Code's global skill directory.
#
# Usage:
#   ./install.sh              # install
#   ./install.sh --dry-run    # preview what would change
#
# After installation, restart Claude Code so the skill reloads.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="$HOME/.claude/skills/aaa-discovery"

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

DRY_RUN=""
if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN="--dry-run"
  echo -e "${YELLOW}DRY RUN — no files will be changed${NC}"
fi

mkdir -p "${INSTALL_DIR}"

# Safety: refuse to install if source and destination resolve to the same path
# (can happen if INSTALL_DIR is a symlink back into this directory).
SRC_REAL="$(cd "${SCRIPT_DIR}" && pwd -P)"
DST_REAL="$(cd "${INSTALL_DIR}" && pwd -P)"
if [[ "${SRC_REAL}" == "${DST_REAL}" ]]; then
  echo -e "${RED}ABORT: install directory resolves to the same path as this repo:${NC}"
  echo "  ${SRC_REAL}"
  echo "If ${INSTALL_DIR} is a symlink, remove it and re-run: rm '${INSTALL_DIR}'"
  exit 1
fi

rsync -av --delete --delete-excluded \
  --exclude='.git' \
  --exclude='README.md' \
  --exclude='CUSTOMIZE.md' \
  --exclude='install.sh' \
  --exclude='.gitignore' \
  ${DRY_RUN} \
  "${SCRIPT_DIR}/" "${INSTALL_DIR}/"

if [[ -z "${DRY_RUN}" ]]; then
  echo
  echo -e "${GREEN}✓ Installed to ${INSTALL_DIR}${NC}"
  echo "  Restart Claude Code to reload the skill."
fi
