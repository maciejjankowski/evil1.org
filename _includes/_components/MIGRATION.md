# Components Migration Guide

This guide helps migrate from the old fragmented component system to the new unified components library.

## Old Structure → New Structure

### HTMX Components (`/htmx/` → `interactive/`)

| Old File | New Component | Migration Notes |
|----------|---------------|-----------------|
| `htmx/stats.html` | `interactive/stats-display` | Convert inline styles to frontmatter config |
| `htmx/search.html` | `interactive/search` | Move HTMX attributes to component parameters |
| `htmx/load-more.html` | `interactive/load-more` | Extract endpoint and button text to config |
| `htmx/notification.html` | `interactive/notification` | Convert to frontmatter-driven notifications |

### Components (`/components/` → `ui/` or `layout/`)

| Old File | New Component | Category | Migration Notes |
|----------|---------------|----------|-----------------|
| `components/footer.html` | `ui/footer` | UI | Convert to component with parameters |
| `components/header.html` | `layout/header` | Layout | Move navigation logic to frontmatter |
| `components/login_form.html` | `ui/login-form` | UI | Extract form fields to configuration |
| `components/register_form.html` | `ui/register-form` | UI | Convert validation to component parameters |

### Includes (`/_includes/` → Various Categories)

| Old Include | New Component | Category | Migration Notes |
|-------------|---------------|----------|-----------------|
| `stat.html` | `core/stat` | Core | Move parameters to frontmatter |
| `crime-card.html` | `core/crime-card` | Core | Convert include variables to component config |
| `timeline-item.html` | `core/timeline-item` | Core | Extract year/title/description to frontmatter |
| `button.html` | `ui/button` | UI | Convert to unified button component |
| `card.html` | `ui/card` | UI | Add support for headers/footers |
| `alert.html` | `ui/alert` | UI | Add dismissible functionality |
| `hero.html` | `layout/hero` | Layout | Support background images and CTAs |
| `section.html` | `layout/section` | Layout | Add background and styling options |
| `grid.html` | `layout/grid` | Layout | Make columns configurable |

## Migration Steps

### Step 1: Update Layout Files

Replace old includes with component renderer:

```html
<!-- OLD: Multiple includes -->
{% include header.html %}
{% include hero.html title="Welcome" %}
{% include stat.html number="1200" label="Articles" %}

<!-- NEW: Single renderer -->
{% include components/renderer.html %}
```

### Step 2: Convert Frontmatter

Move component configurations to frontmatter:

```yaml
---
layout: default
title: "My Page"
# OLD: No components in frontmatter

# NEW: Components defined in frontmatter
components:
  - type: layout/hero
    title: "Welcome"
  - type: core/stat
    number: "1200"
    label: "Articles"
---
```

### Step 3: Update Data Files

Convert old data structures to new format:

```yaml
# OLD: _data/stats.yml
stats:
  articles: 1200
  users: 5000

# NEW: _data/components.yml
stats_component:
  type: core/stat
  number: "1200"
  label: "Articles"
```

### Step 4: Update Styles

Remove old component styles and use unified styles:

```scss
// OLD: Individual component styles
.stat { ... }
.crime-card { ... }

// NEW: Import unified styles
@import "components";
```

## Example Migrations

### Simple Stat Component

**Before:**
```html
{% include stat.html number="1200" label="Articles" %}
```

**After:**
```yaml
components:
  - type: core/stat
    number: "1200"
    label: "Articles"
```

### Complex Hero Section

**Before:**
```html
<section class="hero">
  <h1>Welcome</h1>
  <p>Subtitle here</p>
  <a href="/join" class="cta">Get Started</a>
</section>
```

**After:**
```yaml
components:
  - type: layout/hero
    title: "Welcome"
    subtitle: "Subtitle here"
    cta_text: "Get Started"
    cta_href: "/join"
```

### HTMX Search Component

**Before:**
```html
<div class="search">
  <input type="text" placeholder="Search..."
         hx-get="/search"
         hx-trigger="input changed delay:300ms">
  <div id="results"></div>
</div>
```

**After:**
```yaml
components:
  - type: interactive/search
    placeholder: "Search..."
    endpoint: "/search"
    debounce: 300
```

## Benefits of Migration

### ✅ Consistency
- Unified API across all components
- Consistent styling and behavior
- Standardized parameter names

### ✅ Maintainability
- Single source of truth for components
- Centralized styles and logic
- Easier to update and extend

### ✅ Reusability
- Components work across all pages
- Easy to share configurations
- Frontmatter-driven customization

### ✅ Performance
- Optimized CSS loading
- Reduced duplication
- Better caching

### ✅ Developer Experience
- Clear documentation
- Type-safe parameters
- Easy testing and debugging

## Rollback Plan

If issues arise during migration:

1. **Keep old files** during transition
2. **Use feature flags** to switch between systems
3. **Test thoroughly** on staging before production
4. **Have rollback scripts** ready

## Timeline

- **Phase 1**: Core components migration (Week 1)
- **Phase 2**: UI components migration (Week 2)
- **Phase 3**: Layout components migration (Week 3)
- **Phase 4**: Interactive components migration (Week 4)
- **Phase 5**: Cleanup and optimization (Week 5)

## Support

- 📖 **Documentation**: `_components/README.md`
- 🛠️ **Registry**: `_components/registry.yml`
- 🎨 **Styles**: `_components/components.css`
- 📝 **Demo**: `/components-demo.html`

The unified components library provides a solid foundation for scalable, maintainable component development across Evil1.org.
