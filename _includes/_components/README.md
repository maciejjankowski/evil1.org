# Unified Components Library

The Evil1.org Components Library provides a unified system for creating and managing reusable UI components across the site. All components are frontmatter-driven and organized into four categories: Core, UI, Layout, and Interactive.

## Quick Start

### Method 1: Frontmatter Components Array

Add components directly to your page's frontmatter:

```yaml
---
layout: default
title: "My Page"
components:
  - type: core/stat
    number: "1,200"
    label: "Articles Published"
    description: "Total articles in our database"
  - type: ui/button
    text: "Learn More"
    href: "/about"
    type: "primary"
  - type: layout/hero
    title: "Welcome to Evil1.org"
    subtitle: "Exposing corporate evil worldwide"
    cta_text: "Get Started"
    cta_href: "/join"
---
```

Then include the renderer in your layout:

```html
{% include components/renderer.html %}
```

### Method 2: Direct Include with Helper

Use the helper function for more control:

```html
{% include components/helper.html %}
{{ component('core/stat', number: '1,200', label: 'Articles') }}
```

### Method 3: Data-Driven Components

Store components in `_data/components.yml` and reference them:

```yaml
# _data/components.yml
homepage_hero:
  type: layout/hero
  title: "Welcome to Evil1.org"
  subtitle: "Exposing corporate evil worldwide"
  cta_text: "Get Started"
  cta_href: "/join"
```

```html
{% assign hero = site.data.components.homepage_hero %}
{% include components/helper.html type=hero.type number=hero.number label=hero.label %}
```

## Component Categories

### Core Components (`core/`)

Foundational building blocks for content display:

- **`stat`**: Display statistics with number, label, and description
- **`crime-card`**: Corporate crime/scandal information cards
- **`timeline-item`**: Timeline entries with year, title, and description

### UI Components (`ui/`)

User interface elements:

- **`button`**: Action buttons with various styles and sizes
- **`card`**: Content containers with optional headers/footers
- **`alert`**: Notification messages with different types

### Layout Components (`layout/`)

Page structure and sections:

- **`hero`**: Hero sections with title, subtitle, and CTA
- **`section`**: Content sections with optional titles
- **`grid`**: Responsive grid layouts for multiple items

### Interactive Components (`interactive/`)

HTMX-powered dynamic components:

- **`stats-display`**: Real-time statistics with auto-refresh
- **`search`**: Search interface with debounced HTMX requests
- **`load-more`**: Pagination with HTMX-powered content loading
- **`notification`**: Toast notifications with auto-dismiss

## Component Parameters

Each component accepts specific parameters defined in `_components/registry.yml`. Common parameters include:

- **`class`**: Additional CSS classes for styling
- **`id`**: HTML ID attribute for targeting
- **`style`**: Inline styles (use sparingly)

## Examples

### Statistics Dashboard

```yaml
components:
  - type: layout/section
    title: "Site Statistics"
    content: |
      <div class="stats-grid">
        <!-- Stats will be inserted here -->
      </div>
  - type: interactive/stats-display
    stats:
      - number: "{{ site.posts | size }}"
        label: "Total Articles"
      - number: "{{ site.posts | size }}"
        label: "Published This Month"
      - number: "{{ site.tags | size }}"
        label: "Tags"
```

### Corporate Profile Page

```yaml
components:
  - type: layout/hero
    title: "{{ page.title }}"
    subtitle: "{{ page.description }}"
  - type: layout/section
    title: "Timeline of Corporate Evil"
    content: |
      {% for item in site.data.companies[page.company_key].timeline %}
      <div class="timeline-item">
        <h3>{{ item.year }}: {{ item.title }}</h3>
        <p>{{ item.description }}</p>
      </div>
      {% endfor %}
  - type: layout/grid
    items: "{{ site.data.companies[page.company_key].crimes }}"
    columns: "auto-fit"
```

### Search Interface

```yaml
components:
  - type: interactive/search
    placeholder: "Search articles..."
    endpoint: "/search"
    debounce: 300
```

## Styling

All component styles are defined in `_components/components.css`. The CSS follows these principles:

- **Modular**: Each component has its own styles
- **Responsive**: Mobile-first responsive design
- **Consistent**: Unified color scheme and spacing
- **Accessible**: Proper contrast ratios and focus states

## Migration Guide

### From Old HTMX Components

Replace individual HTMX files with interactive components:

```html
<!-- Old way -->
{% include htmx/stats.html %}

<!-- New way -->
components:
  - type: interactive/stats-display
    stats: [...]
```

### From Old Includes

Replace parameter-based includes with frontmatter components:

```html
<!-- Old way -->
{% include stat.html number="1200" label="Articles" %}

<!-- New way -->
components:
  - type: core/stat
    number: "1200"
    label: "Articles"
```

### From Old Layouts

Extract components from layouts into frontmatter:

```html
<!-- Old layout section -->
<section class="hero">
  <h1>Welcome</h1>
  <p>Description</p>
</section>

<!-- New way -->
components:
  - type: layout/hero
    title: "Welcome"
    subtitle: "Description"
```

## Best Practices

1. **Use Frontmatter**: Define components in frontmatter for better maintainability
2. **Keep it DRY**: Reuse component configurations across pages
3. **Data First**: Store complex component data in `_data/` files
4. **Progressive Enhancement**: Components work without JavaScript
5. **Accessibility**: All components include proper ARIA attributes
6. **Performance**: Components are optimized for fast loading

## Development

### Adding New Components

1. Create component file in appropriate category folder
2. Add component definition to `_components/registry.yml`
3. Add styles to `_components/components.css`
4. Update this documentation

### Component File Structure

```
_components/
├── registry.yml          # Component definitions
├── renderer.html         # Frontmatter renderer
├── helper.html           # Direct include helper
├── components.css        # All component styles
├── core/                 # Core components
│   ├── stat.html
│   ├── crime-card.html
│   └── timeline-item.html
├── ui/                   # UI components
│   ├── button.html
│   ├── card.html
│   └── alert.html
├── layout/               # Layout components
│   ├── hero.html
│   ├── section.html
│   └── grid.html
└── interactive/          # HTMX components
    ├── stats-display.html
    ├── search.html
    ├── load-more.html
    └── notification.html
```

## Troubleshooting

### Component Not Rendering
- Check component type syntax: `category/name`
- Verify parameters match registry definition
- Ensure renderer is included in layout

### Styles Not Applying
- Check CSS is loaded in layout
- Verify class names match component output
- Use browser dev tools to inspect elements

### HTMX Not Working
- Ensure HTMX library is loaded
- Check endpoint URLs are correct
- Verify server-side handlers exist

This unified system provides consistency, maintainability, and reusability across the entire Evil1.org platform.
