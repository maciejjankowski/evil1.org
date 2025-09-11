#!/bin/bash
# Consolidate all backlog files into a single master backlog with categories

# Color output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting backlog consolidation...${NC}"

# Create output file
OUTPUT_FILE="_docs/backlog-all.md"
TEMP_FILE=$(mktemp)
echo "# CONSOLIDATED BACKLOG" > $OUTPUT_FILE
echo "# Format: STATUS | TASK_ID | MODEL | DESCRIPTION | DoD (optional)" >> $OUTPUT_FILE
echo "# Generated: $(date)" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Check if we're in the project root
if [ ! -d "_docs" ]; then
  echo -e "${RED}Error: Please run this script from the project root directory${NC}"
  exit 1
fi

# Process main backlog
echo -e "${YELLOW}Processing main backlog...${NC}"
echo "## MAIN TASKS" >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Extract completed and pending tasks separately to sort them
# If a legacy `_docs/backlog.md` exists, include it; otherwise look for any
# backlog-style files. We prefer existing `_docs/backlog-all.md` as the source
# of truth when present.
SOURCE_FILES=()
# Find any backlog-style files but avoid using the output file itself as a source
for f in _docs/backlog*.md; do
  [ -f "$f" ] || continue
  if [ "$f" = "$OUTPUT_FILE" ]; then
    continue
  fi
  SOURCE_FILES+=("$f")
done

# Collect entries from source files (initialize temp files)
: > $TEMP_FILE.completed
: > $TEMP_FILE.pending
for src in "${SOURCE_FILES[@]}"; do
  grep -E "^\[x\]" "$src" | grep -v "!IMPORTANT" >> $TEMP_FILE.completed || true
  grep -E "^\[ \]" "$src" | grep -v "!IMPORTANT" >> $TEMP_FILE.pending || true
done

# Add completed tasks first (sorted by task ID)
echo "### Completed Tasks" >> $OUTPUT_FILE
sort -t "T" -k 2 -n $TEMP_FILE.completed >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Then add pending tasks (sorted by task ID)
echo "### Pending Tasks" >> $OUTPUT_FILE
sort -t "T" -k 2 -n $TEMP_FILE.pending >> $OUTPUT_FILE
echo "" >> $OUTPUT_FILE

# Note: model-specific backlogs have been consolidated. This script gathers
# tasks from any remaining backlog-style files but primarily normalizes the
# main backlog into `_docs/backlog-all.md`.

# Add footer
echo "---" >> $OUTPUT_FILE
echo "!IMPORTANT: DONT EDIT THIS FILE DIRECTLY - IT IS GENERATED" >> $OUTPUT_FILE
echo "Last generated: $(date)" >> $OUTPUT_FILE
echo "Source files:" >> $OUTPUT_FILE
for f in "${SOURCE_FILES[@]}"; do
  echo "- $f" >> $OUTPUT_FILE
done

# Cleanup temp files
rm -f $TEMP_FILE.completed $TEMP_FILE.pending

# Generate statistics
TOTAL_TASKS=$(grep -E "^\[[ x]\]" $OUTPUT_FILE | wc -l)
COMPLETED_TASKS=$(grep -E "^\[x\]" $OUTPUT_FILE | wc -l)
PENDING_TASKS=$(grep -E "^\[ \]" $OUTPUT_FILE | wc -l)

echo -e "${GREEN}Backlog consolidation complete!${NC}"
echo -e "Output saved to: ${YELLOW}$OUTPUT_FILE${NC}"
echo -e "Statistics:"
echo -e "  - Total tasks: ${YELLOW}$TOTAL_TASKS${NC}"
echo -e "  - Completed: ${GREEN}$COMPLETED_TASKS${NC}"
echo -e "  - Pending: ${YELLOW}$PENDING_TASKS${NC}"
