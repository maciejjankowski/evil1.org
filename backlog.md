# BACKLOG

**IMPORTANT:** Before working on any tasks, read the instructions in `instructions.md` `workflow.md` 
**IMPORTANT:** NEVER CHANGE THE ABOVE LINES. ONLY UPDATE CONTENTS BELOW!



**MODEL SELECTION:** Always assess task complexity and select appropriate Copilot model per `workflow.md` guidelines:
- Grok Code Fast 1 for routine/simple tasks
- GPT-4.1 for complex debugging/configuration
- GPT-4o for content creation/documentation
- GPT-5 mini for balanced medium-complexity tasks

# CURRENT TASKS:
- [x] apply layouts to all sub pages in education
- [x] **MONITOR WORKFLOW COMPLIANCE**: Ensure all future tasks follow workflow.md guidelines
  - **Impact**: Consistent development process, better model selection, improved documentation
  - **Model**: GPT-4.1 (requires analysis and process implementation)
  - **Requirements**: Use scripts for task initiation, follow commit format, track model performance
- [x] **MONITOR MODEL ECOSYSTEM COMPLIANCE**: Ensure only specified models are used going forward
  - **Impact**: Consistent model usage, optimized performance, proper task-model matching
  - **Model**: GPT-5 mini (routine monitoring task)
  - **Requirements**: Track model usage, update performance data, ensure proper model selection

# CRITICAL SITE-WIDE ISSUES DISCOVERED:

## 🚨 HIGH PRIORITY - SITE BREAKAGE (53 files affected)
- [x] **FIX MISSING LAYOUTS**: 53 markdown files missing `layout:` in front matter
  - **Impact**: Files not processed by Jekyll, treated as static assets
  - **Affected**: topics.md, _articles/*.md, workflow.md, image_prompts.md, unfiltered/*.md
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

## 📊 SITE STATISTICS:
- **Total Markdown Files**: 150
- **Generated HTML Files**: 109 (59 files not processed!)
- **Missing Layouts**: 53 files
- **Missing Titles**: 71 files
- **Missing Permalinks**: 91 files

## 🔧 MEDIUM PRIORITY IMPROVEMENTS:
- [x] **STANDARDIZE FRONT MATTER**: Create consistent metadata across all content types
  - **Impact**: Consistent content structure, better SEO, improved site organization
  - **Model**: GPT-5 mini (medium-complexity task requiring systematic updates)
  - **Status**: ✅ IN PROGRESS - Analyzing current front matter structures across content types
- [ ] **ADD DESCRIPTIONS**: 29 files missing descriptions for better SEO (added to 3 files)
- [ ] **IMPLEMENT ARTICLE LAYOUT**: Apply article layout to content pages for better structure
- [ ] **ADD AUTHOR/DATE METADATA**: Enhance content attribution and organization

## 🎨 LOW PRIORITY ENHANCEMENTS:
- [ ] **CONTENT TAGGING**: Add tags for better content organization
- [ ] **READING TIME ESTIMATES**: Add estimated reading times
- [ ] **SOCIAL SHARING METADATA**: Add Open Graph and Twitter card metadata
- [ ] **CONTENT CATEGORIZATION**: Implement content categories and series

# COMPLETED TASKS (Last Updated: September 8, 2025):
- [x] fix hall of fame. it has a broken layout or content or both
- [x] add nice styling to articles in halloffame, use layout styles or top level css - preferred
- [x] redo the top navbar styling to be consistent with the layout
- [x] /groups/groups return 404 when clicked from contents
- [x] scan for broken links from content pages, i.e. in trainings links from boxes are all 404. identify an issue, then perform full scan of the site to fix such issues
- [x] consolidate the layouts, find common parts, common components, modularize, reuse, simplify
- [x] add nice consistent styles to http://localhost:4000/groups/groups/ and other pages with similar layout
- [x] activities links not working!!!!! fix this.
- [x] links: http://localhost:4000/education/ not working. FIX!
- [x] you have not confirmed that education links dont work. Please fix that, update the rule in `instructions.md` to always check for 404
- [x] reread instructions.md and improvements.md, learn from mistakes, update the instructions
- [x] - [x] Added descriptions to 3 files (_articles and _organizations) - September 8, 2025