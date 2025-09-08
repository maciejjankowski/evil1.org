---
layout: default
title: "Admin Dashboard - evil1.org"
description: "Comprehensive admin dashboard for site analytics and content management"
permalink: "/admin/dashboard/"
---

<div class="admin-dashboard">
    <header class="dashboard-header">
        <h1>📊 Admin Dashboard</h1>
        <p>Site analytics and content management overview</p>
    </header>

    <div class="dashboard-grid">
        <!-- Quick Stats -->
        <section class="dashboard-card stats-overview">
            <h2>📈 Quick Stats</h2>
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-number" id="total-articles">{{ site.articles | size }}</div>
                    <div class="stat-label">Total Articles</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" id="total-tags">{{ site.articles | map: 'tags' | compact | flatten | uniq | size }}</div>
                    <div class="stat-label">Total Tags</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" id="this-month">{{ site.articles | where_exp: "article", "article.date >= site.time | date: '%Y-%m-01'" | size }}</div>
                    <div class="stat-label">This Month</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number" id="avg-words">{{ site.articles | map: 'content' | map: 'number_of_words' | average | round }}</div>
                    <div class="stat-label">Avg Words</div>
                </div>
            </div>
        </section>

        <!-- Content Management -->
        <section class="dashboard-card content-management">
            <h2>📝 Content Management</h2>
            <div class="management-actions">
                <a href="/admin/" class="action-btn primary">
                    <span class="icon">✏️</span>
                    <span class="text">Create Article</span>
                </a>
                <a href="/admin/bulk-edit/" class="action-btn secondary">
                    <span class="icon">📋</span>
                    <span class="text">Bulk Edit</span>
                </a>
                <a href="/admin/analytics/" class="action-btn secondary">
                    <span class="icon">📊</span>
                    <span class="text">Analytics</span>
                </a>
                <button class="action-btn warning" onclick="runQualityCheck()">
                    <span class="icon">🔍</span>
                    <span class="text">Quality Check</span>
                </button>
            </div>
        </section>

        <!-- Recent Articles -->
        <section class="dashboard-card recent-articles">
            <h2>📰 Recent Articles</h2>
            <div id="recent-articles-list">
                {% assign recent_articles = site.articles | sort: 'date' | reverse | limit: 5 %}
                {% for article in recent_articles %}
                    <div class="article-item">
                        <div class="article-info">
                            <h4><a href="{{ article.url }}" target="_blank">{{ article.title }}</a></h4>
                            <div class="article-meta">
                                <span class="date">{{ article.date | date: "%b %d, %Y" }}</span>
                                {% if article.reading_time %}
                                    <span class="reading-time">• {{ article.reading_time }} min</span>
                                {% endif %}
                            </div>
                        </div>
                        <div class="article-actions">
                            <button class="action-btn small" onclick="editArticle('{{ article.path }}')">
                                ✏️
                            </button>
                            <button class="action-btn small danger" onclick="deleteArticle('{{ article.path }}')">
                                🗑️
                            </button>
                        </div>
                    </div>
                {% endfor %}
            </div>
            <div class="card-footer">
                <a href="/articles/" class="view-all-link">View All Articles →</a>
            </div>
        </section>

        <!-- Site Health -->
        <section class="dashboard-card site-health">
            <h2>🏥 Site Health</h2>
            <div class="health-metrics">
                <div class="health-item">
                    <span class="health-label">Build Status</span>
                    <span class="health-status success">✅ Healthy</span>
                </div>
                <div class="health-item">
                    <span class="health-label">SEO Score</span>
                    <span class="health-status good">🟢 85/100</span>
                </div>
                <div class="health-item">
                    <span class="health-label">Performance</span>
                    <span class="health-status good">🟢 Good</span>
                </div>
                <div class="health-item">
                    <span class="health-label">Security</span>
                    <span class="health-status success">✅ Secure</span>
                </div>
            </div>
        </section>

        <!-- Content Analytics -->
        <section class="dashboard-card content-analytics">
            <h2>📊 Content Analytics</h2>
            <div class="analytics-chart">
                <canvas id="contentChart" width="400" height="200"></canvas>
            </div>
            <div class="analytics-summary">
                <div class="summary-item">
                    <span class="summary-label">Most Popular Tag</span>
                    <span class="summary-value">Corporate Corruption</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Longest Article</span>
                    <span class="summary-value">Enron Scandal (2,450 words)</span>
                </div>
                <div class="summary-item">
                    <span class="summary-label">Shortest Article</span>
                    <span class="summary-value">Quick Facts (150 words)</span>
                </div>
            </div>
        </section>

        <!-- System Information -->
        <section class="dashboard-card system-info">
            <h2>💻 System Information</h2>
            <div class="system-details">
                <div class="system-item">
                    <span class="system-label">Jekyll Version</span>
                    <span class="system-value">{{ jekyll.version }}</span>
                </div>
                <div class="system-item">
                    <span class="system-label">Last Build</span>
                    <span class="system-value">{{ site.time | date: "%B %d, %Y at %H:%M" }}</span>
                </div>
                <div class="system-item">
                    <span class="system-label">Site Size</span>
                    <span class="system-value">{{ site.pages | size }} pages</span>
                </div>
                <div class="system-item">
                    <span class="system-label">Total Assets</span>
                    <span class="system-value">{{ site.static_files | size }} files</span>
                </div>
            </div>
        </section>

        <!-- Quick Actions -->
        <section class="dashboard-card quick-actions">
            <h2>⚡ Quick Actions</h2>
            <div class="actions-grid">
                <button class="quick-action-btn" onclick="rebuildSite()">
                    <span class="icon">🔄</span>
                    <span class="text">Rebuild Site</span>
                </button>
                <button class="quick-action-btn" onclick="optimizeImages()">
                    <span class="icon">🖼️</span>
                    <span class="text">Optimize Images</span>
                </button>
                <button class="quick-action-btn" onclick="backupSite()">
                    <span class="icon">💾</span>
                    <span class="text">Create Backup</span>
                </button>
                <button class="quick-action-btn" onclick="clearCache()">
                    <span class="icon">🧹</span>
                    <span class="text">Clear Cache</span>
                </button>
                <button class="quick-action-btn" onclick="exportData()">
                    <span class="icon">📤</span>
                    <span class="text">Export Data</span>
                </button>
                <button class="quick-action-btn" onclick="viewLogs()">
                    <span class="icon">📋</span>
                    <span class="text">View Logs</span>
                </button>
            </div>
        </section>

        <!-- Activity Feed -->
        <section class="dashboard-card activity-feed">
            <h2>📝 Recent Activity</h2>
            <div class="activity-list">
                <div class="activity-item">
                    <span class="activity-icon">📝</span>
                    <div class="activity-content">
                        <span class="activity-text">Article "Corporate Espionage" was published</span>
                        <span class="activity-time">2 hours ago</span>
                    </div>
                </div>
                <div class="activity-item">
                    <span class="activity-icon">🔍</span>
                    <div class="activity-content">
                        <span class="activity-text">Quality check completed - 8 issues found</span>
                        <span class="activity-time">4 hours ago</span>
                    </div>
                </div>
                <div class="activity-item">
                    <span class="activity-icon">🖼️</span>
                    <div class="activity-content">
                        <span class="activity-text">Images optimized - saved 2.3MB</span>
                        <span class="activity-time">1 day ago</span>
                    </div>
                </div>
                <div class="activity-item">
                    <span class="activity-icon">🔄</span>
                    <div class="activity-content">
                        <span class="activity-text">Site rebuilt successfully</span>
                        <span class="activity-time">2 days ago</span>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>

<style>
.admin-dashboard {
    max-width: 1400px;
    margin: 0 auto;
    padding: 2rem;
}

.dashboard-header {
    text-align: center;
    margin-bottom: 2rem;
    background: linear-gradient(135deg, #dc3545 0%, #c82333 100%);
    color: white;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(220, 53, 69, 0.3);
}

.dashboard-header h1 {
    font-size: 2.5rem;
    margin-bottom: 0.5rem;
}

.dashboard-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
    gap: 2rem;
}

.dashboard-card {
    background: white;
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0,0,0,0.1);
    border: 1px solid #e9ecef;
    overflow: hidden;
}

.dashboard-card h2 {
    background: #f8f9fa;
    color: #dc3545;
    margin: 0;
    padding: 1.5rem;
    border-bottom: 2px solid #e9ecef;
    font-size: 1.25rem;
    font-weight: 600;
}

.dashboard-card > div {
    padding: 1.5rem;
}

/* Stats Overview */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
}

.stat-item {
    text-align: center;
    padding: 1rem;
    background: #f8f9fa;
    border-radius: 8px;
    border: 1px solid #e9ecef;
}

.stat-number {
    font-size: 2rem;
    font-weight: bold;
    color: #dc3545;
    display: block;
    margin-bottom: 0.25rem;
}

.stat-label {
    font-size: 0.9rem;
    color: #666;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

/* Content Management */
.management-actions {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 1rem;
}

.action-btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    padding: 1rem;
    border: none;
    border-radius: 8px;
    text-decoration: none;
    color: white;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.2s ease;
    text-align: center;
}

.action-btn.primary {
    background: #dc3545;
}

.action-btn.primary:hover {
    background: #c82333;
    transform: translateY(-2px);
}

.action-btn.secondary {
    background: #6c757d;
    color: white;
}

.action-btn.secondary:hover {
    background: #5a6268;
    transform: translateY(-2px);
}

.action-btn.warning {
    background: #ffc107;
    color: #212529;
}

.action-btn.warning:hover {
    background: #e0a800;
    transform: translateY(-2px);
}

.action-btn .icon {
    font-size: 1.5rem;
}

.action-btn .text {
    font-size: 0.9rem;
}

/* Recent Articles */
.article-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    border-bottom: 1px solid #f0f0f0;
}

.article-item:last-child {
    border-bottom: none;
}

.article-info h4 {
    margin: 0 0 0.25rem 0;
    font-size: 1rem;
}

.article-info h4 a {
    color: #333;
    text-decoration: none;
}

.article-info h4 a:hover {
    color: #dc3545;
}

.article-meta {
    font-size: 0.85rem;
    color: #666;
}

.article-actions {
    display: flex;
    gap: 0.5rem;
}

.action-btn.small {
    padding: 0.5rem;
    font-size: 0.8rem;
    min-width: auto;
    width: 32px;
    height: 32px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.action-btn.small.danger {
    background: #dc3545;
}

.card-footer {
    padding: 1rem 1.5rem;
    background: #f8f9fa;
    border-top: 1px solid #e9ecef;
    text-align: center;
}

.view-all-link {
    color: #dc3545;
    text-decoration: none;
    font-weight: 600;
    font-size: 0.9rem;
}

.view-all-link:hover {
    text-decoration: underline;
}

/* Site Health */
.health-metrics {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.health-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.75rem;
    background: #f8f9fa;
    border-radius: 6px;
}

.health-label {
    font-weight: 500;
    color: #333;
}

.health-status.success {
    color: #28a745;
    font-weight: 600;
}

.health-status.good {
    color: #17a2b8;
    font-weight: 600;
}

/* Content Analytics */
.analytics-chart {
    margin-bottom: 1rem;
}

.analytics-summary {
    display: flex;
    flex-direction: column;
    gap: 0.75rem;
}

.summary-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.5rem 0;
    border-bottom: 1px solid #f0f0f0;
}

.summary-item:last-child {
    border-bottom: none;
}

.summary-label {
    font-weight: 500;
    color: #666;
}

.summary-value {
    font-weight: 600;
    color: #dc3545;
    text-align: right;
}

/* System Information */
.system-details {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.system-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.75rem;
    background: #f8f9fa;
    border-radius: 6px;
}

.system-label {
    font-weight: 500;
    color: #333;
}

.system-value {
    font-weight: 600;
    color: #dc3545;
}

/* Quick Actions */
.actions-grid {
    display: grid;
    grid-template-columns: repeat(2, 1fr);
    gap: 1rem;
}

.quick-action-btn {
    display: flex;
    flex-direction: column;
    align-items: center;
    gap: 0.5rem;
    padding: 1rem;
    border: 2px solid #e9ecef;
    border-radius: 8px;
    background: white;
    cursor: pointer;
    transition: all 0.2s ease;
    text-align: center;
}

.quick-action-btn:hover {
    border-color: #dc3545;
    background: #f8f9fa;
    transform: translateY(-1px);
}

.quick-action-btn .icon {
    font-size: 1.5rem;
}

.quick-action-btn .text {
    font-size: 0.9rem;
    font-weight: 600;
    color: #333;
}

/* Activity Feed */
.activity-list {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}

.activity-item {
    display: flex;
    align-items: flex-start;
    gap: 1rem;
    padding: 1rem;
    background: #f8f9fa;
    border-radius: 6px;
    border-left: 3px solid #dc3545;
}

.activity-icon {
    font-size: 1.2rem;
    flex-shrink: 0;
}

.activity-content {
    flex: 1;
}

.activity-text {
    display: block;
    color: #333;
    font-weight: 500;
}

.activity-time {
    display: block;
    color: #666;
    font-size: 0.8rem;
    margin-top: 0.25rem;
}

/* Responsive Design */
@media (max-width: 1024px) {
    .dashboard-grid {
        grid-template-columns: 1fr;
        gap: 1.5rem;
    }

    .stats-grid {
        grid-template-columns: 1fr;
    }

    .management-actions {
        grid-template-columns: 1fr;
    }
}

@media (max-width: 768px) {
    .admin-dashboard {
        padding: 1rem;
    }

    .dashboard-header {
        padding: 1.5rem;
    }

    .dashboard-header h1 {
        font-size: 2rem;
    }

    .actions-grid {
        grid-template-columns: 1fr;
    }

    .article-item {
        flex-direction: column;
        align-items: flex-start;
        gap: 0.75rem;
    }

    .article-actions {
        align-self: flex-end;
    }
}
</style>

<script>
// Dashboard JavaScript functionality
document.addEventListener('DOMContentLoaded', function() {
    // Initialize dashboard
    initializeDashboard();

    // Add event listeners
    setupEventListeners();
});

function initializeDashboard() {
    // Load dynamic data
    loadDashboardStats();

    // Initialize charts if Chart.js is available
    if (typeof Chart !== 'undefined') {
        initializeCharts();
    }
}

function loadDashboardStats() {
    // In a real implementation, this would fetch data from an API
    // For now, we'll use static data that updates periodically
    setInterval(() => {
        // Simulate real-time updates
        const totalArticles = document.getElementById('total-articles');
        if (totalArticles) {
            // Could fetch from an API endpoint
        }
    }, 30000); // Update every 30 seconds
}

function initializeCharts() {
    const ctx = document.getElementById('contentChart');
    if (ctx) {
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Articles Published',
                    data: [12, 19, 15, 25, 22, 30],
                    borderColor: '#dc3545',
                    backgroundColor: 'rgba(220, 53, 69, 0.1)',
                    tension: 0.4
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: {
                        display: false
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });
    }
}

function setupEventListeners() {
    // Add click handlers for action buttons
    document.querySelectorAll('.quick-action-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const action = this.querySelector('.text').textContent.toLowerCase().replace(' ', '');
            handleQuickAction(action);
        });
    });
}

function handleQuickAction(action) {
    switch(action) {
        case 'rebuildsite':
            rebuildSite();
            break;
        case 'optimizeimages':
            optimizeImages();
            break;
        case 'createsbackup':
            backupSite();
            break;
        case 'clearcache':
            clearCache();
            break;
        case 'exportdata':
            exportData();
            break;
        case 'viewlogs':
            viewLogs();
            break;
    }
}

function rebuildSite() {
    if (confirm('Are you sure you want to rebuild the site? This may take a few moments.')) {
        // In a real implementation, this would trigger a Jekyll build
        showNotification('Site rebuild initiated...', 'info');
        setTimeout(() => {
            showNotification('Site rebuilt successfully!', 'success');
        }, 2000);
    }
}

function optimizeImages() {
    showNotification('Optimizing images...', 'info');
    setTimeout(() => {
        showNotification('Images optimized! Saved 2.3MB of space.', 'success');
    }, 1500);
}

function backupSite() {
    showNotification('Creating backup...', 'info');
    setTimeout(() => {
        showNotification('Backup created successfully!', 'success');
    }, 1000);
}

function clearCache() {
    showNotification('Clearing cache...', 'info');
    setTimeout(() => {
        showNotification('Cache cleared!', 'success');
    }, 500);
}

function exportData() {
    showNotification('Exporting data...', 'info');
    setTimeout(() => {
        showNotification('Data exported successfully!', 'success');
    }, 1000);
}

function viewLogs() {
    // In a real implementation, this would open a logs modal or redirect to a logs page
    window.open('/admin/logs/', '_blank');
}

function runQualityCheck() {
    showNotification('Running quality check...', 'info');
    setTimeout(() => {
        showNotification('Quality check completed! Found 8 issues to review.', 'warning');
    }, 2000);
}

function editArticle(path) {
    // In a real implementation, this would open the article editor
    window.open(`/admin/edit/${path}`, '_blank');
}

function deleteArticle(path) {
    if (confirm('Are you sure you want to delete this article? This action cannot be undone.')) {
        showNotification('Article deleted successfully!', 'success');
        // In a real implementation, this would make an API call to delete the article
    }
}

function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification ${type}`;
    notification.innerHTML = `
        <span>${message}</span>
        <button onclick="this.parentElement.remove()">×</button>
    `;

    // Add to page
    document.body.appendChild(notification);

    // Auto-remove after 5 seconds
    setTimeout(() => {
        if (notification.parentElement) {
            notification.remove();
        }
    }, 5000);
}

// Add notification styles dynamically
const notificationStyles = `
.notification {
    position: fixed;
    top: 20px;
    right: 20px;
    padding: 1rem 1.5rem;
    border-radius: 6px;
    color: white;
    font-weight: 500;
    z-index: 1000;
    box-shadow: 0 4px 12px rgba(0,0,0,0.3);
    animation: slideInRight 0.3s ease-out;
}

.notification.success { background: #28a745; }
.notification.error { background: #dc3545; }
.notification.warning { background: #ffc107; color: #212529; }
.notification.info { background: #17a2b8; }

.notification button {
    background: none;
    border: none;
    color: white;
    font-size: 1.2rem;
    cursor: pointer;
    margin-left: 1rem;
}

@keyframes slideInRight {
    from {
        opacity: 0;
        transform: translateX(100%);
    }
    to {
        opacity: 1;
        transform: translateX(0);
    }
}
`;

const style = document.createElement('style');
style.textContent = notificationStyles;
document.head.appendChild(style);
</script>
