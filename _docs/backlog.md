# TASKS
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low
[x] clean up all reports and temporary files
[x] Execute Phase 1 of growth strategy: Foundation building | DoD: Complete membership system setup, hire initial writers, launch newsletter, establish content workflow
[x] Execute Phase 2 of growth strategy: Marketing launch | DoD: Set up social media presence, implement SEO campaign, launch email marketing, begin partnership outreach
[ ] Execute Phase 3 of growth strategy: Monetization activation | DoD: Launch paid membership tiers, activate premium content, establish merchandise sales, implement consulting services
[x] fix the product catalog, links look off | DoD: Add catalog CTA, featured links, and theme browser; verify links resolve
[ ] define profitability plan Q4 2025 | DoD: Set revenue targets, CAC/LTV model, conversion funnel, top 5 growth experiments
[ ] implement conversion boosts on merch | DoD: Add Buy Now CTAs, related items, tags-based browse; track click-throughs
[x] | T201 | Implement Stripe Checkout (products, tax, shipping, receipts) | DoD: Test-mode purchase succeeds for 3 SKUs via /checkout, email receipt received
[ ] | T202 | Build /checkout page that maps SKU->price and redirects to Stripe | DoD: Query param sku renders summary and routes to correct Stripe price
[ ] | T203 | Related-items component on product pages (by tags) | DoD: Include created and added to 10 top products; CTR tracked
[ ] | T204 | Global CTA include (Buy Now / Add to Cart) | DoD: Reusable include added; visible above the fold on merch pages
[ ] | T205 | Analytics: Integrate Plausible with goals (buy_now, membership_start, newsletter) | DoD: Events fire and appear in dashboard
[ ] | T206 | Email capture + funnels (welcome + 3-step merch funnel) | DoD: Forms submit; sequences active in provider; test subscriber receives all emails
[ ] | T207 | Pricing experiments framework (YAML-driven, UTM-coded offers) | DoD: 2 live price tests; conversions logged per variant
[ ] | T208 | Add Product JSON-LD schema to merch pages | DoD: 5 pages validate in Rich Results tester without errors
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
[ ] | T221 | Tag all 50 merch pages; auto-generate theme indexes | DoD: Tags added; theme pages built from tags
[ ] | T222 | A/B test product layout (hero/CTA position) | DoD: 50/50 split live; results logged
[ ] | T223 | Post-purchase upsell/thank-you page | DoD: After checkout, upsell offered with unique coupon
[ ] | T224 | Membership tiers + benefits (Stripe/Memberstack) | DoD: 2 paid tiers configurable; demo flow recorded
[ ] | T225 | Soft paywall for premium content | DoD: Preview-only snippet with Join CTA on 1 article
[ ] | T226 | Merch sitemap + SEO tuning | DoD: Merch sitemap section added; robots ok; noindex fixed where needed
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
[ ] | T239 | Gift cards via Stripe | DoD: Gift card SKU live; redemption instructions documented
[ ] | T240 | Support workflows + macros | DoD: Response templates for returns, shipping, defects, delays
[x] | T241 | Site-wide component inventory & catalog | DoD: `_docs/component-inventory.md` added with layouts, includes, audit targets, reuse policy tie-in
[x] | T242 | Refactor raw HTML/CSS pages into reusable components | DoD: Audit list created; 20 highest-traffic pages refactored to existing or new includes (with justification); inline styles eliminated; improvements logged in `_docs/improvements.md`

--- !IMPORTANT: DONT EDIT BELOW ---

