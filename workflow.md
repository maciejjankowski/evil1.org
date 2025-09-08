# Development Workflow with Copilot Model Selection

## Overview
This document outlines the development workflow for the evil1.org Jekyll site, incorporating intelligent Copilot model selection for optimal task completion.

## Quick Start Scripts

### Task Initiation
Use the automated task initiation script:

```bash
# Start any task with proper model selection
./scripts/start-task.sh "Fix 404 errors in education section"

# This will:
# 1. Assess task complexity
# 2. Provide model recommendations
# 3. Create task documentation
# 4. Guide you through the process
```

### Model Selection Helper
Get instant model recommendations:

```bash
# For debugging tasks
./scripts/select-model.sh debug

# For content creation
./scripts/select-model.sh content

# For routine maintenance
./scripts/select-model.sh routine

# Available types: debug, config, content, routine, complex, simple
```

## Pre-Task Preparation

### 1. Read Instructions
**ALWAYS** read `instructions.md` before starting any work to understand:
- Current guidelines and best practices
- Copilot model selection criteria
- Task management protocols

### 2. Assess Task Complexity
Evaluate the task against these criteria:

**🔴 HIGH COMPLEXITY (Use GPT-4):**
- Involves debugging complex issues (404 errors, build failures)
- Requires deep technical analysis (Jekyll configuration, plugin setup)
- Involves multiple file changes or system integration
- Needs comprehensive problem-solving

**🟡 MEDIUM COMPLEXITY (Use GPT-3.5 or GPT-4):**
- Standard content creation or editing
- Routine maintenance tasks
- Simple debugging (syntax errors, basic validation)
- Configuration changes

**🟢 LOW COMPLEXITY (Use GPT-3.5):**
- Basic file operations (create, edit, delete)
- Simple content updates
- Routine commands and validation
- Quick fixes

### 3. Model Selection Protocol

#### Primary Model Selection
```bash
# For Jekyll debugging and complex tasks
MODEL: GPT-4.1
REASON: Complex debugging required for 404 errors and build issues

# For content creation and documentation
MODEL: GPT-4o
REASON: High-quality content writing and ethical considerations

# For routine maintenance
MODEL: Grok Code Fast 1
REASON: Fast execution for simple file operations and basic validation

# For balanced development tasks
MODEL: GPT-5 mini
REASON: Good balance of speed and capability for medium-complexity tasks
```

#### Model Switching Criteria
- **Switch to GPT-4.1** if task becomes more complex than initially assessed
- **Switch to GPT-4o** if content quality and narrative are more important than technical depth
- **Switch to Grok Code Fast 1** if task is simpler than expected and speed is priority
- **Switch to GPT-5 mini** for balanced performance on medium-complexity tasks

## Task Execution Workflow

### Phase 1: Task Analysis
1. **Read backlog.md** for current tasks
2. **Assess complexity** using criteria above
3. **Select appropriate model** based on task type
4. **Document model choice** in task notes

### Phase 2: Model-Specific Execution

#### GPT-4.1 Workflow (Complex Tasks)
```bash
# 1. Deep analysis phase
- Use verbose debugging (--verbose flags)
- Comprehensive error analysis
- Multi-step problem solving
- Thorough testing and validation

# 2. Documentation phase
- Document findings in improvements.md
- Update instructions.md if new patterns discovered
- Create detailed commit messages
```

#### GPT-5 mini Workflow (Balanced Tasks)
```bash
# 1. Balanced execution phase
- Moderate debugging and analysis
- Standard development practices
- Quality-focused implementation
- Comprehensive testing

# 2. Documentation phase
- Update task documentation
- Note model performance
- Document any learnings
```

#### Grok Code Fast 1 Workflow (Routine Tasks)
```bash
# 1. Efficient execution phase
- Quick file operations
- Basic validation and testing
- Routine maintenance tasks
- Fast iteration on simple changes

# 2. Minimal documentation phase
- Brief commit messages
- Update only if significant changes
```

#### GPT-4o Workflow (Content Tasks)
```bash
# 1. Quality-focused execution phase
- High-quality content creation
- Ethical content review
- Narrative structure optimization
- Documentation excellence

# 2. Comprehensive documentation phase
- Detailed content analysis
- Ethical considerations documentation
- Quality assurance notes
```

### Phase 3: Quality Assurance

#### Universal QA Steps (All Models)
1. **Test changes** thoroughly before marking complete
2. **Verify links** work correctly (no 404 errors)
3. **Check build** passes without errors
4. **Validate YAML** syntax in all modified files

#### Model-Specific QA
```yaml
# GPT-4: Deep validation
- Comprehensive link testing
- Build verification with --verbose
- Cross-browser compatibility check
- Performance impact assessment

# GPT-3.5: Quick validation
- Basic link checks
- Build verification
- Syntax validation
- Functional testing

# Claude: Content validation
- Content accuracy verification
- Ethical considerations review
- Readability and clarity assessment
- Source verification
```

## Post-Task Activities

### 1. Task Completion
- Mark task as `[x]` in backlog.md
- Commit changes with descriptive message
- Update any relevant documentation

### 2. Model Performance Review
```markdown
# After each task, document:
- Model used and why
- Success/failure metrics
- Any model switching that occurred
- Recommendations for future tasks
```

### 3. Continuous Improvement
- Update `improvements.md` with new learnings
- Refine model selection criteria based on experience
- Document any new patterns or best practices

## Model Performance Tracking

### Success Metrics
- **Task Completion Time**: How long each model takes for different task types
- **Error Rate**: Frequency of issues requiring model switching
- **Quality Score**: Output quality assessment for each model
- **User Satisfaction**: Effectiveness rating for different task types

### Performance Log Template
```markdown
## Task: [Task Description]
**Date:** YYYY-MM-DD
**Model Used:** [Grok Code Fast 1/GPT-4.1/GPT-4o/GPT-5 mini]
**Complexity:** [High/Medium/Low]
**Time Taken:** [X minutes/hours]
**Success:** [Yes/No/Partial]
**Notes:** [Any issues, switching, or learnings]
**Recommendation:** [Model preference for similar tasks]
```

### Performance Tracking File
Create `_data/model-performance.yml` to track model effectiveness:

```yaml
# _data/model-performance.yml
models:
  grok_code_fast_1:
    total_tasks: 0
    success_rate: 0.0
    avg_completion_time: "0m"
    best_for: ["routine", "simple", "fast"]
    performance_score: 0.0
  
  gpt_4_1:
    total_tasks: 0
    success_rate: 0.0
    avg_completion_time: "0m"
    best_for: ["debug", "config", "complex"]
    performance_score: 0.0
  
  gpt_4o:
    total_tasks: 0
    success_rate: 0.0
    avg_completion_time: "0m"
    best_for: ["content", "documentation", "ethical"]
    performance_score: 0.0
  
  gpt_5_mini:
    total_tasks: 0
    success_rate: 0.0
    avg_completion_time: "0m"
    best_for: ["balanced", "medium", "general"]
    performance_score: 0.0

recent_tasks:
  - date: "2025-09-08"
    task: "Workflow implementation"
    model: "gpt_4_1"
    complexity: "medium"
    time_taken: "15m"
    success: true
    notes: "Comprehensive analysis and implementation"
```

## Emergency Procedures

### When Model Fails
1. **Assess failure reason** (wrong model, task complexity, technical issue)
2. **Switch to appropriate model** based on failure analysis
3. **Document the switch** and reasoning
4. **Update model selection criteria** if pattern emerges

### When Task Becomes Complex
1. **Immediately switch to GPT-4.1** for complex debugging
2. **Reassess task scope** and break into smaller tasks if needed
3. **Document complexity escalation** for future reference

## Integration with Existing Workflow

### Backlog Management
- Include model recommendation in task descriptions
- Track model performance per task type
- Update task complexity assessments based on experience

### Git Workflow
```bash
# Commit message format
git commit -m "[MODEL] Task description

- Model used: Grok Code Fast 1/GPT-4.1/GPT-4o/GPT-5 mini
- Complexity: High/Medium/Low
- Key changes: [brief summary]"
```

### Documentation Updates
- Update `improvements.md` with model performance insights
- Refine `instructions.md` model selection guide based on experience
- Maintain performance logs for continuous improvement

---

*This workflow ensures optimal Copilot model selection for maximum efficiency and quality in Jekyll development tasks.*

## Workflow Compliance Checklist

### Pre-Task Preparation ✅
- [ ] Read `instructions.md` before starting any work
- [ ] Assess task complexity using provided criteria
- [ ] Use `./scripts/start-task.sh` to initialize task with documentation
- [ ] Select appropriate Copilot model based on task type
- [ ] Document model selection reasoning in task file

### Task Execution ✅
- [ ] Follow model-specific execution workflow (Grok Code Fast 1/GPT-4.1/GPT-4o/GPT-5 mini)
- [ ] Use verbose flags for debugging (`--verbose`)
- [ ] Document progress and issues in task file
- [ ] Perform comprehensive testing before completion

### Quality Assurance ✅
- [ ] Test changes thoroughly with real site/server
- [ ] Verify all links work (no 404 errors)
- [ ] Run `bundle exec jekyll build` to ensure no build errors
- [ ] Validate YAML syntax in all modified files

### Post-Task Activities ✅
- [ ] Mark task as `[x]` in `backlog.md`
- [ ] Commit changes with proper format: `[MODEL] Task description`
- [ ] Update model performance data in `_data/model-performance.yml`
- [ ] Document learnings in `improvements.md` if applicable

### Commit Message Format ✅
```bash
git commit -m "[GPT-4.1] Fix complex debugging issue

- Model used: GPT-4.1
- Complexity: High
- Key changes: Fixed YAML front matter validation"
```

### Model Performance Documentation ✅
After each task, update `_data/model-performance.yml`:
- Task completion time
- Success/failure metrics
- Model effectiveness notes
- Recommendations for similar tasks
