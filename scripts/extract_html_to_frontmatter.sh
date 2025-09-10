#!/bin/bash

# HTML to Frontmatter Extraction Script
# Safely extracts embedded HTML from Jekyll markdown files and moves it to frontmatter
# Version: 2.0 - Enhanced
# Date: September 10, 2025

set -e  # Exit on any error

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$PROJECT_ROOT/backups/html_extraction_$TIMESTAMP"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    if [[ -n "$LOG_FILE" && -w "$LOG_FILE" ]]; then
        echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" >> "$LOG_FILE"
    fi
}

# Error handling
error_exit() {
    echo -e "${RED}ERROR: $1${NC}" >&2
    log "ERROR: $1"
    exit 1
}

# Success message
success() {
    echo -e "${GREEN}SUCCESS: $1${NC}"
    log "SUCCESS: $1"
}

# Warning message
warning() {
    echo -e "${YELLOW}WARNING: $1${NC}"
    log "WARNING: $1"
}

# Info message
info() {
    echo -e "${BLUE}INFO: $1${NC}"
    log "INFO: $1"
}

# Create backup directory
create_backup_dir() {
    info "Creating backup directory: $BACKUP_DIR"
    mkdir -p "$BACKUP_DIR" || error_exit "Failed to create backup directory"

    # Create subdirectories for organization
    mkdir -p "$BACKUP_DIR/original_files"
    mkdir -p "$BACKUP_DIR/processed_files"
    mkdir -p "$BACKUP_DIR/validation"
    mkdir -p "$BACKUP_DIR/samples"

    # Set log file path and create it
    LOG_FILE="$BACKUP_DIR/extraction.log"
    touch "$LOG_FILE"
}

# Backup original file
backup_file() {
    local file="$1"
    local relative_path="${file#$PROJECT_ROOT/}"
    local backup_path="$BACKUP_DIR/original_files/$relative_path"

    # Create directory structure in backup
    mkdir -p "$(dirname "$backup_path")"

    cp "$file" "$backup_path" || error_exit "Failed to backup $file"
    log "Backed up: $relative_path -> $backup_path"
}

# Validate Jekyll frontmatter
validate_frontmatter() {
    local file="$1"

    # Check if file has frontmatter
    if ! head -n 5 "$file" | grep -q "^---$"; then
        error_exit "File $file does not have proper Jekyll frontmatter"
    fi

    # Check if frontmatter is valid YAML (basic check)
    local frontmatter_end
    frontmatter_end=$(awk '/^---$/ { if (++count == 2) { print NR; exit } }' "$file")

    if [ -z "$frontmatter_end" ]; then
        error_exit "File $file has malformed frontmatter (missing closing ---)"
    fi

    log "Frontmatter validation passed for: $file"
}

# Check if file contains significant HTML
contains_html() {
    local file="$1"

    # Find frontmatter boundaries
    local frontmatter_end
    frontmatter_end=$(awk '/^---$/ { if (++count == 2) { print NR; exit } }' "$file")

    if [ -z "$frontmatter_end" ]; then
        return 1
    fi

    # Extract body content
    local body_content
    body_content=$(sed -n "$((frontmatter_end + 1)),\$p" "$file")

    # Check for various HTML patterns
    local html_patterns=(
        "<div style="
        "<span style="
        "<p style="
        "<h[1-6] style="
        "<table"
        "<ul style="
        "<ol style="
        "style=\""
    )

    for pattern in "${html_patterns[@]}"; do
        if echo "$body_content" | grep -q "$pattern"; then
            return 0  # Contains HTML
        fi
    done

    return 1  # No significant HTML found
}

# Extract HTML content from file
extract_html_content() {
    local file="$1"
    local temp_file="$BACKUP_DIR/processed_files/$(basename "$file").temp"

    # Find frontmatter boundaries
    local frontmatter_start frontmatter_end
    frontmatter_start=$(grep -n "^---$" "$file" | head -1 | cut -d: -f1)
    frontmatter_end=$(grep -n "^---$" "$file" | head -2 | tail -1 | cut -d: -f1)

    if [ -z "$frontmatter_start" ] || [ -z "$frontmatter_end" ]; then
        error_exit "Could not determine frontmatter boundaries in $file"
    fi

    # Extract frontmatter (without closing ---)
    sed -n "${frontmatter_start},${frontmatter_end}p" "$file" | head -n -1 > "$temp_file.frontmatter"

    # Extract body content (everything after frontmatter)
    sed -n "$((frontmatter_end + 1)),\$p" "$file" > "$temp_file.body"

    # Check if body contains HTML
    if ! contains_html "$file"; then
        warning "No significant HTML content found in body of $file"
        return 1
    fi

    # Create sample file for documentation
    local sample_file="$BACKUP_DIR/samples/$(basename "$file" .md)_sample.html"
    cp "$temp_file.body" "$sample_file"
    log "Created sample file: $sample_file"

    # Create new frontmatter with page_html
    {
        # Original frontmatter
        cat "$temp_file.frontmatter"
        # Add page_html key
        echo "page_html: |"
        # Add indented HTML content with proper escaping
        sed 's/^/  /' "$temp_file.body" | sed 's/\\/\\\\/g' | sed 's/"/\\"/g'
        # Add closing ---
        echo "---"
        echo ""
        echo "{{ page.page_html }}"
    } > "$temp_file.new"

    # Replace original file
    cp "$temp_file.new" "$file"

    # Clean up temp files
    rm -f "$temp_file.frontmatter" "$temp_file.body" "$temp_file.new"

    success "Extracted HTML content from $file"
    log "Processed: $file"
}

# Validate processed file
validate_processed_file() {
    local file="$1"

    # Check if file has page_html frontmatter
    if ! grep -q "page_html:" "$file"; then
        error_exit "Processed file $file does not contain page_html frontmatter"
    fi

    # Check if file has the placeholder
    if ! grep -q "{{ page.page_html }}" "$file"; then
        error_exit "Processed file $file does not contain placeholder"
    fi

    log "Validation passed for: $file"
}

# Test Jekyll build
test_jekyll_build() {
    info "Testing Jekyll build..."

    cd "$PROJECT_ROOT" || error_exit "Cannot change to project directory"

    if bundle exec jekyll build --quiet > "$BACKUP_DIR/jekyll_build.log" 2>&1; then
        success "Jekyll build successful"
        log "Jekyll build: SUCCESS"
    else
        warning "Jekyll build failed - check $BACKUP_DIR/jekyll_build.log"
        log "Jekyll build: FAILED"
        return 1
    fi
}

# Generate extraction report
generate_report() {
    local report_file="$BACKUP_DIR/extraction_report.md"

    {
        echo "# HTML Extraction Report"
        echo "**Generated:** $(date)"
        echo "**Backup Directory:** $BACKUP_DIR"
        echo ""
        echo "## Files Processed"
        echo ""
        echo "| File | Status | Backup Location | Sample |"
        echo "|------|--------|----------------|--------|"
    } > "$report_file"

    # Add processed files to report
    for file in "$@"; do
        local filename=$(basename "$file")
        local backup_path="$BACKUP_DIR/original_files/${file#$PROJECT_ROOT/}"
        local sample_path="$BACKUP_DIR/samples/${filename%.md}_sample.html"

        echo "| $file | Processed | $backup_path | $sample_path |" >> "$report_file"
    done

    {
        echo ""
        echo "## Summary"
        echo "- **Total Files:** $#"
        echo "- **Backup Directory:** $BACKUP_DIR"
        echo "- **Log File:** $LOG_FILE"
        echo ""
        echo "## Next Steps"
        echo "1. Review the processed files"
        echo "2. Test the Jekyll build: \`bundle exec jekyll build\`"
        echo "3. If build fails, restore from backups:"
        echo "   \`cp $BACKUP_DIR/original_files/* .\`"
        echo "4. Commit changes if successful"
    } >> "$report_file"

    success "Extraction report generated: $report_file"
}

# Main processing function
process_file() {
    local file="$1"

    info "Processing: $file"

    # Validate input file
    if [ ! -f "$file" ]; then
        error_exit "File does not exist: $file"
    fi

    validate_frontmatter "$file"

    # Backup original
    backup_file "$file"

    # Extract HTML content
    if extract_html_content "$file"; then
        # Validate processed file
        validate_processed_file "$file"

        success "Successfully processed: $file"
        return 0
    else
        warning "Skipped processing (no HTML found): $file"
        return 1
    fi
}

# Show usage information
show_usage() {
    cat << EOF
HTML to Frontmatter Extraction Script v2.0

USAGE:
    $0 <file1.md> [file2.md] ... [options]

ARGUMENTS:
    file1.md, file2.md...    Markdown files to process

OPTIONS:
    --dry-run               Show what would be done without making changes
    --help                  Show this help message

EXAMPLES:
    $0 profiles/index.md company/index.md
    $0 news/index.md --dry-run

DESCRIPTION:
    This script safely extracts embedded HTML from Jekyll markdown files
    and moves it to the frontmatter under a 'page_html' key. The body is
    replaced with '{{ page.page_html }}'.

    Features:
    - Automatic backup creation with timestamps
    - HTML content validation
    - Jekyll build testing
    - Comprehensive logging and reporting
    - Sample file generation for documentation

    All original files are backed up to: backups/html_extraction_TIMESTAMP/

EOF
}

# Main function
main() {
    local files=()
    local dry_run=false

    # Parse arguments
    while [[ $# -gt 0 ]]; do
        case $1 in
            --dry-run)
                dry_run=true
                shift
                ;;
            --help)
                show_usage
                exit 0
                ;;
            *)
                files+=("$1")
                shift
                ;;
        esac
    done

    if [ ${#files[@]} -eq 0 ]; then
        show_usage
        exit 1
    fi

    info "Starting HTML extraction process"
    info "Processing ${#files[@]} files"
    info "Backup directory: $BACKUP_DIR"

    if [ "$dry_run" = true ]; then
        info "DRY RUN MODE - No changes will be made"
        for file in "${files[@]}"; do
            if contains_html "$file"; then
                info "Would process: $file (contains HTML)"
            else
                info "Would skip: $file (no HTML found)"
            fi
        done
        exit 0
    fi

    create_backup_dir

    local processed_count=0
    local skipped_count=0

    for file in "${files[@]}"; do
        if process_file "$file"; then
            ((processed_count++))
        else
            ((skipped_count++))
        fi
    done

    # Generate report
    generate_report "${files[@]}"

    # Test build
    if test_jekyll_build; then
        success "All files processed successfully!"
        info "Processed: $processed_count files"
        if [ $skipped_count -gt 0 ]; then
            info "Skipped: $skipped_count files"
        fi
        info "Backup location: $BACKUP_DIR"
        info "Log file: $LOG_FILE"
        info "Report: $BACKUP_DIR/extraction_report.md"
    else
        warning "Jekyll build failed - check processed files and logs"
        info "To restore from backup: cp $BACKUP_DIR/original_files/* ."
    fi
}

# Run main function with all arguments
main "$@"
