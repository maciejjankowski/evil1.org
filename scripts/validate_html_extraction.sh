#!/bin/bash

# HTML Extraction Validation Script
# Validates that converted pages render correctly and maintain functionality
# Version: 1.0
# Date: September 10, 2025

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
SITE_DIR="$PROJECT_ROOT/_site"
LOG_FILE="$PROJECT_ROOT/html_validation_$(date +%Y%m%d_%H%M%S).log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Logging function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Test functions
test_page_exists() {
    local page="$1"
    if [[ -f "$SITE_DIR/$page" ]]; then
        echo -e "${GREEN}✓ PASS${NC}: $page exists"
        log "PASS: $page exists"
        return 0
    else
        echo -e "${RED}✗ FAIL${NC}: $page does not exist"
        log "FAIL: $page does not exist"
        return 1
    fi
}

test_page_html() {
    local page="$1"
    local content
    content=$(cat "$SITE_DIR/$page")

    # Check for basic HTML structure
    if echo "$content" | grep -q "<!DOCTYPE html>"; then
        echo -e "${GREEN}✓ PASS${NC}: $page has DOCTYPE"
        log "PASS: $page has DOCTYPE"
    else
        echo -e "${RED}✗ FAIL${NC}: $page missing DOCTYPE"
        log "FAIL: $page missing DOCTYPE"
        return 1
    fi

    # Check for page_html content
    if echo "$content" | grep -q "page_html"; then
        echo -e "${YELLOW}⚠ WARN${NC}: $page contains raw page_html (Liquid not processed)"
        log "WARN: $page contains raw page_html"
    fi

    # Check for common HTML elements
    if echo "$content" | grep -q "<div\|<span\|<p\|<h[1-6]"; then
        echo -e "${GREEN}✓ PASS${NC}: $page contains HTML elements"
        log "PASS: $page contains HTML elements"
    else
        echo -e "${RED}✗ FAIL${NC}: $page missing HTML elements"
        log "FAIL: $page missing HTML elements"
        return 1
    fi
}

test_liquid_processing() {
    local page="$1"
    local content
    content=$(cat "$SITE_DIR/$page")

    # Check that Liquid tags were processed
    if echo "$content" | grep -q "{{.*}}\|{%.*%}"; then
        echo -e "${RED}✗ FAIL${NC}: $page contains unprocessed Liquid tags"
        log "FAIL: $page contains unprocessed Liquid tags"
        return 1
    else
        echo -e "${GREEN}✓ PASS${NC}: $page Liquid tags processed"
        log "PASS: $page Liquid tags processed"
    fi
}

test_css_styles() {
    local page="$1"
    local content
    content=$(cat "$SITE_DIR/$page")

    # Check for inline styles (should be minimal after conversion)
    local inline_styles
    inline_styles=$(echo "$content" | grep -o 'style="[^"]*"' | wc -l)

    if [[ $inline_styles -gt 10 ]]; then
        echo -e "${YELLOW}⚠ WARN${NC}: $page has $inline_styles inline styles (high)"
        log "WARN: $page has $inline_styles inline styles"
    elif [[ $inline_styles -gt 0 ]]; then
        echo -e "${BLUE}ℹ INFO${NC}: $page has $inline_styles inline styles"
        log "INFO: $page has $inline_styles inline styles"
    else
        echo -e "${GREEN}✓ PASS${NC}: $page has no inline styles"
        log "PASS: $page has no inline styles"
    fi
}

# Main validation function
validate_pages() {
    local pages=(
        "profile/index.html"
        "company/index.html"
        "profiles/index.html"
        "news/index.html"
    )

    echo "=== HTML Extraction Validation ==="
    echo "Log file: $LOG_FILE"
    echo ""

    local total_tests=0
    local passed_tests=0

    for page in "${pages[@]}"; do
        echo "Testing: $page"
        echo "----------------------------------------"

        # Test 1: Page exists
        ((total_tests++))
        if test_page_exists "$page"; then
            ((passed_tests++))
        fi

        # Test 2: Basic HTML structure
        ((total_tests++))
        if test_page_html "$page"; then
            ((passed_tests++))
        fi

        # Test 3: Liquid processing
        ((total_tests++))
        if test_liquid_processing "$page"; then
            ((passed_tests++))
        fi

        # Test 4: CSS styles
        test_css_styles "$page"

        echo ""
    done

    # Summary
    echo "=== Validation Summary ==="
    echo "Total tests: $total_tests"
    echo "Passed tests: $passed_tests"
    echo "Failed tests: $((total_tests - passed_tests))"

    if [[ $passed_tests -eq $total_tests ]]; then
        echo -e "${GREEN}✓ ALL TESTS PASSED${NC}"
        log "RESULT: ALL TESTS PASSED"
        return 0
    else
        echo -e "${RED}✗ SOME TESTS FAILED${NC}"
        log "RESULT: SOME TESTS FAILED"
        return 1
    fi
}

# Build site first
echo "Building site for validation..."
cd "$PROJECT_ROOT"
bundle exec jekyll build --quiet

# Run validation
validate_pages
