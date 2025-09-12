# GitHub Copilot Instructions for evil1.org

**ALWAYS follow these instructions first. Only search for additional context or run exploratory bash commands if the information here is incomplete or found to be in error.**

## Repository Overview

evil1.org is a Jekyll-based satirical social networking platform that exposes corporate evil and capitalist exploitation. The site uses Ruby/Jekyll for content management with Playwright for visual regression testing.

**Key Technologies:**
- Jekyll 4.3.4 static site generator 
- Ruby 3.2.3 with Bundler for dependency management
- Node.js 20.19.5 with npm for testing tools
- Playwright for visual regression testing
- YAML frontmatter for content metadata
- Sass for styling (external CSS only)

## Essential Bootstrap Commands

**NEVER CANCEL builds or long-running commands. Always set timeouts of 60+ minutes for builds, 30+ minutes for tests.**

### 1. Initial Environment Setup (First Time Only)
```bash
# Install bundler (may need sudo)
sudo gem install bundler

# Configure local bundle path to avoid permission issues
bundle config set --local path 'vendor/bundle'

# NEVER CANCEL: Install Ruby dependencies (takes ~25 seconds)
bundle install  # Timeout: 180 seconds minimum

# NEVER CANCEL: Install npm dependencies (takes ~2 seconds)  
npm install  # Timeout: 120 seconds minimum
```

### 2. Build and Test Workflow
```bash
# NEVER CANCEL: Build site (takes ~3 seconds, CRITICAL validation step)
bundle exec jekyll build  # Timeout: 180 seconds minimum

# NEVER CANCEL: Run quality checks (takes <1 second)
./scripts/quality-check.sh  # Timeout: 60 seconds minimum

# NEVER CANCEL: Run comprehensive site tests (takes ~5 seconds, 90% pass rate expected)
./scripts/test-site.sh  # Timeout: 180 seconds minimum
```

### 3. Development Server
```bash
# Start development server (takes ~3 seconds to start)
bundle exec jekyll serve --port 4000 --host 127.0.0.1 --incremental

# Server will be available at: http://127.0.0.1:4000/
# Use Ctrl+C to stop server
```

### 4. Visual Regression Testing
```bash
# INSTALL BROWSERS FIRST (may fail due to download issues - document if so)
npx playwright install  # May fail with download errors - this is known issue

# NEVER CANCEL: Run visual tests (takes ~1 minute with browsers installed)
npm test  # Timeout: 300 seconds minimum

# Update visual baselines after intentional layout changes
npm run visual-baseline  # Timeout: 300 seconds minimum

# View test reports (saved to playwright-report/ folder)
npx playwright show-report playwright-report
```

## Core Development Rules

1. **YAML Frontmatter**: Preserve exactly; never strip `---` delimiters
2. **CSS**: External stylesheets only in `assets/` - NO inline styles
3. **Protected Files**: Never edit `_dont touch/` directory contents  
4. **Testing**: Always run `bundle exec jekyll build` before declaring work complete
5. **Visual Tests**: Run `npm test` after layout/CSS changes (may fail if browsers not installed)
6. **Content Style**: Satirical/dark humor critiquing power structures
7. **Components**: Reuse existing components; avoid duplication
8. **Format**: Prefer Markdown over raw HTML when possible

## Repository Structure

```
/
├── _articles/           # Article content (Jekyll collection)
├── _profiles/           # People profiles (Jekyll collection) 
├── _organizations/      # Company profiles (Jekyll collection)
├── _posts/             # Blog posts
├── _layouts/           # Jekyll page templates
├── _includes/          # Reusable Jekyll components
├── _data/              # YAML data files
├── assets/             # CSS, images, JavaScript
├── scripts/            # Workflow automation scripts
├── tests/              # Playwright visual regression tests
├── vendor/bundle/      # Local Ruby gems (after bundle install)
└── _site/              # Generated site (after Jekyll build)
```

## Critical File Locations

- **Main Config**: `_config.yml` (Jekyll configuration)
- **Ruby Dependencies**: `Gemfile` and `Gemfile.lock`
- **npm Dependencies**: `package.json` and `package-lock.json`
- **Task Management**: `_docs/backlog-all.md` (single source of truth)
- **Quality Scripts**: `scripts/quality-check.sh` and `scripts/test-site.sh`
- **Visual Tests**: `tests/visual.spec.js` and `playwright.config.js`

## Build Times and Performance

- **Bundle install**: ~25 seconds (first time), <5 seconds (subsequent)
- **Jekyll build**: ~3 seconds (clean), ~1 second (incremental)
- **Quality check**: <1 second (fast content analysis)
- **Site tests**: ~5 seconds (comprehensive validation)
- **Visual tests**: ~1 minute (when browsers installed), fails without browsers
- **Development server startup**: ~3 seconds

## Manual Validation Scenarios

**ALWAYS perform these validation steps after making changes:**

### 1. Basic Site Functionality
```bash
# Build and verify no errors
bundle exec jekyll build

# Check generated files exist
find _site -name "*.html" | wc -l  # Should show ~278 HTML files

# Start development server
bundle exec jekyll serve --port 4000 --host 127.0.0.1

# Navigate to http://127.0.0.1:4000/ and verify:
# - Homepage loads correctly
# - Navigation menu works
# - Article links function
# - No JavaScript console errors
```

### 2. Content Quality Validation
```bash
# Run content analysis
./scripts/quality-check.sh  # Should show quality score and recommendations

# Check for broken builds
bundle exec jekyll build --verbose  # Look for YAML or Jekyll errors
```

### 3. Visual Regression Testing (if browsers installed)
```bash
# Run visual tests
npm test  # Should complete without major failures

# If tests fail, check reports
ls playwright-report/  # Review generated test reports
```

## Known Issues and Workarounds

1. **Playwright Browser Install**: May fail with download errors. Document this limitation in any testing instructions.

2. **Bundle Permission Issues**: Use `bundle config set --local path 'vendor/bundle'` to install gems locally.

3. **Sass Deprecation Warnings**: Expected deprecation warnings for `@import "minima"` - these are harmless.

4. **Performance Script**: `scripts/monitor-performance.sh` may not exist - site tests show 90% pass rate is normal.

## Workflow Integration

- **Task Management**: All work tracked in `_docs/backlog-all.md`
- **Completion**: Use `./scripts/mark-task-done.sh TASK_ID` to mark tasks complete  
- **Quality Gates**: Run build + quality check + site tests before completion
- **Visual Changes**: Always run visual tests if layout/CSS modified

## Emergency Commands

```bash
# Stop all Jekyll processes
pkill -f jekyll

# Clean build (if issues)
rm -rf _site && bundle exec jekyll build

# Reset bundle config (if permission issues)
rm -rf vendor/bundle && find .bundle -mindepth 1 ! -name 'config' -exec rm -rf {} + && git checkout -- .bundle/config && bundle config set --local path 'vendor/bundle' && bundle install
```

## Timeout Recommendations

**CRITICAL: NEVER CANCEL long-running commands. Always use these minimum timeouts:**

- Build commands: 180 seconds minimum
- npm install: 120 seconds minimum  
- Visual tests: 300 seconds minimum
- Bundle install: 180 seconds minimum
- Server startup: 60 seconds minimum

Build times are normal and expected. Canceling builds will break the development workflow.

## Advanced Commands

### Development Tools
```bash
# Serve with different options
bundle exec jekyll serve --port 4000 --host 127.0.0.1 --incremental  # Fast rebuilds
bundle exec jekyll serve --port 4000 --host 127.0.0.1 --detach        # Background mode
bundle exec jekyll serve --port 4000 --host 127.0.0.1 --livereload    # Auto-refresh browser

# Build with options  
bundle exec jekyll build --verbose    # Detailed output for debugging
bundle exec jekyll build --trace      # Full error traces
bundle exec jekyll build --incremental # Faster builds (dev only)

# Clean builds when needed
bundle exec jekyll clean && bundle exec jekyll build
```

### Testing Commands  
```bash
# Playwright testing (requires browsers installed)
npm test                    # Run all visual regression tests
npm run test:headed         # Run with browser UI visible  
npm run test:ui            # Interactive UI mode
npm run visual-baseline    # Update snapshots after layout changes

# Site validation
./scripts/quality-check.sh  # Content quality analysis (<1 sec)
./scripts/test-site.sh     # Comprehensive site tests (~5 sec)
```

### Content Management
```bash
# Task management
./scripts/mark-task-done.sh TASK_ID  # Mark backlog item complete
./scripts/start-task.sh "Description" # Initialize new task documentation

# Content validation
./scripts/frontmatter-validator.sh   # Validate YAML frontmatter  
./scripts/link-checker.sh           # Check internal/external links
```

## Jekyll Collection Structure

The site uses Jekyll collections for organized content:

- **`_articles/`**: In-depth exposé articles (main content)
- **`_profiles/`**: Individual people profiles (corporate villains, whistleblowers)  
- **`_organizations/`**: Company/organization profiles (case studies)
- **`_posts/`**: Blog-style posts and updates

## Component System

### Existing Components (`_includes/`)
- **Core Components**: `stat.html`, `crime-card.html`, `timeline-item.html`
- **UI Components**: Button styles, cards, alerts 
- **Layout Components**: Hero sections, grids, content sections
- **Interactive**: HTMX-powered components for dynamic features

### Component Usage Rules
1. Reuse existing components first
2. NO inline styles - external CSS only
3. Document new components in `_docs/component-inventory.md`
4. Prefix domain-specific includes (e.g., `merch-`, `profile-`)

## CSS and Styling

- **Main CSS**: `assets/main.scss` (compiles to CSS)
- **External only**: Never use inline `style=""` attributes
- **Sass deprecation**: Expect warnings about `@import "minima"` (harmless)
- **Classes**: Use `.btn-primary`, `.btn-supporter`, `.cta-link`, etc.

## Playwright Testing Details

### Configuration (`playwright.config.js`)
- **Global timeout**: 10 minutes
- **Expect timeout**: 5 seconds  
- **Screenshot tolerance**: 100 max diff pixels, 20% threshold
- **Browsers**: Chromium, Firefox, WebKit, Mobile Chrome, Mobile Safari
- **Server**: Reuses Jekyll server on port 4000

### Test Files
- **Main tests**: `tests/visual.spec.js` 
- **Reports**: Generated in `playwright-report/` folder
- **Screenshots**: Baseline images for comparison

### Known Playwright Issues
- **Browser download failures**: Common issue with `npx playwright install`
- **Workaround**: Document limitation if browsers can't be installed
- **Fallback**: Use Jekyll build + manual validation if visual tests fail

## Error Handling and Troubleshooting

### Common Build Errors
```bash
# YAML syntax errors
bundle exec jekyll build --verbose  # Shows detailed YAML errors

# Permission errors
bundle config set --local path 'vendor/bundle'  # Use local gem installation

# Server port conflicts  
lsof -ti:4000 | xargs kill -9  # Kill processes on port 4000
```

### Recovery Commands
```bash
# Complete environment reset
rm -rf vendor/bundle .bundle _site
bundle config set --local path 'vendor/bundle'
bundle install
bundle exec jekyll build

# Reset npm environment
rm -rf node_modules package-lock.json
npm install
```

## Quality Standards

### Content Requirements
- **Frontmatter**: All pages must have title, date, description
- **Author attribution**: Required for credibility  
- **Source links**: External verification links required
- **Word count**: Minimum 300 words for articles
- **Fact-checking**: Satirical content must be based on real events

### Technical Standards  
- **Build success**: 100% clean Jekyll builds
- **Link integrity**: No broken internal/external links
- **Performance**: Site loads under 3 seconds
- **Mobile responsive**: All layouts work on mobile devices
- **SEO**: Proper meta tags, schema markup

## Project-Specific Workflow

### Task Lifecycle
1. **Planning**: Tasks added to `_docs/backlog-all.md`
2. **Execution**: Follow build → test → validate cycle
3. **Quality check**: Run all validation scripts
4. **Visual testing**: Verify layout changes with screenshots
5. **Completion**: Mark done with `./scripts/mark-task-done.sh`

### Commit Standards
```bash
# Format: [TASK_ID] Brief description
git commit -m "[T123] Add company profile for Meta layoffs"

# Always run before commit:
bundle exec jekyll build   # Verify no build errors
./scripts/quality-check.sh # Check content quality
npm test                   # Visual regression (if browsers available)
```

This comprehensive guide ensures consistent, reliable development practices across the evil1.org platform.
