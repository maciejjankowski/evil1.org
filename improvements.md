# IMPROVEMENTS & LESSONS LEARNED

## Debugging & Development Workflow Improvements

### Jekyll Page Processing Issues (From Education Links Fix)

**What I Learned:**
- **Missing Front Matter**: Files without proper YAML front matter are treated as static assets, not pages
- **Blank Lines Matter**: Leading blank lines before `---` prevent Jekyll from recognizing YAML front matter
- **File Naming Conflicts**: Some filenames (like "blueprint") may have special handling in Jekyll
- **Verbose Output is Key**: `bundle exec jekyll build --verbose` shows exactly which files are being processed
- **Directory Structure Check**: Check `_site` directory - pages create subdirectories, static files are copied as-is

**Faster Debugging Methods:**
1. **Use Verbose Build Output**
   ```bash
   bundle exec jekyll build --verbose | grep -E "(Reading|Rendering|Writing)"
   ```
   This shows exactly which files Jekyll is processing and how.

2. **Check Generated Structure**
   ```bash
   find _site -name "*.html" -type f | head -10
   ```
   Pages generate `index.html` in subdirectories, static files stay as original format.

3. **Automated Link Testing**
   ```bash
   # Test all education links
   for page in Blueprint Curriculum Doctrine Guestspeakers Rebranding intro statut; do
     curl -I "http://localhost:4000/education/$page/" | head -1
   done
   ```

4. **Quick Front Matter Validation**
   ```bash
   # Check if files have proper front matter
   head -5 education/*.md | grep -E "^---|^$|^layout:"
   ```

5. **Use Jekyll Watch Mode**
   ```bash
   bundle exec jekyll serve --watch --incremental
   ```
   Faster rebuilds during development.

### General Development Improvements

**Build Process Optimization:**
- Use `--incremental` flag for faster rebuilds during development
- Use `--watch` mode to automatically rebuild on file changes
- Use `--verbose` flag to see detailed processing information

**File Organization:**
- Keep consistent front matter structure across all pages
- Use descriptive permalinks that match directory structure
- Validate YAML syntax before committing

**Quality Assurance:**
- Always test links after making changes
- Use browser developer tools to check for 404 errors
- Implement automated link checking in CI/CD pipeline

**Error Prevention:**
- Template for new pages with proper front matter
- Pre-commit hooks to validate YAML syntax
- Automated tests for common Jekyll issues

### Tool & Workflow Enhancements

**Recommended Scripts:**
1. **Link Checker Script** (`scripts/check-links.sh`):
   ```bash
   #!/bin/bash
   # Check all internal links for 404 errors
   bundle exec jekyll build
   bundle exec jekyll serve --detach
   # Use linkchecker or similar tool
   linkchecker http://localhost:4000/
   kill %1
   ```

2. **Page Validation Script** (`scripts/validate-pages.sh`):
   ```bash
   #!/bin/bash
   # Check all pages have proper front matter
   for file in $(find . -name "*.md" -not -path "./_site/*"); do
     if ! head -1 "$file" | grep -q "^---$"; then
       echo "Missing front matter: $file"
     fi
   done
   ```

**VS Code Extensions:**
- YAML Language Support for better front matter editing
- Jekyll Snippets for consistent page templates
- Markdown Preview Enhanced for real-time preview

**Git Workflow:**
- Use feature branches for complex changes
- Commit frequently with descriptive messages
- Use `git add -p` for selective staging

### Future Automation Ideas

**CI/CD Integration:**
- Automated link checking on every build
- YAML validation in pre-commit hooks
- Automated screenshot testing for visual regressions

**Development Tools:**
- Create Jekyll page templates with proper front matter
- Build validation scripts that run before commits
- Automated testing for common Jekyll configuration issues

---

*Last Updated: September 8, 2025*</content>
<parameter name="filePath">/Users/mj/code/evil1.org/improvements.md
