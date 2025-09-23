---
layout: default
title: "HTML Extraction Reviewer Checklist"
description: "Quality assurance checklist for reviewing HTML extraction conversions and ensuring proper Jekyll structure"
---

# HTML Extraction Reviewer Checklist
**Version:** 1.0 | **Date:** September 10, 2025
**Purpose:** Quality assurance checklist for reviewing HTML extraction conversions

## Pre-Review Preparation

### File Analysis
- [ ] **File Type Check**: Confirm file is Jekyll markdown (.md) with frontmatter
- [ ] **Content Assessment**: Verify file contains extractable HTML (>10 lines recommended)
- [ ] **Backup Verification**: Ensure backup exists in `backups/html_extraction_[timestamp]/`
- [ ] **Git Status**: Confirm file is committed before conversion

### Conversion Readiness
- [ ] **Complexity Assessment**: Evaluate HTML complexity (simple/medium/complex)
- [ ] **Dependencies Check**: Identify any Jekyll/Liquid templating that needs `{% raw %}` tags
- [ ] **CSS Dependencies**: Note any inline styles that should be moved to external CSS
- [ ] **Functionality Review**: Document any JavaScript or interactive elements

## Conversion Review Criteria

### ✅ REQUIRED - Must Pass All

#### Frontmatter Structure
- [ ] **YAML Validity**: Frontmatter parses without YAML syntax errors
- [ ] **page_html Key**: `page_html:` key exists and uses proper YAML multiline syntax (`|` or `>-`)
- [ ] **Indentation**: HTML content properly indented (2 spaces minimum)
- [ ] **Frontmatter Closure**: File ends with `---` followed by blank line

#### Body Structure
- [ ] **Placeholder Only**: Body contains only `{{ page.page_html }}`
- [ ] **No Extra Content**: No additional markdown or HTML in body
- [ ] **Clean Separation**: Clear separation between frontmatter and body

#### HTML Integrity
- [ ] **Complete Extraction**: All HTML from original body moved to frontmatter
- [ ] **Tag Matching**: All opening tags have corresponding closing tags
- [ ] **Attribute Preservation**: All HTML attributes and values preserved
- [ ] **Content Accuracy**: No content lost or corrupted during extraction

### ⚠️ RECOMMENDED - Should Pass Most

#### Code Quality
- [ ] **Indentation Consistency**: Consistent indentation throughout HTML
- [ ] **Readable Structure**: HTML logically organized and commented where complex
- [ ] **Semantic HTML**: Appropriate use of semantic HTML elements
- [ ] **Accessibility**: Basic accessibility attributes preserved (alt, aria-*, etc.)

#### Jekyll Integration
- [ ] **Liquid Syntax**: Any Liquid templating properly wrapped with `{% raw %}` and `{% endraw %}`
- [ ] **Variable Preservation**: Jekyll variables (`{% raw %}{{ page.variable }}{% endraw %}`, `{% raw %}{% include file.html %}{% endraw %}`) work correctly
- [ ] **Include Tags**: Any `{% raw %}{% include %}{% endraw %}` or `{% raw %}{% render %}{% endraw %}` tags functional
- [ ] **Frontmatter Variables**: Page variables (`{% raw %}{{ page.title }}{% endraw %}`, etc.) render correctly

#### Performance & Maintainability
- [ ] **File Size**: HTML content not excessively large (>1000 lines consider splitting)
- [ ] **Reusability**: HTML patterns could be reused in similar pages
- [ ] **Documentation**: Complex HTML sections have explanatory comments
- [ ] **Modularity**: HTML could be broken into logical, maintainable sections

## Build & Functionality Testing

### ✅ CRITICAL - Must Verify

#### Jekyll Build
- [ ] **Clean Build**: `bundle exec jekyll build` completes without errors
- [ ] **No Warnings**: No Jekyll warnings related to the converted file
- [ ] **Site Generation**: `_site/` contains generated HTML file
- [ ] **Link Integrity**: All internal links functional

#### Visual Verification
- [ ] **Layout Match**: Generated page visually identical to original
- [ ] **Responsive Design**: Mobile/tablet/desktop layouts preserved
- [ ] **Typography**: Fonts, sizes, colors match original
- [ ] **Spacing**: Margins, padding, positioning correct

#### Content Verification
- [ ] **Text Accuracy**: All text content preserved and correctly displayed
- [ ] **Image Display**: Images load and display correctly
- [ ] **Link Functionality**: All links work and point to correct destinations
- [ ] **Interactive Elements**: Buttons, forms, JavaScript functionality preserved

### 🔍 DETAILED TESTING SCENARIOS

#### Cross-Browser Testing
- [ ] **Chrome/Edge**: Layout and functionality verified
- [ ] **Firefox**: Layout and functionality verified
- [ ] **Safari**: Layout and functionality verified
- [ ] **Mobile Browsers**: iOS Safari and Chrome Mobile tested

#### Device Testing
- [ ] **Desktop**: 1920px+ width displays correctly
- [ ] **Tablet**: 768px-1024px width displays correctly
- [ ] **Mobile**: <768px width displays correctly
- [ ] **Touch Interactions**: Mobile touch targets appropriately sized

## Issue Resolution Matrix

### Common Issues & Solutions

| Issue | Symptoms | Solution |
|-------|----------|----------|
| **YAML Error** | Jekyll build fails with YAML parsing error | Check indentation, quotes, special characters |
| **Missing Content** | Page appears blank or incomplete | Verify `{{ page.page_html }}` in body, check YAML multiline format |
| **Broken Layout** | Visual differences from original | Compare HTML structure, check for missing CSS classes |
| **Liquid Errors** | Template syntax errors in build | Wrap Liquid tags with `{% raw %}` and `{% endraw %}` |
| **Link Issues** | Broken internal/external links | Verify relative paths and Jekyll URL generation |

### Severity Levels

#### 🚨 CRITICAL (Block Release)
- Jekyll build fails
- Page completely broken/unusable
- Security vulnerabilities introduced
- Data loss or corruption

#### ⚠️ HIGH (Fix Before Release)
- Major visual/layout differences
- Broken functionality (links, forms)
- Performance degradation
- Accessibility issues

#### 🔶 MEDIUM (Fix Soon)
- Minor visual inconsistencies
- Non-critical functionality issues
- Performance optimizations needed
- Code quality improvements

#### ℹ️ LOW (Document & Monitor)
- Code style inconsistencies
- Minor optimizations possible
- Documentation improvements
- Future enhancement opportunities

## Approval Workflow

### Reviewer Actions
1. **Initial Review**: Complete checklist items
2. **Testing**: Perform build and visual verification
3. **Issue Documentation**: Note any issues found with severity levels
4. **Recommendations**: Suggest improvements or fixes
5. **Approval Decision**: Approve, request changes, or reject

### Post-Approval
- [ ] **Merge Ready**: All critical and high issues resolved
- [ ] **Documentation Updated**: Any new patterns documented
- [ ] **Team Notification**: Notify team of new conversion patterns
- [ ] **Monitoring**: Add to monitoring for post-release issues

## Quality Metrics

### Target Standards
- **Build Success Rate**: 100% (no Jekyll build failures)
- **Visual Accuracy**: 100% match to original design
- **Functionality Preservation**: 100% of original features working
- **Performance**: No degradation from original
- **Accessibility**: WCAG AA compliance maintained

### Success Criteria
- [ ] All CRITICAL checklist items pass
- [ ] Jekyll build successful
- [ ] Visual inspection confirms identical appearance
- [ ] No functionality regressions
- [ ] Code review completed by senior developer
- [ ] Documentation updated with any new patterns

## Continuous Improvement

### Feedback Collection
- [ ] **Developer Feedback**: Collect input from conversion author
- [ ] **Process Improvements**: Identify bottlenecks or inefficiencies
- [ ] **Tool Enhancements**: Suggest improvements to conversion scripts
- [ ] **Template Updates**: Add successful patterns to template library

### Metrics Tracking
- [ ] **Conversion Time**: Track time spent on conversions
- [ ] **Error Rate**: Monitor types and frequency of issues
- [ ] **Review Cycle Time**: Measure time from submission to approval
- [ ] **Quality Scores**: Rate conversions on established criteria

---

**Checklist Completion**: All items reviewed and documented
**Reviewer Name**: ________________________
**Date**: ________________________
**Approval Status**: ☐ Approved ☐ Changes Requested ☐ Rejected
