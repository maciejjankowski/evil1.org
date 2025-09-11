#!/bin/bash
# Task Initiation Script with Copilot Model Selection
# Usage: ./start-task.sh "Task description"

if [ $# -eq 0 ]; then
    echo "Usage: $0 \"Task description\""
    echo ""
    echo "This script helps you start a task with proper Copilot model selection."
    echo "It will:"
    echo "1. Assess task complexity"
    echo "2. Recommend appropriate Copilot model"
    echo "3. Create task documentation"
    echo "4. Update workflow tracking"
    exit 1
fi

TASK_DESCRIPTION="$1"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

echo "=========================================="
echo "TASK INITIATION: $TASK_DESCRIPTION"
echo "Started: $TIMESTAMP"
echo "=========================================="
echo ""

# Task complexity assessment
echo "TASK COMPLEXITY ASSESSMENT:"
echo "Please evaluate the task complexity:"
echo ""
echo "🔴 HIGH COMPLEXITY (Use GPT-4):"
echo "   - Complex debugging (404 errors, build failures)"
echo "   - Jekyll configuration or plugin setup"
echo "   - Multiple file changes or system integration"
echo "   - Deep technical analysis required"
echo ""
echo "🟡 MEDIUM COMPLEXITY (Use GPT-3.5 or GPT-4):"
echo "   - Content creation or editing"
echo "   - Routine maintenance tasks"
echo "   - Simple debugging (syntax errors)"
echo "   - Configuration changes"
echo ""
echo "🟢 LOW COMPLEXITY (Use GPT-3.5):"
echo "   - Basic file operations"
echo "   - Simple content updates"
echo "   - Routine commands"
echo "   - Quick fixes"
echo ""

# Model recommendations
echo "RECOMMENDED COPILOT MODELS:"
echo ""
echo "🎯 GPT-4.1 (Primary for Complex Tasks):"
echo "   - Front matter issues, permalink problems"
echo "   - Build errors, configuration debugging"
echo "   - Complex content creation, technical analysis"
echo ""
echo "⚡ Grok Code Fast 1 (Secondary for Routine Tasks):"
echo "   - Simple file edits, basic commands"
echo "   - Routine maintenance, quick validation"
echo "   - Simple content updates"
echo ""
echo "📝 GPT-4o (Alternative for Content/Narrative):"
echo "   - High-quality content writing"
echo "   - Documentation, ethical content"
echo "   - Narrative structure, business analysis"
echo ""
echo "🟡 GPT-5 mini (Balanced for Medium Tasks):"
echo "   - Moderate complexity tasks"
echo "   - General development work"
echo "   - Balanced performance needs"
echo ""

# Create task documentation
TASK_FILE="task-$(date '+%Y%m%d-%H%M%S').md"
cat > "$TASK_FILE" << EOF
# Task: $TASK_DESCRIPTION
**Started:** $TIMESTAMP
**Status:** In Progress

## Task Details
- **Description:** $TASK_DESCRIPTION
- **Complexity Assessment:** [High/Medium/Low - to be determined]
- **Recommended Model:** [GPT-4.1/Grok Code Fast 1/GPT-4o/GPT-5 mini - to be selected]

## Model Selection Reasoning
[Document why the selected model was chosen for this task]

## Execution Notes
[Document the work performed and any issues encountered]

## Quality Assurance
- [ ] Changes tested thoroughly
- [ ] Links verified (no 404 errors)
- [ ] Build passes without errors
- [ ] YAML syntax validated

## Completion
**Completed:** [Timestamp]
**Model Used:** [Actual model used: GPT-4.1/Grok Code Fast 1/GPT-4o/GPT-5 mini]
**Time Taken:** [Duration]
**Success:** [Yes/No/Partial]
**Notes:** [Any additional observations or learnings]
EOF

echo "📋 TASK DOCUMENTATION CREATED: $TASK_FILE"
echo ""
echo "Next steps:"
echo "1. Review the task complexity assessment above"
echo "2. Select the appropriate Copilot model"
echo "3. Update $TASK_FILE with your model choice and reasoning"
echo "4. Begin task execution"
echo "5. Document progress and completion in $TASK_FILE"
echo ""
echo "Remember to:"
echo "- Read \`_docs/instructions.md\` before starting"
echo "- Follow \`_docs/workflow.md\` guidelines"
echo "- Test all changes thoroughly"
echo "- Update \`_docs/backlog-all.md\` when complete"
