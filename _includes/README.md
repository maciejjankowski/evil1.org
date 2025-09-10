# EVIL1.ORG Reusable Components

This directory contains reusable Jekyll components extracted from the hellfire designs and new design explorations. These components provide consistent styling and functionality across the site.

## Available Components

### Core Layout Components

#### `hellfire-header.html`
Hellfire-themed header with animated logo and navigation.
```liquid
{% include hellfire-header.html %}
```

#### `hellfire-footer.html`
Hellfire-themed footer with organized link sections.
```liquid
{% include hellfire-footer.html %}
```

### Content Components

#### `post-card.html`
Reusable post/feed item component with author info, content, and actions.
```liquid
{% include post-card.html
  author="Corporate Overlord"
  author_title="CEO of Evil"
  title="Optional Post Title"
  content="Post content here..."
  time="2 hours ago"
  burns="666"
  condemns="42"
  shares="13"
  image="/path/to/image.jpg"
  type="achievement"
%}
```

#### `profile-card.html`
Profile display component with avatar, info, and stats.
```liquid
{% include profile-card.html
  name="John Doe"
  headline="Corporate Soul Extractor"
  location="Corporate Hell"
  avatar="/path/to/avatar.jpg"
  connections="247"
  views="89"
  posts="156"
  skills=page.profile.skills
  url="/profiles/john-doe"
%}
```

#### `story-item.html`
Individual story item for the stories bar.
```liquid
{% include story-item.html
  name="Story Title"
  avatar="/path/to/avatar.jpg"
  url="/stories/story-slug"
%}
```

### Widget Components

#### `sidebar-widget.html`
Generic sidebar widget container.
```liquid
{% include sidebar-widget.html
  title="Widget Title"
  content="<p>Widget content here...</p>"
%}
```

#### `stories-bar.html`
Stories bar component using story-item components.
```liquid
{% include stories-bar.html stories=site.data.stories %}
```

#### `people-suggestions-widget.html`
People suggestions sidebar widget.
```liquid
{% include people-suggestions-widget.html suggestions=site.data.suggestions %}
```

#### `trending-widget.html`
Trending topics sidebar widget.
```liquid
{% include trending-widget.html trends=site.data.trends %}
```

#### `soul-auction-widget.html`
Soul auction advertisement widget.
```liquid
{% include soul-auction-widget.html %}
```

### Interactive Components

#### `tab-navigation.html`
Tab navigation component.
```liquid
{% include tab-navigation.html
  tabs=page.tabs
  active="profile"
%}
```

#### `comment-form.html`
Comment submission form.
```liquid
{% include comment-form.html post_slug=page.slug %}
```

#### `comment-display.html`
Comment display component.
```liquid
{% include comment-display.html comments=site.data.comments[page.slug] %}
```

#### `people-suggestion.html`
Individual people suggestion item.
```liquid
{% include people-suggestion.html
  name="John Doe"
  title="CEO"
  company="Evil Corp"
  avatar="/path/to/avatar.jpg"
  url="/profiles/john-doe"
%}
```

#### `sponsored-content.html`
Sponsored content advertisement.
```liquid
{% include sponsored-content.html
  title="Ad Title"
  content="Ad description..."
  url="https://example.com"
  image="/path/to/ad.jpg"
%}
```

## Usage Examples

### Complete Homepage Layout
```liquid
{% include hellfire-header.html %}

<div id="homepage-container">
    <div id="left-column">
        {% include stories-bar.html stories=site.data.stories %}

        <!-- Main feed -->
        {% for post in site.posts %}
        {% include post-card.html
          author=post.author
          title=post.title
          content=post.excerpt
          time=post.date
        %}
        {% endfor %}
    </div>

    <aside id="right-column">
        {% include people-suggestions-widget.html %}
        {% include soul-auction-widget.html %}
        {% include trending-widget.html %}
    </aside>
</div>

{% include hellfire-footer.html %}
```

### Profile Page Layout
```liquid
{% include hellfire-header.html %}

<div id="profile-header">
    {% include profile-card.html
      name=page.profile.name
      headline=page.profile.headline
      location=page.profile.location
      avatar=page.profile.avatar
    %}
</div>

{% include tab-navigation.html tabs=page.tabs active="profile" %}

<div class="profile-content">
    {{ content }}
</div>

{% include hellfire-footer.html %}
```

## Styling

All components are styled using the `assets/css/hellfire-design.css` stylesheet, which should be included in layouts that use these components:

```liquid
<link rel="stylesheet" href="{{ '/assets/css/hellfire-design.css' | relative_url }}">
```

## Data Requirements

Some components require specific data structures:

- **Stories**: Array of objects with `name` and `avatar` properties
- **People suggestions**: Array of objects with `name`, `title`, `company`, `avatar`, `url` properties
- **Trends**: Array of objects with `hashtag` and `count` properties
- **Comments**: Array of objects with `author`, `date`, `content` properties
- **Tabs**: Array of objects with `id` and `title` properties

## Customization

Components can be customized by:
1. Modifying the component files directly
2. Overriding styles in `hellfire-design.css`
3. Passing different parameters to components
4. Creating new components based on these templates

## Dependencies

- Jekyll 4.0+
- `assets/css/hellfire-design.css` for styling
- Data files in `_data/` for dynamic content (optional)
