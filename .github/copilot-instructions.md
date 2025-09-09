# EVIL1.ORG COPILOT INSTRUCTIONS


## CORE RULES
- **NEVER** modify `_dont touch/` files
- **NEVER** alter `_docs/backlog.md` header (above "# TASKS")
- **NEVER** run destructive commands without committing
- **NEVER** use inline styles – use external CSS in `_includes/`, `assets/`, or theme folders
- **ALWAYS** verify sources for content and preserve YAML frontmatter
- **ALWAYS** test changes before completion

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
- **Select model:** `./scripts/select-model.sh <type>` (see scripts/README.md for types)
- **Commit format:** `[MODEL] Brief description` (see workflow.md)
- **Backlog update:** Mark completed tasks in `_docs/backlog.md` (never edit above "# TASKS")
- **Bulk operations:** For repetitive content, use grep and scripts for efficiency; document patterns in `_docs/improvements.md`

## PROJECT-SPECIFIC CONVENTIONS
- All YAML must be valid and preserve delimiters
- Never alter content meaning without verification
- Use only external CSS, never inline
- Document new patterns and learnings in `_docs/improvements.md`
- For large/repetitive files, process only unique sections and note repetition

## INTEGRATION & DEPENDENCIES
- Jekyll plugins managed via `Gemfile`
- Data flows: YAML in `_data/` powers author, backlink, and organization logic
- Cross-component: Articles reference profiles, organizations, and authors via YAML keys
- Automation: Scripts in `scripts/` streamline model selection and workflow

## EXAMPLES
- To fix 404s in education: `./scripts/start-task.sh "Fix 404 errors in education section"`
- To select model for debugging: `./scripts/select-model.sh debug` (returns GPT-4.1)
- To bulk update repeated HTML: Use `grep` and document in `_docs/improvements.md`

## QUALITY CHECKS
- [ ] Site builds: `bundle exec jekyll build`
- [ ] YAML valid
- [ ] Changes tested
- [ ] Documentation updated
- [ ] Backlog updated

## REFERENCES
- `README.md`, `_docs/instructions.md`, `_docs/workflow.md`, `scripts/README.md`, `_docs/backlog.md`, `_docs/improvements.md`

## PROCESSING GUIDELINES
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

## WORKFLOW
1. Read `readme.md`, `_docs/instructions.md` + `_docs/workflow.md`
2. Assess complexity → Select model
3. Execute with DoD criteria
4. Test + verify
5. Commit: `[MODEL] Brief description`

## MODEL SELECTION
| Complexity | Model | Use Case |
|------------|-------|----------|
| Low | Grok Code Fast 1 | File edits, validation, simple fixes |
| Medium | GPT-5 mini | Content creation, standard debugging |
| High | GPT-4.1 | Complex debugging, multi-step tasks |
| Special | GPT-4o | Ethical content, documentation |

## QUALITY CHECKS
- [ ] No 404 errors
- [ ] Site builds: `bundle exec jekyll build`
- [ ] YAML valid
- [ ] Changes tested
- [ ] Documentation updated

## PROMPT FORMAT
```
TASK: [Specific objective]
CONTEXT: [Background + constraints]
DELIVERABLE: [Output format + DoD]
MODEL: [Selected model]
```

## VERIFICATION
1. Test functionality
2. Check links
3. Build site
4. Verify YAML
5. Commit properly

## LEARNING
- Update `_docs/improvements.md` with new patterns
- Refine `_docs/instructions.md` with better approaches
- Maintain single sources of truth</content>
<parameter name="filePath">/Users/mj/code/evil1.org/_docs/ai-instructions.md

---
layout: default
title: "workflow"
author: "AI Assistant"
date: "2025-09-08"description: "Comprehensive development workflow with Copilot model selection for Jekyll site development"
permalink: "/workflow/"
---

# DEVELOPMENT WORKFLOW

## QUICK START
```bash
# Assess → Select Model → Execute → Verify
./scripts/start-task.sh "Fix 404 errors in education section"
./scripts/select-model.sh debug    # Returns: GPT-4.1 (complex debugging)
```

## SESSION SETUP
```
READ: _docs/instructions.md, _docs/workflow.md, _docs/backlog.md
CONFIRM: Core rules understood, model selected, DoD defined
```

## MODEL SELECTION MATRIX

| Complexity | Examples | Model | Focus |
|------------|----------|-------|-------|
| **Low** | File edits, validation | Grok Fast 1 | Speed, reliability |
| **Medium** | Content, standard debug | GPT-5 mini | Balance, quality |
| **High** | Complex debug, config | GPT-4.1 | Depth, analysis |
| **Special** | Ethical content, docs | GPT-4o | Quality, compliance |

## EXECUTION WORKFLOWS

### GPT-4.1 (Complex Tasks)
```bash
# 1. Deep Analysis
- Use verbose debugging flags
- Comprehensive error analysis
- Multi-step problem solving
- Thorough testing and validation

# 2. Quality Verification
- Cross-reference with existing patterns
- Test edge cases and failure modes
- Document findings and solutions
- Update knowledge base
```

### GPT-5 mini (Balanced Tasks)
```bash
# 1. Balanced Execution
- Moderate analysis and debugging
- Standard development practices
- Quality-focused implementation
- Comprehensive but efficient testing

# 2. Documentation
- Update task documentation
- Note model performance insights
- Document any learnings discovered
```

### Grok Fast 1 (Routine Tasks)
```bash
# 1. Efficient Execution
- Quick file operations and validation
- Routine maintenance and simple fixes
- Basic testing and verification
- Fast iteration on straightforward tasks

# 2. Minimal Documentation
- Brief commit messages
- Update only essential references
- Focus on execution speed
```

### GPT-4o (Content/Ethical Tasks)
```bash
# 1. Quality-First Execution
- High-quality content creation
- Ethical content review and validation
- Narrative structure optimization
- Comprehensive fact-checking

# 2. Compliance Documentation
- Detailed content analysis
- Ethical considerations documentation
- Quality assurance verification
- Source validation records
```

## QUALITY ASSURANCE

### Universal QA Protocol
```yaml
✅ FUNCTIONAL: Code works as specified, no regressions
✅ QUALITY: Meets coding/content standards, follows best practices
✅ TESTING: All test cases pass, edge cases covered
✅ DOCUMENTATION: Code documented, instructions updated
✅ VERIFICATION: Independent review completed, DoD met
```

### Commit Format Standard
```
[MODEL] Brief task description
- Key changes implemented
- Quality verification completed
- Documentation updated
```

## EMERGENCY PROTOCOLS

### When Model Selection is Wrong
1. **Immediate Assessment**: Evaluate if task complexity changed
2. **Model Switch**: Select appropriate model for current complexity
3. **Context Preservation**: Maintain work done, avoid restart
4. **Documentation**: Note switching reason for future reference

### When Task Becomes Complex
1. **Stop Current Approach**: Prevent inefficient work
2. **Reassess Scope**: Break into smaller tasks if needed
3. **Model Upgrade**: Switch to GPT-4.1 for complex scenarios
4. **DoD Refinement**: Update completion criteria for new scope

### When Quality Issues Detected
1. **Pause Execution**: Stop work on current deliverable
2. **Quality Review**: Assess against DoD criteria
3. **Remediation Plan**: Define fixes and prevention measures
4. **Verification**: Independent review before proceeding

## PERFORMANCE TRACKING

### Success Metrics
- **Task Completion Rate**: Percentage of tasks meeting DoD first time
- **Model Efficiency**: Average time per complexity level
- **Quality Score**: Percentage of deliverables passing QA
- **Learning Velocity**: New patterns documented per month

### Continuous Optimization
- **Weekly Review**: Assess model performance and DoD effectiveness
- **Pattern Recognition**: Identify optimal approaches for task types
- **Template Updates**: Refine prompt templates based on results
- **Knowledge Base**: Update instructions.md with new learnings

## REFERENCE ARCHITECTURE

### Core Documentation Structure
- **instructions.md**: Quality framework, critical rules, DoD templates
- **workflow.md**: Execution protocols, model selection, QA processes
- **backlog.md**: Task management and progress tracking
- **improvements.md**: Technical best practices and debugging guides
- **CONTENT_FORMAT_STANDARDS.md**: Content specifications and standards
- **fat.md**: Historical archive and deprecated content

### Content-Specific Files
- **content-creation-plan.md**: Content strategy and planning
- **image_prompts.md**: AI image generation specifications
- **slogans.md**: Advertising and marketing content
- **stories.md**: Content ideas and publishing concepts
- **strategy.md**: Narrative and communication strategy
- **topics.md**: Content topics and themes
- **suggestions.md**: Technical improvement suggestions
- **validate_organizations.sh**: Automated validation scripts
AUDIENCE: [Target readers, tone, style guidelines]
COMPLIANCE: [Fact-checking requirements, ethical boundaries]
DELIVERABLE: [Format specs, SEO requirements, review process]
MODEL: GPT-4o
DoD: [Quality gates, verification steps]
```

### Debugging/Issue Resolution Prompt
```
ISSUE: [Specific problem with symptoms]
CONTEXT: [Environment, recent changes, affected systems]
DIAGNOSTIC: [Tools to use, reproduction steps, log analysis]
ROOT_CAUSE: [Hypothesized cause, investigation approach]
DELIVERABLE: [Fix implementation, testing plan, documentation]
MODEL: GPT-4.1
DoD: [Resolution criteria, prevention measures]
```

## ⚡ EXECUTION WORKFLOWS

### Phase 1: Task Analysis & Planning
1. **Read Context**: instructions.md, workflow.md, backlog.md
2. **Assess Complexity**: Match to model selection matrix
3. **Define DoD**: Specific, measurable completion criteria
4. **Break Down**: Complex tasks → actionable subtasks

### Phase 2: Model-Specific Execution

#### GPT-4.1 Workflow (Complex Tasks)
```bash
# 1. Deep Analysis
- Use verbose debugging flags
- Comprehensive error analysis
- Multi-step problem solving
- Thorough testing and validation

# 2. Quality Verification
- Cross-reference with existing patterns
- Test edge cases and failure modes
- Document findings and solutions
- Update knowledge base
```

#### GPT-5 mini Workflow (Balanced Tasks)
```bash
# 1. Balanced Execution
- Moderate analysis and debugging
- Standard development practices
- Quality-focused implementation
- Comprehensive but efficient testing

# 2. Documentation
- Update task documentation
- Note model performance insights
- Document any learnings discovered
```

#### Grok Code Fast 1 Workflow (Routine Tasks)
```bash
# 1. Efficient Execution
- Quick file operations and validation
- Routine maintenance and simple fixes
- Basic testing and verification
- Fast iteration on straightforward tasks

# 2. Minimal Documentation
- Brief commit messages
- Update only essential references
- Focus on execution speed
```

#### GPT-4o Workflow (Content/Ethical Tasks)
```bash
# 1. Quality-First Execution
- High-quality content creation
- Ethical content review and validation
- Narrative structure optimization
- Comprehensive fact-checking

# 2. Compliance Documentation
- Detailed content analysis
- Ethical considerations documentation
- Quality assurance verification
- Source validation records
```

### Phase 3: Quality Assurance & Completion

#### Universal QA Protocol
```yaml
✅ FUNCTIONAL: Code works as specified, no regressions
✅ QUALITY: Meets coding/content standards, follows best practices
✅ TESTING: All test cases pass, edge cases covered
✅ DOCUMENTATION: Code documented, instructions updated
✅ BACKLOG: Task status updated in _docs/backlog.md
✅ VERIFICATION: Independent review completed, DoD met
```

#### Backlog Update Requirements
**MANDATORY for AI Agents**:
- Update `_docs/backlog.md` after every task completion
- Mark completed tasks with [x] in COMPLETED TASKS section
- Add new discovered tasks to PENDING TASKS section
- Maintain clear, actionable task descriptions
- Never modify header section above "# TASKS"

#### Commit Format Standard
```
[MODEL] Brief task description
- Key changes implemented
- Quality verification completed
- Documentation updated
```

## 🎯 ADVANCED DoD REFINEMENT TECHNIQUES

### DoD Template Customization
```
✅ [DOMAIN]: [Specific measurable criteria]
✅ [ASPECT]: [Quality standard with verification method]
✅ [VERIFICATION]: [How to confirm requirement met]
✅ [DOCUMENTATION]: [What must be recorded]
✅ [PREVENTION]: [How to avoid similar issues]
```

### Task-Specific DoD Examples

#### API Integration DoD
```
✅ FUNCTIONAL: API calls successful, error handling works
✅ SECURITY: No sensitive data exposure, proper authentication
✅ PERFORMANCE: Response times within SLA, rate limiting implemented
✅ TESTING: Unit tests cover all endpoints, integration tests pass
✅ DOCUMENTATION: API documentation updated, usage examples provided
```

#### Database Migration DoD
```
✅ DATA: All data migrated accurately, no loss or corruption
✅ SCHEMA: New schema matches specifications, constraints applied
✅ PERFORMANCE: Query performance maintained or improved
✅ ROLLBACK: Rollback plan tested and documented
✅ VERIFICATION: Data integrity checks pass, business logic validated
```

#### Security Implementation DoD
```
✅ VULNERABILITY: No known security issues introduced
✅ COMPLIANCE: Meets security standards and regulations
✅ MONITORING: Security events logged and monitored
✅ TESTING: Security tests pass, penetration testing completed
✅ DOCUMENTATION: Security measures documented, incident response plan updated
```

### DoD Refinement Process
1. **Task Analysis**: Identify all success dimensions
2. **Stakeholder Alignment**: Confirm requirements with all parties
3. **Measurable Criteria**: Define specific, observable outcomes
4. **Verification Methods**: Specify how each criterion will be tested
5. **Documentation Requirements**: Define what must be recorded
6. **Continuous Improvement**: Update DoD templates based on experience

## 🚨 EMERGENCY PROTOCOLS

### When Model Selection is Wrong
1. **Immediate Assessment**: Evaluate if task complexity changed
2. **Model Switch**: Select appropriate model for current complexity
3. **Context Preservation**: Maintain work done, avoid restart
4. **Documentation**: Note switching reason for future reference

### When Task Becomes Complex
1. **Stop Current Approach**: Prevent inefficient work
2. **Reassess Scope**: Break into smaller tasks if needed
3. **Model Upgrade**: Switch to GPT-4.1 for complex scenarios
4. **DoD Refinement**: Update completion criteria for new scope

### When Quality Issues Detected
1. **Pause Execution**: Stop work on current deliverable
2. **Quality Review**: Assess against DoD criteria
3. **Remediation Plan**: Define fixes and prevention measures
4. **Verification**: Independent review before proceeding

## 📊 PERFORMANCE TRACKING

### Success Metrics
- **Task Completion Rate**: Percentage of tasks meeting DoD first time
- **Model Efficiency**: Average time per complexity level
- **Quality Score**: Percentage of deliverables passing QA
- **Learning Velocity**: New patterns documented per month

### Continuous Optimization
- **Weekly Review**: Assess model performance and DoD effectiveness
- **Pattern Recognition**: Identify optimal approaches for task types
- **Template Updates**: Refine prompt templates based on results
- **Knowledge Base**: Update instructions.md with new learnings

## 📚 REFERENCE ARCHITECTURE

### Core Documentation Structure
- **instructions.md**: Quality framework, critical rules, DoD templates
- **workflow.md**: Execution protocols, model selection, QA processes
- **backlog.md**: Task management and progress tracking
- **improvements.md**: Technical best practices and debugging guides
- **CONTENT_FORMAT_STANDARDS.md**: Content specifications and standards
- **fat.md**: Historical archive and deprecated content

### Content-Specific Files
- **content-creation-plan.md**: Content strategy and planning
- **image_prompts.md**: AI image generation specifications
- **slogans.md**: Advertising and marketing content
- **stories.md**: Content ideas and publishing concepts
- **strategy.md**: Narrative and communication strategy
- **topics.md**: Content topics and themes
- **suggestions.md**: Technical improvement suggestions
- **validate_organizations.sh**: Automated validation scripts


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