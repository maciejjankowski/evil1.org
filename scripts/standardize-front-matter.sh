#!/bin/bash
# Front Matter Standardization Script
# Standardizes front matter across all content types

echo "🔧 STANDARDIZING FRONT MATTER ACROSS CONTENT TYPES"
echo "=================================================="

# Function to standardize organization files
standardize_organizations() {
    echo "📋 Processing organization files..."
    for file in _organizations/*.md; do
        if [ -f "$file" ]; then
            echo "Processing $file..."

            # Read the file content
            content=$(cat "$file")

            # Extract current values
            title=$(grep "^title:" "$file" | head -1 | sed 's/title: //' | sed 's/^"//' | sed 's/"$//')
            sig_title=$(grep "^sig_title:" "$file" | head -1 | sed 's/sig_title: //' | sed 's/^"//' | sed 's/"$//')
            description=$(grep "^description:" "$file" | head -1 | sed 's/description: //' | sed 's/^"//' | sed 's/"$//')
            sig_desc=$(grep "^sig_desc:" "$file" | head -1 | sed 's/sig_desc: //' | sed 's/^"//' | sed 's/"$//')

            # Use sig_desc as the canonical description, remove redundancy
            if [ -n "$sig_desc" ]; then
                canonical_desc="$sig_desc"
            elif [ -n "$description" ]; then
                canonical_desc="$description"
            else
                canonical_desc="Organization profile and analysis"
            fi

            # Create standardized front matter
            cat > "$file.tmp" << EOF
---
layout: organization
title: "$title"
description: "$canonical_desc"
permalink: "/organizations/$(basename "$file" .md)/"
organization:
  name: "$title"
  description: "$canonical_desc"
  type: "organization"
---

EOF

            # Append the rest of the content (skip the old front matter)
            sed -n '/^---$/ { :a; n; /^---$/ { :b; n; p; b }; ba }' "$file" >> "$file.tmp"

            # Replace the original file
            mv "$file.tmp" "$file"
            echo "✅ Standardized $file"
        fi
    done
}

# Function to standardize article files
standardize_articles() {
    echo "📝 Processing article files..."
    for file in _articles/*.md; do
        if [ -f "$file" ]; then
            echo "Processing $file..."

            # Check if it already has proper front matter
            if grep -q "^layout: article" "$file"; then
                echo "✅ $file already has proper article front matter"
                continue
            fi

            # Read current front matter
            title=$(grep "^title:" "$file" | head -1 | sed 's/title: //' | sed 's/^"//' | sed 's/"$//')
            if [ -z "$title" ]; then
                title=$(basename "$file" .md | sed 's/-/ /g' | sed 's/\b\w/\U&/g')
            fi

            # Create standardized front matter
            cat > "$file.tmp" << EOF
---
layout: article
title: "$title"
description: "Article about $title"
permalink: "/articles/$(basename "$file" .md)/"
date: "$(date +%Y-%m-%d)"
author: "Editorial Team"
tags: ["article"]
---

EOF

            # Append the rest of the content
            sed -n '/^---$/ { :a; n; /^---$/ { :b; n; p; b }; ba }' "$file" >> "$file.tmp"

            # Replace the original file
            mv "$file.tmp" "$file"
            echo "✅ Standardized $file"
        fi
    done
}

# Function to standardize profile files
standardize_profiles() {
    echo "👤 Processing profile files..."
    for file in _profiles/*.md; do
        if [ -f "$file" ]; then
            echo "Processing $file..."

            # Check if it already has proper front matter
            if grep -q "^layout: profile" "$file"; then
                echo "✅ $file already has proper profile front matter"
                continue
            fi

            # Read current front matter
            title=$(grep "^title:" "$file" | head -1 | sed 's/title: //' | sed 's/^"//' | sed 's/"$//')
            if [ -z "$title" ]; then
                title=$(basename "$file" .md | sed 's/-/ /g' | sed 's/\b\w/\U&/g')
            fi

            # Create standardized front matter
            cat > "$file.tmp" << EOF
---
layout: profile
title: "$title"
description: "Profile of $title"
permalink: "/profiles/$(basename "$file" .md)/"
profile:
  name: "$title"
  type: "person"
---

EOF

            # Append the rest of the content
            sed -n '/^---$/ { :a; n; /^---$/ { :b; n; p; b }; ba }' "$file" >> "$file.tmp"

            # Replace the original file
            mv "$file.tmp" "$file"
            echo "✅ Standardized $file"
        fi
    done
}

# Run standardization functions
standardize_organizations
standardize_articles
standardize_profiles

echo ""
echo "🎉 FRONT MATTER STANDARDIZATION COMPLETE!"
echo "=========================================="
echo "✅ Organization files: Standardized layout and metadata"
echo "✅ Article files: Ensured consistent article front matter"
echo "✅ Profile files: Standardized profile structure"
echo ""
echo "📊 Summary:"
echo "- Organizations: $(ls _organizations/*.md 2>/dev/null | wc -l) files processed"
echo "- Articles: $(ls _articles/*.md 2>/dev/null | wc -l) files processed"
echo "- Profiles: $(ls _profiles/*.md 2>/dev/null | wc -l) files processed"
