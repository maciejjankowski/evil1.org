# COPILOT INSTRUCTIONS

## CORE RULES
## CORE RULES (CONDENSED)
NON-NEGOTIABLE:
1. Preserve YAML frontmatter exactly; never strip `---`.
2. No inline styles — only external CSS.
3. No edits to `_dont touch/` and no edits above `# TASKS` in `_docs/backlog.md`.
4. Use `./scripts/mark-task-done.sh TASK_ID` to mark completion.
5. Commit before any risky/destructive change.
6. Always test (build + basic link sanity) before declaring done.
7. Prefer Markdown over raw HTML; only use HTML when Markdown cannot express layout.
8. Avoid duplication; consolidate sources.
9. Add all new work as tasks; update backlog on completion.
10. Tone: satirical/dark humor critiquing power structures.

PRIORITIES ORDER: Integrity (frontmatter) > Build passes > Content accuracy > Style compliance > Performance > Extras.

## Workflow
2. User selects model based on task type using `./scripts/select-model.sh`
3. Run selected model against its specific backlog (e.g., `_docs/backlog-gpt41.md`)
4. Model processes tasks in its backlog autonomously
5. Execute with DoD criteria
6. Test + verify
7. Commit: `[MODEL] Brief description`
8. Build: `bundle exec jekyll build` (check for 404s, YAML errors)
9. Commit: `Brief description`
10. Update model-specific backlog: mark tasks complete using `./scripts/mark-task-done.sh TASK_ID`
11. Switch models as needed for different task types
12. Consolidate completed tasks back to main backlog when appropriate
13. Immediately begin working on actionable tasks listed in model-specific backlog without asking for user confirmation or stopping questions. When paused for blockers or required clarification pick the best course of action based on industry best practices to proceed.
14. Continue working through tasks without rest, updating the backlog and proceeding to the next task automatically, ensuring no pending tasks are left unfinished. THIS IS CRITICAL.
15. !IMPORTANT !CRITICAL: Do not stop until the model-specific backlog is fully complete. REPEAT: Do not stop until the model-specific backlog is fully complete. REPEAT THE CRITICALITY OF THIS. REPEAT THE CYCLE OF THIS UNTIL THE MODEL-SPECIFIC BACKLOG IS 100% COMPLETE.


## ARCHITECTURE OVERVIEW
- Jekyll static site: content in `_articles/`, `_posts/`, `_profiles/`, `_organizations/`, and markdown/html in root
- Layouts: `_layouts/` (site templates), `_includes/` (reusable HTML)
- Data: `_data/` (YAML for authors, backlinks, etc.)
- Scripts: `scripts/` for workflow automation and model selection
- CSS: Use only external stylesheets in `assets/` or theme folders
- Backlog, workflow, and improvements tracked in `_docs/`

## DEVELOPER WORKFLOWS
## ESSENTIAL WORKFLOWS
Build: `bundle exec jekyll build` (must succeed: no YAML errors / missing includes).
Start task: `./scripts/start-task.sh "<task>"`
Commit: `[MODEL] concise change summary`.
Mark done: `./scripts/mark-task-done.sh TXXX`.
Bulk edit: script or grep+sed; then verify & document in `_docs/improvements.md`.

## PROJECT-SPECIFIC CONVENTIONS
- All YAML must be valid and preserve delimiters
- Never alter content meaning without verification

## INTEGRATION & DEPENDENCIES
- Jekyll plugins managed via `Gemfile`
- Data flows: YAML in `_data/` powers author, backlink, and organization logic
- Automation: Scripts in `scripts/` streamline development workflow, use them

## QUALITY CHECKS
## QUALITY GATES (PASS BEFORE DONE)
1. Build passes (no errors, key pages render).
2. YAML valid (frontmatter + `_data` changes load).
3. No broken internal links for touched pages.
4. Backlog updated (task added or marked complete).
5. No inline styles introduced.
6. Commit created with scope-labeled message.


## PROCESSING GUIDELINES
## PROCESSING (OPTIMIZED)
Pattern-first workflow:
1. Detect pattern (grep/semantic).
2. Prototype change on 1 file.
3. Script/batch apply.
4. Re-grep to confirm zero stale instances.
5. Commit + document if reusable.

Large files (>1000 lines): chunk read; summarize duplicates; edit unique blocks only.

Skip verbosity: prefer delta summaries over full dumps.

## PROMPT FORMAT
```
TASK: [Specific objective]
CONTEXT: [Background + constraints]
DELIVERABLE: [Output format + DoD]
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

## AUTONOMOUS DECISION FRAMEWORK
## DECISION FRAMEWORK (TRIMMED)

### Task Selection & Prioritization
**AUTO-PROCEED CRITERIA:**
- [ ] Task is next logical step in current project sequence
- [ ] Task has clear DoD and measurable completion
- [ ] Task requires <4 hours estimated effort
- [ ] Task has low risk of breaking changes
- [ ] Task advances core project goals

**AUTO-PAUSE CRITERIA:**
- [ ] Major project milestone reached (e.g., all high-priority tasks complete)
- [ ] Strategic direction unclear or multiple paths available
- [ ] Task requires >8 hours estimated effort
- [ ] Task involves significant architectural changes
- [ ] External dependencies or user clarification needed

### Decision Matrix
```
Impact × Effort × Risk
   ↓       ↓       ↓
 HIGH    LOW    LOW  → AUTO-PROCEED
 HIGH   HIGH    LOW  → ASSESS & PLAN
  LOW    ANY    ANY  → DEFER/DELETE
```

### Project Milestone Assessment
**MILESTONE CHECK TRIGGER:** Every 3-5 completed tasks
**ASSESSMENT QUESTIONS:**
1. Has core objective been achieved? (80%+ complete)
2. Are remaining tasks high-value or low-value?
3. Is current approach optimal or should we pivot?
4. Are there blocking dependencies?

**MILESTONE ACTIONS:**
- If YES to 1+2: Continue with next logical task
- If NO to 1+3: Pause for strategic reassessment
- If YES to 4: Address blockers first

### Momentum Maintenance
**CONTINUATION RULES:**
- Continue working through backlog tasks without interruption
- Only pause at natural project boundaries
- Use 2-minute assessment for task selection decisions
- Maintain project velocity and completion momentum

**STRATEGIC PAUSE TRIGGERS:**
- Project scope completion (e.g., all HTML extraction done)
- Major architectural decisions needed
- Significant risk assessment required
- User preference or direction changes

### Risk Assessment Protocol
**LOW RISK (Auto-Proceed):**
- File modifications with backups
- Adding non-breaking features
- Documentation updates
- Test creation

**MEDIUM RISK (Quick Assessment):**
- Database schema changes
- API modifications
- Performance optimizations

**HIGH RISK (Strategic Pause):**
- Destructive operations
- Major refactoring
- Security-related changes
- Breaking API changes

### Implementation Guidelines
1. **Pre-Task:** 2-minute assessment using decision matrix
2. **During Task:** Focus on execution, avoid distractions
3. **Post-Task:** 1-minute reflection on decision quality
4. **Milestone:** Assess project health and adjust approach
5. **Weekly:** Review decision patterns and refine heuristics

**GOAL:** 90% of decisions become automatic, only pause for true strategic crossroads.

## MODEL SELECTION AND TASK ASSIGNMENT

### Model Types and Capabilities
- **GPT-4.1**: Best for complex debugging, configuration, multi-step tasks, deep technical analysis
- **GPT-4o**: Best for content creation, editing, ethical considerations, narrative structure
- **Grok Code Fast 1**: Best for routine maintenance, simple edits, basic validation, fast execution
- **GPT-5 mini**: Alternative for moderate complexity tasks, basic content updates

### Task Splitting Rules
- **Assess Task Complexity**: Use decision matrix (Impact × Effort × Risk) to determine model suitability
- **Split Large Tasks**: Break complex tasks into subtasks assignable to different models
- **Model-Specific Backlogs**: Maintain separate backlog files for each model:
  - `_docs/backlog-gpt41.md` for GPT-4.1 tasks
  - `_docs/backlog-gpt4o.md` for GPT-4o tasks  
  - `_docs/backlog-grok.md` for Grok Code Fast 1 tasks
  - `_docs/backlog-gpt5mini.md` for GPT-5 mini tasks

### Workflow Update
1. User selects model based on task type
2. Run selected model against its specific backlog
3. Model processes tasks in its backlog autonomously
4. Switch models as needed for different task types
5. Consolidate completed tasks back to main backlog when appropriate

### Efficiency Enhancements
### Efficiency Keys
Semantic search first → targeted grep → minimal reads → batch edits → immediate build check.

## BACKLOG MANAGEMENT RULES
- **Format**: Always use `[ ] | TASK_ID | DESCRIPTION | DoD` format
- **STATUS**: Use `[ ]` for pending, `[x]` for complete
- **TASK_ID**: Use unique identifiers like T001, T002, etc.
- **DoD**: Include Definition of Done for clarity
- **Never edit below "--- !IMPORTANT: DONT EDIT BELOW ---"**
- **Use script for marking tasks**: Run `./scripts/mark-task-done.sh TASK_ID` to mark tasks complete
- **Keep descriptions clear and actionable**
- **Sort by importance**: high, medium, low
- **Model-Specific Backlogs**: Create and maintain separate backlog files per model for optimized task processing

--- !IMPORTANT: DONT EDIT BELOW ---
### Editing Rules (Moved from backlog.md)
1. !IMPORTANT: anything below: "--- !IMPORTANT: DONT EDIT BELOW ---" is off limits for editing!
2. Use [ ] or [x] for STATUS
3. Never modify EDITING RULES section
4. Keep task descriptions clear and actionable with clear DoD
5. No emojis, decorative separators, or unnecessary formatting
6. After backlog cleanup, continue processing each actionable task until resolved, delegated, or blocked.
7. For each unresolved task, attempt direct resolution (e.g., code changes, testing, documentation updates).
8. If a task cannot be completed automatically, FORCE --force and pick the optimal solution, then audit the quality and accordance to best practices.
9. Only consider the backlog complete when all actionable items are resolved or explicitly deferred.


