# HTML Extraction Backup Strategy & Procedures

**Version:** 2.0
**Date:** September 10, 2025
**Purpose:** Comprehensive backup strategy and procedures for safe HTML extraction from Jekyll markdown files

## Backup Strategy Overview

### Automated Backup Process
The enhanced extraction script (`scripts/extract_html_to_frontmatter.sh`) automatically creates comprehensive backups with improved organization:

```
backups/html_extraction_YYYYMMDD_HHMMSS/
├── original_files/          # Complete copies of original files
│   └── [original file structure preserved]
├── processed_files/         # Temporary processing files
├── samples/                 # HTML content samples for review
├── validation/             # Build validation artifacts
├── jekyll_build.log        # Build test results
├── extraction.log          # Complete processing log
└── extraction_report.md    # Processing summary and next steps
```

### Backup Naming Convention
- **Directory:** `html_extraction_YYYYMMDD_HHMMSS`
- **Example:** `html_extraction_20250910_212422`
- **Retention:** Keep last 10 backups automatically, archive older ones

### Manual Backup Verification
Before running extraction on any file:

```bash
# 1. Create manual backup with timestamp
cp target_file.md target_file.md.backup.$(date +%Y%m%d_%H%M%S)

# 2. Verify backup integrity
diff target_file.md target_file.md.backup.* || echo "Backup verification failed!"

# 3. Test Jekyll build
bundle exec jekyll build --quiet
```

## Rollback Procedures

### Emergency Rollback (Single File)
```bash
# Restore from script backup
LATEST_BACKUP=$(ls -td backups/html_extraction_* | head -1)
cp "$LATEST_BACKUP/original_files/path/to/file.md" path/to/file.md

# Or from manual backup
cp file.md.backup.* file.md

# Test build
bundle exec jekyll build
```

### Batch Rollback (Multiple Files)
```bash
# Find latest backup
LATEST_BACKUP=$(ls -td backups/html_extraction_* | head -1)

# Restore all files
find "$LATEST_BACKUP/original_files" -name "*.md" -exec cp {} . \;

# Test build
bundle exec jekyll build
```

### Git-based Rollback
```bash
# If committed, revert specific files
git checkout HEAD~1 -- path/to/file.md

# Or revert entire commit
git revert HEAD

# Or reset to before extraction
git reset --hard HEAD~1
```

## Validation Procedures

### Pre-extraction Validation
- [ ] File has valid Jekyll frontmatter (starts and ends with ---)
- [ ] File contains extractable HTML (`<div`, `<span`, `<p style=`, etc.)
- [ ] Jekyll build passes before extraction
- [ ] Backup directory is writable and has sufficient space
- [ ] File is not currently being edited by another process

### Post-extraction Validation
- [ ] File contains `page_html` frontmatter key
- [ ] File body contains only `{{ page.page_html }}` placeholder
- [ ] Frontmatter YAML is still valid
- [ ] Jekyll build passes after extraction
- [ ] Visual inspection of rendered page matches original
- [ ] No Liquid syntax errors in Jekyll output

### Build Testing
```bash
# Quick build test
bundle exec jekyll build --quiet

# Full build with verbose output
bundle exec jekyll build --verbose

# Serve locally for visual inspection
bundle exec jekyll serve

# Check for specific errors
bundle exec jekyll build 2>&1 | grep -i error
```

## Risk Mitigation

### Low-risk Files (Safe to Process)
- Files with simple HTML structures (< 100 lines)
- Files with repetitive, template-like HTML
- Index pages with standard card layouts
- Files with minimal JavaScript or complex Liquid templating

### High-risk Files (Extra Caution Required)
- Files with complex JavaScript integration
- Files with Liquid templating mixed with HTML
- Files with custom CSS or extensive inline styles
- Critical user-facing pages (homepage, main navigation)
- Files with forms or interactive elements

### Processing Order Recommendations
1. **Phase 1 (Low Risk):** Simple index pages, small files under 50KB
2. **Phase 2 (Medium Risk):** Complex layouts, files 50KB-200KB
3. **Phase 3 (High Risk):** JavaScript-heavy pages, critical user paths

## Recovery Testing

### Test Scenario 1: Single File Failure
```bash
# Process one file
./scripts/extract_html_to_frontmatter.sh test_file.md

# Verify success
bundle exec jekyll build

# If failed, check logs
tail -20 backups/html_extraction_*/extraction.log

# Rollback if needed
LATEST_BACKUP=$(ls -td backups/html_extraction_* | head -1)
cp "$LATEST_BACKUP/original_files/test_file.md" test_file.md
```

### Test Scenario 2: Build Failure After Processing
```bash
# If build fails after processing multiple files
# 1. Check extraction.log for errors
tail -50 backups/html_extraction_*/extraction.log

# 2. Check Jekyll build log
cat backups/html_extraction_*/jekyll_build.log

# 3. Restore from backup
LATEST_BACKUP=$(ls -td backups/html_extraction_* | head -1)
find "$LATEST_BACKUP/original_files" -name "*.md" -exec cp {} . \;

# 4. Re-run build
bundle exec jekyll build
```

### Test Scenario 3: Content Rendering Issues
```bash
# If page renders incorrectly
# 1. Compare sample with rendered output
LATEST_BACKUP=$(ls -td backups/html_extraction_* | head -1)
cat "$LATEST_BACKUP/samples/"*sample.html

# 2. Check extraction report
cat "$LATEST_BACKUP/extraction_report.md"

# 3. Restore and manually fix
cp "$LATEST_BACKUP/original_files/file.md" file.md
# Edit file.md manually to fix issues
```

## Processing Procedures

### Step-by-Step Extraction Process
1. **Preparation**
   - Identify target files from `_docs/html-scan.md`
   - Ensure development environment is clean
   - Create manual backup if desired

2. **Validation**
   - Run `./scripts/extract_html_to_frontmatter.sh file.md --dry-run`
   - Verify HTML detection and file validation
   - Confirm backup directory creation works

3. **Processing**
   - Run `./scripts/extract_html_to_frontmatter.sh file.md`
   - Monitor extraction.log for progress
   - Check extraction_report.md for summary

4. **Verification**
   - Run `bundle exec jekyll build`
   - Check jekyll_build.log for errors
   - Visually inspect rendered pages
   - Test interactive elements if present

5. **Completion**
   - Update `_docs/html-scan.md` with completion status
   - Commit changes with descriptive message
   - Archive backup if processing successful

## Documentation Updates

After successful extraction:
- [ ] Update `_docs/html-scan.md` with completion status
- [ ] Mark file as "Converted" in the inventory
- [ ] Update file size and HTML byte counts if changed
- [ ] Add any issues encountered to `_docs/improvements.md`
- [ ] Commit changes with descriptive message:
  ```
  [COPILOT] Extract HTML from file.md to frontmatter
  - Moved ~XKB of HTML to page_html frontmatter
  - Jekyll build passes
  - Backup created: backups/html_extraction_YYYYMMDD_HHMMSS
  ```

## Monitoring and Alerts

### Success Indicators
- Jekyll build passes without errors
- No Liquid syntax errors in output
- Page renders correctly in browser
- No JavaScript console errors
- File size appropriately reduced
- Backup files match originals

### Warning Signs
- Jekyll build warnings about syntax
- File size unexpectedly large/small
- Rendering differences from original
- JavaScript functionality broken
- Liquid templating errors

### Failure Indicators
- Jekyll build fails completely
- File corruption or data loss
- Cannot restore from backup
- Multiple files affected by single failure

## Tool Maintenance

### Script Updates
- Test script updates on sample files first
- Maintain backward compatibility with existing backups
- Document any breaking changes in this document
- Update version number and changelog

### Backup Management
- Implement automatic cleanup of old backups
- Compress archived backups to save space
- Document backup locations in project wiki
- Regular audit of backup integrity

## Sample Processing Output

After running extraction on 3 files:

```
INFO: Starting HTML extraction process
INFO: Processing 3 files
INFO: Backup directory: /Users/mj/code/evil1.org/backups/html_extraction_20250910_212422
INFO: Creating backup directory: /Users/mj/code/evil1.org/backups/html_extraction_20250910_212422
INFO: Processing: profiles/index.md
SUCCESS: Extracted HTML content from profiles/index.md
SUCCESS: Successfully processed: profiles/index.md
[... similar for other files ...]
SUCCESS: Extraction report generated: /Users/mj/code/evil1.org/backups/html_extraction_20250910_212422/extraction_report.md
INFO: Testing Jekyll build...
SUCCESS: Jekyll build successful
SUCCESS: All files processed successfully!
INFO: Processed: 3 files
INFO: Backup location: /Users/mj/code/evil1.org/backups/html_extraction_20250910_212422
```

## Contact and Support

For extraction issues:
1. Check `extraction.log` and `jekyll_build.log` in backup directory
2. Review `extraction_report.md` for processing summary
3. Consult `_docs/html-scan.md` for file inventory
4. Check `_docs/improvements.md` for known issues
5. Create issue in project repository with log files attached

## Version History

- **v2.0** (2025-09-10): Enhanced procedures, comprehensive validation, sample generation, improved error handling
- **v1.0** (2025-09-10): Initial backup strategy with basic rollback procedures
