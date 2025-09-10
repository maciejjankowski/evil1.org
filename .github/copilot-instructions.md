# COPILOT INSTRUCTIONS

## CORE RULES
- **NEVER** modify `_dont touch/` files
- **NEVER** alter `_docs/backlog.md` headers or metadata. preferably never edit above the "# TASKS" section. Only change task status checkboxes in the # TASKS section and use the script `./scripts/mark-task-done.sh TASK_ID` to avoid errors.
- **NEVER** run destructive commands without committing
- **NEVER** use inline styles – use external CSS in `_includes/`, `assets/`, or theme folders
- **ALWAYS** modifying textual content unless specifically asked and preserve YAML frontmatter. This is CRITICAL.
- **ALWAYS** test changes before completion. This is CRITICAL.
- **ALWAYS** preserve YAML frontmatter delimiters `---` at start and end of files
- **ALWAYS** avoid duplication – consolidate similar content into one authoritative source
- **ALWAYS** add new tasks to `_docs/backlog.md`.
- when creating new content, ensure it aligns with the site's dark humor and satirical tone, using satire and irony to critique power structures and societal issues
- when creating new content STRONGLY PREFER using markdown syntax for formatting (e.g., headings, lists, links) instead of raw HTML, unless specific HTML elements are required for functionality or styling that cannot be achieved with markdown. ALWAYS OPTIMIZE FOR FRONTMATTER COMPATIBILITY AND READABILITY.
- ALWAYS end a task in performing commits and updating the backlog. This is CRITICAL.

## Workflow
1. Read `readme.md`, `_docs/instructions.md` + `_docs/workflow.md`
2. Assess complexity → Select model
3. Execute with DoD criteria
4. Test + verify
5. Commit: `[MODEL] Brief description`
3. Build: `bundle exec jekyll build` (check for 404s, YAML errors)
5. Commit: `Brief description`
6. Update backlog: `_docs/backlog.md` only marking tasks as complete, only adding new tasks to break up large tasks if absolutely necessary. when marking tasks complete use the script `./scripts/mark-task-done.sh TASK_ID` to avoid errors. 
7. Immediately begin working on actionable tasks listed in `_docs/backlog.md` without asking for user confirmation or stopping questions. When paused for blockers or required clarification pick the best course of action based on industry best practices to proceed.
8. Continue working through tasks without rest, updating the backlog and proceeding to the next task automatically, ensuring no pending tasks are left unfinished. THIS IS CRITICAL.
9. !IMPORTANT !CRITICAL: Do not stop until the backlog is fully complete. REPEAT: Do not stop until the backlog is fully complete. REPEAT THE CRITICALITY OF THIS. REPEAT THE CYCLE OF THIS UNTIL THE BACKLOG IS 100% COMPLETE.


## ARCHITECTURE OVERVIEW
- Jekyll static site: content in `_articles/`, `_posts/`, `_profiles/`, `_organizations/`, and markdown/html in root
- Layouts: `_layouts/` (site templates), `_includes/` (reusable HTML)
- Data: `_data/` (YAML for authors, backlinks, etc.)
- Scripts: `scripts/` for workflow automation and model selection
- CSS: Use only external stylesheets in `assets/` or theme folders
- Backlog, workflow, and improvements tracked in `_docs/`

## DEVELOPER WORKFLOWS
- **Build site:** `bundle exec jekyll build` (check for 404s, YAML errors)
- **Start new task:** `./scripts/start-task.sh "<task>"` (initializes with model selection)
- **Commit format:** `[MODEL] Brief description` (see workflow.md)
- **Backlog update:** Mark completed tasks in `_docs/backlog.md` (never edit above "# TASKS")
- **Bulk operations:** For repetitive content, use grep and scripts for efficiency; document patterns in `_docs/improvements.md`

## PROJECT-SPECIFIC CONVENTIONS
- All YAML must be valid and preserve delimiters
- Never alter content meaning without verification

## INTEGRATION & DEPENDENCIES
- Jekyll plugins managed via `Gemfile`
- Data flows: YAML in `_data/` powers author, backlink, and organization logic
- Automation: Scripts in `scripts/` streamline development workflow, use them

## QUALITY CHECKS
- [ ] Site builds: `bundle exec jekyll build`
- [ ] YAML valid
- [ ] Changes tested
- [ ] Documentation updated
- [ ] Backlog updated
- [ ] No 404 errors


## PROCESSING GUIDELINES
- To bulk update repeated HTML: Use `grep` and `sed` for in-place editing
- Avoid repetitive processing of similar content; summarize or skip redundant sections in large files
- When encountering loops in content (e.g., repeated patterns like in panama.md), process only unique sections and note the repetition
- For files with extensive repetitive content, provide a high-level summary rather than detailed edits for each instance
- Prioritize efficiency: if a pattern repeats, apply changes to one instance and generalize the approach
- **Detection and Handling of Repetitive Patterns**: Before processing, scan for repeated structures (e.g., identical HTML tags, similar text blocks). Apply bulk replacements or template-based fixes.
- **Threshold Limits**: For files over 1,000 lines with >50% repetitive content, focus on pattern identification rather than line-by-line editing.
- **Fallback Strategy**: If repetitive processing begins, pause and request user confirmation for bulk operations.
- **Documentation**: Note repetitive patterns in `_docs/improvements.md` for future reference and automated handling.
- **Chunked Processing**: For large files, use read_file with limit and offset parameters to process in smaller chunks (e.g., 500-1000 lines at a time).
- **File Size Assessment**: Before full processing, check file size and estimate processing time; for files >10MB or >5000 lines, use chunked approach.
- **Incremental Reading**: Read sections incrementally, focusing on relevant parts first to avoid getting stuck on entire files.
- **Pattern Location with grep_search**: Use grep_search to locate all instances of repetitive patterns before processing to plan bulk operations.
- **Bulk Replacement Strategy**: For identical patterns, apply replacements sequentially in chunks to ensure completeness without loops.
- **Verification of Completion**: After bulk operations, re-run grep_search to confirm no remaining instances and validate the changes.
- **Output Management**: Avoid generating large summaries in responses; keep outputs concise and suppress unnecessary details.
- **Context Length Management**: For large files or repetitive content, implement a chunking strategy:
  - Break tasks into smaller subtasks that can be handled within context limits
  - Use targeted grep searches instead of loading entire files
  - Implement batch processing for repeated operations
  - Create scripts for bulk operations rather than attempting to process everything in one session
  - Avoid unnecessary file reads when patterns are already identified
  - When processing multiple similar files, work with representative samples first

## PROMPT FORMAT
```
TASK: [Specific objective]
CONTEXT: [Background + constraints]
DELIVERABLE: [Output format + DoD]
MODEL: [Selected model]
```

## VERIFICATION
1. Test functionality
2. apply fixes to backlog if needed

## BACKLOG MANAGEMENT RULES
- **Format**: Always use `[ ] | TASK_ID | DESCRIPTION | DoD` format
- **STATUS**: Use `[ ]` for pending, `[x]` for complete
- **TASK_ID**: Use unique identifiers like T001, T002, etc.
- **DoD**: Include Definition of Done for clarity
- **Never edit below "--- !IMPORTANT: DONT EDIT BELOW ---"**
- **Use script for marking tasks**: Run `./scripts/mark-task-done.sh TASK_ID` to mark tasks complete
- **Keep descriptions clear and actionable**
- **Sort by importance**: high, medium, low

## EVIL1.ORG COPILOT INSTRUCTIONS (COMPACT)

### Core Rules
- Never modify `_dont touch/` files
- No destructive commands without commit
- No inline styles; use only external CSS
- Always verify sources and preserve YAML frontmatter
- Always test changes before completion

### Architecture
- Jekyll static site: content in `_articles/`, `_posts/`, `_profiles/`, `_organizations/`, markdown/html in root
- Layouts: `_layouts/`, includes: `_includes/`, data: `_data/` (YAML)
- Scripts: `scripts/` for automation/model selection
- CSS: only in `assets/` or theme folders
- Javascript: minimal, only for interactivity, use htmx and alpine.js, use chart.js for charts, no heavy frameworks, use CDN for libraries, use minimal custom JS, no bundlers, no transpilers, 


