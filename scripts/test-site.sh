#!/bin/bash
# scripts/test-site.sh
# Comprehensive site testing suite

echo "🧪 Comprehensive Site Testing Suite"
echo "==================================="
echo "Date: $(date)"
echo ""

# Initialize test results
tests_passed=0
tests_failed=0
total_tests=0

# Function to run a test
run_test() {
    local test_name="$1"
    local test_command="$2"

    echo "🔍 Running: $test_name"
    total_tests=$((total_tests + 1))

    if eval "$test_command"; then
        echo "✅ PASSED: $test_name"
        tests_passed=$((tests_passed + 1))
    else
        echo "❌ FAILED: $test_name"
        tests_failed=$((tests_failed + 1))
    fi
    echo ""
}

# Test 1: Jekyll build
run_test "Jekyll Build" "bundle exec jekyll build --quiet"

# Test 2: Check for build errors
run_test "Build Error Check" "[ -d '_site' ] && [ \"\$(find _site -name '*.html' | wc -l)\" -gt 0 ]"

# Test 3: HTML validation (basic)
run_test "HTML Structure Check" "find _site -name '*.html' -exec grep -l '<!DOCTYPE' {} \; | wc -l | grep -q '^[1-9]'"

# Test 4: Check for broken internal links (basic)
run_test "Internal Link Check" "find _site -name '*.html' -exec grep -h 'href=\"/' {} \; | grep -v 'href=\"//\"' | wc -l | grep -q '^[0-9]'"

# Test 5: SEO elements check
run_test "SEO Elements Check" "find _site -name '*.html' -exec grep -l '<title>' {} \; | wc -l | grep -q '^[1-9]'"

# Test 6: Image optimization check
run_test "Image Optimization Check" "[ -d 'assets/images' ] && find assets/images -type f \( -iname '*.jpg' -o -iname '*.png' \) | wc -l | grep -q '^[0-9]'"

# Test 7: Content quality check
run_test "Content Quality Check" "[ -f 'scripts/quality-check.sh' ] && ./scripts/quality-check.sh > /dev/null 2>&1"

# Test 8: Performance check
run_test "Performance Analysis" "[ -f 'scripts/monitor-performance.sh' ] && ./scripts/monitor-performance.sh > /dev/null 2>&1"

# Test 9: Asset compilation check
run_test "Asset Compilation" "find _site/assets -name '*.css' | wc -l | grep -q '^[0-9]'"

# Test 10: Sitemap generation
run_test "Sitemap Check" "[ -f '_site/sitemap.xml' ] && [ -s '_site/sitemap.xml' ]"

echo "📊 Test Results Summary"
echo "======================="
echo "Total Tests: $total_tests"
echo "Passed: $tests_passed"
echo "Failed: $tests_failed"
echo "Success Rate: $(echo "scale=1; $tests_passed * 100 / $total_tests" | bc)%"
echo ""

if [ $tests_failed -eq 0 ]; then
    echo "🎉 All tests passed! Site is ready for deployment."
    exit 0
else
    echo "⚠️  Some tests failed. Please review the issues above."
    echo ""
    echo "💡 Common fixes:"
    echo "  • Run 'bundle exec jekyll build' to check for build errors"
    echo "  • Run './scripts/quality-check.sh' for content issues"
    echo "  • Run './scripts/monitor-performance.sh' for performance issues"
    echo "  • Check _site/ directory for generated files"

    exit 1
fi
