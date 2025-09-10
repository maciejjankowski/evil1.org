#!/bin/bash

# HTML Extraction Validation Script
# Validates that converted HTML pages render correctly and maintain functionality
# Version: 1.0
# Date: September 10, 2025

set -e

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$(dirname "$SCRIPT_DIR")")"
TEST_DIR="$SCRIPT_DIR"
LOG_FILE="$TEST_DIR/validation_results.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

# Logging function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
}

# Test result functions
pass() {
    echo -e "${GREEN}✓ PASS: $1${NC}"
    log "PASS: $1"
}

fail() {
    echo -e "${RED}✗ FAIL: $1${NC}"
    log "FAIL: $1"
}

warn() {
    echo -e "${YELLOW}⚠ WARN: $1${NC}"
    log "WARN: $1"
}

info() {
    echo -e "${BLUE}ℹ INFO: $1${NC}"
    log "INFO: $1"
}

# Initialize test results
init_tests() {
    echo "=== HTML EXTRACTION VALIDATION RESULTS ===" > "$LOG_FILE"
    echo "Date: $(date)" >> "$LOG_FILE"
    echo "Project: evil1.org HTML Extraction" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"
}

# Test 1: Jekyll Build Validation
test_jekyll_build() {
    info "Test 1: Jekyll Build Validation"

    cd "$PROJECT_ROOT"

    if bundle exec jekyll build --quiet 2>&1; then
        pass "Jekyll build successful"
        return 0
    else
        fail "Jekyll build failed"
        return 1
    fi
}

# Test 2: Frontmatter Validation
test_frontmatter() {
    info "Test 2: Frontmatter Validation"

    local files=(
        "company/exxonmobil.md"
        "news/index.md"
        "profile/index.md"
        "members/index.md"
        "company/index.md"
    )

    local all_pass=true

    for file in "${files[@]}"; do
        if [ -f "$PROJECT_ROOT/$file" ]; then
            # Check for valid YAML frontmatter
            if head -n 5 "$PROJECT_ROOT/$file" | grep -q "^---$"; then
                # Check for closing ---
                if grep -q "^---$" "$PROJECT_ROOT/$file"; then
                    # Check for page_html key
                    if grep -q "page_html:" "$PROJECT_ROOT/$file"; then
                        pass "Frontmatter valid: $file"
                    else
                        fail "Missing page_html key: $file"
                        all_pass=false
                    fi
                else
                    fail "Missing closing --- in frontmatter: $file"
                    all_pass=false
                fi
            else
                fail "No frontmatter found: $file"
                all_pass=false
            fi
        else
            warn "File not found: $file"
        fi
    done

    return $([ "$all_pass" = true ] && echo 0 || echo 1)
}

# Test 3: HTML Structure Validation
test_html_structure() {
    info "Test 3: HTML Structure Validation"

    local files=(
        "company/exxonmobil.md"
        "news/index.md"
        "profile/index.md"
        "members/index.md"
        "company/index.md"
    )

    local all_pass=true

    for file in "${files[@]}"; do
        if [ -f "$PROJECT_ROOT/$file" ]; then
            # Check for page_html placeholder
            if grep -q "{{ page.page_html }}" "$PROJECT_ROOT/$file"; then
                pass "HTML placeholder found: $file"
            else
                fail "Missing HTML placeholder: $file"
                all_pass=false
            fi

            # Check for basic HTML structure in frontmatter
            if grep -A 5 "page_html:" "$PROJECT_ROOT/$file" | grep -q "<div"; then
                pass "HTML content found in frontmatter: $file"
            else
                fail "No HTML content in frontmatter: $file"
                all_pass=false
            fi
        else
            warn "File not found: $file"
        fi
    done

    return $([ "$all_pass" = true ] && echo 0 || echo 1)
}

# Test 4: Content Preservation Check
test_content_preservation() {
    info "Test 4: Content Preservation Check"

    local files=(
        "company/exxonmobil.md"
        "news/index.md"
        "profile/index.md"
        "members/index.md"
        "company/index.md"
    )

    local all_pass=true

    for file in "${files[@]}"; do
        if [ -f "$PROJECT_ROOT/$file" ]; then
            # Check for expected content markers
            case "$file" in
                "company/exxonmobil.md")
                    if grep -q "ExxonMobil" "$PROJECT_ROOT/$file"; then
                        pass "Content preserved: ExxonMobil reference in $file"
                    else
                        fail "Missing content: ExxonMobil reference in $file"
                        all_pass=false
                    fi
                    ;;
                "news/index.md")
                    if grep -q "Media Outlets" "$PROJECT_ROOT/$file"; then
                        pass "Content preserved: Media Outlets in $file"
                    else
                        fail "Missing content: Media Outlets in $file"
                        all_pass=false
                    fi
                    ;;
                "profile/index.md")
                    if grep -q "Lucifer" "$PROJECT_ROOT/$file"; then
                        pass "Content preserved: Lucifer reference in $file"
                    else
                        fail "Missing content: Lucifer reference in $file"
                        all_pass=false
                    fi
                    ;;
                "members/index.md")
                    if grep -q "13 Circle" "$PROJECT_ROOT/$file"; then
                        pass "Content preserved: 13 Circle in $file"
                    else
                        fail "Missing content: 13 Circle in $file"
                        all_pass=false
                    fi
                    ;;
                "company/index.md")
                    if grep -q "Agricultural Biotechnology" "$PROJECT_ROOT/$file"; then
                        pass "Content preserved: Agricultural Biotechnology in $file"
                    else
                        fail "Missing content: Agricultural Biotechnology in $file"
                        all_pass=false
                    fi
                    ;;
            esac
        else
            warn "File not found: $file"
        fi
    done

    return $([ "$all_pass" = true ] && echo 0 || echo 1)
}

# Test 5: Generated Site Validation
test_generated_site() {
    info "Test 5: Generated Site Validation"

    cd "$PROJECT_ROOT"

    # Build the site
    if bundle exec jekyll build --quiet; then
        # Check if _site directory exists
        if [ -d "_site" ]; then
            pass "Site generated successfully"

            # Check for specific generated files
            local check_files=(
                "company/exxonmobil/index.html"
                "news/index.html"
                "profile/index.html"
                "members/index.html"
                "company/index.html"
            )

            local site_pass=true
            for file in "${check_files[@]}"; do
                if [ -f "_site/$file" ]; then
                    pass "Generated file exists: $file"
                else
                    fail "Missing generated file: $file"
                    site_pass=false
                fi
            done

            return $([ "$site_pass" = true ] && echo 0 || echo 1)
        else
            fail "_site directory not found"
            return 1
        fi
    else
        fail "Site generation failed"
        return 1
    fi
}

# Generate test report
generate_report() {
    info "Generating Test Report"

    local total_tests=5
    local passed_tests=0
    local failed_tests=0

    # Count results from log
    passed_tests=$(grep -c "PASS:" "$LOG_FILE")
    failed_tests=$(grep -c "FAIL:" "$LOG_FILE")

    echo "" >> "$LOG_FILE"
    echo "=== TEST SUMMARY ===" >> "$LOG_FILE"
    echo "Total Tests: $total_tests" >> "$LOG_FILE"
    echo "Passed: $passed_tests" >> "$LOG_FILE"
    echo "Failed: $failed_tests" >> "$LOG_FILE"
    echo "Success Rate: $((passed_tests * 100 / total_tests))%" >> "$LOG_FILE"
    echo "" >> "$LOG_FILE"

    if [ $failed_tests -eq 0 ]; then
        echo "🎉 ALL TESTS PASSED!" >> "$LOG_FILE"
        pass "All validation tests passed!"
    else
        echo "⚠️  SOME TESTS FAILED - Review log for details" >> "$LOG_FILE"
        warn "Some validation tests failed - check $LOG_FILE"
    fi
}

# Main test execution
main() {
    info "Starting HTML Extraction Validation Suite"
    info "Testing converted files for rendering parity and functionality"

    init_tests

    local test_results=()

    # Run all tests
    test_jekyll_build
    test_results+=($?)

    test_frontmatter
    test_results+=($?)

    test_html_structure
    test_results+=($?)

    test_content_preservation
    test_results+=($?)

    test_generated_site
    test_results+=($?)

    # Generate report
    generate_report

    # Calculate overall result
    local overall_pass=true
    for result in "${test_results[@]}"; do
        if [ $result -ne 0 ]; then
            overall_pass=false
            break
        fi
    done

    echo ""
    if [ "$overall_pass" = true ]; then
        pass "HTML EXTRACTION VALIDATION: SUCCESS"
        info "All converted pages are rendering correctly"
        info "Log file: $LOG_FILE"
        return 0
    else
        fail "HTML EXTRACTION VALIDATION: ISSUES FOUND"
        info "Review log file for details: $LOG_FILE"
        return 1
    fi
}

# Run main function
main "$@"
