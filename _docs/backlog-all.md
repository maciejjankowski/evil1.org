# -----------------------------------------------------------------------------
# BACKLOG-ALL: single source of truth (auto-generated)
# -----------------------------------------------------------------------------
# This file is the consolidated backlog and the single source of truth for
# task tracking. Do not edit manually above the tasks section. To regenerate
# the consolidated backlog run:
#
#   ./scripts/consolidate-backlogs.sh
#
# Backups are created by `scripts/backup-backlog.sh` (recommended before
# regenerating).
# -----------------------------------------------------------------------------

# CI: A GitHub Action will run `scripts/backup-backlog.sh` and
# `scripts/consolidate-backlogs.sh` on push or manual dispatch to keep this
# file up to date (`.github/workflows/backlog-regenerate.yml`).

# TASKS for GPT-4.1
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low

# HIGH PRIORITY - Complex debugging, configuration, multi-step tasks
[x] | T301 | Audit all internal and external links across the site using grep patterns | DoD: Create comprehensive link inventory in _docs/link-audit.md, identify broken/outdated links, document findings with recommendations
[x] | T302 | Create automation scripts for repetitive validation tasks (link checking, front matter validation) | DoD: Create scripts/link-checker.sh and scripts/frontmatter-validator.sh with proper error handling and documentation
[x] | T400 | Implement Stripe payment processing for membership tiers | DoD: Set up Stripe account, integrate payment forms, implement subscription management, test payment flow
[x] | T403 | Develop social media marketing strategy and content calendar | DoD: Create brand accounts, develop content pillars, set up posting schedule, engagement strategy, growth tactics
[x] | T424 | Launch social media accounts and initial content | DoD: Set up Twitter/X, LinkedIn, Reddit accounts with branding, post initial content series, establish posting schedule
[x] | T425 | Implement SEO optimization across site | DoD: Add meta tags, schema markup, optimize content for keywords, set up Google Search Console, create sitemap

# MEDIUM PRIORITY
[x] | T404 | Create merchandise store with satirical corporate evil products | DoD: Design product line, set up e-commerce platform, integrate with main site, launch marketing campaign
[ ] | T405 | Build partnerships with NGOs and activist organizations | DoD: Identify target organizations, develop partnership proposals, establish collaboration agreements, joint content initiatives
[ ] | T406 | Implement advanced analytics and user tracking | DoD: Set up Google Analytics 4, implement conversion tracking, create custom dashboards, user behavior analysis

# LOW PRIORITY
[ ] | T407 | Develop mobile app for iOS and Android | DoD: Design app architecture, develop native apps, implement push notifications, app store optimization
[ ] | T408 | Create premium content platform for exclusive investigations | DoD: Design paywall system, create premium content categories, implement access controls, marketing strategy

# TASKS for GPT-4o
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low

# HIGH PRIORITY - Content creation, editing, ethical considerations
[x] | T305 | Perform content cross-check process across all articles | DoD: Verify front matter fields, formatting consistency, permalink structure, reference styles, document findings and recommendations in _docs/content-consistency-report.md
[ ] | T409 | Hire and onboard freelance investigative writers | DoD: Review applications, conduct interviews, onboard 3-5 writers, establish workflow and quality standards
[ ] | T410 | Create comprehensive style guide for consistent content quality | DoD: Document tone guidelines, formatting standards, fact-checking procedures, citation requirements, editorial workflow
[ ] | T411 | Develop content repurposing strategy for maximum reach | DoD: Create social media content from articles, develop email newsletter content, create video scripts, podcast outlines

# MEDIUM PRIORITY
[ ] | T412 | Build community forum and discussion platform | DoD: Choose forum software, integrate with main site, create community guidelines, moderate initial discussions
[ ] | T413 | Create educational content series on corporate accountability | DoD: Develop curriculum outline, create training modules, implement progress tracking, certification system
[ ] | T414 | Develop thought leadership content and white papers | DoD: Research trending topics, create in-depth analysis, design professional layouts, distribution strategy

# LOW PRIORITY
[ ] | T415 | Create multimedia content (videos, podcasts, infographics) | DoD: Set up production workflow, create initial content pieces, optimize for SEO, track engagement metrics

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

[ ] | T509 | Rework main site navigation into a data-driven component | DoD: Create `_data/topnav.yml`, `_includes/topnav.html`, update `_layouts/default.html` to include component; top nav should prioritize profitable links (Shop, Membership, Consulting, Courses, Jobs, Newsletter); ensure accessible markup and mobile menu

[ ] | T510 | Remove the 'hellfire' theme entirely and clean up related assets | DoD: Remove hellfire CSS, templates and assets; perform comprehensive site scan to ensure no references remain; run `bundle exec jekyll build` and grep for 'hellfire' occurrences; Recommended model: GPT-4.1 (complex site-wide refactor)
[ ] | T511 | Add CSS for the new top nav and mobile styles | DoD: Create `assets/css/topnav.css`, responsive mobile rules, and small utility classes; ensure contrast/accessibility and that Shop CTA is prominent; Recommended model: GPT-5 mini (implementation + CSS)
[ ] | T512 | Wire analytics events for top nav links | DoD: Add data attributes to topnav links and include small script to emit events to Plausible/GA4; document events and test manually; Recommended model: GPT-4o (analytics & event design)
[ ] | T513 | Move the hellfire header to use the same data-driven topnav include | DoD: Update `_layouts/default.html` hellfire section to `{% include topnav.html %}` and remove duplicate nav markup; ensure visual parity and run build; Recommended model: Grok Code Fast 1 (routine include replacement)
[ ] | T514 | Comprehensive site scan after nav/theme changes | DoD: Run grep and link checks across repo and `_site`, create report in `_docs/link-audit.md` and `_docs/refactor.md` with any remaining issues; Recommended model: GPT-4.1 (audit & fixes)

# TASKS for Grok Code Fast 1
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low

# HIGH PRIORITY - Routine maintenance, simple edits, basic validation
[x] | T303 | Audit YAML front matter consistency across all articles | DoD: Check all .md files have complete front matter (layout, title, description, permalink, date, categories), document any inconsistencies in _docs/frontmatter-audit.md
[x] | T304 | Verify layouts are properly assigned to all pages | DoD: Ensure all .md files have appropriate layouts (post, default, home), fix any missing layouts, document results
[ ] | T416 | Set up automated backup and deployment system | DoD: Configure GitHub Actions for automated deployment, set up database backups, create rollback procedures
[ ] | T417 | Implement performance monitoring and optimization | DoD: Set up site speed monitoring, implement caching strategies, optimize images, track Core Web Vitals
[ ] | T418 | Create user feedback and support system | DoD: Set up contact forms, create FAQ section, implement ticketing system, establish response protocols

# MEDIUM PRIORITY
[ ] | T419 | Develop API for third-party integrations | DoD: Design REST API endpoints, implement authentication, create documentation, build sample integrations
[ ] | T420 | Implement advanced search functionality | DoD: Set up Elasticsearch or Algolia, create search interface, implement filters and facets, optimize for performance
[ ] | T421 | Create content management dashboard | DoD: Build admin interface for content management, implement user permissions, create analytics dashboard

# LOW PRIORITY
[ ] | T422 | Set up A/B testing framework for optimization | DoD: Implement testing infrastructure, create test variations, set up analytics tracking, establish optimization workflow

# TASKS
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low
[x] clean up all reports and temporary files
[x] Execute Phase 1 of growth strategy: Foundation building | DoD: Complete membership system setup, hire initial writers, launch newsletter, establish content workflow
[x] Execute Phase 2 of growth strategy: Marketing launch | DoD: Set up social media presence, implement SEO campaign, launch email marketing, begin partnership outreach
[ ] Execute Phase 3 of growth strategy: Monetization activation | DoD: Launch paid membership tiers, activate premium content, establish merchandise sales, implement consulting services
[x] fix the product catalog, links look off | DoD: Add catalog CTA, featured links, and theme browser; verify links resolve
[x] implement conversion boosts on merch | DoD: Add Buy Now CTAs, related items, tags-based browse; track click-throughs
[ ] define profitability plan Q4 2025 | DoD: Set revenue targets, CAC/LTV model, conversion funnel, top 5 growth experiments
[ ] | T243 | Consolidate backlog files for better tracking | DoD: Merge model-specific backlogs into main backlog with categorization, create status dashboard, update workflow docs
[x] | T201 | Implement Stripe Checkout (products, tax, shipping, receipts) | DoD: Test-mode purchase succeeds for 3 SKUs via /checkout, email receipt received
[x] | T202 | Build /checkout page that maps SKU->price and redirects to Stripe | DoD: Query param sku renders summary and routes to correct Stripe price
[x] | T203 | Related-items component on product pages (by tags) | DoD: Include created and added to 10 top products; CTR tracked
[x] | T204 | Global CTA include (Buy Now / Add to Cart) | DoD: Reusable include added; visible above the fold on merch pages
[ ] | T205 | Analytics: Integrate Plausible with goals (buy_now, membership_start, newsletter) | DoD: Events fire and appear in dashboard
[ ] | T206 | Email capture + funnels (welcome + 3-step merch funnel) | DoD: Forms submit; sequences active in provider; test subscriber receives all emails
[ ] | T207 | Pricing experiments framework (YAML-driven, UTM-coded offers) | DoD: 2 live price tests; conversions logged per variant
[x] | T208 | Add Product JSON-LD schema to merch pages | DoD: 5 pages validate in Rich Results tester without errors
[ ] | T209 | Reviews/UGC component (YAML-backed testimonials) | DoD: Component live with 5 seeded reviews; shown on top 10 products
[ ] | T210 | Bundles + coupons via Stripe | DoD: 2 bundle pages live and purchasable; coupons applied in Stripe
[ ] | T211 | Performance pass on merch pages (LCP < 2.5s) | DoD: Lighthouse 90+ Perf on 5 merch URLs; images compressed
[ ] | T212 | Currency display (USD/EUR/PLN) selector | DoD: Front-end selector updates displayed prices sitewide
[ ] | T213 | Legal: Returns, Shipping, Terms, Privacy, Cookies pages | DoD: Pages published and linked in footer
[ ] | T214 | Fulfillment: choose POD (Printful/Printify) + connect 3 SKUs | DoD: 3 products synced with mockups; fulfillment flow documented
[ ] | T215 | Referral program MVP (manual codes) | DoD: UTM/ref codes tracked; payout spreadsheet defined; landing page live
[ ] | T216 | Affiliate program page + signup flow | DoD: Program terms page + intake form + autoresponder
[ ] | T217 | Social share OG images for top 20 items | DoD: OG images added; link previews verified
[ ] | T218 | Cart/checkout recovery (email capture before checkout) | DoD: Recovery email triggers for abandons (tested)
[ ] | T219 | Exit-intent promo (lightweight, Alpine) | DoD: Modal fires on merch; 10% code via coupon
[ ] | T220 | KPI dashboard (/admin) pulling Plausible + Stripe | DoD: Shows revenue, CR, AOV for last 7/30 days
[x] | T221 | Tag all 50 merch pages; auto-generate theme indexes | DoD: Tags added; theme pages built from tags
[ ] | T222 | A/B test product layout (hero/CTA position) | DoD: 50/50 split live; results logged
[ ] | T223 | Post-purchase upsell/thank-you page | DoD: After checkout, upsell offered with unique coupon
[ ] | T224 | Membership tiers + benefits (Stripe/Memberstack) | DoD: 2 paid tiers configurable; demo flow recorded
[ ] | T225 | Soft paywall for premium content | DoD: Preview-only snippet with Join CTA on 1 article
[x] | T226 | Merch sitemap + SEO tuning | DoD: Merch sitemap section added; robots ok; noindex fixed where needed
[ ] | T227 | UTM tracking on internal CTAs | DoD: UTMs appended to outbound checkout links by context
[ ] | T228 | Campaign calendar (drops, BF/CM, end-of-year) | DoD: YAML calendar + banner component
[ ] | T229 | Localized copy (PL/DE) for top 5 items | DoD: Alt-language versions live and linked
[ ] | T230 | Wholesale/bulk orders page | DoD: Volume pricing + contact form; responses route to inbox
[ ] | T231 | Limited editions drop engine (YAML schedule) | DoD: One timed drop shipped successfully
[ ] | T232 | Loyalty program MVP (email punch-card) | DoD: Rule set + manual tracking + redemption flow
[ ] | T233 | Impact/Donations transparency page | DoD: Live counters and quarterly report template
[ ] | T234 | Press kit for merch collection | DoD: Downloadable images, logo, quotes, factsheet
[ ] | T235 | Launch QA checklist (merch) | DoD: Document in _docs with pre-flight steps
[ ] | T236 | Heatmap/recordings (privacy-safe) evaluation | DoD: Tool chosen or deferred with rationale
[ ] | T237 | Tax/VAT approach documented | DoD: Decision memo (Stripe Tax vs manual) and next steps
[ ] | T238 | Inventory/status badges (preorder/limited) | DoD: Badges render on product pages via frontmatter
[x] | T239 | Gift cards via Stripe | DoD: Gift card SKU live; redemption instructions documented
[ ] | T240 | Support workflows + macros | DoD: Response templates for returns, shipping, defects, delays
[x] | T241 | Site-wide component inventory & catalog | DoD: `_docs/component-inventory.md` added with layouts, includes, audit targets, reuse policy tie-in
[x] | T242 | Refactor raw HTML/CSS pages into reusable components | DoD: Audit list created; 20 highest-traffic pages refactored to existing or new includes (with justification); inline styles eliminated; improvements logged in `_docs/improvements.md`


