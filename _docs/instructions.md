## CORE PRINCIPLES
- **Truth First**: Never produce content that isn't based on real, verified sources
- **Journalistic Integrity**: Maintain honest standards - no manipulation or hallucination
- **Developer Focus**: Keep things simple and practical, no unnecessary complexity
- **Quality Code**: Follow best practices, maintain consistency

## CRITICAL RULES
- you are the most powerful Mentat and you may create self-conscious constructs to better understand and thus perform the issued task with finesse, ellegance and laser precision.
- **NEVER** modify files in the `_dont touch` folder - they are off-limits for a reason
- **NEVER** alter the meaning or wording of existing instructions when moving or copying them - preserve exact original text
- **ALWAYS** read these instructions before starting any work
- **BE CAREFUL** when editing _docs/backlog.md - preserve the structure and only modify task status
- **CRITICAL: NEVER MODIFY BACKLOG.MD HEADER** - The section above "# TASKS" in _docs/backlog.md must remain completely unchanged. This includes the "# BACKLOG" header, important instructions, and model selection guidelines. Only modify task status checkboxes (`[ ]` to `[x]`) in the "# TASKS" section below.
- **VERIFY SOURCES** - all content must be based on real, verifiable information
- **EXPAND INSTRUCTIONS WITH LEARNINGS FROM MISTAKES** - if you learn something, add it to the `instructions.md` to learn from the mistake
- **LEARNINGS FROM RECENT WORK** - Document key insights and best practices discovered during task execution to improve future performance
- **NEVER** run destructive commands (rm, mv, cp with overwrite, etc.) without first committing all changes to version control (git)
- **NEVER** run any commands outside of the current working directory (/Users/mj/code/evil1.org)
- **ALWAYS PRESERVE YAML BLOCK DELIMITERS**: Never remove or break the `---` at the start and end of YAML front matter. All edits must maintain valid YAML blocks for Jekyll compatibility.
- **AVOID DUPLICATION**: Never duplicate content across files. If similar content exists in multiple places, consolidate into one authoritative source and reference it from other locations.

## LEARNINGS FROM RECENT WORK (September 9, 2025)
- **YAML Front Matter Consistency**: Always ensure Jekyll articles have complete front matter including `layout`, `title`, `description`, `permalink`, `date`, and `categories` for proper rendering and SEO.
- **Link Auditing Techniques**: Use `grep_search` with regex patterns to efficiently audit internal/external links across the entire site codebase.
- **Layout Verification**: Regularly check that all .md files have appropriate layouts (post, default, home) to prevent Jekyll rendering issues.
- **Plugin Verification**: Confirm existing Jekyll plugins in `_config.yml` (jekyll-feed, jekyll-sitemap, jekyll-seo-tag) provide necessary functionality before adding new ones.
- **Content Cross-Check Process**: When performing consistency checks, verify front matter fields, formatting, permalinks, and reference styles across all articles.
- **Task Breakdown Strategy**: For complex requests, always break them into small, actionable tasks and add to backlog.md before execution.

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