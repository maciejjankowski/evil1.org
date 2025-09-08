# BACKLOG

**IMPORTANT:** Before working on any tasks, read the instructions in `instructions.md`

**MODEL SELECTION:** Always assess task complexity and select appropriate Copilot model per `workflow.md` guidelines:
- GPT-4 for complex debugging/configuration
- GPT-3.5 for routine tasks/simple edits
- Claude for content creation/documentation

# CURRENT TASKS:
# BACKLOG

**IMPORTANT:** Before working on any tasks, read the instructions in `instructions.md`

**MODEL SELECTION:** Always assess task complexity and select appropriate Copilot model per `workflow.md` guidelines:
- GPT-4 for complex debugging/configuration
- GPT-3.5 for routine tasks/simple edits
- Claude for content creation/documentation

# CURRENT TASKS:
- [x] apply layouts to all sub pages in education

# CRITICAL SITE-WIDE ISSUES DISCOVERED:

## 🚨 HIGH PRIORITY - SITE BREAKAGE (53 files affected)
- [ ] **FIX MISSING LAYOUTS**: 53 markdown files missing `layout:` in front matter
  - **Impact**: Files not processed by Jekyll, treated as static assets
  - **Affected**: topics.md, _articles/*.md, workflow.md, image_prompts.md, unfiltered/*.md
  - **Model**: GPT-4 (complex configuration across multiple files)

## 🚨 HIGH PRIORITY - SEO & NAVIGATION (71 files affected)
- [ ] **ADD MISSING TITLES**: 71 markdown files missing `title:` in front matter
  - **Impact**: Poor SEO, broken navigation, inconsistent page titles
  - **Model**: GPT-3.5 (routine task, can be automated)

## 🚨 HIGH PRIORITY - BROKEN LINKS (91 files affected)
- [ ] **ADD MISSING PERMALINKS**: 91 markdown files missing `permalink:` in front matter
  - **Impact**: Broken internal links, 404 errors, poor URL structure
  - **Model**: GPT-4 (requires careful URL planning and consistency)

## 📊 SITE STATISTICS:
- **Total Markdown Files**: 150
- **Generated HTML Files**: 109 (59 files not processed!)
- **Missing Layouts**: 53 files
- **Missing Titles**: 71 files
- **Missing Permalinks**: 91 files

## 🔧 MEDIUM PRIORITY IMPROVEMENTS:
- [ ] **STANDARDIZE FRONT MATTER**: Create consistent metadata across all content types
- [ ] **ADD DESCRIPTIONS**: Missing descriptions for better SEO
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