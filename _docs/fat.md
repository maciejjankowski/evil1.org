# Instructions Archive (Fat.md)

## Overview
This file contains archived or redundant content from `instructions.md` that has been trimmed for efficiency. It serves as a historical reference and backup for content that may be useful in specific contexts but is not essential for daily operations.

## Archived Content

### Duplicate Core Principles (Archived September 9, 2025)
These principles were duplicated in the original instructions.md and have been consolidated in the main file.

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
