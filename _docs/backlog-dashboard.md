---
layout: default
title: "Backlog Status Dashboard"
description: "Real-time view of task progress across all Copilot models"
permalink: /docs/backlog-dashboard/
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
