# BACKLOG: Simplified Task List
# Format: | STATUS | TASK_ID | TASK_DESCRIPTION | MODEL | DoD

# HIGH PRIORITY TASKS (Most Important)
[ ] | T409 | Hire and onboard freelance investigative writers | GPT-4o | Review applications, conduct interviews, onboard 3-5 writers, establish workflow and quality standards
[ ] | T410 | Create comprehensive style guide for consistent content quality | GPT-4o | Document tone guidelines, formatting standards, fact-checking procedures, citation requirements, editorial workflow
[x] | T407 | Implement relevant progressive web app features to maximize user retention and stickability | GPT-4.1 | Design app architecture, implement push notifications, etc.
[ ] | T408 | Create premium content platform for exclusive investigations | GPT-4.1 | Design paywall system, create premium content categories, implement access controls, marketing strategy
[ ] | T501 | Create standard page templates for key content types | GPT-5 mini | Create `_layouts/template-article.html`, `_layouts/template-profile.html`, `_layouts/template-organization.html` that use existing component renderer; ensure at least one article, one profile and one organization page render using the templates without build errors
[ ] | T502 | Implement site-wide navigation improvements | GPT-5 mini | Provide `_includes/breadcrumbs.html` (configurable include) and ensure `_includes/topnav.html` has accessible mobile toggle; run `bundle exec jekyll build` and verify no layout errors
[ ] | T520 | Restructure company/pfizer.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T521 | Restructure company/amazon.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[x] | T243 | Consolidate backlog files for better tracking | Gemini 2.5 Pro | Merge model-specific backlogs into main backlog with categorization, create status dashboard, update workflow docs
[x] | T205 | Analytics: Integrate Plausible with goals (buy_now, membership_start, newsletter) | Gemini 2.5 Pro | Events fire and appear in dashboard

# MEDIUM PRIORITY TASKS
[ ] | T411 | Develop content repurposing strategy for maximum reach | GPT-4o | Create social media content from articles, develop email newsletter content, create video scripts, podcast outlines
[ ] | T412 | Build community forum and discussion platform | GPT-4o | Choose forum software, integrate with main site, create community guidelines, moderate initial discussions
[ ] | T504 | Set up automated content publishing workflow | GPT-5 mini | Add a GitHub Actions workflow `/.github/workflows/publish-schedule.yml` that creates PRs or publishes posts based on `_data/schedule`; include a simple smoke test for schedule parsing
[ ] | T505 | Develop content recommendation engine | GPT-5 mini | Add `_includes/related-articles.html` (Liquid-only) that shows up to 3 related articles by tag; include 3 sample posts demonstrating behavior
[ ] | T522 | Restructure company/philip-morris.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T523 | Restructure company/monsanto.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T206 | Email capture + funnels (welcome + 3-step merch funnel) | Gemini 2.5 Pro | Forms submit; sequences active in provider; test subscriber receives all emails
[ ] | T207 | Pricing experiments framework (YAML-driven, UTM-coded offers) | Gemini 2.5 Pro | 2 live price tests; conversions logged per variant
[ ] | T209 | Reviews/UGC component (YAML-backed testimonials) | Gemini 2.5 Pro | Component live with 5 seeded reviews; shown on top 10 products
[ ] | T210 | Bundles + coupons via Stripe | Gemini 2.5 Pro | 2 bundle pages live and purchasable; coupons applied in Stripe

# LOW PRIORITY TASKS
[ ] | T413 | Create educational content series on corporate accountability | GPT-4o | Develop curriculum outline, create training modules, implement progress tracking, certification system
[ ] | T414 | Develop thought leadership content and white papers | GPT-4o | Research trending topics, create in-depth analysis, design professional layouts, distribution strategy
[ ] | T415 | Create multimedia content (videos, podcasts, infographics) | GPT-4o | Set up production workflow, create initial content pieces, optimize for SEO, track engagement metrics
[ ] | T503 | Optimize images across the site | GPT-5 mini | Create `scripts/optimize-images.sh` (dry-run + apply flags) and apply to `assets/` sample images; document required tools in `_docs/performance-optimization-report.md`
[ ] | T506 | Create interactive data visualizations | GPT-5 mini | Add two visualization components (Chart.js or SVG) consuming `_data/*.yml` sample datasets; include a demo page verifying rendering
[ ] | T507 | Implement dark mode toggle | GPT-5 mini | Provide optional dark-theme CSS and a small JS toggle that persists user preference in localStorage; ensure no inline styles were added
[ ] | T508 | Create RSS feeds by category | GPT-5 mini | Add category-specific RSS generation and verify at least 2 category feeds validate with RSS validator
[ ] | T524 | Restructure company/walmart.md to use company_profile layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T525 | Check and restructure company/index.md if it contains HTML | Grok Code Fast 1 | If HTML present, move to appropriate layout, leave only frontmatter
[ ] | T526 | Restructure organizations/index.md to use appropriate layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T527 | Restructure checkout.md to use appropriate layout and frontmatter data | Grok Code Fast 1 | Move HTML to layout, leave only frontmatter in .md file
[ ] | T211 | Performance pass on merch pages (LCP < 2.5s) | Gemini 2.5 Pro | Lighthouse 90+ Perf on 5 merch URLs; images compressed
[ ] | T212 | Currency display (USD/EUR/PLN) selector | Gemini 2.5 Pro | Front-end selector updates displayed prices sitewide
[ ] | T213 | Legal: Returns, Shipping, Terms, Privacy, Cookies pages | Gemini 2.5 Pro | Pages published and linked in footer
[ ] | T214 | Fulfillment: choose POD (Printful/Printify) + connect 3 SKUs | Gemini 2.5 Pro | 3 products synced with mockups; fulfillment flow documented

# COMPLETED TASKS
[x] | T301 | Audit all internal and external links across the site using grep patterns | GPT-4.1 | Create comprehensive link inventory in _docs/link-audit.md, identify broken/outdated links, document findings with recommendations
[x] | T302 | Create automation scripts for repetitive validation tasks (link checking, front matter validation) | GPT-4.1 | Create scripts/link-checker.sh and scripts/frontmatter-validator.sh with proper error handling and documentation
[x] | T400 | Implement Stripe payment processing for membership tiers | GPT-4.1 | Set up Stripe account, integrate payment forms, implement subscription management, test payment flow
[x] | T403 | Develop social media marketing strategy and content calendar | GPT-4.1 | Create brand accounts, develop content pillars, set up posting schedule, engagement strategy, growth tactics
[x] | T424 | Launch social media accounts and initial content | GPT-4.1 | Set up Twitter/X, LinkedIn, Reddit accounts with branding, post initial content series, establish posting schedule
[x] | T425 | Implement SEO optimization across site | GPT-4.1 | Add meta tags, schema markup, optimize content for keywords, set up Google Search Console, create sitemap
[x] | T404 | Create merchandise store with satirical corporate evil products | GPT-4.1 | Design product line, set up e-commerce platform, integrate with main site, launch marketing campaign
[x] | T405 | Build partnerships with NGOs and activist organizations | GPT-4.1 | Identify target organizations, develop partnership proposals, establish collaboration agreements, joint content initiatives
[x] | T406 | Implement advanced analytics and user tracking | GPT-4.1 | Set up Google Analytics 4, implement conversion tracking, create custom dashboards, user behavior analysis
[x] | T305 | Perform content cross-check process across all articles | GPT-4o | Verify front matter fields, formatting consistency, permalink structure, reference styles, document findings and recommendations in _docs/content-consistency-report.md
[x] | T509 | Rework main site navigation into a data-driven component | GPT-5 mini | Create `_data/topnav.yml`, `_includes/topnav.html`, update `_layouts/default.html` to include component; top nav should prioritize profitable links (Shop, Membership, Consulting, Courses, Jobs, Newsletter); ensure accessible markup and mobile menu
[x] | T510 | Remove the 'hellfire' theme entirely and clean up related assets | GPT-4.1 | Remove hellfire CSS, templates and assets; perform comprehensive site scan to ensure no references remain; run `bundle exec jekyll build` and grep for 'hellfire' occurrences
[x] | T511 | Add CSS for the new top nav and mobile styles | GPT-5 mini | Create `assets/css/topnav.css`, responsive mobile rules, and small utility classes; ensure contrast/accessibility and that Shop CTA is prominent
[x] | T512 | Wire analytics events for top nav links | GPT-4o | Add data attributes to topnav links and include small script to emit events to Plausible/GA4; document events and test manually
[x] | T513 | Move the hellfire header to use the same data-driven topnav include | Grok Code Fast 1 | Update `_layouts/default.html` hellfire section to `{% include topnav.html %}` and remove duplicate nav markup; ensure visual parity and run build
[x] | T514 | Comprehensive site scan after nav/theme changes | GPT-4.1 | Run grep and link checks across repo and `_site`, create report in `_docs/link-audit.md` and `_docs/refactor.md` with any remaining issues
[x] | T221 | Tag all 50 merch pages; auto-generate theme indexes | Gemini 2.5 Pro | Tags added; theme pages built from tags





# NOTES
- Use scripts/start-task.sh to begin work on a task
- Use scripts/mark-task-done.sh TASK_ID to mark completion
- Jekyll build: `bundle exec jekyll build`
- Visual tests: `npm test`

---

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# NOTES
- Use scripts/start-task.sh to begin work on a task
- Use scripts/mark-task-done.sh TASK_ID to mark completion
- Jekyll build: `bundle exec jekyll build`
- Visual tests: `npm test`



---

# Backlog Status Dashboard

**Last Updated**: {{ site.time | date: "%Y-%m-%d %H:%M UTC" }}

## Overview

This dashboard provides a real-time view of task progress across all Copilot models in the simplified backlog format.

### Task Statistics

{% assign all_tasks = 0 %}
{% assign completed_tasks = 0 %}
{% assign pending_tasks = 0 %}

<!-- Read and parse the backlog file -->
{% assign backlog_content = site.data.backlog-stats %}

<div class="stats-grid">
  <div class="stat-card">
    <h3>Total Tasks</h3>
    <div class="stat-number" id="total-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Completed</h3>
    <div class="stat-number completed" id="completed-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Pending</h3>
    <div class="stat-number pending" id="pending-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Completion Rate</h3>
    <div class="stat-number" id="completion-rate">Loading...</div>
  </div>
</div>

## Tasks by Model

### High Priority Tasks
- **GPT-4.1**: Complex debugging, configuration, multi-step tasks
- **GPT-4o**: Content creation, editing, ethical considerations  
- **Gemini 2.5 Pro**: Advanced analytics, e-commerce features
- **GPT-5 mini**: Moderate complexity tasks, general development
- **Grok Code Fast 1**: Routine maintenance, simple edits

### Model Distribution

<div class="model-stats">
  <div class="model-card">
    <h4>GPT-4.1</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt4" style="width: 0%" id="gpt4-progress"></div>
      </div>
      <span class="progress-text" id="gpt4-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>GPT-4o</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt4o" style="width: 0%" id="gpt4o-progress"></div>
      </div>
      <span class="progress-text" id="gpt4o-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>Gemini 2.5 Pro</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gemini" style="width: 0%" id="gemini-progress"></div>
      </div>
      <span class="progress-text" id="gemini-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>GPT-5 mini</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt5" style="width: 0%" id="gpt5-progress"></div>
      </div>
      <span class="progress-text" id="gpt5-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>Grok Code Fast 1</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill grok" style="width: 0%" id="grok-progress"></div>
      </div>
      <span class="progress-text" id="grok-text">0/0 tasks</span>
    </div>
  </div>
</div>

## Recent Activity

<div id="recent-activity">
  <p>Loading recent task activity...</p>
</div>

## Quick Actions

<div class="action-buttons">
  <a href="/docs/backlog-all/" class="btn btn-primary">View Full Backlog</a>
  <a href="https://github.com/maciejjankowski/evil1.org/blob/main/_docs/backlog-all.md" class="btn btn-secondary">Edit on GitHub</a>
  <button onclick="refreshDashboard()" class="btn btn-accent">Refresh Data</button>
</div>

<script>
// Dashboard JavaScript for real-time updates
async function loadBacklogStats() {
  try {
    // Fetch the backlog file and parse task statistics
    const response = await fetch('/docs/backlog-all.md');
    if (!response.ok) {
      // Fallback to GitHub raw if local fetch fails
      const githubResponse = await fetch('https://raw.githubusercontent.com/maciejjankowski/evil1.org/main/_docs/backlog-all.md');
      const content = await githubResponse.text();
      parseBacklogContent(content);
    } else {
      const content = await response.text();
      parseBacklogContent(content);
    }
  } catch (error) {
    console.error('Error loading backlog:', error);
    displayError();
  }
}

function parseBacklogContent(content) {
  const lines = content.split('\n');
  const stats = {
    total: 0,
    completed: 0,
    pending: 0,
    models: {
      'GPT-4.1': {completed: 0, total: 0},
      'GPT-4o': {completed: 0, total: 0},
      'Gemini 2.5 Pro': {completed: 0, total: 0},
      'GPT-5 mini': {completed: 0, total: 0},
      'Grok Code Fast 1': {completed: 0, total: 0}
    }
  };
  
  lines.forEach(line => {
    if (line.match(/^\[[ x]\] \|/)) {
      stats.total++;
      const isCompleted = line.startsWith('[x]');
      if (isCompleted) {
        stats.completed++;
      } else {
        stats.pending++;
      }
      
      // Extract model name
      const modelMatch = line.match(/\| (GPT-4\.1|GPT-4o|Gemini 2\.5 Pro|GPT-5 mini|Grok Code Fast 1) \|/);
      if (modelMatch) {
        const model = modelMatch[1];
        stats.models[model].total++;
        if (isCompleted) {
          stats.models[model].completed++;
        }
      }
    }
  });
  
  updateDashboard(stats);
}

function updateDashboard(stats) {
  // Update main statistics
  document.getElementById('total-tasks').textContent = stats.total;
  document.getElementById('completed-tasks').textContent = stats.completed;
  document.getElementById('pending-tasks').textContent = stats.pending;
  
  const completionRate = stats.total > 0 ? Math.round((stats.completed / stats.total) * 100) : 0;
  document.getElementById('completion-rate').textContent = completionRate + '%';
  
  // Update model statistics
  Object.entries(stats.models).forEach(([model, data]) => {
    const modelKey = model.toLowerCase().replace(/[^a-z0-9]/g, '');
    const progressElement = document.getElementById(modelKey + '-progress');
    const textElement = document.getElementById(modelKey + '-text');
    
    if (progressElement && textElement) {
      const percentage = data.total > 0 ? Math.round((data.completed / data.total) * 100) : 0;
      progressElement.style.width = percentage + '%';
      textElement.textContent = `${data.completed}/${data.total} tasks`;
    }
  });
}

function displayError() {
  document.getElementById('total-tasks').textContent = 'Error';
  document.getElementById('completed-tasks').textContent = 'Error';
  document.getElementById('pending-tasks').textContent = 'Error';
  document.getElementById('completion-rate').textContent = 'Error';
}

function refreshDashboard() {
  loadBacklogStats();
}

// Load dashboard on page load
document.addEventListener('DOMContentLoaded', loadBacklogStats);

// Auto-refresh every 5 minutes
setInterval(loadBacklogStats, 5 * 60 * 1000);
</script>

<style>
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin: 2rem 0;
}

.stat-card {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1.5rem;
  text-align: center;
}

.stat-number {
  font-size: 2rem;
  font-weight: bold;
  color: #495057;
}

.stat-number.completed {
  color: #28a745;
}

.stat-number.pending {
  color: #ffc107;
}

.model-stats {
  display: grid;
  gap: 1rem;
  margin: 2rem 0;
}

.model-card {
  background: #fff;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1rem;
}

.model-progress {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.progress-bar {
  flex: 1;
  height: 20px;
  background: #e9ecef;
  border-radius: 10px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  transition: width 0.3s ease;
}

.progress-fill.gpt4 { background: #007bff; }
.progress-fill.gpt4o { background: #28a745; }
.progress-fill.gemini { background: #dc3545; }
.progress-fill.gpt5 { background: #ffc107; }
.progress-fill.grok { background: #6f42c1; }

.progress-text {
  font-weight: bold;
  min-width: 80px;
  text-align: right;
}

.action-buttons {
  display: flex;
  gap: 1rem;
  margin: 2rem 0;
  flex-wrap: wrap;
}

.btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  text-decoration: none;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.2s;
}

.btn-primary {
  background: #007bff;
  color: white;
}

.btn-secondary {
  background: #6c757d;
  color: white;
}

.btn-accent {
  background: #17a2b8;
  color: white;
}

.btn:hover {
  opacity: 0.9;
}

#recent-activity {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1rem;
  margin: 2rem 0;
}
</style>


---

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.



---

# Backlog Status Dashboard

**Last Updated**: {{ site.time | date: "%Y-%m-%d %H:%M UTC" }}

## Overview

This dashboard provides a real-time view of task progress across all Copilot models in the simplified backlog format.

### Task Statistics

{% assign all_tasks = 0 %}
{% assign completed_tasks = 0 %}
{% assign pending_tasks = 0 %}

<!-- Read and parse the backlog file -->
{% assign backlog_content = site.data.backlog-stats %}

<div class="stats-grid">
  <div class="stat-card">
    <h3>Total Tasks</h3>
    <div class="stat-number" id="total-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Completed</h3>
    <div class="stat-number completed" id="completed-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Pending</h3>
    <div class="stat-number pending" id="pending-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Completion Rate</h3>
    <div class="stat-number" id="completion-rate">Loading...</div>
  </div>
</div>

## Tasks by Model

### High Priority Tasks
- **GPT-4.1**: Complex debugging, configuration, multi-step tasks
- **GPT-4o**: Content creation, editing, ethical considerations  
- **Gemini 2.5 Pro**: Advanced analytics, e-commerce features
- **GPT-5 mini**: Moderate complexity tasks, general development
- **Grok Code Fast 1**: Routine maintenance, simple edits

### Model Distribution

<div class="model-stats">
  <div class="model-card">
    <h4>GPT-4.1</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt4" style="width: 0%" id="gpt4-progress"></div>
      </div>
      <span class="progress-text" id="gpt4-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>GPT-4o</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt4o" style="width: 0%" id="gpt4o-progress"></div>
      </div>
      <span class="progress-text" id="gpt4o-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>Gemini 2.5 Pro</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gemini" style="width: 0%" id="gemini-progress"></div>
      </div>
      <span class="progress-text" id="gemini-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>GPT-5 mini</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt5" style="width: 0%" id="gpt5-progress"></div>
      </div>
      <span class="progress-text" id="gpt5-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>Grok Code Fast 1</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill grok" style="width: 0%" id="grok-progress"></div>
      </div>
      <span class="progress-text" id="grok-text">0/0 tasks</span>
    </div>
  </div>
</div>

## Recent Activity

<div id="recent-activity">
  <p>Loading recent task activity...</p>
</div>

## Quick Actions

<div class="action-buttons">
  <a href="/docs/backlog-all/" class="btn btn-primary">View Full Backlog</a>
  <a href="https://github.com/maciejjankowski/evil1.org/blob/main/_docs/backlog-all.md" class="btn btn-secondary">Edit on GitHub</a>
  <button onclick="refreshDashboard()" class="btn btn-accent">Refresh Data</button>
</div>

<script>
// Dashboard JavaScript for real-time updates
async function loadBacklogStats() {
  try {
    // Fetch the backlog file and parse task statistics
    const response = await fetch('/docs/backlog-all.md');
    if (!response.ok) {
      // Fallback to GitHub raw if local fetch fails
      const githubResponse = await fetch('https://raw.githubusercontent.com/maciejjankowski/evil1.org/main/_docs/backlog-all.md');
      const content = await githubResponse.text();
      parseBacklogContent(content);
    } else {
      const content = await response.text();
      parseBacklogContent(content);
    }
  } catch (error) {
    console.error('Error loading backlog:', error);
    displayError();
  }
}

function parseBacklogContent(content) {
  const lines = content.split('\n');
  const stats = {
    total: 0,
    completed: 0,
    pending: 0,
    models: {
      'GPT-4.1': {completed: 0, total: 0},
      'GPT-4o': {completed: 0, total: 0},
      'Gemini 2.5 Pro': {completed: 0, total: 0},
      'GPT-5 mini': {completed: 0, total: 0},
      'Grok Code Fast 1': {completed: 0, total: 0}
    }
  };
  
  lines.forEach(line => {
    if (line.match(/^\[[ x]\] \|/)) {
      stats.total++;
      const isCompleted = line.startsWith('[x]');
      if (isCompleted) {
        stats.completed++;
      } else {
        stats.pending++;
      }
      
      // Extract model name
      const modelMatch = line.match(/\| (GPT-4\.1|GPT-4o|Gemini 2\.5 Pro|GPT-5 mini|Grok Code Fast 1) \|/);
      if (modelMatch) {
        const model = modelMatch[1];
        stats.models[model].total++;
        if (isCompleted) {
          stats.models[model].completed++;
        }
      }
    }
  });
  
  updateDashboard(stats);
}

function updateDashboard(stats) {
  // Update main statistics
  document.getElementById('total-tasks').textContent = stats.total;
  document.getElementById('completed-tasks').textContent = stats.completed;
  document.getElementById('pending-tasks').textContent = stats.pending;
  
  const completionRate = stats.total > 0 ? Math.round((stats.completed / stats.total) * 100) : 0;
  document.getElementById('completion-rate').textContent = completionRate + '%';
  
  // Update model statistics
  Object.entries(stats.models).forEach(([model, data]) => {
    const modelKey = model.toLowerCase().replace(/[^a-z0-9]/g, '');
    const progressElement = document.getElementById(modelKey + '-progress');
    const textElement = document.getElementById(modelKey + '-text');
    
    if (progressElement && textElement) {
      const percentage = data.total > 0 ? Math.round((data.completed / data.total) * 100) : 0;
      progressElement.style.width = percentage + '%';
      textElement.textContent = `${data.completed}/${data.total} tasks`;
    }
  });
}

function displayError() {
  document.getElementById('total-tasks').textContent = 'Error';
  document.getElementById('completed-tasks').textContent = 'Error';
  document.getElementById('pending-tasks').textContent = 'Error';
  document.getElementById('completion-rate').textContent = 'Error';
}

function refreshDashboard() {
  loadBacklogStats();
}

// Load dashboard on page load
document.addEventListener('DOMContentLoaded', loadBacklogStats);

// Auto-refresh every 5 minutes
setInterval(loadBacklogStats, 5 * 60 * 1000);
</script>

<style>
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin: 2rem 0;
}

.stat-card {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1.5rem;
  text-align: center;
}

.stat-number {
  font-size: 2rem;
  font-weight: bold;
  color: #495057;
}

.stat-number.completed {
  color: #28a745;
}

.stat-number.pending {
  color: #ffc107;
}

.model-stats {
  display: grid;
  gap: 1rem;
  margin: 2rem 0;
}

.model-card {
  background: #fff;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1rem;
}

.model-progress {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.progress-bar {
  flex: 1;
  height: 20px;
  background: #e9ecef;
  border-radius: 10px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  transition: width 0.3s ease;
}

.progress-fill.gpt4 { background: #007bff; }
.progress-fill.gpt4o { background: #28a745; }
.progress-fill.gemini { background: #dc3545; }
.progress-fill.gpt5 { background: #ffc107; }
.progress-fill.grok { background: #6f42c1; }

.progress-text {
  font-weight: bold;
  min-width: 80px;
  text-align: right;
}

.action-buttons {
  display: flex;
  gap: 1rem;
  margin: 2rem 0;
  flex-wrap: wrap;
}

.btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  text-decoration: none;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.2s;
}

.btn-primary {
  background: #007bff;
  color: white;
}

.btn-secondary {
  background: #6c757d;
  color: white;
}

.btn-accent {
  background: #17a2b8;
  color: white;
}

.btn:hover {
  opacity: 0.9;
}

#recent-activity {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1rem;
  margin: 2rem 0;
}
</style>


---

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.



---

# Backlog Status Dashboard

**Last Updated**: {{ site.time | date: "%Y-%m-%d %H:%M UTC" }}

## Overview

This dashboard provides a real-time view of task progress across all Copilot models in the simplified backlog format.

### Task Statistics

{% assign all_tasks = 0 %}
{% assign completed_tasks = 0 %}
{% assign pending_tasks = 0 %}

<!-- Read and parse the backlog file -->
{% assign backlog_content = site.data.backlog-stats %}

<div class="stats-grid">
  <div class="stat-card">
    <h3>Total Tasks</h3>
    <div class="stat-number" id="total-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Completed</h3>
    <div class="stat-number completed" id="completed-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Pending</h3>
    <div class="stat-number pending" id="pending-tasks">Loading...</div>
  </div>
  <div class="stat-card">
    <h3>Completion Rate</h3>
    <div class="stat-number" id="completion-rate">Loading...</div>
  </div>
</div>

## Tasks by Model

### High Priority Tasks
- **GPT-4.1**: Complex debugging, configuration, multi-step tasks
- **GPT-4o**: Content creation, editing, ethical considerations  
- **Gemini 2.5 Pro**: Advanced analytics, e-commerce features
- **GPT-5 mini**: Moderate complexity tasks, general development
- **Grok Code Fast 1**: Routine maintenance, simple edits

### Model Distribution

<div class="model-stats">
  <div class="model-card">
    <h4>GPT-4.1</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt4" style="width: 0%" id="gpt4-progress"></div>
      </div>
      <span class="progress-text" id="gpt4-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>GPT-4o</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt4o" style="width: 0%" id="gpt4o-progress"></div>
      </div>
      <span class="progress-text" id="gpt4o-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>Gemini 2.5 Pro</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gemini" style="width: 0%" id="gemini-progress"></div>
      </div>
      <span class="progress-text" id="gemini-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>GPT-5 mini</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill gpt5" style="width: 0%" id="gpt5-progress"></div>
      </div>
      <span class="progress-text" id="gpt5-text">0/0 tasks</span>
    </div>
  </div>
  
  <div class="model-card">
    <h4>Grok Code Fast 1</h4>
    <div class="model-progress">
      <div class="progress-bar">
        <div class="progress-fill grok" style="width: 0%" id="grok-progress"></div>
      </div>
      <span class="progress-text" id="grok-text">0/0 tasks</span>
    </div>
  </div>
</div>

## Recent Activity

<div id="recent-activity">
  <p>Loading recent task activity...</p>
</div>

## Quick Actions

<div class="action-buttons">
  <a href="/docs/backlog-all/" class="btn btn-primary">View Full Backlog</a>
  <a href="https://github.com/maciejjankowski/evil1.org/blob/main/_docs/backlog-all.md" class="btn btn-secondary">Edit on GitHub</a>
  <button onclick="refreshDashboard()" class="btn btn-accent">Refresh Data</button>
</div>

<script>
// Dashboard JavaScript for real-time updates
async function loadBacklogStats() {
  try {
    // Fetch the backlog file and parse task statistics
    const response = await fetch('/docs/backlog-all.md');
    if (!response.ok) {
      // Fallback to GitHub raw if local fetch fails
      const githubResponse = await fetch('https://raw.githubusercontent.com/maciejjankowski/evil1.org/main/_docs/backlog-all.md');
      const content = await githubResponse.text();
      parseBacklogContent(content);
    } else {
      const content = await response.text();
      parseBacklogContent(content);
    }
  } catch (error) {
    console.error('Error loading backlog:', error);
    displayError();
  }
}

function parseBacklogContent(content) {
  const lines = content.split('\n');
  const stats = {
    total: 0,
    completed: 0,
    pending: 0,
    models: {
      'GPT-4.1': {completed: 0, total: 0},
      'GPT-4o': {completed: 0, total: 0},
      'Gemini 2.5 Pro': {completed: 0, total: 0},
      'GPT-5 mini': {completed: 0, total: 0},
      'Grok Code Fast 1': {completed: 0, total: 0}
    }
  };
  
  lines.forEach(line => {
    if (line.match(/^\[[ x]\] \|/)) {
      stats.total++;
      const isCompleted = line.startsWith('[x]');
      if (isCompleted) {
        stats.completed++;
      } else {
        stats.pending++;
      }
      
      // Extract model name
      const modelMatch = line.match(/\| (GPT-4\.1|GPT-4o|Gemini 2\.5 Pro|GPT-5 mini|Grok Code Fast 1) \|/);
      if (modelMatch) {
        const model = modelMatch[1];
        stats.models[model].total++;
        if (isCompleted) {
          stats.models[model].completed++;
        }
      }
    }
  });
  
  updateDashboard(stats);
}

function updateDashboard(stats) {
  // Update main statistics
  document.getElementById('total-tasks').textContent = stats.total;
  document.getElementById('completed-tasks').textContent = stats.completed;
  document.getElementById('pending-tasks').textContent = stats.pending;
  
  const completionRate = stats.total > 0 ? Math.round((stats.completed / stats.total) * 100) : 0;
  document.getElementById('completion-rate').textContent = completionRate + '%';
  
  // Update model statistics
  Object.entries(stats.models).forEach(([model, data]) => {
    const modelKey = model.toLowerCase().replace(/[^a-z0-9]/g, '');
    const progressElement = document.getElementById(modelKey + '-progress');
    const textElement = document.getElementById(modelKey + '-text');
    
    if (progressElement && textElement) {
      const percentage = data.total > 0 ? Math.round((data.completed / data.total) * 100) : 0;
      progressElement.style.width = percentage + '%';
      textElement.textContent = `${data.completed}/${data.total} tasks`;
    }
  });
}

function displayError() {
  document.getElementById('total-tasks').textContent = 'Error';
  document.getElementById('completed-tasks').textContent = 'Error';
  document.getElementById('pending-tasks').textContent = 'Error';
  document.getElementById('completion-rate').textContent = 'Error';
}

function refreshDashboard() {
  loadBacklogStats();
}

// Load dashboard on page load
document.addEventListener('DOMContentLoaded', loadBacklogStats);

// Auto-refresh every 5 minutes
setInterval(loadBacklogStats, 5 * 60 * 1000);
</script>

<style>
.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 1rem;
  margin: 2rem 0;
}

.stat-card {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1.5rem;
  text-align: center;
}

.stat-number {
  font-size: 2rem;
  font-weight: bold;
  color: #495057;
}

.stat-number.completed {
  color: #28a745;
}

.stat-number.pending {
  color: #ffc107;
}

.model-stats {
  display: grid;
  gap: 1rem;
  margin: 2rem 0;
}

.model-card {
  background: #fff;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1rem;
}

.model-progress {
  display: flex;
  align-items: center;
  gap: 1rem;
}

.progress-bar {
  flex: 1;
  height: 20px;
  background: #e9ecef;
  border-radius: 10px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  transition: width 0.3s ease;
}

.progress-fill.gpt4 { background: #007bff; }
.progress-fill.gpt4o { background: #28a745; }
.progress-fill.gemini { background: #dc3545; }
.progress-fill.gpt5 { background: #ffc107; }
.progress-fill.grok { background: #6f42c1; }

.progress-text {
  font-weight: bold;
  min-width: 80px;
  text-align: right;
}

.action-buttons {
  display: flex;
  gap: 1rem;
  margin: 2rem 0;
  flex-wrap: wrap;
}

.btn {
  padding: 0.5rem 1rem;
  border: none;
  border-radius: 4px;
  text-decoration: none;
  font-weight: bold;
  cursor: pointer;
  transition: background-color 0.2s;
}

.btn-primary {
  background: #007bff;
  color: white;
}

.btn-secondary {
  background: #6c757d;
  color: white;
}

.btn-accent {
  background: #17a2b8;
  color: white;
}

.btn:hover {
  opacity: 0.9;
}

#recent-activity {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 1rem;
  margin: 2rem 0;
}
</style>


---

# TASKS for GPT-5 mini
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] pending, [x] complete
# This file contains only tasks that are best-suited for the GPT-5 mini model.
# Use this file as the working backlog when assigning or running GPT-5 mini.

# HIGH PRIORITY - Moderate complexity tasks, basic content updates
[ ] | T501 | Create standard page templates for key content types | DoD: Design templates for profiles, articles, organization pages with reusable components
[ ] | T502 | Implement site-wide navigation improvements | DoD: Add breadcrumbs, enhance mobile menu, improve internal link structure

# MEDIUM PRIORITY
[ ] | T504 | Set up automated content publishing workflow | DoD: Create GitHub Actions workflow for scheduled content publishing
[ ] | T505 | Develop content recommendation engine | DoD: Implement "Related Articles" feature based on categories and tags
[ ] | T506 | Create interactive data visualizations | DoD: Build 3 data visualizations for corporate evil metrics

# LOW PRIORITY
[ ] | T503 | Optimize images across the site | DoD: Compress all images, implement responsive images, add proper alt text
[ ] | T507 | Implement dark mode toggle | DoD: Add dark theme CSS, implement preference toggle, ensure all components support both themes
[ ] | T508 | Create RSS feeds by category | DoD: Implement category-specific RSS feeds, add subscription options

## Next steps
- Review each task and pick the first small task to implement (e.g., T503 image optimization or T502 navigation tweaks).
- For each selected task, create a task document using `scripts/start-task.sh "Short description"` and update this file when complete using `./scripts/mark-task-done.sh TASK_ID`.

### Notes: Image optimization helper
- A helper script `scripts/optimize-images.sh` was added (dry-run by default).
- To preview changes locally run: `./scripts/optimize-images.sh` (no changes).
- To apply optimizations after confirming, install `jpegoptim`/`pngquant` or ImageMagick and run:
	`./scripts/optimize-images.sh --apply --quality 85`

### Current work
- T502 is the active next task to work on (site-wide navigation improvements). A task document will be created and a starter include added in `_includes/breadcrumbs.html`.

