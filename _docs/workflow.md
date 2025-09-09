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

This framework ensures consistent, high-quality execution with precise prompts and measurable outcomes.
