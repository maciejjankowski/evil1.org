# HTML Extraction Frontmatter Templates
# Copy and modify these templates when converting HTML to frontmatter
# Last Updated: September 10, 2025

# =============================================================================
# BASIC PAGE TEMPLATE
# Use for simple pages with minimal HTML structure
# =============================================================================
---
layout: default
title: "Your Page Title"
description: "Brief description of the page content"
permalink: /your-page/
page_html: |
  <div class="page-content">
      <h1>{{ page.title }}</h1>
      <p>{{ page.description }}</p>

      <!-- Your HTML content here -->
      <div class="main-content">
          <p>Page content goes here...</p>
      </div>
  </div>
---

{{ page.page_html }}

# =============================================================================
# INDEX PAGE TEMPLATE
# Use for directory/index pages with card-based layouts
# =============================================================================
---
layout: default
title: "Section Index"
description: "Overview of section content and navigation"
permalink: /section/
page_html: |
  <div class="index-page">
      <div class="page-header">
          <h1>{{ page.title }}</h1>
          <p class="page-description">{{ page.description }}</p>
      </div>

      <div class="content-grid">
          <div class="content-card">
              <h2><a href="/section/item1/">Item 1</a></h2>
              <p>Description of item 1...</p>
              <a href="/section/item1/" class="read-more">Learn More →</a>
          </div>

          <div class="content-card">
              <h2><a href="/section/item2/">Item 2</a></h2>
              <p>Description of item 2...</p>
              <a href="/section/item2/" class="read-more">Learn More →</a>
          </div>
      </div>
  </div>
---

{{ page.page_html }}

# =============================================================================
# PROFILE/COMPANY PAGE TEMPLATE
# Use for detailed profile pages with complex layouts
# =============================================================================
---
layout: default
title: "Company/Profile Name"
description: "Detailed description of the company or profile"
permalink: /company/profile-name/
page_html: |
  <div class="profile-page">
      <header class="page-header">
          <h1>{{ page.title }}</h1>
          <p class="page-description">{{ page.description }}</p>
      </header>

      <section class="overview">
          <h2>Overview</h2>
          <p>Company/profile overview content...</p>
      </section>

      <section class="timeline">
          <h2>Timeline</h2>
          <div class="timeline-item">
              <h3>Year/Event</h3>
              <p>Description of event...</p>
          </div>
      </section>

      <section class="impact">
          <h2>Impact & Statistics</h2>
          <div class="stats-grid">
              <div class="stat">
                  <div class="number">X</div>
                  <div class="label">Statistic</div>
                  <div class="description">Description</div>
              </div>
          </div>
      </section>

      <section class="sources">
          <h2>Sources</h2>
          <ul>
              <li><a href="source-url">Source Name</a></li>
          </ul>
      </section>
  </div>
---

{{ page.page_html }}

# =============================================================================
# NEWS/ARTICLE PAGE TEMPLATE
# Use for news articles or blog posts with rich content
# =============================================================================
---
layout: default
title: "Article Title"
description: "Article summary or excerpt"
permalink: /news/article-title/
date: 2025-09-10
page_html: |
  <article class="news-article">
      <header class="article-header">
          <h1>{{ page.title }}</h1>
          <div class="article-meta">
              <time datetime="{{ page.date | date: '%Y-%m-%d' }}">
                  {{ page.date | date: "%B %d, %Y" }}
              </time>
              <span class="author">Author Name</span>
          </div>
      </header>

      <div class="article-content">
          <p>Article introduction...</p>

          <h2>Section Heading</h2>
          <p>Section content...</p>

          <blockquote>
              <p>Important quote or highlight...</p>
          </blockquote>

          <h2>Another Section</h2>
          <p>More content...</p>
      </div>

      <footer class="article-footer">
          <div class="tags">
              <span class="tag">Tag 1</span>
              <span class="tag">Tag 2</span>
          </div>
      </footer>
  </article>
---

{{ page.page_html }}

# =============================================================================
# LIQUID TEMPLATING EXAMPLES
# Use these patterns when HTML contains Jekyll/Liquid code
# =============================================================================

# Example 1: Dynamic Content with Liquid
---
layout: default
title: "Dynamic Page"
description: "Page with dynamic content"
permalink: /dynamic/
page_html: |
  <div class="dynamic-content">
      <h1>{{ page.title }}</h1>
      <p>Generated on: {% raw %}{{ site.time | date: "%B %d, %Y" }}{% endraw %}</p>

      <div class="recent-posts">
          <h2>Recent Posts</h2>
          {% raw %}{% for post in site.posts limit:3 %}{% endraw %}
              <article class="post-preview">
                  <h3><a href="{{ post.url }}">{{ post.title }}</a></h3>
                  <p>{{ post.excerpt }}</p>
                  <time>{{ post.date | date: "%B %d, %Y" }}</time>
              </article>
          {% raw %}{% endfor %}{% endraw %}
      </div>
  </div>
---

{{ page.page_html }}

# Example 2: Conditional Content
---
layout: default
title: "Conditional Page"
description: "Page with conditional content"
permalink: /conditional/
page_html: |
  <div class="conditional-content">
      <h1>{{ page.title }}</h1>

      {% raw %}{% if page.featured %}{% endraw %}
          <div class="featured-banner">
              <p>This is a featured page!</p>
          </div>
      {% raw %}{% endif %}{% endraw %}

      <div class="main-content">
          <p>Regular page content...</p>
      </div>
  </div>
---

{{ page.page_html }}

# =============================================================================
# INLINE STYLE CONVERSION EXAMPLES
# Convert inline styles to CSS classes (preferred)
# =============================================================================

# Before: Inline styles (avoid)
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px;">
        <h1>Page Title</h1>
    </div>
</div>

# After: CSS classes (preferred)
page_html: |
  <div class="page-container">
      <div class="page-header">
          <h1>{{ page.title }}</h1>
      </div>
  </div>

# =============================================================================
# VALIDATION CHECKLIST
# Use this checklist after conversion
# =============================================================================
# Pre-conversion:
# [ ] File has valid Jekyll frontmatter
# [ ] File contains HTML to extract
# [ ] Backup created
# [ ] File committed to git

# Post-conversion:
# [ ] page_html key exists in frontmatter
# [ ] Body contains only {{ page.page_html }}
# [ ] Jekyll build passes
# [ ] Generated HTML matches original
# [ ] All functionality preserved
# [ ] Content appears identical

# Quality checks:
# [ ] No broken HTML tags
# [ ] Proper YAML indentation
# [ ] No Liquid syntax errors
# [ ] Cross-browser compatibility
# [ ] Mobile responsiveness
