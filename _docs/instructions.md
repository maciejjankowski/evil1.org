# CORE INSTRUCTIONS

## CRITICAL RULES
- **NEVER** modify `_dont touch/` files
- **NEVER** alter `backlog.md` header (above "# TASKS")
- **NEVER** run destructive commands without committing
- **NEVER** use inline styles - use external CSS
- **NEVER** alter content meaning without verification
- **ALWAYS** preserve YAML delimiters (`---`) and meta information
- **ALWAYS** read instructions before work

## QUALITY STANDARDS
- **Truth First**: Verified sources only
- **Journalistic Integrity**: No manipulation
- **Developer Focus**: Simple, practical solutions
- **Quality Code**: Best practices, testing

## PROMPT ENGINEERING

### Core Prompt Structure
```
READ: _docs/instructions.md, _docs/workflow.md, _docs/backlog.md

TASK: [Specific, measurable objective]
CONTEXT: [Background, constraints, requirements]
DELIVERABLE: [Output format, DoD criteria]
MODEL: [Grok/GPT-4.1/GPT-4o/GPT-5 mini]
```

## DEFINITION OF DONE (DoD)

### Core DoD Template
```
✅ FUNCTIONAL: [Measurable working criteria]
✅ QUALITY: [Standards met]
✅ TESTING: [Validation completed]
✅ DOCUMENTATION: [Updates made]
✅ BACKLOG: [Task status updated in _docs/backlog.md]
✅ VERIFICATION: [Review completed]
```

### Examples

#### Code Implementation
```
✅ Code compiles, no regressions
✅ Tests pass, edge cases covered
✅ Code follows conventions
✅ Documentation updated
✅ Backlog updated with task completion
✅ No breaking changes
```


## EXECUTION PROTOCOL

### Session Setup
1. Read core files (instructions.md, workflow.md, backlog.md)
2. Assess complexity → Select model
3. Define DoD criteria
4. Execute with precision
5. Verify against DoD
6. **Update backlog.md**: Mark completed tasks with [x], add new tasks if discovered
7. Commit: `[MODEL] Brief description`

### Quality Assurance
- [ ] Functionality tested
- [ ] No 404 errors
- [ ] Site builds successfully
- [ ] YAML syntax valid
- [ ] Documentation updated
- [ ] **Backlog updated with completed tasks**

### Backlog Management Protocol
**MANDATORY**: After completing any task or work session, the AI agent MUST:
1. Update `_docs/backlog.md` with completed tasks
2. Mark completed items with [x] in the COMPLETED TASKS section
3. Add any new tasks discovered during work to the PENDING TASKS section
4. Ensure task descriptions are clear and actionable
5. Never modify the header section above "# TASKS"

**TRIGGER CONDITIONS**:
- After completing a task (regardless of size)
- When discovering new work requirements during execution
- At the end of any work session
- When fixing bugs or issues that weren't previously tracked

## FILE ORGANIZATION
- **instructions.md**: Core rules, quality framework
- **workflow.md**: Execution protocols, model selection
- **backlog.md**: Task management
- **improvements.md**: Technical best practices
- **CONTENT_FORMAT_STANDARDS.md**: Content specs
- **fat.md**: Archive

## CONTINUOUS IMPROVEMENT
- Document learnings in improvements.md
- Refine instructions with better approaches
- Update DoD templates based on experience
- Optimize prompts for precision
- **MANDATORY**: Update backlog.md after every task completion
- Track backlog update compliance in performance metrics

## 📚 FILE ORGANIZATION
- **instructions.md**: This file (core rules, quality framework)
- **workflow.md**: Development process, model selection
- **backlog.md**: Task management
- **improvements.md**: Technical best practices
- **CONTENT_FORMAT_STANDARDS.md**: Content specifications
- **fat.md**: Archive and historical reference

## 📈 CONTINUOUS IMPROVEMENT
- Document learnings from each task
- Update instructions with new patterns
- Refine DoD criteria based on experience
- Optimize prompts for better precision