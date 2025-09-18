# Project Organization

## Directory Structure

This document outlines the organized structure of the evil1.org project after cleanup.

### Root Directory (Content & Essential Files)
- `_config.yml` - Jekyll configuration
- `index.html` - Homepage
- `about.html`, `contact.html`, `press.html`, `privacy.html`, `terms.html` - Main pages
- `_data/`, `_docs/`, `_includes/`, `_layouts/`, `_plugins/` - Jekyll directories
- `assets/` - Styles, images, fonts
- `_site/` - Built site (generated)

### Organized Directories

#### `configs/`
Configuration files for development tools:
- `Gemfile`, `Gemfile.lock` - Ruby dependencies
- `package.json`, `package-lock.json` - Node.js dependencies
- `playwright.config.js` - Testing configuration

#### `scripts/`
Automation and utility scripts:
- `build.sh` - Main build script (handles moved Gemfile)
- `analyze_unused_css.sh` - CSS analysis tool
- `setup_ssh_key.sh` - SSH key setup helper

#### `_docs/`
Documentation and project files:
- `backlog-all.md` - Project task management
- `ADMIN_README.md` - Administrative documentation
- `readme.md` - Project README
- `launch-roadmap.md` - Project roadmap
- `playwright-report/` - Test reports
- `test-results/` - Test outputs

#### `archives/`
Generated and archived files:
- `evil1.org-site.zip` - Site archive
- `fundraiser-description.md` - Generated content

#### `_to_review/`
Files needing review or cleanup:
- `out.txt` - Debug output
- `.delete-manifest` - Deletion manifest
- `.DS_Store` - macOS system file

#### `vendor/`
Third-party dependencies:
- `bundle/` - Ruby gems
- `node_modules/` - Node.js packages

## Build Process

To build the site after cleanup:

```bash
# Using the build script (recommended)
./scripts/build.sh

# Or manually with environment variable
BUNDLE_GEMFILE=configs/Gemfile bundle exec jekyll build
```

## Benefits of Cleanup

1. **Cleaner Root Directory** - Only essential content files remain
2. **Better Organization** - Files grouped by purpose
3. **Easier Maintenance** - Clear separation of concerns
4. **Build Optimization** - Non-essential files don't interfere with Jekyll
5. **Team Collaboration** - Clearer project structure

## File Movement Summary

| Original Location | New Location | Files Moved |
|------------------|--------------|-------------|
| Root | `configs/` | Gemfile*, package.json*, playwright.config.js |
| Root | `scripts/` | *.sh scripts |
| Root | `_docs/` | Documentation files, test reports |
| Root | `archives/` | Generated archives |
| Root | `_to_review/` | Debug files, system files |
| Root | `vendor/` | node_modules |

*Build script automatically handles moved Gemfile location
