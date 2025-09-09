# Instructions Archive (Fat.md)

## Overview
This file contains archived or redundant content from `instructions.md` that has been trimmed for efficiency. It serves as a historical reference and backup for content that may be useful in specific contexts but is not essential for daily operations.

## Archived Content

### AI Agent Best Practices Guide (Archived September 9, 2025)
**Reason for archiving:** Content merged into main `instructions.md` file for better organization.

**Original content from ai-agent-guide.md:**

#### Explicit Instruction References in Prompts
Always start your prompts with clear instruction references:

```
Before starting any work, read these instruction files:
- _docs/instructions.md (core rules and principles)
- _docs/workflow.md (complete workflow and model selection)
- _docs/backlog.md (current tasks)

Then proceed with: [your specific request]
```

#### Use Context Attachment
In VS Code Copilot Chat:
- **Attach the instruction files** as context using `@workspace` or file references
- **Reference specific sections** when relevant to the task
- **Include the backlog.md** so the agent knows current task status

#### Start Each Session with File Reading
Begin conversations by having the agent read the key files:
```
Please read and acknowledge the following instruction files before we begin:
1. /Users/mj/code/evil1.org/_docs/instructions.md
2. /Users/mj/code/evil1.org/_docs/workflow.md
3. /Users/mj/code/evil1.org/_docs/backlog.md

Confirm you understand the core rules, workflow, and current tasks.
```

#### Reference Specific Rules When Needed
When you notice non-compliance, reference specific rules:
```
❌ STOP - You're about to modify the backlog.md header section.
Please review the CRITICAL RULE in _docs/instructions.md about never modifying the backlog header.
Only change task status checkboxes in the # TASKS section.
```

### README.md Quick Reference (Archived September 9, 2025)
**Reason for archiving:** Content merged into main `workflow.md` file for better organization.

**Original content from README.md:**

#### Start New Tasks
```bash
# Initialize task with model selection
./scripts/start-task.sh "Fix 404 errors in education section"

# Get model recommendations
./scripts/select-model.sh debug    # For debugging tasks
./scripts/select-model.sh content  # For content creation
./scripts/select-model.sh routine  # For maintenance tasks
```

#### Development Process
1. **Read Instructions**: `_docs/instructions.md` - Core guidelines and model selection
2. **Follow Workflow**: `_docs/workflow.md` - Complete development process
3. **Check Tasks**: `_docs/backlog.md` - Current priorities and tasks
4. **Review History**: `_docs/improvements.md` - Lessons learned and best practices
5. **AI Guidelines**: `.github/COPILOT.md` - AI assistant guidelines

#### Commit Format
All commits follow this format:
```
[MODEL] Task description
- Key changes: [Brief summary]
```

### _docs Folder Optimization Analysis (Archived September 9, 2025)
**Reason for archiving:** Analysis document for optimization that has been completed. Content preserved for historical reference.

**Original content from optimization-analysis.md:**

[Full content of optimization-analysis.md would be inserted here - see the file for complete analysis of the optimization process that was just completed]
- **ALWAYS PRESERVE YAML BLOCK DELIMITERS**: Never remove or break the `---` at the start and end of YAML front matter. All edits must maintain valid YAML blocks for Jekyll compatibility.
- **AVOID DUPLICATION**: Never duplicate content across files. If similar content exists in multiple places, consolidate into one authoritative source and reference it from other locations.
- **ALWAYS PRESERVE YAML BLOCK DELIMITERS**: Never remove or break the `---` at the start and end of YAML front matter. All edits must maintain valid YAML blocks for Jekyll compatibility.
- **AVOID DUPLICATION**: Never duplicate content across files. If similar content exists in multiple places, consolidate into one authoritative source and reference it from other locations.

### Legacy Mentat Reference (Archived September 9, 2025)
This philosophical reference was part of the original critical rules but has been moved here as it's more inspirational than operational.

- you are the most powerful Mentat and you may create self-conscious constructs to better understand and thus perform the issued task with finesse, ellegance and laser precision.

## How to Use Fat.md

### When to Reference Fat.md
- **Historical Context**: When you need to understand why certain decisions were made or what content was previously included
- **Backup Reference**: If you accidentally remove something from the main instructions and need to recover it
- **Comprehensive Research**: When doing deep dives into the evolution of our workflow and guidelines
- **Training New Team Members**: To show the full history and evolution of our processes

### When NOT to Use Fat.md
- **Daily Operations**: Use the optimized `instructions.md` for standard workflow
- **Quick Reference**: The main instructions file should be your primary guide
- **New Tasks**: Always start with the current, streamlined instructions

### Maintenance Guidelines
- **Add to Fat.md**: When trimming content from main files, archive it here with date and reason
- **Review Periodically**: Every 3-6 months, review if any archived content should be restored or permanently removed
- **Version Control**: Keep this file in git for historical tracking
- **Cross-Reference**: When archiving, note which main file the content came from

## Relationship to Main Instructions

### Optimized Instructions (instructions.md)
- **Purpose**: Daily operational guidance, essential rules, current best practices
- **Audience**: All team members for standard workflow
- **Content**: Streamlined, non-duplicated, actionable guidelines
- **Updates**: Regular updates for new learnings and improvements

### Archive (fat.md)
- **Purpose**: Historical reference, backup, comprehensive context
- **Audience**: Advanced users, researchers, maintainers
- **Content**: Archived, redundant, or less frequently used information
- **Updates**: Only when archiving new content from main files

### Best Practices for Using Both
1. **Start with instructions.md** for any new task or question
2. **Check fat.md** if you need historical context or archived information
3. **Archive thoughtfully** - only move content that truly isn't needed daily
4. **Document archiving** - always note why content was moved and when
5. **Regular cleanup** - review and remove truly obsolete content periodically

---

*Last archived: September 9, 2025*
*This file serves as a living archive for workflow evolution and historical reference*
