# BACKLOG: Simplified Task List# Format: | STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD# HIGH PRIORITY TASKS (Most Important)[ ] | T409 | Hire and onboard freelance investigative writers | GPT-4o | Review applications, conduct interviews, onboard 3-5 writers, establish workflow and quality standards
[ ] | T410 | Create comprehensive style guide for consistent content quality | GPT-4o | Document tone guidelines, formatting standards, fact-checking procedures, citation requirements, editorial workflow
[ ] | T407 | Develop mobile app for iOS and Android | GPT-4.1 | Design app architecture, develop native apps, implement push notifications, app store optimization
[ ] | T408 | Create premium content platform for exclusive investigations | GPT-4.1 | Design paywall system, create premium content categories, implement access controls, marketing strategy
[ ] | T501 | Create standard page templates for key content types | GPT-5 mini | Create `_layouts/template-article.html`, `_layouts/template-profile.html`, `_layouts/template-organization.html` that use existing component renderer; ensure at least one article, one profile and one organization page render using the templates without build errors
[ ] | T502 | Implement site-wide navigation improvements | GPT-5 mini | Provide `_includes/breadcrumbs.html` (configurable include) and ensure `_includes/topnav.html` has accessible mobile toggle; run `bundle exec jekyll build` and verify no layout errors
[ ] | T520 | Restructure company/pfizer.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T521 | Restructure company/amazon.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T243 | Consolidate backlog files for better tracking | Gemini 2.5 Pro | Merge model-specific backlogs into main backlog with categorization, create status dashboard, update workflow docs
[ ] | T205 | Analytics: Integrate Plausible with goals (buy_now, membership_start, newsletter) | Gemini 2.5 Pro | Events fire and appear in dashboard
[ ] | T411 | Develop content repurposing strategy for maximum reach | GPT-4o | Create social media content from articles, develop email newsletter content, create video scripts, podcast outlines
[ ] | T412 | Build community forum and discussion platform | GPT-4o | Choose forum software, integrate with main site, create community guidelines, moderate initial discussions
[ ] | T504 | Set up automated content publishing workflow | GPT-5 mini | Add a GitHub Actions workflow `/.github/workflows/publish-schedule.yml` that creates PRs or publishes posts based on `_data/schedule`; include a simple smoke test for schedule parsing
[ ] | T505 | Develop content recommendation engine | GPT-5 mini | Add `_includes/related-articles.html` (Liquid-only) that shows up to 3 related articles by tag; include 3 sample posts demonstrating behavior
[ ] | T522 | Restructure company/philip-morris.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T523 | Restructure company/monsanto.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T206 | Email capture + funnels (welcome + 3-step merch funnel) | Gemini 2.5 Pro | Forms submit; sequences active in provider; test subscriber receives all emails
[ ] | T207 | Pricing experiments framework (YAML-driven, UTM-coded offers) | Gemini 2.5 Pro | 2 live price tests; conversions logged per variant
[ ] | T209 | Reviews/UGC component (YAML-backed testimonials) | Gemini 2.5 Pro | Component live with 5 seeded reviews; shown on top 10 products
[ ] | T210 | Bundles + coupons via Stripe | Gemini 2.5 Pro | 2 bundle pages live and purchasable; coupons applied in Stripe
[ ] | T413 | Create educational content series on corporate accountability | GPT-4o | Develop curriculum outline, create training modules, implement progress tracking, certification system
[ ] | T414 | Develop thought leadership content and white papers | GPT-4o | Research trending topics, create in-depth analysis, design professional layouts, distribution strategy
[ ] | T415 | Create multimedia content (videos, podcasts, infographics) | GPT-4o | Set up production workflow, create initial content pieces, optimize for SEO, track engagement metrics
[ ] | T503 | Optimize images across the site | GPT-5 mini | Create `scripts/optimize-images.sh` (dry-run + apply flags) and apply to `assets/` sample images; document required tools in `_docs/performance-optimization-report.md`
[ ] | T506 | Create interactive data visualizations | GPT-5 mini | Add two visualization components (Chart.js or SVG) consuming `_data/*.yml` sample datasets; include a demo page verifying rendering
[ ] | T507 | Implement dark mode toggle | GPT-5 mini | Provide optional dark-theme CSS and a small JS toggle that persists user preference in localStorage; ensure no inline styles were added
[ ] | T508 | Create RSS feeds by category | GPT-5 mini | Add category-specific RSS generation and verify at least 2 category feeds validate with RSS validator
[ ] | T524 | Restructure company/walmart.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T525 | Check and restructure company/index.md if it contains HTML | Grok Code Fast 1 | If HTML present, move to appropriate layout, leave only frontmatter
[ ] | T526 | Restructure organizations/index.md to use appropriate layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T527 | Restructure checkout.md to use appropriate layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T211 | Performance pass on merch pages (LCP < 2.5s) | Gemini 2.5 Pro | Lighthouse 90+ Perf on 5 merch URLs; images compressed
[ ] | T212 | Currency display (USD/EUR/PLN) selector | Gemini 2.5 Pro | Front-end selector updates displayed prices sitewide
[ ] | T213 | Legal: Returns, Shipping, Terms, Privacy, Cookies pages | Gemini 2.5 Pro | Pages published and linked in footer
[ ] | T214 | Fulfillment: choose POD (Printful/Printify) + connect 3 SKUs | Gemini 2.5 Pro | 3 products synced with mockups; fulfillment flow documented
