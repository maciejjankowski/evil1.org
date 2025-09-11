# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.
