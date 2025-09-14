# BACKLOG: Simplified Task List
# Format: | STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD

# HIGH PRIORITY TASKS (Most Important)

## Evil StrengthsFinder Assessment Tool (New Revenue Stream)
[x] | T600 | Design Evil StrengthsFinder assessment framework and themes | GPT-4.1 | Create 20 evil strength themes across 4 domains, design question framework, create scoring algorithm, document assessment structure
[x] | T601 | Create assessment question database | GPT-4o | Write 180 satirical questions (9 per theme), implement forced-choice format, ensure corporate context framing, test question balance
[ ] | T602 | Build core assessment engine | GPT-4.1 | Implement question delivery system, scoring algorithm, progress tracking, session management, result generation
[ ] | T603 | Design and implement payment integration for assessments | GPT-4.1 | Integrate with existing Stripe, create pricing tiers ($49.99, $99.99, $299.99), implement secure payment flow
[ ] | T604 | Create dynamic results system and report templates | GPT-4o | Build personalized report generation, historical comparisons, evil development recommendations, multiple report tiers
[ ] | T605 | Implement user management and result storage | GPT-4.1 | Integrate with existing membership, secure result storage, sharing options, retake functionality
[x] | T606 | Create Evil StrengthsFinder landing pages and marketing materials | GPT-4o | Design landing page, create marketing copy, implement A/B testing, social media integration
[ ] | T607 | Build team assessment and corporate features | GPT-4.1 | Multi-user assessments, team comparisons, enterprise reporting, corporate consulting package
[ ] | T608 | Create Evil StrengthsFinder content marketing strategy | GPT-4o | Evil strength spotlights, historical analysis content, case studies, user success stories
[ ] | T609 | Implement analytics and optimization tracking | GPT-4.1 | Conversion tracking, user behavior analysis, A/B test infrastructure, performance monitoring
[ ] | T604 | Create article exposing Academic Surveillance Capitalism | GPT-4o | Write article on educational technology companies harvesting student data for profit, privacy violations in schools
[ ] | T409 | Hire and onboard freelance investigative writers | GPT-4o | Review applications, conduct interviews, onboard 3-5 writers, establish workflow and quality standards
[ ] | T410 | Create comprehensive style guide for consistent content quality | GPT-4o | Document tone guidelines, formatting standards, fact-checking procedures, citation requirements, editorial workflow
[ ] | T407 | Develop mobile app for iOS and Android | GPT-4.1 | Design app architecture, develop native apps, implement push notifications, app store optimization
[ ] | T408 | Create premium content platform for exclusive investigations | GPT-4.1 | Design paywall system, create premium content categories, implement access controls, marketing strategy
[ ] | T501 | Create standard page templates for key content types | GPT-5 mini | Create `_layouts/template-article.html`, `_layouts/template-profile.html`, `_layouts/template-organization.html` that use existing component renderer; ensure at least one article, one profile and one organization page render using the templates without build errors
[ ] | T502 | Implement site-wide navigation improvements | GPT-5 mini | Provide `_includes/breadcrumbs.html` (configurable include) and ensure `_includes/topnav.html` has accessible mobile toggle; run `bundle exec jekyll build` and verify no layout errors
[ ] | T520 | Restructure company/pfizer.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T521 | Restructure company/amazon.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T243 | Consolidate backlog files for better tracking | Gemini 2.5 Pro | Merge model-specific backlogs into main backlog with categorization, create status dashboard, update workflow docs
[ ] | T205 | Analytics: Integrate Plausible with goals (buy_now, membership_start, newsletter) | Gemini 2.5 Pro | Events fire and appear in dashboard

# MEDIUM PRIORITY TASKS
[ ] | T605 | Create article exposing Academic Surveillance Capitalism | GPT-4o | Write article on educational technology companies harvesting student data for profit, privacy violations in schools
[ ] | T606 | Create article exposing Predatory Gaming Monetization | GPT-4o | Write exposé on loot boxes, pay-to-win mechanics, gambling addiction targeting children in video games
[ ] | T607 | Create article exposing Environmental Racism practices | GPT-4o | Write investigative piece on corporations strategically locating polluting facilities in minority communities
[ ] | T608 | Create article exposing Carbon Credit Fraud schemes | GPT-4o | Write article on fake carbon credits, greenwashing through offset purchases, environmental responsibility theater
[ ] | T609 | Create article exposing Fertility Data Mining | GPT-4o | Write article on period/fertility tracking apps selling intimate health data to advertisers and employers
[ ] | T610 | Create article exposing Shrinkflation Deception tactics | GPT-4o | Write article on reducing product sizes while maintaining prices, packaging deception, value extraction
[ ] | T411 | Develop content repurposing strategy for maximum reach | GPT-4o | Create social media content from articles, develop email newsletter content, create video scripts, podcast outlines
[ ] | T412 | Build community forum and discussion platform | GPT-4o | Choose forum software, integrate with main site, create community guidelines, moderate initial discussions
[x] | T504 | Set up automated content publishing workflow | GPT-5 mini | Add a GitHub Actions workflow `/.github/workflows/publish-schedule.yml` that creates PRs or publishes posts based on `_data/schedule`; include a simple smoke test for schedule parsing
[ ] | T505 | Develop content recommendation engine | GPT-5 mini | Add `_includes/related-articles.html` (Liquid-only) that shows up to 3 related articles by tag; include 3 sample posts demonstrating behavior
[ ] | T522 | Restructure company/philip-morris.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T523 | Restructure company/monsanto.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T206 | Email capture + funnels (welcome + 3-step merch funnel) | Gemini 2.5 Pro | Forms submit; sequences active in provider; test subscriber receives all emails
[ ] | T207 | Pricing experiments framework (YAML-driven, UTM-coded offers) | Gemini 2.5 Pro | 2 live price tests; conversions logged per variant
[ ] | T209 | Reviews/UGC component (YAML-backed testimonials) | Gemini 2.5 Pro | Component live with 5 seeded reviews; shown on top 10 products
[ ] | T210 | Bundles + coupons via Stripe | Gemini 2.5 Pro | 2 bundle pages live and purchasable; coupons applied in Stripe

# LOW PRIORITY TASKS
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

# COMPLETED TASKS
[x] | T600 | Create predatory insurance offering for companies not wanting site appearance | GPT-4o | Create comprehensive insurance package documentation with deliberately complex terms designed to avoid payments, expand insurance-scams.md organization page, satirical tone critiquing insurance industry practices
[x] | T301 | Audit all internal and external links across the site using grep patterns | GPT-4.1 | Create comprehensive link inventory in _docs/link-audit.md, identify broken/outdated links, document findings with recommendations
[x] | T302 | Create automation scripts for repetitive validation tasks (link checking, front matter validation) | GPT-4.1 | Create scripts/link-checker.sh and scripts/frontmatter-validator.sh with proper error handling and documentation
[x] | T400 | Implement Stripe payment processing for membership tiers | GPT-4.1 | Set up Stripe account, integrate payment forms, implement subscription management, test payment flow
[x] | T403 | Develop social media marketing strategy and content calendar | GPT-4.1 | Create brand accounts, develop content pillars, set up posting schedule, engagement strategy, growth tactics
[x] | T424 | Launch social media accounts and initial content | GPT-4.1 | Set up Twitter/X, LinkedIn, Reddit accounts with branding, post initial content series, establish posting schedule
[x] | T425 | Implement SEO optimization across site | GPT-4.1 | Add meta tags, schema markup, optimize content for keywords, set up Google Search Console, create sitemap
[x] | T404 | Create merchandise store with satirical corporate evil products | GPT-4.1 | Design product line, set up e-commerce platform, integrate with main site, launch marketing campaign
[x] | T405 | Build partnerships with NGOs and activist organizations | GPT-4.1 | Identify target organizations, develop partnership proposals, establish collaboration agreements, joint content initiatives
[x] | T406 | Implement advanced analytics and user tracking | GPT-4.1 | Set up Google Analytics 4, implement conversion tracking, create custom dashboards, user behavior analysis
[x] | T305 | Perform content cross-check process across all articles | GPT-4o | Verify front matter fields, formatting consistency, permalink structure, reference styles, document findings and recommendations in _docs/content-consistency-report.md
[x] | T509 | Rework main site navigation into a data-driven component | GPT-5 mini | Create `_data/topnav.yml`, `_includes/topnav.html`, update `_layouts/default.html` to include component; top nav should prioritize profitable links (Shop, Membership, Consulting, Courses, Jobs, Newsletter); ensure accessible markup and mobile menu
[x] | T510 | Remove the 'hellfire' theme entirely and clean up related assets | GPT-4.1 | Remove hellfire CSS, templates and assets; perform comprehensive site scan to ensure no references remain; run `bundle exec jekyll build` and grep for 'hellfire' occurrences
[x] | T511 | Add CSS for the new top nav and mobile styles | GPT-5 mini | Create `assets/css/topnav.css`, responsive mobile rules, and small utility classes; ensure contrast/accessibility and that Shop CTA is prominent
[x] | T512 | Wire analytics events for top nav links | GPT-4o | Add data attributes to topnav links and include small script to emit events to Plausible/GA4; document events and test manually
[x] | T513 | Move the hellfire header to use the same data-driven topnav include | Grok Code Fast 1 | Update `_layouts/default.html` hellfire section to `{% include topnav.html %}` and remove duplicate nav markup; ensure visual parity and run build
[x] | T514 | Comprehensive site scan after nav/theme changes | GPT-4.1 | Run grep and link checks across repo and `_site`, create report in `_docs/link-audit.md` and `_docs/refactor.md` with any remaining issues
[x] | T221 | Tag all 50 merch pages; auto-generate theme indexes | Gemini 2.5 Pro | Tags added; theme pages built from tags





# NOTES
- Use scripts/start-task.sh to begin work on a task
- Use scripts/mark-task-done.sh TASK_ID to mark completion
- Jekyll build: `bundle exec jekyll build`
- Visual tests: `npm test`

---

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# NOTES
- Use scripts/start-task.sh to begin work on a task
- Use scripts/mark-task-done.sh TASK_ID to mark completion
- Jekyll build: `bundle exec jekyll build`
- Visual tests: `npm test`



---

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.

