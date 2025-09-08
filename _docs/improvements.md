# Jekyll Development Best Practices & Debugging Guide

## Overview

This document outlines comprehensive best practices for Jekyll development, debugging techniques, and workflow improvements based on official Jekyll documentation and real-world experience fixing common issues.

## Front Matter Best Practices

### Essential Front Matter Variables

Every Jekyll page must have proper YAML front matter to be processed correctly:

```yaml
---
layout: default
title: "Page Title"
description: "Brief description for SEO and previews"
permalink: /custom-url/
published: true
---
```

**Critical Variables:**
- `layout`: Specifies the template to use (required for pages)
- `title`: Page title (used in templates and SEO)
- `permalink`: Custom URL structure (overrides global settings)
- `published`: Controls page visibility (false hides the page)

### Custom Variables

Use custom variables for page-specific content:

```yaml
---
layout: education
title: "Advanced Curriculum"
description: "Comprehensive learning path"
author: "Institute Team"
difficulty: "Advanced"
duration: "8 weeks"
prerequisites:
  - "Basic Knowledge"
  - "Previous Course"
---
```

### Front Matter Validation

**Quick validation script:**
```bash
# Check all markdown files have proper front matter
for file in $(find . -name "*.md" -not -path "./_site/*"); do
  if ! head -1 "$file" | grep -q "^---$"; then
    echo "❌ Missing front matter: $file"
  fi
done
```

## Permalink Configuration

### Permalink Structure Options

**Global Configuration** (`_config.yml`):
```yaml
permalink: /:categories/:year/:month/:day/:title/
```

**Front Matter Override:**
```yaml
---
permalink: /education/blueprint/
---
```

### Built-in Permalink Styles

- `date`: `/:categories/:year/:month/:day/:title.html`
- `pretty`: `/:categories/:year/:month/:day/:title/`
- `ordinal`: `/:categories/:year/:month/:day/:title/index.html`
- `none`: `/:categories/:title.html`

### Placeholders Available

- `:year` - 4-digit year
- `:month` - 2-digit month
- `:day` - 2-digit day
- `:title` - URL-safe title
- `:categories` - Category path
- `:collection` - Collection name

## Debugging Techniques

### Verbose Build Output

Use verbose mode to see detailed processing:

```bash
bundle exec jekyll build --verbose
```

This shows:
- Which files are being read
- Template rendering process
- File writing operations
- Any processing errors

### Jekyll Doctor

Check for configuration issues:

```bash
bundle exec jekyll doctor
```

Identifies:
- Deprecated features
- Configuration problems
- Missing dependencies

### Development Server Options

```bash
# Watch mode with incremental builds
bundle exec jekyll serve --watch --incremental

# Verbose server output
bundle exec jekyll serve --verbose

# Custom port and host
bundle exec jekyll serve --host 0.0.0.0 --port 4001
```

### Link Testing

**Automated link checking:**
```bash
# Start server in background
bundle exec jekyll serve --detach

# Test specific links
curl -I http://localhost:4000/education/blueprint/

# Stop server
pkill -f jekyll
```

**Batch link testing:**
```bash
# Test all education pages
for page in blueprint curriculum doctrine; do
  status=$(curl -s -o /dev/null -w "%{http_code}" \
    "http://localhost:4000/education/$page/")
  echo "$page: $status"
done
```

## Common Issues & Solutions

### 404 Errors on Pages

**Symptoms:** Pages return 404 despite existing files

**Causes & Solutions:**

1. **Missing Front Matter:**
   ```bash
   # Check for missing front matter
   grep -L "^---$" *.md
   ```
   **Fix:** Add proper YAML front matter to all pages

2. **Blank Lines Before Front Matter:**
   ```bash
   # Files with leading blank lines
   for file in *.md; do
     if head -1 "$file" | grep -q "^$"; then
       echo "Leading blank line: $file"
     fi
   done
   ```
   **Fix:** Remove blank lines before `---`

3. **Incorrect Permalink Structure:**
   ```bash
   # Check permalink format
   grep "permalink:" *.md
   ```
   **Fix:** Ensure permalinks match directory structure

### Base URL Problems

**Issue:** Links work locally but break in production

**Solution:** Always use relative URLs or proper baseurl:

```yaml
# In _config.yml
baseurl: "/blog"  # For GitHub Pages
url: "https://username.github.io"
```

**Template usage:**
```liquid
<!-- Wrong -->
<a href="/about/">About</a>

<!-- Correct -->
<a href="{{ '/about/' | relative_url }}">About</a>
```

### Configuration Precedence Issues

**Order of precedence:**
1. Command-line flags
2. `_config.yml` settings
3. Jekyll defaults

**Common mistake:** Overriding defaults completely

```yaml
# Wrong - overrides all defaults
exclude:
  - custom_file.txt

# Correct - merges with defaults
exclude:
  - custom_file.txt
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor/bundle/
```

### Liquid Template Errors

**Common issues:**
- Unclosed tags: `{% if condition %}` without `{% endif %}`
- Undefined variables
- Incorrect filter usage

**Debugging:**
```bash
# Enable Liquid error reporting
bundle exec jekyll build --trace
```

### Production Environment Issues

**Static file symlinks:**
```bash
# Set environment for production builds
JEKYLL_ENV=production bundle exec jekyll build
```

**Missing dependencies:**
```bash
# Use bundle exec to ensure correct gem versions
bundle exec jekyll build
```

## Development Workflow Improvements

### File Organization

**Recommended structure:**
```
├── _config.yml
├── _layouts/
├── _includes/
├── _sass/
├── assets/
├── _posts/
├── pages/
│   ├── about.md
│   └── contact.md
└── collections/
    └── _education/
```

### Git Workflow

**Pre-commit hooks:**
```bash
#!/bin/bash
# .git/hooks/pre-commit

# Validate YAML syntax
for file in $(git diff --cached --name-only | grep "\.md$"); do
  if ! head -1 "$file" | grep -q "^---$"; then
    echo "❌ Missing front matter: $file"
    exit 1
  fi
done

# Check for Jekyll build errors
bundle exec jekyll build --quiet
if [ $? -ne 0 ]; then
  echo "❌ Jekyll build failed"
  exit 1
fi
```

### VS Code Setup

**Recommended extensions:**
- YAML (redhat.vscode-yaml)
- Jekyll Snippets (bradlc.vscode-tailwindcss)
- Markdown Preview Enhanced (shd101wyy.markdown-preview-enhanced)
- Liquid (neilding.language-liquid)

**Settings:**
```json
{
  "yaml.schemas": {
    "Jekyll Front Matter": ["*.md", "*.markdown"]
  },
  "files.associations": {
    "*.liquid": "liquid"
  }
}
```

## Automation & Tools

### Build Scripts

**Development script** (`scripts/dev.sh`):
```bash
#!/bin/bash
# Start development server with optimal settings
bundle exec jekyll serve \
  --watch \
  --incremental \
  --host 0.0.0.0 \
  --port 4000 \
  --verbose
```

**Production build script** (`scripts/build.sh`):
```bash
#!/bin/bash
# Production build with optimizations
JEKYLL_ENV=production bundle exec jekyll build \
  --config _config.yml,_config.production.yml
```

### Validation Scripts

**Link checker** (`scripts/check-links.sh`):
```bash
#!/bin/bash
# Comprehensive link checking
bundle exec jekyll build
bundle exec jekyll serve --detach --host 127.0.0.1

# Use linkchecker or similar tool
linkchecker \
  --check-extern \
  --no-warnings \
  http://127.0.0.1:4000/

pkill -f jekyll
```

**Front matter validator** (`scripts/validate-frontmatter.sh`):
```bash
#!/bin/bash
# Validate all front matter
for file in $(find . -name "*.md" -not -path "./_site/*"); do
  # Check YAML syntax
  if ! python3 -c "import yaml; yaml.safe_load(open('$file'))" 2>/dev/null; then
    echo "❌ Invalid YAML: $file"
    continue
  fi

  # Check required fields
  if ! grep -q "^layout:" "$file"; then
    echo "⚠️  Missing layout: $file"
  fi
done
```

### CI/CD Integration

**GitHub Actions example** (`.github/workflows/jekyll.yml`):
```yaml
name: Jekyll Build
on: [push, pull_request]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: ruby/setup-ruby@v1
        with:
          ruby-version: '3.1'
      - run: bundle install
      - run: bundle exec jekyll build
      - run: ./scripts/check-links.sh
```

## Performance Optimization

### Build Optimization

**Incremental builds:**
```bash
bundle exec jekyll build --incremental
```

**Exclude unnecessary files:**
```yaml
# _config.yml
exclude:
  - README.md
  - scripts/
  - .git/
  - vendor/
```

### Content Optimization

**Lazy loading images:**
```liquid
<img src="{{ '/assets/placeholder.jpg' | relative_url }}"
     data-src="{{ page.image | relative_url }}"
     class="lazy">
```

**Minify HTML output:**
```yaml
# _config.yml
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-minifier
```

## Copilot Model Selection for Jekyll Tasks

### Model Recommendations by Task Type

**🔧 Debugging & Troubleshooting**
- **GPT-4** (Primary): Complex 404 errors, build failures, configuration issues, front matter problems
- **GPT-3.5-Turbo** (Secondary): Simple syntax errors, basic validation, quick fixes
- **Claude** (Alternative): Analyzing error patterns, documenting solutions, preventive debugging

**📝 Content Creation & Front Matter**
- **GPT-4** (Primary): Complex content structure, custom variables, permalink configuration
- **Claude** (Secondary): Narrative content, documentation writing, content analysis
- **GPT-3.5-Turbo** (Utility): Basic front matter templates, simple content updates

**⚙️ Configuration & Setup**
- **GPT-4** (Primary): Jekyll configuration, plugin setup, complex integrations, CI/CD setup
- **GPT-3.5-Turbo** (Secondary): Basic config changes, simple script creation
- **Claude** (Documentation): Configuration documentation, setup guides, best practices

**🚀 Performance & Optimization**
- **GPT-4** (Primary): Build optimization, performance analysis, complex automation
- **GPT-3.5-Turbo** (Secondary): Simple script optimization, basic performance checks
- **Claude** (Analysis): Performance documentation, optimization strategies

**🔗 Link Testing & Validation**
- **GPT-4** (Primary): Complex link validation, automated testing setup, error analysis
- **GPT-3.5-Turbo** (Secondary): Basic link checking, simple validation scripts
- **Claude** (Reporting): Link validation documentation, error reporting

### Model Switching Guidelines

**When to Switch Models:**
1. **Task Complexity Changes**: If a simple task becomes complex (switch to GPT-4)
2. **Stuck on Problem**: If current model can't solve issue after 2-3 attempts
3. **Output Quality Issues**: If generated code/content doesn't meet requirements
4. **Time Sensitivity**: For urgent tasks, consider faster models (GPT-3.5)

**Model Performance Patterns:**
- **GPT-4 excels at**: Deep technical analysis, complex debugging, comprehensive solutions
- **GPT-3.5 excels at**: Fast execution, routine tasks, simple operations
- **Claude excels at**: Content quality, ethical considerations, documentation

### Task-Specific Model Assignments

**Front Matter Issues:**
```yaml
# GPT-4: Complex front matter debugging
# GPT-3.5: Basic front matter validation
# Claude: Front matter documentation
```

**Build Errors:**
```bash
# GPT-4: Complex build failure analysis
bundle exec jekyll build --verbose  # GPT-4 debugging

# GPT-3.5: Simple build validation
bundle exec jekyll build           # GPT-3.5 routine builds
```

**Content Creation:**
```markdown
<!-- GPT-4: Technical content with complex structure -->
<!-- Claude: Narrative content with ethical considerations -->
<!-- GPT-3.5: Basic content updates and simple edits -->
```

**Automation Scripts:**
```bash
# GPT-4: Complex validation and automation scripts
# GPT-3.5: Simple utility scripts and basic automation
# Claude: Script documentation and usage guides
```

## Conclusion

Following these best practices will significantly improve your Jekyll development experience:

- **Prevention**: Use validation scripts and pre-commit hooks
- **Debugging**: Leverage verbose output and Jekyll doctor
- **Automation**: Implement CI/CD and build scripts
- **Performance**: Use incremental builds and optimization techniques
- **Model Selection**: Choose the right Copilot model for each task type

**Key Takeaways:**
1. Always include proper front matter in all pages
2. Use verbose mode for debugging
3. Validate YAML syntax regularly
4. Implement automated testing
5. Use relative URLs for portability
6. Keep configuration organized with proper precedence
7. **Select appropriate Copilot model** based on task complexity and requirements

---

*Last Updated: September 8, 2025*
*Based on Jekyll v4.x documentation and best practices*

## Recent Learnings and Workflow Improvements (September 9, 2025)

### YAML Front Matter Consistency for Articles
**Learning:** Always ensure Jekyll articles have complete front matter including `layout`, `title`, `description`, `permalink`, `date`, and `categories` for proper rendering and SEO.

**Implementation:**
```yaml
---
layout: post
title: "Article Title"
description: "Brief description for SEO"
permalink: /articles/article-slug/
date: 2025-09-09
categories: [category1, category2]
---
```

**Benefits:**
- Consistent metadata across all articles
- Better SEO and social media previews
- Proper categorization and date-based organization
- Prevents Jekyll rendering issues

### Link Auditing Techniques Using Grep Search
**Learning:** Use `grep_search` with regex patterns to efficiently audit internal and external links across the entire site codebase.

**Implementation:**
```bash
# Find all markdown links
grep_search includePattern: "*.md" isRegexp: true query: "\[.*?\]\(.*?\)"

# Find internal links only (starting with /)
grep_search includePattern: "*.md" isRegexp: true query: "\[.*?\]\(/[^)]+\)"

# Find external links only
grep_search includePattern: "*.md" isRegexp: true query: "\[.*?\]\((?!http)[^)]+\)"
```

**Benefits:**
- Comprehensive link inventory
- Quick identification of broken or outdated links
- Efficient cross-site consistency checks
- Automated validation workflows

### Layout Verification Process
**Learning:** Regularly check that all .md files have appropriate layouts (post, default, home) to prevent Jekyll rendering issues.

**Implementation:**
```bash
# Check all files have layout
grep_search includePattern: "*.md" isRegexp: true query: "^layout:"

# Validate layout values
grep "layout:" *.md | sort | uniq -c
```

**Benefits:**
- Prevents 404 errors from missing layouts
- Ensures consistent page rendering
- Early detection of configuration issues
- Maintains site structure integrity

### Jekyll Plugin Verification in Config
**Learning:** Confirm existing Jekyll plugins in `_config.yml` provide necessary functionality before adding new ones.

**Current Plugin Assessment:**
```yaml
plugins:
  - jekyll-feed      # ✅ RSS feed generation
  - jekyll-sitemap   # ✅ SEO sitemap creation
  - jekyll-seo-tag   # ✅ Meta tag optimization
```

**Benefits:**
- Avoids unnecessary plugin additions
- Ensures optimal performance
- Maintains clean configuration
- Leverages built-in functionality

### Content Cross-Check Process
**Learning:** When performing consistency checks, verify front matter fields, formatting, permalinks, and reference styles across all articles.

**Cross-Check Checklist:**
- [ ] Front matter completeness (layout, title, description, permalink, date, categories)
- [ ] Consistent formatting (headings, lists, code blocks)
- [ ] Permalink structure alignment
- [ ] Reference style consistency (citations, links)
- [ ] YAML syntax validation

**Benefits:**
- Maintains professional appearance
- Improves user experience
- Enhances SEO consistency
- Reduces maintenance overhead

### Task Breakdown Strategy for Complex Requests
**Learning:** For complex user requests, always break them into small, actionable tasks and add to `backlog.md` before execution.

**Process:**
1. Analyze user request complexity
2. Break into 3-5 specific, measurable tasks
3. Add to backlog with clear descriptions
4. Execute tasks sequentially
5. Mark completion and document learnings

**Benefits:**
- Improved task management
- Better progress tracking
- Reduced cognitive load
- Enhanced collaboration efficiency

### Practical Implementation Notes
- **Automation:** Consider creating scripts for repetitive checks (link validation, front matter verification)
- **Documentation:** Update workflow.md with new patterns discovered
- **Training:** Use these learnings to improve future task execution
- **Metrics:** Track time saved and error reduction from implementing these practices</content>
<parameter name="filePath">/Users/mj/code/evil1.org/improvements.md
