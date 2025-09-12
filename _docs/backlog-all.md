# BACKLOG: Simplified Task List
# Format: | STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD

# HIGH PRIORITY TASKS (Most Important)
[x] | T413 | Create educational content series on corporate accountability | GPT-4o | Develop curriculum outline, create training modules, implement progress tracking, certification system
[x] | T414 | Develop thought leadership content and white papers | GPT-4o | Research trending topics, create in-depth analysis, design professional layouts, distribution strategy
[ ] | T415 | !SKIP: Create multimedia content (videos, podcasts, infographics) | GPT-4o | Set up production workflow, create initial content pieces, optimize for SEO, track engagement metrics
[ ] | T412 | !SKIP: Build community forum and discussion platform | GPT-4o | Choose forum software, integrate with main site, create community guidelines, moderate initial discussions

# MEDIUM PRIORITY TASKS
[x] | T501 | Create standard page templates for key content types | GPT-5 mini | Create `_layouts/template-article.html`, `_layouts/template-profile.html`, `_layouts/template-organization.html` that use existing component renderer; ensure at least one article, one profile and one organization page render using the templates without build errors
[x] | T502 | Implement site-wide navigation improvements | GPT-5 mini | Provide `_includes/breadcrumbs.html` (configurable include) and ensure `_includes/topnav.html` has accessible mobile toggle; run `bundle exec jekyll build` and verify no layout errors
[x] | T504 | Set up automated content publishing workflow | GPT-5 mini | Add a GitHub Actions workflow `/.github/workflows/publish-schedule.yml` that creates PRs or publishes posts based on `_data/schedule`; include a simple smoke test for schedule parsing
[x] | T505 | Develop content recommendation engine | GPT-5 mini | Add `_includes/related-articles.html` (Liquid-only) that shows up to 3 related articles by tag; include 3 sample posts demonstrating behavior
[x] | T506 | Create interactive data visualizations | GPT-5 mini | Add two visualization components (Chart.js or SVG) consuming `_data/*.yml` sample datasets; include a demo page verifying rendering

# LOW PRIORITY TASKS
[ ] | T520 | Restructure company/pfizer.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T521 | Restructure company/amazon.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T522 | Restructure company/philip-morris.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T523 | Restructure company/monsanto.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T524 | Restructure company/walmart.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T525 | Check and restructure company/index.md if it contains HTML | Grok Code Fast 1 | If HTML present, move to appropriate layout, leave only frontmatter
[ ] | T526 | Restructure organizations/index.md to use appropriate layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T527 | Restructure checkout.md to use appropriate layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file

# GEMINI 2.5 PRO TASKS
[ ] | T206 | !SKIP: Email capture + funnels (welcome + 3-step merch funnel) | Gemini 2.5 Pro | Forms submit; sequences active in provider; test subscriber receives all emails
[ ] | T207 | Pricing experiments framework (YAML-driven, UTM-coded offers) | Gemini 2.5 Pro | 2 live price tests; conversions logged per variant
[ ] | T209 | !SKIP: Reviews/UGC component (YAML-backed testimonials) | Gemini 2.5 Pro | Component live with 5 seeded reviews; shown on top 10 products
[ ] | T212 | !SKIP: Currency display (USD/EUR/PLN) selector | Gemini 2.5 Pro | Front-end selector updates displayed prices sitewide
[ ] | T213 | Legal: Returns, Shipping, Terms, Privacy, Cookies pages | Gemini 2.5 Pro | Pages published and linked in footer
[ ] | T214 | !SKIP: Fulfillment: choose POD (Printful/Printify) + connect 3 SKUs | Gemini 2.5 Pro | 3 products synced with mockups; fulfillment flow documented

# COMPLETED TASKS
