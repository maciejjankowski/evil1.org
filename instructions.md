# INSTRUCTIONS FOR AI ASSISTANT

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

## COPILOT MODEL SELECTION GUIDE

### Model Capabilities & Use Cases

**GPT-4 (Primary Model)**
- **Best for:** Complex reasoning, multi-step tasks, content creation, debugging complex issues
- **Use when:** Working with Jekyll configuration, debugging 404 errors, creating new content, analyzing site structure
- **Strengths:** Deep understanding of web development, excellent at troubleshooting, comprehensive documentation
- **When to switch:** For simple tasks or when GPT-4 seems stuck on basic operations

**GPT-3.5-Turbo (Secondary Model)**
- **Best for:** Quick tasks, simple file edits, repetitive operations, basic content updates
- **Use when:** Making straightforward changes, running simple commands, basic file operations
- **Strengths:** Fast response times, good for routine maintenance, efficient for simple tasks
- **When to switch:** For complex debugging, content creation, or when task requires deep analysis

**Claude (Alternative Model)**
- **Best for:** Content writing, documentation, ethical considerations, complex analysis
- **Use when:** Creating articles, writing documentation, analyzing business/corporate content
- **Strengths:** Excellent writing quality, strong ethical reasoning, good for narrative content
- **When to switch:** For technical debugging or when web development expertise is needed

### Task-Based Model Recommendations

**🔧 Jekyll Development & Debugging**
- **Use GPT-4** for: Front matter issues, permalink problems, build errors, configuration debugging
- **Use GPT-3.5** for: Simple file edits, running basic commands, routine maintenance
- **Use Claude** for: Content creation, documentation writing, site structure analysis

**📝 Content Creation & Editing**
- **Use GPT-4** for: Technical content, complex articles, debugging content issues
- **Use Claude** for: Narrative writing, ethical content, business analysis articles
- **Use GPT-3.5** for: Simple content updates, basic editing, routine content tasks

**🐛 Error Resolution & Troubleshooting**
- **Use GPT-4** for: Complex debugging, 404 errors, build failures, configuration issues
- **Use GPT-3.5** for: Simple syntax errors, basic validation, quick fixes
- **Use Claude** for: Analyzing error patterns, documenting solutions, preventive measures

**⚙️ Configuration & Setup**
- **Use GPT-4** for: Jekyll configuration, plugin setup, complex integrations
- **Use GPT-3.5** for: Basic setup tasks, simple configuration changes
- **Use Claude** for: Documentation of setup processes, configuration analysis

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
- **GPT-4:** Deep technical analysis, comprehensive debugging, complex problem-solving
- **GPT-3.5:** Fast execution, reliable for routine tasks, efficient simple operations
- **Claude:** High-quality content, ethical considerations, excellent documentation

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