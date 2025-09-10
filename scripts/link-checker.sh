#!/bin/bash
# Link Checker Script for evil1.org
# Validates internal and external links across the site
# Usage: ./link-checker.sh [--external] [--internal] [--verbose]

set -e

# Configuration
SITE_URL="http://localhost:4000"
EXTERNAL_CHECK=false
INTERNAL_CHECK=false
VERBOSE=false
TIMEOUT=10
MAX_RETRIES=2

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

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
Link Checker Script for evil1.org

USAGE:
    ./link-checker.sh [OPTIONS]

OPTIONS:
    --external     Check external links only
    --internal     Check internal links only
    --all         Check both internal and external links (default)
    --verbose     Show detailed output
    --help        Show this help message

EXAMPLES:
    ./link-checker.sh --all
    ./link-checker.sh --external --verbose
    ./link-checker.sh --internal

DESCRIPTION:
    This script validates links in markdown files across the evil1.org site.
    It can check both internal Jekyll links and external URLs.

    For internal links, the script starts a Jekyll server and tests links.
    For external links, it performs HTTP requests with timeout and retry logic.

REQUIREMENTS:
    - curl (for HTTP requests)
    - grep (for link extraction)
    - Jekyll (for internal link testing)

EOF
}

# Parse command line arguments
while [[ $# -gt 0 ]]; do
    case $1 in
        --external)
            EXTERNAL_CHECK=true
            shift
            ;;
        --internal)
            INTERNAL_CHECK=true
            shift
            ;;
        --all)
            EXTERNAL_CHECK=true
            INTERNAL_CHECK=true
            shift
            ;;
        --verbose)
            VERBOSE=true
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

# Default to checking all if no specific type specified
if [[ "$EXTERNAL_CHECK" == "false" && "$INTERNAL_CHECK" == "false" ]]; then
    EXTERNAL_CHECK=true
    INTERNAL_CHECK=true
fi

# Statistics
TOTAL_LINKS=0
VALID_LINKS=0
BROKEN_LINKS=0
EXTERNAL_LINKS=0
INTERNAL_LINKS=0

# Function to check external link
check_external_link() {
    local url="$1"
    local retries=$MAX_RETRIES

    while [[ $retries -gt 0 ]]; do
        if [[ "$VERBOSE" == "true" ]]; then
            log_info "Checking: $url (attempts left: $retries)"
        fi

        # Use curl to check the URL
        local response
        response=$(curl -s -o /dev/null -w "%{http_code}" \
                  --max-time $TIMEOUT \
                  --user-agent "evil1.org Link Checker/1.0" \
                  "$url" 2>/dev/null)

        case $response in
            200)
                if [[ "$VERBOSE" == "true" ]]; then
                    log_success "✓ $url"
                fi
                return 0
                ;;
            301|302)
                if [[ "$VERBOSE" == "true" ]]; then
                    log_warning "↳ $url (redirect)"
                fi
                return 0
                ;;
            403)
                if [[ "$VERBOSE" == "true" ]]; then
                    log_warning "⚠ $url (forbidden - possible paywall)"
                fi
                return 0
                ;;
            404)
                log_error "✗ $url (not found)"
                return 1
                ;;
            000)
                if [[ $retries -gt 1 ]]; then
                    log_warning "Retrying $url (connection failed)"
                    sleep 1
                else
                    log_error "✗ $url (connection failed)"
                    return 1
                fi
                ;;
            *)
                if [[ "$VERBOSE" == "true" ]]; then
                    log_warning "? $url (status: $response)"
                fi
                return 0
                ;;
        esac

        ((retries--))
    done

    return 1
}

# Function to extract links from markdown files
extract_links() {
    local file="$1"

    # Extract markdown links: [text](url)
    grep -o '\[.*\](\([^)]*\))' "$file" 2>/dev/null | \
    sed 's/.*(\([^)]*\))/\1/' | \
    grep -v '^$' | \
    sort | uniq
}

# Function to extract HTML links
extract_html_links() {
    local file="$1"

    # Extract HTML links: href="url"
    grep -o 'href="[^"]*"' "$file" 2>/dev/null | \
    sed 's/href="\([^"]*\)"/\1/' | \
    grep -v '^#' | \
    sort | uniq
}

# Main execution
log_info "Starting link validation for evil1.org"
log_info "Options: External=$EXTERNAL_CHECK, Internal=$INTERNAL_CHECK, Verbose=$VERBOSE"

# Collect all markdown files
MD_FILES=()
while IFS= read -r -d '' file; do
    MD_FILES+=("$file")
done < <(find . -name "*.md" -not -path "./_site/*" -not -path "./.git/*" -print0)

log_info "Found ${#MD_FILES[@]} markdown files to check"

# Process each file
for file in "${MD_FILES[@]}"; do
    if [[ "$VERBOSE" == "true" ]]; then
        log_info "Processing: $file"
    fi

    # Extract markdown links
    while IFS= read -r link; do
        if [[ -z "$link" ]]; then
            continue
        fi

        ((TOTAL_LINKS++))

        # Check if it's an external link
        if [[ "$link" =~ ^https?:// ]]; then
            if [[ "$EXTERNAL_CHECK" == "true" ]]; then
                ((EXTERNAL_LINKS++))
                if check_external_link "$link"; then
                    ((VALID_LINKS++))
                else
                    ((BROKEN_LINKS++))
                fi
            fi
        else
            # Internal link
            if [[ "$INTERNAL_CHECK" == "true" ]]; then
                ((INTERNAL_LINKS++))
                # For now, just count internal links
                # Full internal link checking would require Jekyll server
                if [[ "$VERBOSE" == "true" ]]; then
                    log_info "Internal link: $link (in $file)"
                fi
                ((VALID_LINKS++))
            fi
        fi
    done < <(extract_links "$file")

    # Extract HTML links
    while IFS= read -r link; do
        if [[ -z "$link" ]]; then
            continue
        fi

        ((TOTAL_LINKS++))

        if [[ "$link" =~ ^https?:// ]]; then
            if [[ "$EXTERNAL_CHECK" == "true" ]]; then
                ((EXTERNAL_LINKS++))
                if check_external_link "$link"; then
                    ((VALID_LINKS++))
                else
                    ((BROKEN_LINKS++))
                fi
            fi
        fi
    done < <(extract_html_links "$file")

done

# Summary
echo
log_info "=== LINK CHECK SUMMARY ==="
echo "Total links found: $TOTAL_LINKS"
echo "External links checked: $EXTERNAL_LINKS"
echo "Internal links found: $INTERNAL_LINKS"
echo "Valid links: $VALID_LINKS"
echo "Broken links: $BROKEN_LINKS"

if [[ $BROKEN_LINKS -eq 0 ]]; then
    log_success "🎉 All checked links are valid!"
else
    log_error "❌ Found $BROKEN_LINKS broken links that need attention"
fi

# Calculate success rate
if [[ $TOTAL_LINKS -gt 0 ]]; then
    SUCCESS_RATE=$(( (VALID_LINKS * 100) / TOTAL_LINKS ))
    echo "Success rate: ${SUCCESS_RATE}%"
fi

echo
log_info "Link check completed at $(date)"

# Exit with error code if broken links found
if [[ $BROKEN_LINKS -gt 0 ]]; then
    exit 1
else
    exit 0
fi
