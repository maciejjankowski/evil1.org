---
layout: default
title: Component Inventory
description: Central catalog of reusable layouts and includes. Update before adding new components.
permalink: /docs/component-inventory/
---

# Component Inventory

This catalog is generated manually (T241). Before creating a new include/layout, consult and cite this file.

## Layouts
| Name | Purpose | Key Slots/Variables | Notes |
|------|---------|---------------------|-------|
| `default` | Base shell (header/footer) | `content` | Wrap most pages |
| `article` | Article detail | frontmatter: title, author | Uses sidebar widgets |
| `post` | Blog post layout | date, tags | Similar to article |
| `profile` | Profile pages | profile data | Renders profile-card include |
| `company` | Company pages | org data | Variation of profile |
| `organization` | Organization detail | org data |  |
| `event` | Event detail | date/time |  |
| `homepage` | Marketing/home variant | hero sections |  |
| `home` | Legacy home |  | Consider deprecating |
| `submit` | Submission form | form include? |  |
| `login` | Auth login |  |  |
| `register` | Registration |  |  |
| `halloffame` | Recognition wall | data loops |  |
| `sig` | Special interest group | ??? | Needs audit |

## Includes (Content / Cards)
| Name | Purpose | Inputs (frontmatter/params) | Reuse Potential |
|------|---------|----------------------------|-----------------|
| `post-card.html` | Summary card for posts | page object | High |
| `profile-card.html` | Profile summary | profile data | High |
| `merch-tile.html` | Merchandise tile | item hash (url,title,price,sku) | High |
| `merch-cta.html` | Product CTA block | page.sku, page.price | High |
| `merch-related.html` | Related merch list | page.tags | Medium |
| `product-schema.html` | JSON-LD for products | page fields | High |
| `related-articles.html` | Related content list | tags/categories | High |
| `people-suggestion.html` | Person suggestion card | context vars | Medium |
| `people-suggestions-widget.html` | Batch suggestions | collection | Medium |
| `stories-bar.html` | Horizontal story feed | collection | Medium |
| `story-item.html` | Item inside stories-bar | story data | Medium |
| `sponsored-content.html` | Paid placement | sponsor meta | Low |
| `trending-widget.html` | Trending items | data source | Medium |
| `widget-newsletter.html` | Newsletter signup | form action | High |
| `widget-related-tags.html` | Related tags | tag context | Medium |
| `widget-search.html` | Search box | none | Medium |
| `widget-popular-tags.html` | Popular tags list | tag stats | Medium |
| `widget-featured-articles.html` | Featured articles block | curated list | High |
| `widget-author-spotlight.html` | Highlight author | author id | Medium |
| `widget-reading-progress.html` | Progress bar | scroll JS | Medium |
| `sidebar.html` | Sidebar scaffold | stacked widgets | High |
| `sidebar-widget.html` | Generic wrapper | inner content | High |
| `tab-navigation.html` | Tab UI | nav items | Medium |
| `comment-form.html` | Comment submission | target endpoint | Medium |
| `comment-display.html` | Render comments | comments collection | Medium |
| `widget-social-share.html` | Share links | page meta | High |
| `hellfire-header.html` | Alt header variant | nav items | Low |
| `hellfire-footer.html` | Alt footer variant | nav items | Low |
| `header.html` | Global site header | nav, logo | Critical |
| `footer.html` | Global site footer | nav | Critical |
| `soul-auction-widget.html` | Humorous widget | none | Novelty |

## Pending Audit Targets (Inline / Raw HTML)
List pages with significant inline styles or raw layout markup to refactor under T242.

| Page | Issue | Proposed Action |
|------|-------|-----------------|
| `/merchandise/` | Inline styles, marketing blocks | Extract hero + manifesto into includes |
| `/index.markdown` | Raw HTML sections? | Audit |
| `/about.markdown` | Mixed formatting | Convert to markdown + includes |
| `/login.md` | Duplicate with login.html? | Consolidate layout |
| `/register.md` | Duplicate with register.html | Consolidate |

## Reuse Guidelines (Quick)
1. Search here first.
2. If similar component exists: extend or parametrize it.
3. If gap: justify (scope, frequency) in PR/commit message.
4. Add new component row here immediately.
5. Refactor legacy inline blocks opportunistically.

_Last updated: {{ site.time | date: '%Y-%m-%d %H:%M' }}_
