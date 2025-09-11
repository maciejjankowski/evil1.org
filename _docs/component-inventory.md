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
## Includes (Content / Cards)
| Name | Purpose | Inputs (frontmatter/params) | Reuse Potential |
|------|---------|----------------------------|-----------------|
| `post-card.html` | Summary card for posts | page object | High |
| `profile-card.html` | Profile summary | profile data | High |
| `merch-tile.html` | Merchandise tile | item hash from collection | High |
| `merch-cta.html` | Product CTA block | page.sku, page.price | High |
| `merch-related.html` | Related merch list | page.tags | Medium |
| `merch-hero.html` | Merch page hero section | collection data | Medium |
| `product-schema.html` | JSON-LD for products | page fields | High |

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
