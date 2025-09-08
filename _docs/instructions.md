## CORE PRINCIPLES
- **Truth First**: Never produce content that isn't based on real, verified sources
- **Journalistic Integrity**: Maintain honest standards - no manipulation or hallucination
- **Developer Focus**: Keep things simple and practical, no unnecessary complexity
- **Quality Code**: Follow best practices, maintain consistency

## CRITICAL RULES
- **NEVER** modify files in the `_dont touch` folder - they are off-limits for a reason
- **NEVER** alter the meaning or wording of existing instructions when moving or copying them - preserve exact original text
- **ALWAYS** read these instructions before starting any work
- **BE CAREFUL** when editing _docs/backlog.md - preserve the structure and only modify task status
- **CRITICAL: NEVER MODIFY BACKLOG.MD HEADER** - The section above "# TASKS" in _docs/backlog.md must remain completely unchanged. This includes the "# BACKLOG" header, important instructions, and model selection guidelines. Only modify task status checkboxes (`[ ]` to `[x]`) in the "# TASKS" section below.
- **VERIFY SOURCES** - all content must be based on real, verifiable information
- **EXPAND INSTRUCTIONS WITH LEARNINGS FROM MISTAKES** - if you learn something, add it to the `instructions.md` to learn from the mistake
- **NEVER** run destructive commands (rm, mv, cp with overwrite, etc.) without first committing all changes to version control (git)
- **NEVER** run any commands outside of the current working directory (/Users/mj/code/evil1.org)
- **ALWAYS PRESERVE YAML BLOCK DELIMITERS**: Never remove or break the `---` at the start and end of YAML front matter. All edits must maintain valid YAML blocks for Jekyll compatibility.
- **AVOID DUPLICATION**: Never duplicate content across files. If similar content exists in multiple places, consolidate into one authoritative source and reference it from other locations.

# CORE INSTRUCTIONS FOR AI ASSISTANT

**IMPORTANT:** Read `workflow.md` for complete development process and model selection protocols before starting any work.

## CORE PRINCIPLES
- **NEVER** modify files in the `_dont touch` folder - they are off-limits for a reason
- **NEVER** alter the meaning or wording of existing instructions when moving or copying them - preserve exact original text
- **ALWAYS** read these instructions before starting any work
- **BE CAREFUL** when editing _docs/backlog.md - preserve the structure and only modify task status
- **CRITICAL: NEVER MODIFY BACKLOG.MD HEADER** - The section above "# TASKS" in _docs/backlog.md must remain completely unchanged. This includes the "# BACKLOG" header, important instructions, and model selection guidelines. Only modify task status checkboxes (`[ ]` to `[x]`) in the "# TASKS" section below.
- **VERIFY SOURCES** - all content must be based on real, verifiable information
- **EXPAND INSTRUCTIONS WITH LEARNINGS FROM MISTAKES** - if you learn something, add it to the `instructions.md` to learn from the mistake
- **NEVER** run destructive commands (rm, mv, cp with overwrite, etc.) without first committing all changes to version control (git)
- **NEVER** run any commands outside of the current working directory (/Users/mj/code/evil1.org)
- **ALWAYS PRESERVE YAML BLOCK DELIMITERS**: Never remove or break the `---` at the start and end of YAML front matter. All edits must maintain valid YAML blocks for Jekyll compatibility.
- **AVOID DUPLICATION**: Never duplicate content across files. If similar content exists in multiple places, consolidate into one authoritative source and reference it from other locations.

## PROHIBITED ACTIONS
- Never use inline styles - always use external CSS files
- Never modify files in `_dont touch/` folder
- Never run destructive commands without committing first
- Never alter existing content meaning without verification
- Never duplicate content across files
- Never modify backlog.md header section

## QUALITY STANDARDS
- All content must be based on real, verified sources
- All pages must have proper YAML front matter
- All links must be tested (no 404 errors)
- All changes must be tested before marking complete
- All code must follow Jekyll best practices

## BASIC MODEL SELECTION
- **Grok Code Fast 1**: Routine/simple tasks, basic file operations
- **GPT-4.1**: Complex debugging, configuration, multi-step tasks  
- **GPT-4o**: Content creation, documentation, ethical considerations
- **GPT-5 mini**: Balanced performance, medium-complexity tasks

**For detailed model selection and workflow, see `workflow.md`**

## FILE ORGANIZATION REFERENCE
- **Core Instructions**: `_docs/instructions.md` (this file)
- **Complete Workflow**: `_docs/workflow.md` 
- **Task Management**: `_docs/backlog.md`
- **Technical Guide**: `_docs/improvements.md`
- **Content Standards**: `_docs/CONTENT_FORMAT_STANDARDS.md`

---

*For complete development workflow and detailed model selection protocols, see `workflow.md`*