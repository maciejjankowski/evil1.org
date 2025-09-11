# !IMPORTANT: DONT PROCESS FOR JEKYLL

## Quick Workflow Reference

### Start New Tasks
```bash
# Initialize task with model selection
./scripts/start-task.sh "Fix 404 errors in education section"

# Get model recommendations
./scripts/select-model.sh debug    # For debugging tasks
./scripts/select-model.sh content  # For content creation
./scripts/select-model.sh routine  # For maintenance tasks
```

### Development Process
1. **Read Instructions**: `_docs/instructions.md` - Core guidelines and model selection
2. **Follow Workflow**: `_docs/workflow.md` - Complete development process
3. **Check Tasks**: `_docs/backlog-all.md` - Current priorities and tasks
4. **Review History**: `_docs/improvements.md` - Lessons learned and best practices
5. **AI Guidelines**: `.github/COPILOT.md` - AI assistant guidelines

### Commit Format
All commits follow this format:
```
[MODEL] Task description
- Key changes: [Brief summary]
```

## Development Workflow

### Copilot Model Selection

Choose the appropriate model based on task complexity:

- **Grok Code Fast 1**: Routine tasks, simple edits, basic validation, quick fixes
- **GPT-4.1**: Complex debugging, Jekyll configuration, build issues, technical analysis
- **GPT-4o**: Content creation, documentation, ethical content, narrative writing
- **GPT-5 mini**: Balanced performance, medium-complexity tasks, general development

See `_docs/workflow.md` for detailed model selection guidelines and `_docs/instructions.md` for complete model capabilities.

## Editorial Review Process

All stories published on the wall must:
- Be based on real events and cite reputable sources (news outlets, official reports, etc.)
- Include a direct link to the source article for verification
- Be fact-checked by at least one editor before publication
- Avoid manipulation or hallucination; maintain meaning and integrity
- Use sarcasm only when the underlying facts are accurate

Editors are responsible for:
- Reviewing each submission for factual accuracy
- Ensuring links are valid and point to real sources
- Rejecting any content that cannot be verified

This process ensures honest journalism and maintains the highest standards of integrity, even when the tone is satirical.