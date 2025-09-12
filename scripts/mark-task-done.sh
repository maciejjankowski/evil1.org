#!/bin/bash

# Script to mark tasks as done in backlog.md
# Usage: ./scripts/mark-task-done.sh TASK_ID

if [ $# -eq 0 ]; then
    echo "Usage: $0 TASK_ID"
    echo "Example: $0 T001"
    exit 1
fi

TASK_ID=$1
BACKLOG_FILE="_docs/backlog-all.md"

# Check if task exists
if ! grep -q "$TASK_ID" "$BACKLOG_FILE"; then
    echo "Task $TASK_ID not found in backlog"
    exit 1
fi

# Mark task as done
if [[ "$(uname)" == "Darwin" ]]; then
    sed -i '' "s/\[ \] | $TASK_ID |/\[x\] | $TASK_ID |/" "$BACKLOG_FILE"
else
    sed -i "s/\[ \] | $TASK_ID |/\[x\] | $TASK_ID |/" "$BACKLOG_FILE"
fi

echo "Task $TASK_ID marked as complete"
