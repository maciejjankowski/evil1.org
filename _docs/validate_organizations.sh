#!/bin/bash

# Organization Format Validator
# Checks that all organization files use consistent SIG format

echo "🔍 Checking organization file formats..."

INVALID_FILES=$(grep -l "layout: organization" _organizations/*.md 2>/dev/null)

if [ -n "$INVALID_FILES" ]; then
    echo "❌ FOUND INVALID FORMATS:"
    echo "$INVALID_FILES"
    echo ""
    echo "📋 These files need to be converted from 'organization' format to 'sig' format"
    echo "   See CONTENT_FORMAT_STANDARDS.md for the correct format"
    exit 1
else
    echo "✅ All organization files use correct SIG format"
    exit 0
fi
