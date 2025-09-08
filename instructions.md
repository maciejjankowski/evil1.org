# INSTRUCTIONS FOR AI ASSISTANT

- **IMPORTANT** use files `instructions.md` `workflow.md` `backlog.md` `task-*.md` for instructions for ai agents, dont treat them as source files for evil1.org content.
**IMPORTANT:** Read `workflow.md` for the complete development process and model selection protocols before starting any work.

## Task Management
- After task completion mark the task complete like that: [x]
- Should a task need splitting into smaller tasks, add those smaller tasks with clear description and clear deliverables into the backlog.md file and then process them
- Always reread the backlog and don't ask for confirmation unless you have finished all TASKS
- Always reread the backlog.md file before starting work as it may have been updated with new tasks or changes
- **ALWAYS REREAD THE BACKLOG.MD FILE AFTER COMPLETING ANY TASK** to ensure no new tasks were added and to verify task completion status
- **ALWAYS** issue a git commit with a brief descriptive message after completing each task from the backlog

## Decision Making & Communication
- Always assume and execute the best possible option for any decision, based on context and best practices, without asking for confirmation unless absolutely necessary to proceed
- DON'T SHOW THINKING OR EXTRA INFORMATION UNLESS EXPLICITLY ASKED FOR
- When given a choice always suggest the option promoting clarity, maintainability and established best practices
- Always suggest recommended approach based on industry standards and best practices in software engineering

## Content & Data Integrity
- YOU MAY NEVER PRODUCE CONTENT WHICH IS NOT BASED ON TRUTH. Maintain honest journalist integrity. ALWAYS PROVIDE __REAL__ __VERIFIED__ __SOURCES__
- Perform comprehensive fact-checking and source verification for all content
- Use existing factual content to support the site's narrative about capitalism

## Code Quality & Architecture
- Never use inline styles. Always use external CSS files with proper organization
- Avoid changing files not directly related to the task at hand
- Always perform logic, structure, and code quality analysis; when issues found, reiterate until fixed with no errors
- Follow Jekyll best practices: proper front matter, layouts, includes, and asset pipeline
- Maintain consistent file naming: lowercase, hyphens for spaces, .md for content
- Ensure proper heading hierarchy (h1 > h2 > h3) and semantic HTML structure

## Content Structure & Organization
- Place content in YAML config format inside markdown files using placeholders where possible
- Use Jekyll collections for organized content types
- Maintain consistent layout hierarchy and template structure
- Implement proper SEO meta tags and structured data markup

## Performance & Accessibility
- Optimize for web performance: minified CSS/JS, optimized images, proper caching
- Ensure accessibility compliance: alt text, semantic markup, keyboard navigation
- Implement responsive design for mobile compatibility
- Add integrity attributes to external resources and implement CSP

## Quality Assurance
- Validate all links and ensure no broken references
- Test layouts across different screen sizes and browsers
- Verify all YAML front matter is properly formatted
- Ensure consistent navigation and user experience across all pages
- **ALWAYS CHECK FOR 404 ERRORS**: Before marking any task complete, test all links on the page to ensure they resolve correctly and don't return 404 errors

## VERIFICATION & TESTING PROTOCOL
### **MANDATORY VERIFICATION STEPS**
- **ALWAYS** test fixes by running the site and viewing actual rendered pages
- **NEVER** mark tasks as `[x]` until personally verified working
- **ALWAYS** check generated HTML output to confirm changes took effect
- **NEVER** assume fixes work - prove them with actual testing
- after each task completion you will assess your approach and if you have found improvements, add them as concise instructions to `improvements.md`

### **PROBLEM-SOLVING APPROACH**
- **Step 1:** Identify the actual root cause (not just symptoms)
- **Step 2:** Implement the targeted fix
- **Step 3:** Test thoroughly with real site/server
- **Step 4:** Only then mark as complete in backlog
- **Step 5:** Clean up any temporary files created during debugging

### **WHEN USER INDICATES ISSUE**
- **IMMEDIATELY** stop current approach if user says "this is wrong"
- **RE-EXAMINE** the actual problem instead of defending approach
- **FOCUS** on user's specific complaint, not tangential improvements
- **TEST** the actual issue before creating documentation or scripts

### **FILE NAMING & STRUCTURE CONFLICTS**
- **AVOID** creating static HTML files with same names as Jekyll collections
- **NEVER** have both `pagename.html` and `pagename/` directory
- **USE** descriptive suffixes for alternative formats (e.g., `halloffame-feed.html`)
- **CHECK** for naming conflicts before creating new files
- **DOCUMENT** the purpose of each file format to avoid confusion

### **CONTENT ORGANIZATION RULES**
- **Jekyll Collections**: Use for structured, categorized content (`_collectionname/`)
- **Static HTML**: Use for dynamic/interactive content with unique suffixes
- **Navigation**: Always point to the primary content format
- **File Structure**: Keep related files organized in logical directories
- **URL LINKING**: NEVER link to `.html` files directly - always use Jekyll's URL generation with permalinks
- **PAGE CREATION**: Convert static HTML files to proper Jekyll pages (`.md`) with front matter and permalinks
- **COLLECTION CONFLICTS**: Remove static HTML files that conflict with Jekyll collections

### **BACKLOG MANAGEMENT**
- **ONLY** change `[ ]` to `[x]` when actually done and tested
- **DON'T** add explanatory text, status sections, or comments
- **DON'T** modify task descriptions beyond completion marking
- **DON'T** create documentation while issue is still broken

## CRITICAL RULES
- **NEVER** modify files in the `_dont touch` folder - they are off-limits for a reason
- **NEVER** alter the meaning or wording of existing instructions when moving or copying them - preserve exact original text
- **ALWAYS** read these instructions before starting any work
- **BE CAREFUL** when editing backlog.md - preserve the structure and only modify task status
- **VERIFY SOURCES** - all content must be based on real, verifiable information
- **EXPAND INSTRUCTIONS WITH LEARNINGS FROM MISTAKES** - if you learn something, add it to the `instructions.md` to learn from the mistake
- **NEVER** run destructive commands (rm, mv, cp with overwrite, etc.) without first committing all changes to version control (git)
- **NEVER** run any commands outside of the current working directory (/Users/mj/code/evil1.org)
- **ALWAYS PRESERVE YAML BLOCK DELIMITERS**: Never remove or break the `---` at the start and end of YAML front matter. All edits must maintain valid YAML blocks for Jekyll compatibility.
- **AVOID DUPLICATION**: Never duplicate content across files. If similar content exists in multiple places, consolidate into one authoritative source and reference it from other locations.

## YAML FRONT MATTER VALIDATION
### **CRITICAL VALIDATION RULES**
- **ALWAYS** ensure YAML blocks start and end with `---` on separate lines
- **NEVER** add content before the opening `---` delimiter
- **ALWAYS** validate YAML syntax after any front matter edits
- **TEST** that pages render correctly after front matter changes
- **USE** verbose Jekyll builds (`bundle exec jekyll build --verbose`) to catch YAML errors

### **COMMON YAML MISTAKES TO AVOID**
- Missing opening or closing `---` delimiters
- Extra blank lines before opening `---`
- Incorrect indentation in YAML structure
- Missing required fields (layout, title for pages)
- Invalid YAML syntax (unclosed quotes, improper nesting)

## DEBUGGING & VALIDATION BEST PRACTICES
### **MANDATORY DEBUGGING STEPS**
- **USE VERBOSE MODE**: Always use `--verbose` flag with Jekyll commands for detailed error information
- **VALIDATE YAML**: Use `python3 -c "import yaml; yaml.safe_load(open('file.md'))"` to check YAML syntax
- **TEST LINKS**: Use `curl -I http://localhost:4000/page/` to verify pages load correctly
- **CHECK BUILD OUTPUT**: Always examine `_site/` directory to confirm files are generated properly

### **AUTOMATED VALIDATION SCRIPTS**
```bash
# Quick YAML validation for all markdown files
for file in $(find . -name "*.md" -not -path "./_site/*"); do
  if ! head -1 "$file" | grep -q "^---$"; then
    echo "❌ Missing front matter: $file"
  fi
done

# Link validation script
bundle exec jekyll serve --detach
curl -s -o /dev/null -w "%{http_code}" "http://localhost:4000/test-page/"
pkill -f jekyll
```

## GITHUB CLI INTEGRATION FOR AI-ASSISTED CODING

### GitHub CLI Setup & Authentication
```bash
# Install GitHub CLI (if not already installed)
brew install gh

# Authenticate with GitHub
gh auth login

# Verify authentication
gh auth status
```

### AI-Assisted Development Workflow with GitHub CLI

#### 1. Issue Management for AI Tasks
```bash
# Create issue for AI-assisted task
gh issue create --title "[AI] Task description" --body "AI-assisted development task details"

# List open issues
gh issue list

# View specific issue
gh issue view ISSUE_NUMBER

# Comment on issue (AI progress updates)
gh issue comment ISSUE_NUMBER --body "AI analysis: [findings]"

# Close issue when task completed
gh issue close ISSUE_NUMBER
```

#### 2. Branch Management for AI Work
```bash
# Create feature branch for AI task
gh repo clone evil1.org
cd evil1.org
git checkout -b ai-task-description

# Push branch to GitHub
git push -u origin ai-task-description
```

#### 3. Pull Request Workflow for AI Contributions
```bash
# Create pull request for AI work
gh pr create --title "[AI] Task completion" --body "AI-assisted implementation details"

# List pull requests
gh pr list

# View pull request details
gh pr view PR_NUMBER

# Add reviewers to PR
gh pr edit PR_NUMBER --add-reviewer username

# Merge PR when approved
gh pr merge PR_NUMBER --merge
```

#### 4. Code Review Integration
```bash
# Review PR as AI assistant
gh pr review PR_NUMBER --approve --body "AI review: Code looks good"

# Request changes if needed
gh pr review PR_NUMBER --request-changes --body "AI suggestions: [specific feedback]"

# View PR diff
gh pr diff PR_NUMBER
```

#### 5. Repository Status & Health Checks
```bash
# Check repository status
gh repo view

# View recent activity
gh repo log

# Check for security alerts
gh repo security-advisories

# View repository statistics
gh repo stats
```

#### 6. AI-Assisted Content Management
```bash
# Search for issues related to AI tasks
gh issue list --search "AI" --state open

# Create issue templates for AI work
gh issue create --template ai-task.md

# Label issues for AI categorization
gh issue edit ISSUE_NUMBER --add-label "ai-assisted"
```

### AI-Specific GitHub CLI Workflows

#### Automated Task Tracking
```bash
# Create standardized AI task issue
gh issue create \
  --title "[AI] $(date '+%Y-%m-%d') - Task Description" \
  --body "## AI Task Details
**Model Used:** [Model name]
**Complexity:** [High/Medium/Low]
**Estimated Time:** [Duration]

## Requirements
- [ ] Task analysis
- [ ] Implementation
- [ ] Testing
- [ ] Documentation

## AI Progress Notes
[AI to update this section with progress]"
```

#### Model Performance Tracking Integration
```bash
# Update model performance issue
gh issue comment MODEL_PERFORMANCE_ISSUE \
  --body "## Model Performance Update
**Task:** [Task name]
**Model:** [Model used]
**Time:** [Duration]
**Success:** [Yes/No]
**Notes:** [Performance observations]"
```

#### Automated Commit and PR Creation
```bash
# Commit with AI metadata
git commit -m "[AI: MODEL_NAME] Task description

- Model used: MODEL_NAME
- Complexity: COMPLEXITY_LEVEL
- Key changes: CHANGE_SUMMARY"

# Create PR with AI context
gh pr create \
  --title "[AI: MODEL_NAME] Task completion" \
  --body "## AI Implementation Summary
**Model:** MODEL_NAME
**Task:** TASK_DESCRIPTION
**Changes:** KEY_CHANGES
**Testing:** TESTING_PERFORMED

## AI Quality Assurance
- [x] Code review passed
- [x] Tests executed
- [x] Documentation updated"
```

### Integration with Existing Workflow

#### Enhanced Task Initiation
```bash
# Use GitHub CLI for task initiation
./scripts/start-task.sh "Fix navigation issues"

# Create corresponding GitHub issue
gh issue create --title "[AI] Fix navigation issues" --body "See task file for details"
```

#### Model Selection Documentation
```bash
# Document model selection in issue
gh issue comment ISSUE_NUMBER \
  --body "## Model Selection Rationale
**Selected Model:** MODEL_NAME
**Reasoning:** TASK_ANALYSIS
**Expected Complexity:** COMPLEXITY_LEVEL
**Alternative Models Considered:** ALTERNATIVES"
```

#### Quality Assurance Integration
```bash
# Run validation and update issue
bundle exec jekyll build --verbose
gh issue comment ISSUE_NUMBER --body "✅ Jekyll build successful"

# Test links and report
curl -I http://localhost:4000/test-page/
gh issue comment ISSUE_NUMBER --body "✅ Link validation passed"
```

### Best Practices for AI-Assisted GitHub CLI Usage

#### Issue Management
- **Always create issues** for AI tasks to maintain visibility
- **Use consistent labeling** (ai-assisted, model-name, complexity)
- **Update issues regularly** with AI progress and findings
- **Close issues promptly** when tasks are completed

#### Pull Request Standards
- **Include AI context** in PR descriptions (model used, task complexity)
- **Request reviews** from appropriate team members
- **Document testing** performed by AI assistant
- **Reference related issues** in PR descriptions

#### Commit Message Conventions
- **Include model information** in commit messages
- **Follow existing patterns** for consistency
- **Reference issue numbers** when applicable
- **Keep messages descriptive** but concise

#### Repository Health
- **Regular status checks** using `gh repo view`
- **Monitor for security issues** with `gh repo security-advisories`
- **Keep dependencies updated** using GitHub's dependency management
- **Review repository statistics** for optimization opportunities

### Troubleshooting GitHub CLI Issues

#### Authentication Problems
```bash
# Re-authenticate if needed
gh auth logout
gh auth login

# Check authentication status
gh auth status
```

#### Permission Issues
```bash
# Verify repository access
gh repo view evil1.org

# Check user permissions
gh repo collaborators
```

#### Network/Connectivity Issues
```bash
# Test GitHub connectivity
gh api user

# Check API rate limits
gh api rate_limit
```

### Advanced GitHub CLI Features for AI Development

#### Custom Aliases for Common Tasks
```bash
# Create aliases for frequent AI operations
gh alias set ai-task 'issue create --title "[AI] $1" --body "AI task: $1"'
gh alias set ai-review 'pr review --approve --body "AI review: Code approved"'
gh alias set ai-status 'issue list --label ai-assisted --state open'
```

#### Automated Workflows
```bash
# Create scripts that combine multiple gh commands
# Example: Complete AI task workflow
#!/bin/bash
TASK_NAME="$1"
MODEL_NAME="$2"

# Create issue
ISSUE_URL=$(gh issue create --title "[AI: $MODEL_NAME] $TASK_NAME" --return-url)

# Create branch
git checkout -b "ai-$(date +%s)"

# ... perform AI work ...

# Create PR
gh pr create --title "[AI: $MODEL_NAME] $TASK_NAME" --body "Completed by AI assistant"
```

#### Integration with CI/CD
- **Use GitHub Actions** for automated testing of AI-generated code
- **Trigger deployments** based on successful AI PR merges
- **Monitor build status** using `gh run list`
- **View workflow logs** with `gh run view`

This GitHub CLI integration enables seamless AI-assisted development workflows while maintaining full traceability and collaboration capabilities.
### **RELATED FILES**
- **`improvements.md`**: Detailed debugging techniques, automation scripts, and advanced best practices
- **`workflow.md`**: Comprehensive workflow documentation with model selection protocols
- **`backlog.md`**: Current tasks and project status

### **WHEN TO CONSULT OTHER FILES**
- **Use `improvements.md`** for: Advanced debugging techniques, automation scripts, performance optimization
- **Use `workflow.md`** for: Detailed workflow processes, model selection protocols, task execution guidelines
- **Use `backlog.md`** for: Current task status, project priorities, completion tracking

## CONCLUSION & CONTINUOUS IMPROVEMENT
- **LEARN FROM MISTAKES**: Always document new learnings and update these instructions
- **MAINTAIN CONSISTENCY**: Keep all documentation files synchronized and cross-referenced
- **VALIDATE REGULARLY**: Test all processes and update documentation based on real-world experience
- **PREVENT DUPLICATION**: Consolidate overlapping content and maintain single sources of truth

## COPILOT MODEL SELECTION GUIDE

### Available Models & Capabilities

**Grok Code Fast 1**
- **Best for:** Fast code generation, simple debugging, routine tasks
- **Use when:** Quick fixes, basic file operations, simple validation
- **Strengths:** Speed, efficiency for repetitive tasks
- **When to switch:** For complex analysis or content creation

**GPT-4.1**
- **Best for:** Complex reasoning, multi-step tasks, debugging complex issues
- **Use when:** Working with Jekyll configuration, debugging 404 errors, analyzing site structure
- **Strengths:** Deep technical analysis, comprehensive problem-solving
- **When to switch:** For very fast tasks or content creation

**GPT-4o**
- **Best for:** Content creation, documentation, ethical considerations
- **Use when:** Creating articles, writing documentation, analyzing business content
- **Strengths:** High-quality content, strong ethical reasoning, good for narrative content
- **When to switch:** For pure technical debugging or very fast tasks

**GPT-5 mini**
- **Best for:** Balanced performance, medium-complexity tasks, general development
- **Use when:** Standard development tasks, moderate debugging, content editing
- **Strengths:** Good balance of speed and capability, versatile for most tasks
- **When to switch:** For highly complex analysis (use GPT-4.1) or very fast tasks (use Grok Code Fast 1)

### Task-Based Model Recommendations

**🔧 Jekyll Development & Debugging**
- **Use GPT-4.1** for: Front matter issues, permalink problems, build errors, configuration debugging
- **Use GPT-5 mini** for: Moderate debugging, configuration changes, standard development tasks
- **Use Grok Code Fast 1** for: Simple file edits, running basic commands, routine maintenance
- **Use GPT-4o** for: Content creation with technical requirements, documentation writing

**📝 Content Creation & Editing**
- **Use GPT-4o** for: Narrative writing, ethical content, business analysis articles
- **Use GPT-4.1** for: Technical content, complex articles with technical requirements
- **Use GPT-5 mini** for: Basic content updates, simple editing, routine content tasks
- **Use Grok Code Fast 1** for: Quick content fixes, simple updates

**🐛 Error Resolution & Troubleshooting**
- **Use GPT-4.1** for: Complex debugging, 404 errors, build failures, configuration issues
- **Use GPT-5 mini** for: Moderate debugging, syntax errors, basic validation
- **Use Grok Code Fast 1** for: Simple syntax errors, quick fixes
- **Use GPT-4o** for: Analyzing error patterns, documenting solutions

**⚙️ Configuration & Setup**
- **Use GPT-4.1** for: Jekyll configuration, plugin setup, complex integrations
- **Use GPT-5 mini** for: Basic config changes, simple configuration changes
- **Use Grok Code Fast 1** for: Basic setup tasks, simple script creation

### Model Switching Protocol

**When to Switch Models:**
1. **If current model is stuck** on a task for more than 2-3 attempts
2. **If task complexity changes** (simple → complex or vice versa)
3. **If output quality is insufficient** for the task requirements
4. **If response time becomes an issue** for urgent tasks

**How to Request Model Switch:**
- State the current model and why you need to switch
- Specify the target model and reasoning
- Provide context about what hasn't worked with current model

**Model Performance Tracking:**
- Document which models work best for specific task types
- Update this guide based on real-world performance
- Note any persistent issues with specific models for certain tasks

### Quality Assurance Across Models

**Universal Requirements:**
- All models must follow these instructions completely
- All models must verify work before marking tasks complete
- All models must maintain code quality and site integrity
- All models must test changes thoroughly

**Model-Specific Expectations:**
- **Grok Code Fast 1:** Fast execution, reliable for routine tasks, efficient simple operations
- **GPT-4.1:** Deep technical analysis, comprehensive debugging, complex problem-solving
- **GPT-4o:** High-quality content, ethical considerations, excellent documentation
- **GPT-5 mini:** Balanced performance, versatile for medium-complexity tasks

### Model Performance Documentation

**After Each Task:**
- Note which model was used and why
- Document any model switching that occurred
- Record successes and challenges with specific models
- Update `improvements.md` with model performance insights

**Performance Metrics to Track:**
- Task completion time by model
- Success rate for different task types
- Quality of output for various models
- Frequency of model switching needed