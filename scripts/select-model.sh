#!/bin/bash
# Copilot Model Selection Helper
# Usage: ./select-model.sh [task-type]

TASK_TYPE="$1"

echo "🤖 COPILOT MODEL SELECTION HELPER"
echo "=================================="
echo ""

if [ -z "$TASK_TYPE" ]; then
    echo "Available task types:"
    echo "  debug      - Debugging issues (404 errors, build failures)"
    echo "  config     - Jekyll configuration, plugins, setup"
    echo "  content    - Content creation, editing, writing"
    echo "  routine    - Routine maintenance, simple edits"
    echo "  complex    - Complex multi-step tasks"
    echo "  simple     - Basic file operations, quick fixes"
    echo ""
    echo "Usage: $0 <task-type>"
    exit 1
fi

case $TASK_TYPE in
    "debug")
        echo "🔧 TASK TYPE: Debugging & Troubleshooting"
        echo ""
        echo "🎯 RECOMMENDED MODEL: GPT-4"
        echo "   Best for: Complex debugging, 404 errors, build failures"
        echo "   Why: Deep technical analysis and comprehensive problem-solving"
        echo ""
        echo "⚡ ALTERNATIVE: GPT-3.5-Turbo"
        echo "   For: Simple syntax errors, basic validation"
        echo ""
        echo "📝 IF CONTENT: Claude"
        echo "   For: Analyzing error patterns, documenting solutions"
        ;;

    "config")
        echo "⚙️ TASK TYPE: Configuration & Setup"
        echo ""
        echo "🎯 RECOMMENDED MODEL: GPT-4"
        echo "   Best for: Jekyll configuration, plugin setup, complex integrations"
        echo "   Why: Deep understanding of system configuration and dependencies"
        echo ""
        echo "⚡ ALTERNATIVE: GPT-3.5-Turbo"
        echo "   For: Basic config changes, simple setup tasks"
        ;;

    "content")
        echo "📝 TASK TYPE: Content Creation & Editing"
        echo ""
        echo "🎯 RECOMMENDED MODEL: Claude"
        echo "   Best for: High-quality writing, ethical content, narrative structure"
        echo "   Why: Superior content quality and ethical considerations"
        echo ""
        echo "⚡ ALTERNATIVE: GPT-4"
        echo "   For: Technical content, complex articles with technical requirements"
        echo ""
        echo "📝 BACKUP: GPT-3.5-Turbo"
        echo "   For: Simple content updates, basic editing"
        ;;

    "routine")
        echo "🔄 TASK TYPE: Routine Maintenance"
        echo ""
        echo "🎯 RECOMMENDED MODEL: GPT-3.5-Turbo"
        echo "   Best for: Routine tasks, simple edits, basic validation"
        echo "   Why: Fast execution and reliable for repetitive operations"
        echo ""
        echo "⚡ ALTERNATIVE: GPT-4"
        echo "   For: If routine task reveals complex underlying issues"
        ;;

    "complex")
        echo "🧩 TASK TYPE: Complex Multi-Step Tasks"
        echo ""
        echo "🎯 RECOMMENDED MODEL: GPT-4"
        echo "   Best for: Multi-step tasks, system integration, complex analysis"
        echo "   Why: Superior reasoning and comprehensive problem-solving"
        echo ""
        echo "⚡ NO ALTERNATIVE RECOMMENDED"
        echo "   Complex tasks require GPT-4's deep analysis capabilities"
        ;;

    "simple")
        echo "📄 TASK TYPE: Simple Operations"
        echo ""
        echo "🎯 RECOMMENDED MODEL: GPT-3.5-Turbo"
        echo "   Best for: Basic file operations, quick fixes, simple validation"
        echo "   Why: Fast and efficient for straightforward tasks"
        echo ""
        echo "⚡ ALTERNATIVE: GPT-4"
        echo "   Only if simple task becomes complex unexpectedly"
        ;;

    *)
        echo "❌ Unknown task type: $TASK_TYPE"
        echo ""
        echo "Available task types:"
        echo "  debug config content routine complex simple"
        exit 1
        ;;
esac

echo ""
echo "💡 REMEMBER:"
echo "   - Always assess actual task complexity, not just type"
echo "   - Switch models if current model isn't performing well"
echo "   - Document model selection and performance"
echo "   - Update workflow.md with learnings"
echo ""
echo "📚 REFERENCE:"
echo "   - instructions.md - Complete model selection guide"
echo "   - workflow.md - Full development workflow"
echo "   - improvements.md - Jekyll-specific model recommendations"
