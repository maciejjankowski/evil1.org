# INSTRUCTIONS FOR AI ASSISTANT

## Task Management
- After task completion mark the task complete like that: [x]
- Should a task need splitting into smaller tasks, add those smaller tasks with clear description and clear deliverables into the backlog.md file and then process them
- Always reread the backlog and don't ask for confirmation unless you have finished all TASKS
- Always reread the backlog.md file before starting work as it may have been updated with new tasks or changes
- **ALWAYS REREAD THE BACKLOG.MD FILE AFTER COMPLETING ANY TASK** to ensure no new tasks were added and to verify task completion status

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

## VERIFICATION & TESTING PROTOCOL
### **MANDATORY VERIFICATION STEPS**
- **ALWAYS** test fixes by running the site and viewing actual rendered pages
- **NEVER** mark tasks as `[x]` until personally verified working
- **ALWAYS** check generated HTML output to confirm changes took effect
- **NEVER** assume fixes work - prove them with actual testing

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