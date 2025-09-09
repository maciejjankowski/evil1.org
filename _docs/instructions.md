# CORE INSTRUCTIONS

## CRITICAL RULES
- **NEVER** modify `_dont touch/` files
- **NEVER** alter `backlog.md` header (above "# TASKS")
- **NEVER** run destructive commands without committing
- **NEVER** use inline styles - use external CSS
- **NEVER** alter content meaning without verification
- **ALWAYS** preserve YAML delimiters (`---`)
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

### Task-Specific Prompts

#### Code Tasks
```
TASK: [Specific change]
REQUIREMENTS: [Specs, edge cases]
TESTING: [Validation methods]
DELIVERABLE: [Files, commit format]
MODEL: [Selected]
DoD: [Completion criteria]
```

#### Content Tasks
```
TASK: [Objective, word count]
SOURCES: [Verified references]
COMPLIANCE: [Fact-checking, ethics]
DELIVERABLE: [Format, SEO, review]
MODEL: GPT-4o
DoD: [Quality gates]
```

#### Debug Tasks
```
ISSUE: [Specific problem]
CONTEXT: [Environment, changes]
DIAGNOSTIC: [Tools, reproduction]
DELIVERABLE: [Fix, testing, docs]
MODEL: GPT-4.1
DoD: [Resolution criteria]
```

## MODEL SELECTION MATRIX

| Complexity | Examples | Model | Rationale |
|------------|----------|-------|-----------|
| **Low** | File edits, validation | Grok Fast 1 | Speed, reliability |
| **Medium** | Content, standard debug | GPT-5 mini | Balance, quality |
| **High** | Complex debug, config | GPT-4.1 | Depth, analysis |
| **Special** | Ethical content, docs | GPT-4o | Quality, compliance |

## DEFINITION OF DONE (DoD)

### Core DoD Template
```
✅ FUNCTIONAL: [Measurable working criteria]
✅ QUALITY: [Standards met]
✅ TESTING: [Validation completed]
✅ DOCUMENTATION: [Updates made]
✅ VERIFICATION: [Review completed]
```

### Examples

#### Code Implementation
```
✅ Code compiles, no regressions
✅ Tests pass, edge cases covered
✅ Code follows conventions
✅ Documentation updated
✅ No breaking changes
```

#### Content Creation
```
✅ Verified sources, fact-checked
✅ Meets format/length specs
✅ SEO optimized
✅ Links tested (no 404s)
✅ Editorial review passed
```

## EXECUTION PROTOCOL

### Session Setup
1. Read core files (instructions.md, workflow.md, backlog.md)
2. Assess complexity → Select model
3. Define DoD criteria
4. Execute with precision
5. Verify against DoD
6. Commit: `[MODEL] Brief description`

### Quality Assurance
- [ ] Functionality tested
- [ ] No 404 errors
- [ ] Site builds successfully
- [ ] YAML syntax valid
- [ ] Documentation updated

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