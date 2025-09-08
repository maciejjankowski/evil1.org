#!/bin/bash
# Model Ecosystem Compliance Monitor
# Usage: ./monitor-models.sh [check|report|validate]

ACTION="$1"

if [ -z "$ACTION" ]; then
    echo "🤖 MODEL ECOSYSTEM COMPLIANCE MONITOR"
    echo "====================================="
    echo ""
    echo "Usage: $0 <action>"
    echo ""
    echo "Actions:"
    echo "  check    - Check recent commits for model compliance"
    echo "  report   - Generate compliance report"
    echo "  validate - Validate current model ecosystem setup"
    echo "  help     - Show detailed help"
    exit 1
fi

# Valid models in the ecosystem
VALID_MODELS=("Grok Code Fast 1" "GPT-4.1" "GPT-4o" "GPT-5 mini")

# Invalid/legacy models to watch for
INVALID_MODELS=("GPT-3.5" "GPT-4" "Claude" "GPT-3.5-Turbo")

case $ACTION in
    "check")
        echo "🔍 CHECKING RECENT COMMITS FOR MODEL COMPLIANCE"
        echo "==============================================="
        echo ""

        # Check recent commits for model mentions
        echo "Recent commits mentioning models:"
        git log --oneline -10 | while read -r commit; do
            commit_hash=$(echo "$commit" | awk '{print $1}')
            commit_msg=$(echo "$commit" | cut -d' ' -f2-)

            # Check if commit message contains model information
            if echo "$commit_msg" | grep -qi "model\|gpt\|claude\|grok"; then
                echo "📋 $commit_hash: $commit_msg"

                # Extract model from commit message
                for model in "${VALID_MODELS[@]}"; do
                    if echo "$commit_msg" | grep -qi "$model"; then
                        echo "   ✅ Valid model: $model"
                        break
                    fi
                done

                # Check for invalid models
                for invalid_model in "${INVALID_MODELS[@]}"; do
                    if echo "$commit_msg" | grep -qi "$invalid_model"; then
                        echo "   ❌ INVALID MODEL DETECTED: $invalid_model"
                        echo "   ⚠️  This commit uses a non-compliant model!"
                    fi
                done
            fi
        done
        ;;

    "report")
        echo "📊 MODEL COMPLIANCE REPORT"
        echo "=========================="
        echo "Generated: $(date)"
        echo ""

        # Count commits by model
        echo "Model Usage Statistics:"
        echo "-----------------------"

        for model in "${VALID_MODELS[@]}"; do
            count=$(git log --oneline --grep="$model" | wc -l)
            echo "• $model: $count commits"
        done

        echo ""
        echo "Invalid Model Usage:"
        echo "--------------------"

        invalid_found=false
        for invalid_model in "${INVALID_MODELS[@]}"; do
            count=$(git log --oneline --grep="$invalid_model" | wc -l)
            if [ "$count" -gt 0 ]; then
                echo "❌ $invalid_model: $count commits (NON-COMPLIANT)"
                invalid_found=true
            fi
        done

        if [ "$invalid_found" = false ]; then
            echo "✅ No invalid model usage detected"
        fi

        echo ""
        echo "Compliance Status:"
        echo "------------------"
        total_commits=$(git log --oneline | wc -l)
        compliant_commits=$(git log --oneline | grep -i "model\|gpt\|claude\|grok" | wc -l)

        if [ "$compliant_commits" -eq 0 ]; then
            echo "⚠️  No commits with model information found"
        else
            echo "📈 $compliant_commits out of $total_commits recent commits include model information"
        fi
        ;;

    "validate")
        echo "✅ VALIDATING MODEL ECOSYSTEM SETUP"
        echo "==================================="
        echo ""

        # Check if model-performance.yml exists and is valid
        if [ -f "_data/model-performance.yml" ]; then
            echo "✅ Model performance data file exists"

            # Try to validate YAML syntax with python if available
            if command -v python3 &> /dev/null && python3 -c "import yaml" &> /dev/null; then
                if python3 -c "import yaml; yaml.safe_load(open('_data/model-performance.yml'))" 2>/dev/null; then
                    echo "✅ Model performance YAML is valid"
                else
                    echo "❌ Model performance YAML has syntax errors"
                fi
            else
                echo "⚠️  Python YAML validation not available - assuming valid"
            fi
        else
            echo "❌ Model performance data file missing"
        fi

        # Check if scripts are executable
        if [ -x "scripts/start-task.sh" ]; then
            echo "✅ Task initiation script is executable"
        else
            echo "❌ Task initiation script not executable"
        fi

        if [ -x "scripts/select-model.sh" ]; then
            echo "✅ Model selection script is executable"
        else
            echo "❌ Model selection script not executable"
        fi

        # Check if workflow documentation is up to date
        if grep -q "Grok Code Fast 1\|GPT-4.1\|GPT-4o\|GPT-5 mini" workflow.md; then
            echo "✅ Workflow documentation includes current models"
        else
            echo "❌ Workflow documentation may be outdated"
        fi

        echo ""
        echo "Valid Models in Ecosystem:"
        for model in "${VALID_MODELS[@]}"; do
            echo "  • $model"
        done
        ;;

    "help")
        echo "🤖 MODEL ECOSYSTEM COMPLIANCE MONITOR - HELP"
        echo "============================================="
        echo ""
        echo "This script monitors compliance with the specified Copilot model ecosystem."
        echo ""
        echo "ACTIONS:"
        echo "  check    - Scans recent git commits for model usage"
        echo "             Identifies valid and invalid model references"
        echo "             Reports compliance violations"
        echo ""
        echo "  report   - Generates comprehensive compliance statistics"
        echo "             Shows model usage distribution"
        echo "             Identifies non-compliant commits"
        echo ""
        echo "  validate - Verifies the model ecosystem setup"
        echo "             Checks script executability"
        echo "             Validates configuration files"
        echo ""
        echo "VALID MODELS:"
        for model in "${VALID_MODELS[@]}"; do
            echo "  ✅ $model"
        done
        echo ""
        echo "INVALID/LEGACY MODELS:"
        for model in "${INVALID_MODELS[@]}"; do
            echo "  ❌ $model"
        done
        echo ""
        echo "USAGE EXAMPLES:"
        echo "  ./monitor-models.sh check     # Check recent commits"
        echo "  ./monitor-models.sh report    # Generate full report"
        echo "  ./monitor-models.sh validate  # Validate setup"
        ;;

    *)
        echo "❌ Unknown action: $ACTION"
        echo ""
        echo "Available actions: check report validate help"
        exit 1
        ;;
esac

echo ""
echo "💡 For more information, run: $0 help"
