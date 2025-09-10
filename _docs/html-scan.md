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
- **Files with inline HTML:** 8 identified
- **Total HTML bytes:** ~15KB across all files
- **Largest file:** `profile/index.md` (221 lines, ~8KB HTML)
- **Priority candidates:** 5 high-impact files

## Detailed Inventory

### HIGH PRIORITY - Large Index Pages

#### 1. `profile/index.md` - **221 lines, ~8KB HTML** | **PRIORITY: CRITICAL**
**Path:** `/Users/mj/code/evil1.org/profile/index.md`  
**Impact:** Main profile page with extensive tabbed interface  
**Rationale:** Largest file, most complex HTML, high user visibility  
**HTML Elements:** 50+ div tags with inline styles, JavaScript, complex layout  
**Sample:**
```html
<div style="border-bottom: 2px solid #003366; margin-bottom: 15px; background: #F0F0F0;">
    <div style="margin: 0; padding: 0;">
        <div id="tab-profile" onclick="showTab('profile')" style="display: inline-block; padding: 6px 12px; background: #6699CC; color: #fff; border: 1px solid #003366; border-bottom: none; cursor: pointer; position: relative; top: 2px; font-size: 11px; font-weight: bold; margin-right: 2px;">Profile</div>
```

#### 2. `members/index.md` - **94 lines, ~4KB HTML** | **PRIORITY: HIGH**
**Path:** `/Users/mj/code/evil1.org/members/index.md`  
**Impact:** Membership page with card-based layout  
**Rationale:** Clean structure, high user engagement, reusable card pattern  
**HTML Elements:** 20+ div tags with CSS classes, grid layout  
**Sample:**
```html
<div class="index-page">
    <div class="content-grid">
        <div class="content-card">
            <div class="card-meta">Elite Inner Circle</div>
            <div class="card-summary">The highest level of membership reserved for those who have demonstrated exceptional commitment to exposing corporate evil.</div>
```

#### 3. `company/exxonmobil.md` - **128 lines, ~5KB HTML** | **PRIORITY: HIGH**
**Path:** `/Users/mj/code/evil1.org/company/exxonmobil.md`  
**Impact:** Detailed company profile with timeline and statistics  
**Rationale:** Template for other company pages, structured data layout  
**HTML Elements:** 25+ div tags with CSS classes, structured data layout  
**Sample:**
```html
<div class="index-page">
    <div class="company-profile">
        <div class="timeline-item">
            <div class="year">1970s</div>
            <div class="content">Early climate research suppressed</div>
```

### MEDIUM PRIORITY - Index Pages

#### 4. `news/index.md` - **65 lines, ~2.5KB HTML** | **PRIORITY: MEDIUM**
**Path:** `/Users/mj/code/evil1.org/news/index.md`  
**Impact:** News section index with article cards  
**Rationale:** Medium traffic, similar structure to other indexes  
**HTML Elements:** 15+ div tags with inline styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">News</div>
```

#### 5. `company/index.md` - **26 lines, ~1KB HTML** | **PRIORITY: MEDIUM**
**Path:** `/Users/mj/code/evil1.org/company/index.md`  
**Impact:** Company directory index  
**Rationale:** Small file, directory pattern, low complexity  
**HTML Elements:** 8+ div tags with inline styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">Companies</div>
```

### LOW PRIORITY - Partially Converted

#### 6. `profiles/index.md` - **47 lines, ~1.5KB HTML** | **PRIORITY: LOW**
**Path:** `/Users/mj/code/evil1.org/profiles/index.md`  
**Impact:** Profile directory (partially converted)  
**Rationale:** Already has `page_html` frontmatter, just needs cleanup  
**Status:** Already has `page_html` frontmatter but with issues (duplicate loops)  
**HTML Elements:** 10+ div tags with inline styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366;">Profiles</div>
```

#### 2. `members/index.md` - **94 lines, ~4KB HTML**
**Path:** `/Users/mj/code/evil1.org/members/index.md`  
**Impact:** Membership page with card-based layout  
**HTML Elements:** 20+ div tags with CSS classes, grid layout  
**Sample:**
```html
<div class="index-page">
    <div class="content-grid">
        <div class="content-card">
            <div class="card-meta">Elite Inner Circle</div>
            <div class="card-summary">The highest level of membership reserved for those who have demonstrated exceptional commitment to exposing corporate evil.</div>
```

#### 3. `company/exxonmobil.md` - **128 lines, ~5KB HTML**
**Path:** `/Users/mj/code/evil1.org/company/exxonmobil.md`  
**Impact:** Detailed company profile with timeline and statistics  
**HTML Elements:** 25+ div tags with CSS classes, structured data layout  
**Sample:**
```html
<div class="index-page">
    <div class="company-profile">
        <div class="timeline-item">
            <div class="year">1970s</div>
            <div class="content">Early climate research suppressed</div>
```

### MEDIUM PRIORITY - Index Pages

#### 4. `news/index.md` - **65 lines, ~2.5KB HTML**
**Path:** `/Users/mj/code/evil1.org/news/index.md`  
**Impact:** News section index with article cards  
**HTML Elements:** 15+ div tags with inline styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">News</div>
```

#### 5. `company/index.md` - **26 lines, ~1KB HTML**
**Path:** `/Users/mj/code/evil1.org/company/index.md`  
**Impact:** Company directory index  
**HTML Elements:** 8+ div tags with inline styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">Companies</div>
```

### LOW PRIORITY - Partially Converted

#### 6. `profiles/index.md` - **47 lines, ~1.5KB HTML**
**Path:** `/Users/mj/code/evil1.org/profiles/index.md`  
**Impact:** Profile directory (partially converted)  
**Status:** Already has `page_html` frontmatter but with issues (duplicate loops)  
**HTML Elements:** 10+ div tags with inline styles  
**Sample:**
```html
<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366;">Profiles</div>
```

## Priority Recommendations

### Top 3 for Immediate Conversion
1. **`profile/index.md`** - Largest impact, most complex HTML
2. **`members/index.md`** - High user visibility, clean card layout
3. **`company/exxonmobil.md`** - Detailed content page, reusable structure

### Next Phase Candidates
4. **`news/index.md`** - Medium traffic page
5. **`company/index.md`** - Directory page

### Cleanup Only
6. **`profiles/index.md`** - Fix existing partial conversion

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

## Next Steps

1. **T202:** Prioritize candidates based on this inventory
2. **T203:** Create extraction script and backup procedures
3. **T204:** Convert top 3 files as proof-of-concept
4. **T205:** Batch convert remaining high-priority files
