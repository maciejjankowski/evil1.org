---
layout: default
title: HTML Extraction Inventory
description: Inventory of pages with embedded inline HTML for extraction to frontmatter
permalink: /docs/html-scan/
---

# HTML Extraction Inventory

**Generated:** September 10, 2025  
**Purpose:** Identify pages with excessive inline HTML that should be extracted to frontmatter for better maintainability

## Summary Statistics

- **Total files scanned:** 50+ markdown files
- **Files with inline HTML:** 9 identified
- **Total HTML bytes:** ~22KB across all files
- **Largest file:** `profile/index.md` (16,485 bytes, ~12KB HTML)
- **Priority candidates:** 5 high-impact files

## Priority Classification
- **HIGH**: Core navigation/layout pages with extensive inline HTML (>5KB)
- **MEDIUM**: Content pages with moderate inline HTML (1-5KB)
- **LOW**: Pages with minimal inline HTML (<1KB) or single elements

## Detailed Inventory

### HIGH PRIORITY - Large Index Pages

#### 1. `profile/index.md` - **16,485 bytes, ~12KB HTML** | **PRIORITY: CRITICAL**
**Path:** `/Users/mj/code/evil1.org/profile/index.md`  
**Impact:** Main profile page with extensive tabbed interface and complex layout  
**Rationale:** Largest file, most complex HTML, high user visibility, contains JavaScript  
**HTML Elements:** 50+ div tags with inline styles, span elements, h1-h4 with styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366;">Profile</div>
    <div style="padding: 10px; background: #fff;">
        <!-- Tab Navigation -->
        <div style="border-bottom: 2px solid #003366; margin-bottom: 15px; background: #F0F0F0;">
            <div style="margin: 0; padding: 0;">
                <div id="tab-profile" onclick="showTab('profile')" style="display: inline-block; padding: 6px 12px; background: #6699CC; color: #fff; border: 1px solid #003366; border-bottom: none; cursor: pointer; position: relative; top: 2px; font-size: 11px; font-weight: bold; margin-right: 2px;">Profile</div>
```

#### 2. `company/index.md` - **6,229 bytes, ~4KB HTML** | **PRIORITY: HIGH**
**Path:** `/Users/mj/code/evil1.org/company/index.md`  
**Impact:** Company listings page with repeated styled div containers  
**Rationale:** Clean structure, high user engagement, reusable card pattern  
**HTML Elements:** 20+ div tags with inline styles, h3 tags with styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">Companies</div>

    <div style="border: 1px solid #D0D0D0; margin: 15px 0; background: #F8F8F8; padding: 10px;">
        <h3 style="color: #003366; font-size: 14px; margin-bottom: 5px;">Agricultural Biotechnology</h3>
        <div style="font-size: 10px; color: #666; margin-bottom: 8px;">Agricultural Biotechnology</div>
        <div style="font-size: 11px; color: #333; margin-bottom: 8px; font-style: italic;">The poster child of corporate agricultural evil...</div>
    </div>
```

#### 3. `profiles/index.md` - **2,189 bytes, ~1.5KB HTML** | **PRIORITY: HIGH**
**Path:** `/Users/mj/code/evil1.org/profiles/index.md`  
**Impact:** Profiles listing page with styled containers and profile cards  
**Rationale:** Directory pattern, similar to company/index.md, good candidate for component extraction  
**HTML Elements:** 15+ div tags with inline styles, h2 with styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366;">Profiles</div>
    <div style="padding: 10px; background: #fff;">
        <p>Historical masters of exploitation...</p>
    </div>

    <div style="border: 1px solid #D0D0D0; margin: 15px 0; background: #F8F8F8; padding: 10px;">
        <h2 style="color: #003366; font-size: 14px; margin-bottom: 5px;">
            <a href="{{ profile.url }}" style="color: #003366; text-decoration: none;">{{ profile.profile.name }}</a>
        </h2>
```

### MEDIUM PRIORITY - Index Pages

#### 4. `news/index.md` - **3,470 bytes, ~2KB HTML** | **PRIORITY: MEDIUM**
**Path:** `/Users/mj/code/evil1.org/news/index.md`  
**Impact:** News section index with article cards  
**Rationale:** Medium traffic, similar structure to other indexes  
**HTML Elements:** 15+ div tags with inline styles, h2 tags with styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">News</div>

    <div style="border: 1px solid #D0D0D0; margin: 15px 0; background: #F8F8F8; padding: 10px;">
        <h2 style="color: #003366; font-size: 14px; margin-bottom: 5px;">
            <a href="#" style="color: #003366; text-decoration: none;">Corporate Tax Evasion Schemes Exposed</a>
        </h2>
```

### LOW PRIORITY - Minimal HTML

#### 5. `education/index.md` - **2,387 bytes, ~200 bytes HTML** | **PRIORITY: LOW**
**Path:** `/Users/mj/code/evil1.org/education/index.md`  
**Impact:** Education page with minimal inline styling  
**Rationale:** Single paragraph with styling, low complexity  
**HTML Elements:** 1 p tag with inline style  
**Sample:**
```html
<p style="font-size: 11px; color: #666; margin-bottom: 20px; font-style: italic;">Comprehensive educational programs for understanding and implementing modern systems of influence, control, and strategic manipulation.</p>
```

#### 6. `education/application-v2.md` - **unknown size, ~300 bytes HTML** | **PRIORITY: LOW**
**Path:** `/Users/mj/code/evil1.org/education/application-v2.md`  
**Impact:** Application page with styled quote spans  
**Rationale:** Multiple span elements with font styling  
**HTML Elements:** 3+ span tags with inline styles  
**Sample:**
```html
<span style="font-size: 11px;">"Stakeholder cost externalization is essential for optimal shareholder value creation"</span>
```

#### 7. `education/application.md` - **unknown size, ~300 bytes HTML** | **PRIORITY: LOW**
**Path:** `/Users/mj/code/evil1.org/education/application.md`  
**Impact:** Application page with styled quote spans  
**Rationale:** Multiple span elements with font styling  
**HTML Elements:** 3+ span tags with inline styles  
**Sample:**
```html
<span style="font-size: 11px;">"Human suffering is an acceptable externality for profit maximization"</span>
```

#### 8. `typography-enhancement-report.md` - **unknown size, ~200 bytes HTML** | **PRIORITY: LOW**
**Path:** `/Users/mj/code/evil1.org/typography-enhancement-report.md`  
**Impact:** Report page with styled typography spans  
**Rationale:** Typography demonstration with inline styles  
**HTML Elements:** 2+ span tags with inline styles  
**Sample:**
```html
<span style="font-weight:700;color:#1d2129;font-size:16px;">{{ article.title }}</span>
<span style="color:#65676b;font-size:13px;">{{ article.date }}</span>
```

#### 9. `new ideas/Corporate America's War on Democracy_ A Tale of Sh.md` - **unknown size, ~100 bytes HTML** | **PRIORITY: LOW**
**Path:** `/Users/mj/code/evil1.org/new ideas/Corporate America's War on Democracy_ A Tale of Sh.md`  
**Impact:** Content page with hidden footnote spans  
**Rationale:** Display:none styling for footnotes  
**HTML Elements:** 1 span tag with display styling  
**Sample:**
```html
<span style="display:none">[^28][^29][^30][^31][^32][^33][^34][^35][^36][^37][^38][^39][^40][^41][^42][^43][^44][^45][^46][^47][^48][^49][^50][^51][^52][^53][^54][^55][^56][^57][^58][^59][^60][^61][^62][^63][^64][^65][^66][^67][^68][^69][^70][^71][^72][^73][^74][^75][^76][^77][^78][^79]</span>
```

## Priority Recommendations

### Top 3 for Immediate Conversion
1. **`profile/index.md`** - Largest impact, most complex HTML, contains JavaScript
2. **`company/index.md`** - Clean structure, high user engagement, reusable card pattern
3. **`profiles/index.md`** - Directory page, similar to company/index.md

### Next Phase Candidates
4. **`news/index.md`** - Medium traffic page with similar structure
5. **Education pages** - Low complexity, quick wins

### Minimal Impact
6-9. **Typography and content pages** - Single elements, low priority

## Extraction Strategy

### Recommended Approach
1. **Create `page_html` frontmatter key** for each file
2. **Move all HTML content** from body to frontmatter
3. **Replace body with** `{{ page.page_html }}`
4. **Preserve Liquid templating** within HTML blocks
5. **Test rendering** after each conversion

### Benefits Expected
- **Reduced file size** in version control
- **Better maintainability** of HTML structure
- **Cleaner separation** of content and presentation
- **Easier template reuse** across similar pages
- **Improved performance** through better caching

## Component Opportunities

Based on this inventory, several reusable components should be created:

1. **Page Header Component** (`_includes/page-header.html`) - Gradient header with title
2. **Content Card Component** (`_includes/content-card.html`) - Bordered content containers
3. **Profile Card Component** (`_includes/profile-card.html`) - Profile listing items
4. **Company Card Component** (`_includes/company-card.html`) - Company listing items
5. **Tab Navigation Component** (`_includes/tab-navigation.html`) - Already exists, needs testing
6. **Typography Components** (`_includes/typography.html`) - For styled text elements

## Next Steps

1. **T202:** Prioritize candidates based on this updated inventory
2. **T203:** Create extraction script and backup procedures
3. **T204:** Convert top 3 files as proof-of-concept
4. **T205:** Batch convert remaining high-priority files
5. **Create reusable components** for common patterns identified
