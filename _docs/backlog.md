# BACKLOG

================================================================================
CRITICAL HEADER - DO NOT MODIFY THESE LINES
================================================================================

**IMPORTANT:** Before working on any tasks, read the instructions in `_docs/instructions.md` `_docs/workflow.md`
**IMPORTANT:** NEVER CHANGE THE ABOVE LINES. ONLY UPDATE CONTENTS BELOW!

================================================================================
TASKS - EDIT BELOW THIS LINE ONLY
================================================================================

## HIGH PRIORITY
- [ ] Test all layout fixes across different pages and screen sizes
- [ ] Verify that all halloffame pages use consistent layout and styling
- [ ] Create scripts to split large unfiltered files into smaller topic-based files

## MEDIUM PRIORITY
- [ ] Review and optimize CSS utility classes for maintainability
- [ ] Audit and refactor markdown files for repetitive patterns
- [x] Summarize and bulk replace repeated HTML blocks

## LOW PRIORITY
- [ ] Expand case studies and boardroom documentation
- [ ] Add more tags/categories to articles

## COMPLETED TASKS
- [x] Fixed halloffame/charity/ layout and scanned other pages for similar issues
- [x] Created halloffame.html layout file with semantic structure
- [x] Removed duplicated content in charity.md
- [x] Updated all halloffame pages to use halloffame layout
- [x] Removed manual halloffame-article wrapper from banking.md
- [x] Added comprehensive CSS styles for halloffame components
- [x] Ensured responsive design for halloffame articles on mobile
- [x] Fixed inline styles in component-styling-report.md, layout-consistency-report.md, profiles/index.md, halloffame-feed.md
- [x] Replaced decorative text alignment divs with CSS classes in unfiltered/*.md files
- [x] Created CSS utility classes for common inline style patterns
- [x] Restructured and consolidated AI instructions and rules
- [x] Pruned and optimized instructions, added DoD refinement section
- [x] Updated unfiltered files to use CSS classes instead of inline text-align styles (all instances replaced)
- [x] Analyzed and updated copilot-instructions.md and referenced docs for prompt optimization
- [x] Fixed YAML front matter errors in unfiltered/something.md, unfiltered/plan.md, cease-and-desist.md
- [x] Fixed Liquid template errors: replaced site.articles with site.posts
- [x] Fixed broken where_exp filters in admin-dashboard.md and htmx/stats.html
- [x] Updated widget files to use site.posts
- [x] Jekyll site builds successfully after all YAML and Liquid fixes
- [x] Created script to automate inline style replacements for center-aligned divs


================================================================================
EDITING RULES
================================================================================
1. Only edit content below the "TASKS" line
2. Use [x] for completed tasks, [ ] for pending
3. Add new tasks to the appropriate section
4. Never modify the header section above
5. Keep task descriptions clear and actionable
6. AVOID VISUAL BLOAT: No emojis, decorative separators, or unnecessary formatting
7. After backlog cleanup, continue processing each actionable task until resolved, delegated, or blocked.
8. For each unresolved task, attempt direct resolution (e.g., code changes, testing, documentation updates).
9. If a task cannot be completed automatically, document the blocker and next steps.
10. Only consider the backlog complete when all actionable items are resolved or explicitly deferred.