#!/bin/bash
# Update backlog to ensure simplified format consistency

# Color output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${GREEN}Checking backlog format consistency...${NC}"

BACKLOG_FILE="_docs/backlog-all.md"

# Check if we're in the project root
if [ ! -d "_docs" ]; then
  echo -e "${RED}Error: Please run this script from the project root directory${NC}"
  exit 1
fi

if [ ! -f "$BACKLOG_FILE" ]; then
  echo -e "${RED}Error: Backlog file not found: $BACKLOG_FILE${NC}"
  exit 1
fi

# Validate format
echo -e "${YELLOW}Validating simplified format...${NC}"

# Check if tasks follow the format: | STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD
FORMAT_ISSUES=$(grep -E "^\[ \]|\[x\]" "$BACKLOG_FILE" | grep -v -E "^\[[ x]\] \| T[0-9]+ \| .+ \| (GPT-4\.1|GPT-4o|GPT-5 mini|Grok Code Fast 1|Gemini 2\.5 Pro) \|" | wc -l)

if [ "$FORMAT_ISSUES" -gt 0 ]; then
  echo -e "${YELLOW}Found $FORMAT_ISSUES tasks that may not follow the simplified format${NC}"
  echo -e "${YELLOW}Expected format: | STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD${NC}"
else
  echo -e "${GREEN}All tasks follow the simplified format correctly${NC}"
fi

# Generate statistics
TOTAL_TASKS=$(grep -E "^\[[ x]\] \|" "$BACKLOG_FILE" | wc -l)
COMPLETED_TASKS=$(grep -E "^\[x\] \|" "$BACKLOG_FILE" | wc -l)
PENDING_TASKS=$(grep -E "^\[ \] \|" "$BACKLOG_FILE" | wc -l)

echo -e "${GREEN}Backlog format check complete!${NC}"
echo -e "Statistics:"
echo -e "  - Total tasks: ${YELLOW}$TOTAL_TASKS${NC}"
echo -e "  - Completed: ${GREEN}$COMPLETED_TASKS${NC}"
echo -e "  - Pending: ${YELLOW}$PENDING_TASKS${NC}"
