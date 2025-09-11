#!/bin/bash
# Add Author/Date Metadata Script
# Adds author and date metadata to content files for better attribution

echo "👤 ADDING AUTHOR/DATE METADATA FOR CONTENT ATTRIBUTION"
echo "===================================================="

# Files that need author/date metadata added
files_to_update=(
    "topics.md"
    "CONTENT_FORMAT_STANDARDS.md"
    "cease-and-desist.md"
    "README.md"
    "_docs/instructions.md"
    "_docs/workflow.md"
    "_docs/backlog-all.md"
)

# Function to add author and date to a file
add_metadata() {
    local file="$1"
    local author="$2"
    local date="$3"

    if [ ! -f "$file" ]; then
        echo "❌ File not found: $file"
        return 1
    fi

    echo "Processing $file..."

    # Check if file already has front matter
    if head -1 "$file" | grep -q "^---$"; then
        # File has front matter, add author and date after title
        sed -i '' '/^title:/a\
author: "'"$author"'"\
date: "'"$date"'"' "$file"
        echo "✅ Added author and date to existing front matter in $file"
    else
        # File has no front matter, add complete front matter
        cat > "$file.tmp" << EOF
---
layout: default
title: "$(basename "$file" .md | sed 's/-/ /g' | sed 's/\b\w/\U&/g')"
description: "Content page for evil1.org"
author: "$author"
date: "$date"
permalink: "/$(basename "$file" .md)/"
---

EOF
        # Append original content
        cat "$file" >> "$file.tmp"
        mv "$file.tmp" "$file"
        echo "✅ Added complete front matter with author/date to $file"
    fi
}

# Process each file with appropriate author
for file in "${files_to_update[@]}"; do
    case "$file" in
        "topics.md"|"cease-and-desist.md")
            add_metadata "$file" "Editorial Team" "2025-09-08"
            ;;
        "CONTENT_FORMAT_STANDARDS.md"|"README.md")
            add_metadata "$file" "Development Team" "2025-09-08"
            ;;
        "_docs/instructions.md"|"_docs/workflow.md"|"_docs/backlog-all.md")
            add_metadata "$file" "AI Assistant" "2025-09-08"
            ;;
        *)
            add_metadata "$file" "Editorial Team" "2025-09-08"
            ;;
    esac
done

echo ""
echo "🎉 AUTHOR/DATE METADATA ADDITION COMPLETE!"
echo "=========================================="
echo "✅ Added author and date metadata to key content files"
echo ""
echo "📊 Summary:"
echo "- Files processed: ${#files_to_update[@]}"
echo "- Authors assigned: Editorial Team, Development Team, AI Assistant"
echo "- Dates standardized: 2025-09-08"
echo ""
echo "📝 Attribution Standards:"
echo "- Editorial Team: Content creation and editorial work"
echo "- Development Team: Technical documentation and standards"
echo "- AI Assistant: Workflow and instruction documentation"
