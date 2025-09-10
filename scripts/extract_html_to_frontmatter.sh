#!/bin/bash

# HTML to Frontmatter Extraction Script
# Safely extracts inline HTML from Jekyll markdown files and moves to frontmatter
# Version: 1.0
# Date: September 10, 2025

set -e  # Exit on any error

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
BACKUP_DIR="$PROJECT_ROOT/backups/html_extraction_$(date +%Y%m%d_%H%M%S)"
LOG_FILE="$BACKUP_DIR/extraction.log"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Logging function
log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') - $1" | tee -a "$LOG_FILE"
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

    # Extract frontmatter
    sed -n "${frontmatter_start},${frontmatter_end}p" "$file" > "$temp_file.frontmatter"

    # Extract body content (everything after frontmatter)
    sed -n "$((frontmatter_end + 1)),\$p" "$file" > "$temp_file.body"

    # Check if body contains HTML
    if ! grep -q "<div" "$temp_file.body"; then
        warning "No HTML content found in body of $file"
        return 1
    fi

    # Create new frontmatter with page_html
    {
        # Remove last line (closing ---) from original frontmatter
        head -n -1 "$temp_file.frontmatter"
        # Add page_html key
        echo "page_html: |"
        # Add indented HTML content
        sed 's/^/  /' "$temp_file.body"
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
    else
        warning "Skipped processing (no HTML found): $file"
    fi
}

# Main function
main() {
    local files=("$@")

    if [ ${#files[@]} -eq 0 ]; then
        echo "Usage: $0 <file1.md> [file2.md] ..."
        echo "Example: $0 profiles/index.md company/index.md"
        exit 1
    fi

    info "Starting HTML extraction process"
    info "Processing ${#files[@]} files"
    info "Backup directory: $BACKUP_DIR"

    create_backup_dir

    local processed_count=0
    local failed_count=0

    for file in "${files[@]}"; do
        if process_file "$file"; then
            ((processed_count++))
        else
            ((failed_count++))
        fi
    done

    # Test build
    if test_jekyll_build; then
        success "All files processed successfully!"
        info "Processed: $processed_count files"
        if [ $failed_count -gt 0 ]; then
            warning "Failed: $failed_count files"
        fi
        info "Backup location: $BACKUP_DIR"
        info "Log file: $LOG_FILE"
    else
        warning "Jekyll build failed - check processed files"
    fi
}

# Run main function with all arguments
main "$@"
