# HTML Extraction Backup Strategy

**Version:** 1.0
**Date:** September 10, 2025
**Purpose:** Ensure safe rollback capability during HTML extraction process

## Backup Strategy Overview

### Automated Backup Process
The extraction script (`scripts/extract_html_to_frontmatter.sh`) automatically creates comprehensive backups:

```
backups/html_extraction_YYYYMMDD_HHMMSS/
├── original_files/          # Complete copies of original files
│   └── [original file structure preserved]
├── processed_files/         # Temporary processing files
├── validation/             # Build validation artifacts
├── jekyll_build.log        # Build test results
└── extraction.log          # Complete processing log
```

### Backup Naming Convention
- **Directory:** `html_extraction_YYYYMMDD_HHMMSS`
- **Example:** `html_extraction_20250910_143052`
- **Retention:** Keep last 5 backups automatically

### Manual Backup Verification
Before running extraction on any file:

```bash
# 1. Create manual backup
cp target_file.md target_file.md.backup

# 2. Verify backup integrity
diff target_file.md target_file.md.backup || echo "Backup differs!"

# 3. Test Jekyll build
bundle exec jekyll build --quiet
```

## Rollback Procedures

### Emergency Rollback (Single File)
```bash
# Restore from script backup
cp backups/html_extraction_YYYYMMDD_HHMMSS/original_files/path/to/file.md path/to/file.md

# Or from manual backup
cp file.md.backup file.md

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
```

## Validation Procedures

### Pre-extraction Validation
- [ ] File has valid Jekyll frontmatter
- [ ] File contains HTML content (`<div` tags)
- [ ] Jekyll build passes before extraction
- [ ] Backup created and verified

### Post-extraction Validation
- [ ] File contains `page_html` frontmatter key
- [ ] File body contains `{{ page.page_html }}` placeholder
- [ ] Jekyll build passes after extraction
- [ ] Visual inspection of rendered page

### Build Testing
```bash
# Quick build test
bundle exec jekyll build --quiet

# Full build with verbose output
bundle exec jekyll build --verbose

# Serve locally for visual inspection
bundle exec jekyll serve
```

## Risk Mitigation

### Low-risk Files (Safe to Process)
- Files with simple HTML structures
- Files under 50 lines
- Files with clear HTML boundaries
- Index pages with repetitive structures

### High-risk Files (Extra Caution)
- Files with complex JavaScript
- Files with Liquid templating mixed with HTML
- Files with custom CSS or styling
- Critical user-facing pages

### Processing Order
1. **Phase 1 (Low Risk):** Simple index pages, small files
2. **Phase 2 (Medium Risk):** Complex layouts, larger files
3. **Phase 3 (High Risk):** JavaScript-heavy, critical pages

## Recovery Testing

### Test Scenario 1: Single File Failure
```bash
# Process one file
./scripts/extract_html_to_frontmatter.sh test_file.md

# Verify success
bundle exec jekyll build

# If failed, rollback
cp backups/html_extraction_*/original_files/test_file.md test_file.md
```

### Test Scenario 2: Build Failure
```bash
# If build fails after processing
# 1. Check extraction.log for errors
# 2. Restore from backup
# 3. Re-run build
# 4. If persistent, manual fix required
```

## Documentation Updates

After successful extraction:
- [ ] Update `_docs/html-scan.md` with completion status
- [ ] Add file to list of successfully converted pages
- [ ] Update any related documentation
- [ ] Commit changes with descriptive message

## Monitoring and Alerts

### Success Indicators
- Jekyll build passes
- No Liquid syntax errors
- Page renders correctly
- No JavaScript errors in browser

### Failure Indicators
- Jekyll build fails
- Liquid syntax errors
- Page displays raw Liquid code
- JavaScript functionality broken

## Contact and Support

For extraction issues:
1. Check `extraction.log` in backup directory
2. Review Jekyll build output
3. Consult `_docs/html-extraction.md` for examples
4. Create issue in project repository
