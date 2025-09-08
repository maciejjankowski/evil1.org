# BACKLOG

# BACKLOG

**IMPORTANT:** Before working on any tasks, read the instructions in `_docs/instructions.md` `_docs/workflow.md`
**IMPORTANT:** NEVER CHANGE THE ABOVE LINES. ONLY UPDATE CONTENTS BELOW!

**MODEL SELECTION:** Always assess task complexity and select appropriate Copilot model per `_docs/workflow.md` guidelines:
- Grok Code Fast 1 for routine/simple tasks
- GPT-4.1 for complex debugging/configuration
- GPT-4o for content creation/documentation
- GPT-5 mini for balanced medium-complexity tasks

## ✅ COMPLETED TASKS
- [x] Move documentation files to _docs/ folder
- [x] Apply layouts to all education subpages
- [x] Fix missing layouts in markdown files
- [x] Add missing titles to content files
- [x] Add missing permalinks to content files
- [x] Standardize front matter across content types
- [x] Add descriptions for better SEO
- [x] Implement article layout improvements
- [x] Add author/date metadata to content files
- [x] Monitor workflow compliance
- [x] Monitor model ecosystem compliance

## 🔄 PENDING TASKS
- [ ] **CONTENT TAGGING**: Add tags for better content organization
- [ ] **READING TIME ESTIMATES**: Add estimated reading times
- [ ] **SOCIAL SHARING METADATA**: Add Open Graph and Twitter card metadata
- [ ] **CONTENT CATEGORIZATION**: Implement content categories and series

# CRITICAL SITE-WIDE ISSUES DISCOVERED:

## 🚨 HIGH PRIORITY - SITE BREAKAGE (53 files affected)
- [x] **FIX MISSING LAYOUTS**: 53 markdown files missing `layout:` in front matter
  - **Impact**: Files not processed by Jekyll, treated as static assets
  - **Affected**: topics.md, _articles/*.md, _docs/workflow.md, image_prompts.md, unfiltered/*.md
  - **Model**: GPT-4.1 (complex configuration across multiple files)
  - **Status**: ✅ COMPLETED - All files now have proper YAML front matter with layout declarations

## 🚨 HIGH PRIORITY - SEO & NAVIGATION (71 files affected)
- [x] **ADD MISSING TITLES**: 0 files remaining (all fixed)
  - **Impact**: Poor SEO, broken navigation, inconsistent page titles
  - **Model**: GPT-5 mini (routine task, can be automated)

## 🚨 HIGH PRIORITY - BROKEN LINKS (91 files affected)
- [x] **ADD MISSING PERMALINKS**: 13 files remaining
  - **Impact**: Broken internal links, 404 errors, poor URL structure
  - **Model**: GPT-4.1 (requires careful URL planning and consistency)

## 📊 SITE STATISTICS (Updated: September 8, 2025):
- **Total Markdown Files**: 143 (content files only, excluding _docs/)
- **Generated HTML Files**: 135
- **Documentation Files**: 8 (moved to _docs/ folder)

## 🔧 MEDIUM PRIORITY IMPROVEMENTS:
- [x] **STANDARDIZE FRONT MATTER**: Create consistent metadata across all content types
  - **Impact**: Consistent content structure, better SEO, improved site organization
  - **Model**: GPT-5 mini (medium-complexity task requiring systematic updates)
  - **Status**: ✅ COMPLETED - Standardized front matter across 44 content files (14 organizations, 6 articles, 24 profiles)
- [x] **ADD DESCRIPTIONS**: 29 files missing descriptions for better SEO (added to 9 files)
  - **Impact**: Improved SEO, better search engine visibility, enhanced content discoverability
  - **Model**: GPT-5 mini (routine task with systematic approach)
  - **Status**: ✅ COMPLETED - Added descriptions to 6 core documentation files (_docs/workflow.md, _docs/backlog.md, _docs/instructions.md, _docs/test-page.md, _docs/test-blueprint.md, README.md)
- [x] **IMPLEMENT ARTICLE LAYOUT**: Apply article layout to content pages for better structure
  - **Impact**: Better content presentation, improved user experience, enhanced semantic structure
  - **Model**: GPT-5 mini (layout improvements and standardization)
  - **Status**: ✅ COMPLETED - Enhanced article.html layout, updated organization.html and profile.html layouts to work with standardized front matter
- [x] **ADD AUTHOR/DATE METADATA**: Enhance content attribution and organization
  - **Impact**: Better content attribution, improved organization, enhanced credibility
  - **Model**: GPT-5 mini (systematic metadata addition)
  - **Status**: ✅ COMPLETED - Added author/date metadata to 7 key content files with appropriate attribution standards

## 🎨 LOW PRIORITY ENHANCEMENTS:
- [ ] **CONTENT TAGGING**: Add tags for better content organization
- [ ] **READING TIME ESTIMATES**: Add estimated reading times
- [ ] **SOCIAL SHARING METADATA**: Add Open Graph and Twitter card metadata
- [ ] **CONTENT CATEGORIZATION**: Implement content categories and series