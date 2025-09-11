# COPILOT INSTRUCTIONS

## CORE RULES (ESSENTIAL)
1. Preserve YAML frontmatter exactly; never strip `---`
2. No inline styles — only external CSS
3. No edits to `_dont touch/` files
4. Use `./scripts/mark-task-done.sh TASK_ID` to mark task completion
5. Commit before any risky/destructive change
6. Always test before declaring done: `bundle exec jekyll build`
7. **Run visual tests after layout/CSS changes: `npm test`**
8. Prefer Markdown over raw HTML; use HTML only when necessary
9. Reuse existing components; avoid duplication
10. Tone: satirical/dark humor critiquing power structures

## ARCHITECTURE
- **Jekyll site**: content in `_articles/`, `_posts/`, `_profiles/`, `_organizations/`, and root
- **Structure**: `_layouts/` (templates), `_includes/` (components), `_data/` (YAML data)
- **Scripts**: `scripts/` for workflow automation
- **CSS**: external stylesheets in `assets/` only
- **Testing**: Playwright visual regression tests in `tests/`
- **Backlog**: all tasks managed in a single consolidated file `_docs/backlog-all.md`

## WORKFLOW
1. Process tasks from `_docs/backlog-all.md` autonomously and completely
2. Build → **Visual Test** → Commit → Mark complete → Next task
3. Commit format: `[TASK_ID] Brief description`
4. Update backlog using `./scripts/mark-task-done.sh TASK_ID`
5. Continue without pausing until backlog is complete

## QUALITY CHECKS
1. Build passes: `bundle exec jekyll build` (no YAML errors)
2. **Visual tests pass: `npm test` (no layout regressions)**
3. No broken internal links
4. Backlog updated (task marked complete)
5. No inline styles introduced
6. Commit message properly formatted

## COMPONENT REUSE HIERARCHY
1. Existing layout (`_layouts/*.html`)
2. Existing include (`_includes/*.html`)
3. Existing utility component (timeline-item, crime-card, stat)
4. New include (only with documented rationale)

## COMPONENT RULES
- NO inline `<style>` or `style=""` attributes
- Use CSS classes: `.btn-primary`, `.btn-supporter`, `.btn-activist`, `.btn-patron`, `.cta-link`
- NO new CSS unless pattern used ≥3 times
- Prefix includes with domain (`merch-`, `profile-`, etc.)
- Document all new includes in `_docs/improvements.md`
- Link to `_docs/component-inventory.md`

## DECISION FRAMEWORK
### Auto-Proceed When:
- Task has clear completion criteria
- Task requires <4 hours effort
- Task has low breaking risk

### Pause When:
- Major milestone reached
- Task requires >8 hours effort
- Significant architectural changes needed

## BACKLOG MANAGEMENT
- All tasks are tracked in `_docs/backlog-all.md` using the format: `[ ] | TASK_ID | DESCRIPTION | DoD`
- Status: `[ ]` pending, `[x]` complete
- Use unique task IDs (T001, T002...)
- Include Definition of Done
- Never edit below "--- !IMPORTANT: DONT EDIT BELOW ---"

--- !IMPORTANT: DONT EDIT BELOW ---
### Editing Rules
1. Anything below this line is off limits for editing!
2. Use [ ] or [x] for STATUS
3. Keep task descriptions clear with measurable DoD
4. After backlog cleanup, process each task until resolved
5. If a task cannot be completed automatically, pick the optimal solution
6. Only consider backlog complete when all items are resolved or deferred
