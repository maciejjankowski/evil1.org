# COPILOT INSTRUCTIONS

## CORE RULES (ESSENTIAL)
0. ALL WORK MUST BE FULLY AUTOMATED WITHOUT HUMAN INTERVENTION
0. ALL WORK MUST BE ADDED TO THE BACKLOG AND PROCESSED FROM THERE
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
2. **After layout/CSS changes**: Run `npm test` to check for visual regressions
3. Build → **Visual Test** → Commit → Mark complete → Next task
4. Commit format: `[TASK_ID] Brief description`
5. Update backlog using `./scripts/mark-task-done.sh TASK_ID`
6. Continue without pausing until backlog is complete

## TESTING WORKFLOW
1. **Before committing layout changes**: Run `npm test`
2. **If tests fail**: Check `playwright-report/` for visual differences
3. **Update snapshots**: Run `npm run visual-baseline` if changes are intentional
4. **Verify fixes**: Re-run `npm test` to ensure tests pass

## TESTING SETUP
- **Visual Tests**: `npm test` - Playwright tests run once and exit cleanly
- **Test Reports**: Generated in `playwright-report/` folder (no auto-open)
- **Test Configuration**: 
  - HTML reporter with `outputFolder: 'playwright-report'` and `open: 'never'`
  - Reuses existing Jekyll server on port 4000
  - 10-minute global timeout, 5-second expect timeout
  - Screenshot tolerance: 100 max diff pixels, 20% threshold

## TESTING COMMANDS
- `npm test` - Run all visual regression tests
- `npm run test:headed` - Run tests with browser UI visible
- `npm run test:ui` - Run tests with Playwright UI mode
- `npm run visual-baseline` - Update visual snapshots (after layout changes)
- `npx playwright show-report playwright-report` - View test results manually

## QUALITY CHECKS
1. Build passes: `bundle exec jekyll build` (no YAML errors)
2. **Visual tests pass: `npm test` (no layout regressions)**
   - Tests run automatically and exit cleanly
  ```instructions
  # COPILOT INSTRUCTIONS

  ## CORE RULES (ESSENTIAL)
  0. ALL WORK MUST BE FULLY AUTOMATED WITHOUT HUMAN INTERVENTION
  0. ALL WORK MUST BE ADDED TO THE BACKLOG AND PROCESSED FROM THERE
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
  2. **After layout/CSS changes**: Run `npm test` to check for visual regressions
  3. Build → **Visual Test** → Commit → Mark complete → Next task
  4. Commit format: `[TASK_ID] Brief description`
  5. Update backlog using `./scripts/mark-task-done.sh TASK_ID`
  6. Continue without pausing until backlog is complete

  ## TESTING WORKFLOW
  1. **Before committing layout changes**: Run `npm test`
  2. **If tests fail**: Check `playwright-report/` for visual differences
  3. **Update snapshots**: Run `npm run visual-baseline` if changes are intentional
  4. **Verify fixes**: Re-run `npm test` to ensure tests pass

  ## TESTING SETUP
  - **Visual Tests**: `npm test` - Playwright tests run once and exit cleanly
  - **Test Reports**: Generated in `playwright-report/` folder (no auto-open)
  - **Test Configuration**: 
    - HTML reporter with `outputFolder: 'playwright-report'` and `open: 'never'`
    - Reuses existing Jekyll server on port 4000
    - 10-minute global timeout, 5-second expect timeout
    - Screenshot tolerance: 100 max diff pixels, 20% threshold

  ## TESTING COMMANDS
  - `npm test` - Run all visual regression tests
  - `npm run test:headed` - Run tests with browser UI visible
  - `npm run test:ui` - Run tests with Playwright UI mode
  - `npm run visual-baseline` - Update visual snapshots (after layout changes)
  - `npx playwright show-report playwright-report` - View test results manually

  ## QUALITY CHECKS
  1. Build passes: `bundle exec jekyll build` (no YAML errors)
  2. **Visual tests pass: `npm test` (no layout regressions)**
    - Tests run automatically and exit cleanly
    - Reports saved to `playwright-report/` folder
    - No user interaction required
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

  ## FILE EDITING BEST PRACTICES
  1. Always re-read the target file immediately before editing to capture exact current content (including whitespace and hidden chars).
  2. For `replace_string_in_file`, include 3-5+ lines of unchanged context before/after the target to ensure uniqueness and avoid mismatches.
  3. Verify edits post-change by re-reading the file or running a build/test—don't assume success.
  4. If replacement fails due to string mismatch, fall back to replacing the entire file content or use terminal tools for diffs.
  5. Prefer Markdown restructuring: move HTML to layouts/includes, leave only frontmatter in .md files.
  6. Test builds after any structural changes to catch YAML or rendering errors early.

  ## DECISION FRAMEWORK
  ### Auto-Proceed When:
  - Task has clear completion criteria
  - Task requires <4 hours effort
  - Task involves subjective judgment or trade-offs - pick best option
  - Task is low-risk and reversible
  - Task may introduce significant risk or complexity but has clear rollback plan
  - Task is ambiguous or lacks clear DoD, but can be reasonably interpreted and executed. refine DoD before attempting.
  ### Pause When:

  - Task requires human creativity or nuanced decision-making
  - Task involves ethical considerations or potential harm

## BACKLOG MANAGEMENT
- All tasks are tracked in `_docs/backlog-all.md` using the simplified format: `| STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD`
- Status: `[ ]` pending, `[x]` complete  
- Tasks are sorted by importance: HIGH PRIORITY → MEDIUM PRIORITY → LOW PRIORITY → COMPLETED
- Each task specifies the recommended MODEL (GPT-4.1, GPT-4o, GPT-5 mini, Grok Code Fast 1, Gemini 2.5 Pro)
- Use unique task IDs (T001, T002...)
- Include specific Definition of Done (DoD)
- No unnecessary headers or sections - maximum simplicity  --- !IMPORTANT: DONT EDIT BELOW ---
  ### Editing Rules
  1. Anything below this line is off limits for editing!
  2. Use [ ] or [x] for STATUS
  3. Keep task descriptions clear with measurable DoD
  4. After backlog cleanup, process each task until resolved
  5. If a task cannot be completed automatically, pick the optimal solution
  6. Only consider backlog complete when all items are resolved or deferred

  ```
