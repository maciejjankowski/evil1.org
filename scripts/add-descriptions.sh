#!/bin/bash
# Add Missing Descriptions Script
# Adds description fields to files missing them for better SEO

echo "📝 ADDING MISSING DESCRIPTIONS FOR SEO"
echo "======================================"

# Files that need descriptions added
files_to_update=(
    "_docs/workflow.md"
    "_docs/backlog.md"
    "_docs/instructions.md"
    "_docs/test-page.md"
    "_docs/test-blueprint.md"
    "README.md"
)

# Function to add description to a file
add_description() {
    local file="$1"
    local description="$2"

    if [ ! -f "$file" ]; then
        echo "❌ File not found: $file"
        return 1
    fi

    echo "Processing $file..."

    # Check if file already has front matter
    if head -1 "$file" | grep -q "^---$"; then
        # File has front matter, add description after title
        sed -i '' '/^title:/a\
description: "'"$description"'"' "$file"
        echo "✅ Added description to existing front matter in $file"
    else
        # File has no front matter, add complete front matter
        cat > "$file.tmp" << EOF
---
layout: default
title: "$(basename "$file" .md | sed 's/-/ /g' | sed 's/\b\w/\U&/g')"
description: "$description"
permalink: "/$(basename "$file" .md)/"
---

EOF
        # Append original content
        cat "$file" >> "$file.tmp"
        mv "$file.tmp" "$file"
        echo "✅ Added complete front matter with description to $file"
    fi
}

# Process each file
for file in "${files_to_update[@]}"; do
    case "$file" in
        "workflow.md")
            add_description "$file" "Comprehensive development workflow with Copilot model selection for Jekyll site development"
            ;;
        "backlog.md")
            add_description "$file" "Project backlog and task management for evil1.org development"
            ;;
        "instructions.md")
            add_description "$file" "Complete instructions and guidelines for AI-assisted development"
            ;;
        "test-page.md")
            add_description "$file" "Test page for development and layout verification"
            ;;
        "test-blueprint.md")
            add_description "$file" "Blueprint testing and development documentation"
            ;;
        "README.md")
            add_description "$file" "Project overview and setup instructions for evil1.org"
            ;;
        *)
            add_description "$file" "Content page for evil1.org"
            ;;
    esac
done

echo ""
echo "🎉 DESCRIPTION ADDITION COMPLETE!"
echo "================================="
echo "✅ Added descriptions to key files for better SEO"
echo ""
echo "📊 Summary:"
echo "- Files processed: ${#files_to_update[@]}"
echo "- Descriptions added for improved search engine optimization"
