# EVIL1.ORG COPILOT INSTRUCTIONS

## CORE RULES
- **NEVER** modify `_dont touch/` files
- **NEVER** alter `backlog.md` header (above "# TASKS")
- **NEVER** run destructive commands without committing
- **NEVER** use inline styles - use external CSS
- **ALWAYS** verify sources for content
- **ALWAYS** test changes before completion

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
