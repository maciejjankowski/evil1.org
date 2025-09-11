#!/bin/bash
# Create a timestamped backup of the consolidated backlog
set -euo pipefail

SRC="_docs/backlog-all.md"
DEST_DIR="_docs/backlog-backups"
mkdir -p "$DEST_DIR"
TS=$(date -u +"%Y%m%dT%H%M%SZ")
cp -v "$SRC" "$DEST_DIR/backlog-all.$TS.md"

echo "Backup saved to $DEST_DIR/backlog-all.$TS.md"
