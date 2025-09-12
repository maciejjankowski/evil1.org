---
layout: default
title: "Workflow Documentation"
description: "Complete workflow guide for the simplified backlog system"
permalink: /docs/workflow/
---

# Workflow Documentation

## Overview

This document outlines the complete workflow for managing tasks in the simplified backlog system, designed for maximum efficiency and automated processing.

## Backlog Structure

### Simplified Format
All tasks follow the format: `| STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD`

- **STATUS**: `[ ]` pending, `[x]` complete
- **TASK_ID**: Unique identifier (T001, T002, etc.)
- **TASK_DESCRIPTION**: Clear, concise description
- **MODEL**: Recommended Copilot model
- **DoD**: Definition of Done (acceptance criteria)

### Priority Organization
Tasks are sorted by importance without unnecessary headers:
1. **HIGH PRIORITY** - Most critical tasks
2. **MEDIUM PRIORITY** - Important but not urgent
3. **LOW PRIORITY** - Nice to have features
4. **COMPLETED** - Finished tasks for reference

## Available Models

### GPT-4.1 (Complex Tasks)
- Complex debugging and configuration
- Multi-step technical tasks
- Build errors and system integration
- Jekyll configuration issues

### GPT-4o (Content/Narrative)
- High-quality content creation
- Documentation and ethical content
- Editorial workflows and style guides
- Business analysis and strategy

### GPT-5 mini (Medium Tasks)
- Moderate complexity development
- General code implementation
- Template creation and layout work
- Component development

### Grok Code Fast 1 (Routine Tasks)
- Simple file edits and maintenance
- Routine validation and cleanup
- Basic HTML to frontmatter conversion
- Quick fixes and simple updates

### Gemini 2.5 Pro (Advanced Features)
- Complex analytics and tracking
- E-commerce integrations
- Advanced monetization features
- Performance optimization
- Payment processing

## Workflow Steps

### 1. Task Selection
1. Review current backlog at `_docs/backlog-all.md`
2. Check the [Status Dashboard](/docs/backlog-dashboard/) for progress overview
3. Select highest priority task for your model capability
4. Use `./scripts/start-task.sh "Task description"` to begin

### 2. Task Execution
1. Mark task as in-progress in your tracking system
2. Follow the Definition of Done criteria precisely
3. Test all changes thoroughly:
   - Run `bundle exec jekyll build` for Jekyll validation
   - Run `npm test` for visual regression testing
   - Verify no broken links or errors

### 3. Quality Assurance
1. **Build Testing**: Ensure `bundle exec jekyll build` passes
2. **Visual Testing**: Run `npm test` after layout/CSS changes
3. **Link Validation**: Check for broken internal/external links
4. **YAML Validation**: Verify frontmatter syntax is correct
5. **Performance Check**: Ensure changes don't degrade performance

### 4. Task Completion
1. Commit changes with format: `[TASK_ID] Brief description`
2. Mark task complete: `./scripts/mark-task-done.sh TASK_ID`
3. Update documentation if needed
4. Move to next highest priority task

## Scripts and Tools

### Core Scripts
- `./scripts/start-task.sh` - Initialize new task
- `./scripts/mark-task-done.sh TASK_ID` - Mark task complete
- `./scripts/consolidate-backlogs.sh` - Validate backlog format

### Quality Tools
- `bundle exec jekyll build` - Build validation
- `npm test` - Visual regression testing
- `./scripts/link-checker.sh` - Link validation
- `./scripts/frontmatter-validator.sh` - YAML validation

### Performance Tools
- `./scripts/optimize-images.sh` - Image optimization
- `./scripts/minify-assets.sh` - Asset minification

## File Organization

### Key Files
- `_docs/backlog-all.md` - Single source of truth for all tasks
- `_docs/backlog-dashboard.md` - Real-time progress dashboard
- `_docs/workflow.md` - This documentation
- `.github/copilot-instructions.md` - Copilot configuration

### Backup Strategy
- Automated backups via `./scripts/backup-backlog.sh`
- Git history provides complete change tracking
- Dashboard provides real-time status monitoring

## Best Practices

### Task Management
1. **One task at a time** - Focus on single high-priority item
2. **Complete DoD** - Meet all acceptance criteria before marking done
3. **Test thoroughly** - Prevent regressions and errors
4. **Document changes** - Update relevant documentation

### Code Quality
1. **No inline styles** - Use external CSS only
2. **Preserve YAML** - Never strip frontmatter delimiters
3. **Reuse components** - Avoid duplication
4. **Responsive design** - Test mobile/desktop compatibility

### Communication
1. **Clear commits** - Use TASK_ID and brief description format
2. **Update dashboard** - Ensure progress is visible
3. **Document decisions** - Record important architectural choices

## Monitoring and Metrics

### Dashboard Metrics
- Total tasks and completion rate
- Progress by model type
- Recent activity and trends
- Performance indicators

### Quality Metrics
- Build success rate
- Visual test pass rate
- Link validation results
- Performance scores

## Troubleshooting

### Common Issues
1. **Build failures** - Check YAML syntax and file paths
2. **Visual test failures** - Review layout changes and update baselines
3. **Link errors** - Validate internal/external link targets
4. **Performance regressions** - Profile changes and optimize

### Recovery Procedures
1. **Git revert** - Roll back problematic changes
2. **Backup restore** - Use timestamped backlog backups
3. **Manual validation** - Cross-check dashboard vs actual files

## Automation

### Continuous Integration
- Automated testing on commit
- Performance monitoring
- Link validation
- Visual regression detection

### Scheduled Tasks
- Backup generation
- Dashboard updates
- Performance reporting
- Link health checks

## Getting Started

1. Review this workflow documentation
2. Check the [Status Dashboard](/docs/backlog-dashboard/)
3. Select a task appropriate for your model
4. Run `./scripts/start-task.sh "Task description"`
5. Follow the workflow steps outlined above

---

**Last Updated**: {{ site.time | date: "%Y-%m-%d %H:%M UTC" }}

For questions or issues, refer to the [Copilot Instructions](/.github/copilot-instructions.md) or create a new task in the backlog.
