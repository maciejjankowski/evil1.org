# Development Scripts

This directory contains automation scripts to streamline the Jekyll development workflow with intelligent Copilot model selection.

## Available Scripts

### `start-task.sh`
**Purpose:** Initialize a new task with proper Copilot model selection and documentation

**Usage:**
```bash
./scripts/start-task.sh "Fix 404 errors in education section"
```

**What it does:**
- Assesses task complexity
- Provides Copilot model recommendations
- Creates task documentation file
- Guides through the development process

### `select-model.sh`
**Purpose:** Get instant Copilot model recommendations for different task types

**Usage:**
```bash
./scripts/select-model.sh debug      # For debugging tasks
./scripts/select-model.sh content    # For content creation
./scripts/select-model.sh routine    # For maintenance tasks
./scripts/select-model.sh config     # For configuration tasks
./scripts/select-model.sh complex    # For multi-step tasks
./scripts/select-model.sh simple     # For basic operations
```

**What it does:**
- Analyzes task type
- Recommends optimal Copilot model
- Provides reasoning and alternatives
- References documentation for detailed guidance

## Model Selection Quick Reference

| Task Type | Primary Model | Alternative | Best For |
|-----------|---------------|-------------|----------|
| Debug | GPT-4 | GPT-3.5 | 404 errors, build failures |
| Config | GPT-4 | GPT-3.5 | Jekyll setup, plugins |
| Content | Claude | GPT-4 | Writing, documentation |
| Routine | GPT-3.5 | GPT-4 | Maintenance, simple edits |
| Complex | GPT-4 | None | Multi-step, integration |
| Simple | GPT-3.5 | GPT-4 | Basic operations |

## Integration with Workflow

These scripts are designed to work with the overall development workflow:

1. **Start Task** → Use `start-task.sh` to initialize
2. **Select Model** → Use `select-model.sh` for guidance
3. **Execute Work** → Follow model-specific workflow
4. **Document** → Update task file with progress
5. **Complete** → Mark task done in backlog.md

## Files Created

Scripts may create the following files in the project root:
- `task-YYYYMMDD-HHMMSS.md` - Task documentation and tracking
- Temporary log files for debugging sessions

## Requirements

- Bash shell environment
- Execute permissions on script files
- Access to project documentation files

## Troubleshooting

**Script won't run:**
```bash
chmod +x scripts/start-task.sh
chmod +x scripts/select-model.sh
```

**No output from model selection:**
- Check that task type is spelled correctly
- Run script without arguments to see available options

**Task documentation not created:**
- Ensure write permissions in project directory
- Check available disk space

## Related Documentation

- `instructions.md` - Complete guidelines and model selection
- `workflow.md` - Full development workflow
- `improvements.md` - Jekyll-specific recommendations
- `README.md` - Project overview and setup
