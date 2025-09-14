#!/usr/bin/env bash
# Wrapper: mark a task done using the official script and verify the backlog updated.
# Usage: ./scripts/auto-mark-and-verify.sh T123
set -euo pipefail
TASK_ID="$1"
SCRIPTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="${SCRIPTDIR}/.."
BACKLOG_FILE="${REPO_ROOT}/_docs/backlog-all.md"
MARK_SCRIPT="${SCRIPTDIR}/mark-task-done.sh"

if [ -z "${TASK_ID}" ]; then
  echo "Usage: $0 TASK_ID"
  exit 2
fi
if [ ! -x "${MARK_SCRIPT}" ]; then
  echo "Mark script not found or not executable: ${MARK_SCRIPT}" >&2
  exit 2
fi

echo "Running mark script for ${TASK_ID}..."
"${MARK_SCRIPT}" "${TASK_ID}"

sleep 0.2

echo "Verifying backlog file: ${BACKLOG_FILE} contains an entry for ${TASK_ID} marked as complete..."
# Use fixed-string grep to avoid regex metacharacter issues in backlog content
if grep -Fq "[x] | ${TASK_ID} |" "${BACKLOG_FILE}"; then
  echo "Verification OK: ${TASK_ID} is marked complete in backlog."
  exit 0
else
  echo "Verification FAILED: ${TASK_ID} not found as completed in ${BACKLOG_FILE}" >&2
  exit 1
fi
