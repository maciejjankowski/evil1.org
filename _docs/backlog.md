# BACKLOG

================================================================================
CRITICAL HEADER - DO NOT MODIFY THESE LINES
================================================================================

**IMPORTANT:** Before working on any tasks, read the instructions in `_docs/instructions.md` `_docs/workflow.md`
**IMPORTANT:** NEVER CHANGE THE ABOVE LINES. ONLY UPDATE CONTENTS BELOW!

**MODEL SELECTION:** Always assess task complexity and select appropriate Copilot model per `_docs/workflow.md` guidelines:
- Grok Code Fast 1 for routine/simple tasks
- GPT-4.1 for complex debugging/configuration
- GPT-4o for content creation/documentation
- GPT-5 mini for balanced medium-complexity tasks

================================================================================
TASKS - EDIT BELOW THIS LINE ONLY
================================================================================

## COMPLETED TASKS
- [x] pages like http://localhost:4000/halloffame/charity/ hav messed up layout. analyze the causes, then do a full site scan and fix it on other pages. add those atomic tasks to backlog
- [x] Create proper halloffame.html layout file with semantic structure
- [x] Fix duplicated content in charity.md (introduction was repeated)
- [x] Update all halloffame pages to use halloffame layout instead of default
- [x] Remove manual halloffame-article wrapper from banking.md
- [x] Add comprehensive CSS styles for halloffame layout components
- [x] Ensure responsive design for halloffame articles on mobile devices
- [x] Fix inline styles in component-styling-report.md (buttons and layout)
- [x] Fix inline styles in layout-consistency-report.md (float layouts)
- [x] Fix inline styles in profiles/index.md (skill level bars)
- [x] Fix inline styles in halloffame-feed.md (chart bars)
- [x] Replace decorative text alignment divs with CSS classes in unfiltered/*.md files
- [x] Create CSS utility classes for common inline style patterns
- [x] Restructure and consolidate all AI instructions and rules into minimal set of files
- [x] Consolidate and prune instructions, distill to essential quality-improving instructions, optimize prompts for precise responses, add DoD refinement section
- [x] Consolidate, trim, optimize, cut all slack. refer to prompt engineering guides and best practices. make this work well in vscode. optimize copilot-instructions.md as well.

## PENDING TASKS
- [ ] Update unfiltered files to use CSS classes instead of inline text-align styles
- [ ] Test all layout fixes across different pages and screen sizes
- [ ] Verify that all halloffame pages now use consistent layout and styling
- [ ] analyze copilot-instructions.md and all linked referenced pages including readme and workflow. THEN structure the prompts for easier reading and optimal processing by AI agents
- [ ] rework the contents, create scripts to split large files into smaller, grouped by topics

================================================================================
EDITING RULES
================================================================================
1. Only edit content below the "TASKS" line
2. Use [x] for completed tasks, [ ] for pending
3. Add new tasks to the appropriate section
4. Never modify the header section above
5. Keep task descriptions clear and actionable
6. AVOID VISUAL BLOAT: No emojis, decorative separators, or unnecessary formatting