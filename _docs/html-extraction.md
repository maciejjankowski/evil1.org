---
layout: default
title: HTML Extraction Guide
description: Complete guide for extracting inline HTML from Jekyll pages to frontmatter for better maintainability
permalink: /docs/html-extraction/
---

# HTML Extraction Guide

**Last Updated:** September 10, 2025
**Purpose:** Guide for extracting inline HTML from Jekyll markdown files to frontmatter for improved maintainability and version control

## Overview

This guide documents the process of extracting embedded inline HTML from Jekyll markdown files and moving it to frontmatter using the `page_html` key pattern. This improves code maintainability, version control tracking, and separation of content from presentation.

## Why Extract HTML?

### Benefits
- **Better Version Control**: HTML changes are tracked as content changes rather than code changes
- **Improved Maintainability**: HTML structure is separated from Jekyll frontmatter
- **Cleaner Code**: Markdown files focus on content, HTML focuses on presentation
- **Template Reusability**: HTML patterns can be reused across similar pages
- **Easier Debugging**: Clear separation makes issues easier to identify

### When to Extract
- Files with extensive inline HTML (>50 lines)
- Pages with complex layouts using `<div style=>` patterns
- Content that mixes HTML structure with Jekyll templating
- Files that would benefit from cleaner separation of concerns

## Conversion Process

### Step 1: Identify Candidates
Use the HTML scanning tools to identify files needing conversion:

```bash
# Scan for HTML content in markdown files
find . -name "*.md" -exec grep -l "<div" {} \;

# Get detailed analysis
./scripts/extract_html_to_frontmatter_batch.sh --dry-run *.md
```

### Step 2: Backup Original Files
Always create backups before conversion:

```bash
# Manual backup
cp file.md file.md.backup

# Or use the batch script (creates automatic backups)
./scripts/extract_html_to_frontmatter_batch.sh --batch file.md
```

### Step 3: Convert File Structure

#### Before Conversion
```markdown
---
layout: default
title: "Page Title"
description: "Page description"
permalink: /page/
---

<div class="content">
    <h1>My Page</h1>
    <p>Some content</p>
    <div style="color: red;">Styled content</div>
</div>
```

#### After Conversion
```markdown
---
layout: default
title: "Page Title"
description: "Page description"
permalink: /page/
page_html: |
  <div class="content">
      <h1>My Page</h1>
      <p>Some content</p>
      <div style="color: red;">Styled content</div>
  </div>
---

{{ page.page_html }}
```

### Step 4: Validate Conversion

Run the validation suite to ensure everything works:

```bash
# Run full validation
./_tests/html_validation/validate_html_extraction.sh

# Or validate specific file
bundle exec jekyll build --quiet
```

## Code Examples

### Basic HTML Extraction
```bash
# Single file conversion
./scripts/extract_html_to_frontmatter.sh page.md

# Batch conversion
./scripts/extract_html_to_frontmatter_batch.sh --batch page1.md page2.md page3.md

# Dry run to preview changes
./scripts/extract_html_to_frontmatter_batch.sh --dry-run *.md
```

### Frontmatter Template
```yaml
---
layout: default
title: "Your Page Title"
description: "Brief description of page content"
permalink: /your-page/
page_html: |
  <!-- Your HTML content goes here -->
  <div class="your-content">
      <h1>Page Title</h1>
      <p>Content here...</p>
  </div>
---

{{ page.page_html }}
```

### Complex HTML with Jekyll Templating
```yaml
---
layout: default
title: "Dynamic Page"
description: "Page with dynamic content"
permalink: /dynamic/
page_html: |
  <div class="dynamic-content">
      <h1>{{ page.title }}</h1>
      <p>Generated on: {% raw %}{{ site.time | date: "%B %d, %Y" }}{% endraw %}</p>
      <div class="posts">
          {% raw %}{% for post in site.posts limit:5 %}{% endraw %}
              <article>
                  <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
                  <p>{{ post.excerpt }}</p>
              </article>
          {% raw %}{% endfor %}{% endraw %}
      </div>
  </div>
---

{{ page.page_html }}
```

## Validation Checklist

### Pre-Conversion
- [ ] File has valid Jekyll frontmatter
- [ ] File contains HTML content to extract
- [ ] Backup created
- [ ] File committed to version control

### Post-Conversion
- [ ] Frontmatter contains `page_html` key
- [ ] Body contains only `{{ page.page_html }}`
- [ ] Jekyll build passes without errors
- [ ] Generated HTML matches original layout
- [ ] All links and functionality preserved
- [ ] Content appears identical to original

### Quality Assurance
- [ ] No broken HTML tags
- [ ] Proper YAML indentation (2 spaces)
- [ ] No Liquid template syntax errors
- [ ] Cross-browser compatibility maintained
- [ ] Mobile responsiveness preserved

## Common Patterns

### Index Pages
```yaml
page_html: |
  <div class="index-page">
      <div class="page-header">
          <h1>{{ page.title }}</h1>
          <p class="description">{{ page.description }}</p>
      </div>
      <div class="content-grid">
          <!-- Content cards -->
      </div>
  </div>
```

### Article Pages
```yaml
page_html: |
  <article class="post-content">
      <header class="post-header">
          <h1>{{ page.title }}</h1>
          <div class="post-meta">
              <time>{{ page.date | date: "%B %d, %Y" }}</time>
          </div>
      </header>
      <div class="post-body">
          {{ content }}
      </div>
  </article>
```

### Profile/Company Pages
```yaml
page_html: |
  <div class="profile-page">
      <div class="hero-section">
          <h1>{{ page.title }}</h1>
          <p class="tagline">{{ page.description }}</p>
      </div>
      <div class="timeline">
          <!-- Timeline content -->
      </div>
      <div class="statistics">
          <!-- Stats content -->
      </div>
  </div>
```

## Troubleshooting

### Common Issues

#### YAML Parsing Errors
**Problem:** Invalid YAML syntax in frontmatter
**Solution:**
- Ensure proper indentation (2 spaces)
- Check for special characters in YAML values
- Use quotes for strings containing colons or special characters

#### Jekyll Build Failures
**Problem:** Site fails to build after conversion
**Solution:**
- Check for Liquid syntax errors in HTML content
- Verify all `{% raw %}` and `{% endraw %}` tags are properly paired
- Ensure HTML structure is valid

#### Content Not Rendering
**Problem:** Page appears blank or missing content
**Solution:**
- Verify `{{ page.page_html }}` is in the body
- Check that `page_html` key exists in frontmatter
- Ensure proper YAML multiline string formatting

#### Layout Issues
**Problem:** Visual layout differs from original
**Solution:**
- Compare generated HTML with original
- Check for missing CSS classes or inline styles
- Verify responsive design elements

### Recovery Procedures

#### Rollback Single File
```bash
# Restore from backup
cp file.md.backup file.md

# Rebuild site
bundle exec jekyll build
```

#### Rollback Multiple Files
```bash
# Use batch script rollback (if available)
./scripts/extract_html_to_frontmatter_batch.sh --rollback

# Or manual restoration
find backups/ -name "*.backup" -exec cp {} . \;
```

## Best Practices

### File Organization
- Keep HTML content logically structured
- Use consistent indentation (2 spaces for YAML, 4 spaces for HTML)
- Group related HTML elements together
- Comment complex HTML structures

### Version Control
- Commit conversions in logical batches
- Include validation results in commit messages
- Tag major conversion milestones
- Document any breaking changes

### Maintenance
- Regularly validate converted files
- Update HTML patterns as design evolves
- Keep documentation current with process changes
- Train team members on extraction procedures

### Performance Considerations
- Monitor build times after large conversions
- Consider caching strategies for complex HTML
- Optimize HTML structure for rendering speed
- Test on multiple devices and browsers

## Tools and Scripts

### Core Scripts
- `scripts/extract_html_to_frontmatter.sh` - Single file extraction
- `scripts/extract_html_to_frontmatter_batch.sh` - Batch processing
- `_tests/html_validation/validate_html_extraction.sh` - Validation suite

### Helper Commands
```bash
# Find files with HTML content
find . -name "*.md" -exec grep -l "<div" {} \;

# Count HTML lines in file
grep -c "<" file.md

# Validate YAML frontmatter
ruby -ryaml -e "YAML.load_file('file.md')"

# Check Jekyll syntax
bundle exec jekyll build --drafts --quiet
```

## Training Resources

### Quick Start
1. Read this guide completely
2. Practice on a test file
3. Run validation suite
4. Convert production files in batches

### Advanced Topics
- Liquid templating in extracted HTML
- CSS optimization strategies
- Performance monitoring
- Automated testing integration

### Support
- Check existing converted files for examples
- Review validation logs for error patterns
- Test conversions on staging environment first
- Document any new patterns discovered

## Changelog

- **v1.0** (September 10, 2025): Initial guide creation
- Comprehensive validation procedures added
- Batch processing workflows documented
- Troubleshooting section expanded
