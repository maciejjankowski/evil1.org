#!/bin/bash
# Front Matter Validator Script for evil1.org
# Validates YAML front matter in markdown files
# Usage: ./frontmatter-validator.sh [--fix] [--verbose]

set -e

# Configuration
VERBOSE=false
AUTO_FIX=false
STRICT_MODE=false

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Statistics
TOTAL_FILES=0
VALID_FILES=0
INVALID_FILES=0
FIXED_FILES=0
MISSING_LAYOUT=0
MISSING_TITLE=0
MISSING_DESCRIPTION=0
YAML_ERRORS=0

# Logging functions
log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Help function
show_help() {
    cat << EOF
Front Matter Validator Script for evil1.org

USAGE:
    ./frontmatter-validator.sh [OPTIONS]

OPTIONS:
    --fix          Automatically fix common issues
    --verbose      Show detailed output
    --strict       Enable strict validation mode
    --help         Show this help message

EXAMPLES:
    ./frontmatter-validator.sh --verbose
    ./frontmatter-validator.sh --fix
    ./frontmatter-validator.sh --strict --verbose

DESCRIPTION:
    This script validates YAML front matter in all markdown files.
    It checks for required fields, YAML syntax, and consistency.

    In fix mode, it can automatically add missing layout fields
    and fix common formatting issues.

VALIDATION CHECKS:
    - YAML syntax validation
    - Required fields: layout, title
    - Recommended fields: description, permalink
    - Front matter delimiters (---)
    - Field value formats

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --fix)
            AUTO_FIX=true
            shift
            ;;
        --verbose)
            VERBOSE=true
            shift
            ;;
        --strict)
            STRICT_MODE=true
            shift
            ;;
        --help)
            show_help
            exit 0
            ;;
        *)
            log_error "Unknown option: $1"
            show_help
            exit 1
            ;;
    esac
done

# Function to validate YAML syntax
validate_yaml() {
    local file="$1"

    # Extract front matter (between --- markers)
    local front_matter
    front_matter=$(sed -n '/^---$/,/^---$/p' "$file" | sed '1d;$d')

    if [[ -z "$front_matter" ]]; then
        return 1
    fi

    # Try to parse with Python's yaml module
    if command -v python3 &> /dev/null; then
        if echo "$front_matter" | python3 -c "import yaml, sys; yaml.safe_load(sys.stdin)" 2>/dev/null; then
            return 0
        else
            return 1
        fi
    else
        # Fallback: basic validation
        # Check for common YAML syntax errors
        if echo "$front_matter" | grep -q ":\s*$" || echo "$front_matter" | grep -q "^[[:space:]]*-[[:space:]]*$"; then
            return 1
        fi
        return 0
    fi
}

# Function to check required fields
check_required_fields() {
    local file="$1"

    local has_layout=false
    local has_title=false
    local has_description=false

    # Check for layout
    if grep -q "^layout:" "$file"; then
        has_layout=true
    fi

    # Check for title
    if grep -q "^title:" "$file"; then
        has_title=true
    fi

    # Check for description
    if grep -q "^description:" "$file"; then
        has_description=true
    fi

    # Return results
    echo "$has_layout:$has_title:$has_description"
}

# Function to auto-fix common issues
auto_fix_file() {
    local file="$1"

    local fixed=false

    # Check if file has front matter
    if ! grep -q "^---$" "$file"; then
        if [[ "$VERBOSE" == "true" ]]; then
            log_info "Adding front matter to: $file"
        fi

        # Get filename without extension for title
        local filename
        filename=$(basename "$file" .md | sed 's/-/ /g' | sed 's/\b\w/\U&/g')

        # Add basic front matter
        local temp_file
        temp_file=$(mktemp)
        cat > "$temp_file" << EOF
---
layout: default
title: "$filename"
description: "Description for $filename"
---

EOF
        cat "$file" >> "$temp_file"
        mv "$temp_file" "$file"
        fixed=true
    else
        # File has front matter, check for missing layout
        if ! grep -q "^layout:" "$file"; then
            if [[ "$VERBOSE" == "true" ]]; then
                log_info "Adding layout to: $file"
            fi

            # Add layout after first ---
            sed -i '' '1a\
layout: default
' "$file"
            fixed=true
        fi
    fi

    if [[ "$fixed" == "true" ]]; then
        ((FIXED_FILES++))
    fi
}

# Function to validate single file
validate_file() {
    local file="$1"

    ((TOTAL_FILES++))

    if [[ "$VERBOSE" == "true" ]]; then
        log_info "Validating: $file"
    fi

    local is_valid=true
    local issues=()

    # Check if file has front matter
    if ! grep -q "^---$" "$file"; then
        issues+=("Missing front matter delimiters")
        is_valid=false
    else
        # Validate YAML syntax
        if ! validate_yaml "$file"; then
            issues+=("Invalid YAML syntax")
            is_valid=false
            ((YAML_ERRORS++))
        fi

        # Check required fields
        local fields
        fields=$(check_required_fields "$file")
        IFS=':' read -r has_layout has_title has_description <<< "$fields"

        if [[ "$has_layout" != "true" ]]; then
            issues+=("Missing layout field")
            ((MISSING_LAYOUT++))
            is_valid=false
        fi

        if [[ "$has_title" != "true" ]]; then
            issues+=("Missing title field")
            ((MISSING_TITLE++))
            is_valid=false
        fi

        if [[ "$STRICT_MODE" == "true" && "$has_description" != "true" ]]; then
            issues+=("Missing description field (strict mode)")
            ((MISSING_DESCRIPTION++))
            is_valid=false
        fi
    fi

    # Report issues
    if [[ ${#issues[@]} -gt 0 ]]; then
        log_error "Issues in $file:"
        for issue in "${issues[@]}"; do
            echo "  - $issue"
        done

        # Auto-fix if enabled
        if [[ "$AUTO_FIX" == "true" ]]; then
            auto_fix_file "$file"
        fi
    else
        if [[ "$VERBOSE" == "true" ]]; then
            log_success "✓ $file"
        fi
    fi

    if [[ "$is_valid" == "true" ]]; then
        ((VALID_FILES++))
    else
        ((INVALID_FILES++))
    fi
}

# Main execution
log_info "Starting front matter validation for evil1.org"
log_info "Options: Auto-fix=$AUTO_FIX, Verbose=$VERBOSE, Strict=$STRICT_MODE"

# Collect all markdown files
MD_FILES=()
while IFS= read -r -d '' file; do
    MD_FILES+=("$file")
done < <(find . -name "*.md" -not -path "./_site/*" -not -path "./.git/*" -print0)

log_info "Found ${#MD_FILES[@]} markdown files to validate"

# Process each file
for file in "${MD_FILES[@]}"; do
    validate_file "$file"
done

# Summary
echo
log_info "=== FRONT MATTER VALIDATION SUMMARY ==="
echo "Total files processed: $TOTAL_FILES"
echo "Valid files: $VALID_FILES"
echo "Invalid files: $INVALID_FILES"
if [[ "$AUTO_FIX" == "true" ]]; then
    echo "Files auto-fixed: $FIXED_FILES"
fi
echo
echo "Detailed issue counts:"
echo "  - YAML syntax errors: $YAML_ERRORS"
echo "  - Missing layout: $MISSING_LAYOUT"
echo "  - Missing title: $MISSING_TITLE"
if [[ "$STRICT_MODE" == "true" ]]; then
    echo "  - Missing description: $MISSING_DESCRIPTION"
fi

if [[ $INVALID_FILES -eq 0 ]]; then
    log_success "🎉 All front matter is valid!"
elif [[ "$AUTO_FIX" == "true" && $FIXED_FILES -gt 0 ]]; then
    log_success "🔧 Auto-fixed $FIXED_FILES files"
    if [[ $((INVALID_FILES - FIXED_FILES)) -gt 0 ]]; then
        log_warning "⚠️  $((INVALID_FILES - FIXED_FILES)) files still need manual review"
    fi
else
    log_error "❌ Found $INVALID_FILES files with front matter issues"
fi

echo
log_info "Validation completed at $(date)"

# Make scripts executable
chmod +x "$0"

# Exit with error code if issues found and not auto-fixed
if [[ $INVALID_FILES -gt 0 && "$AUTO_FIX" != "true" ]]; then
    exit 1
else
    exit 0
fi
