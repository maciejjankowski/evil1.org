---
layout: default
title: "Analytics Dashboard"
description: "Real-time analytics and goal tracking for evil1.org"
permalink: /admin/analytics/
---

# Analytics Dashboard

<div class="analytics-dashboard">
  
  <div class="dashboard-header">
    <h2>Plausible Analytics Integration</h2>
    <p>Real-time tracking of user goals and site performance</p>
    <div class="dashboard-status">
      <span id="analytics-status" class="status-indicator">🔄 Loading...</span>
    </div>
  </div>

  <div class="metrics-grid">
    
    <div class="metric-card">
      <h3>🛒 Purchase Goals (buy_now)</h3>
      <div class="metric-value" id="buy-now-count">Loading...</div>
      <div class="metric-description">Total purchase button clicks</div>
      <div class="metric-details">
        <small>Tracks: SKU, product, price, source page</small>
      </div>
    </div>
    
    <div class="metric-card">
      <h3>👥 Membership Goals (membership_start)</h3>
      <div class="metric-value" id="membership-count">Loading...</div>
      <div class="metric-description">Membership signup attempts</div>
      <div class="metric-details">
        <small>Tracks: membership type, source, form interactions</small>
      </div>
    </div>
    
    <div class="metric-card">
      <h3>📧 Newsletter Goals (newsletter_start)</h3>
      <div class="metric-value" id="newsletter-count">Loading...</div>
      <div class="metric-description">Newsletter subscription starts</div>
      <div class="metric-details">
        <small>Tracks: form submissions, source page</small>
      </div>
    </div>
    
    <div class="metric-card">
      <h3>🧭 Navigation Tracking</h3>
      <div class="metric-value" id="nav-clicks">Loading...</div>
      <div class="metric-description">Top navigation clicks</div>
      <div class="metric-details">
        <small>Enhanced with profit-link tagging</small>
      </div>
    </div>

  </div>

  <div class="events-section">
    <h3>📊 Additional Tracked Events</h3>
    
    <div class="events-grid">
      <div class="event-item">
        <strong>External Links</strong>
        <p>Tracks clicks to external websites with destination URL</p>
      </div>
      
      <div class="event-item">
        <strong>File Downloads</strong>
        <p>PDF, ZIP, DOC downloads with filename tracking</p>
      </div>
      
      <div class="event-item">
        <strong>Contact Forms</strong>
        <p>Form submissions with type classification</p>
      </div>
      
      <div class="event-item">
        <strong>Scroll Depth</strong>
        <p>Page engagement at 25%, 50%, 75%, 100%</p>
      </div>
      
      <div class="event-item">
        <strong>Time on Page</strong>
        <p>Engagement tracking at 5, 10, 15 minute intervals</p>
      </div>
      
      <div class="event-item">
        <strong>Mobile Menu</strong>
        <p>Mobile navigation usage patterns</p>
      </div>
    </div>
  </div>

  <div class="integration-section">
    <h3>🔗 Plausible Integration Details</h3>
    
    <div class="integration-info">
      <div class="info-card">
        <h4>Domain Configuration</h4>
        <p>Site: <code>evil1.org</code></p>
        <p>Script: <code>plausible.io/js/script.js</code></p>
        <p>Status: <span id="plausible-loaded">Checking...</span></p>
      </div>
      
      <div class="info-card">
        <h4>Goal Configuration</h4>
        <ul>
          <li>✅ buy_now - Purchase tracking</li>
          <li>✅ membership_start - Signup tracking</li>
          <li>✅ newsletter_start - Subscription tracking</li>
          <li>✅ nav_click - Navigation analytics</li>
          <li>✅ external_link - Outbound links</li>
          <li>✅ file_download - Asset downloads</li>
          <li>✅ contact_form - Lead generation</li>
          <li>✅ scroll_depth - Engagement metrics</li>
          <li>✅ time_on_page - Session quality</li>
        </ul>
      </div>
      
      <div class="info-card">
        <h4>Data Collection</h4>
        <p>Privacy-focused analytics with no cookies</p>
        <p>GDPR compliant data processing</p>
        <p>Real-time goal tracking</p>
      </div>
    </div>
  </div>

  <div class="testing-section">
    <h3>🧪 Test Analytics Events</h3>
    <p>Use these buttons to test goal tracking functionality:</p>
    
    <div class="test-buttons">
      <button onclick="testBuyNow()" class="test-btn">Test Buy Now Event</button>
      <button onclick="testMembership()" class="test-btn">Test Membership Event</button>
      <button onclick="testNewsletter()" class="test-btn">Test Newsletter Event</button>
      <button onclick="testNavClick()" class="test-btn">Test Nav Click Event</button>
    </div>
    
    <div id="test-results" class="test-results"></div>
  </div>

  <div class="links-section">
    <h3>📈 Access Analytics</h3>
    <div class="analytics-links">
      <a href="https://plausible.io/evil1.org" target="_blank" rel="noopener" class="analytics-link">
        📊 View Plausible Dashboard
      </a>
      <a href="/docs/backlog-dashboard/" class="analytics-link">
        📋 Task Dashboard
      </a>
      <a href="/.github/copilot-instructions.md" class="analytics-link">
        ⚙️ Copilot Instructions
      </a>
    </div>
  </div>

</div>

<script>
// Check if Plausible is loaded
function checkAnalyticsStatus() {
  const statusEl = document.getElementById('analytics-status');
  const plausibleStatusEl = document.getElementById('plausible-loaded');
  
  if (typeof window.plausible === 'function') {
    statusEl.innerHTML = '✅ Analytics Active';
    statusEl.className = 'status-indicator status-active';
    plausibleStatusEl.innerHTML = '✅ Loaded';
  } else {
    statusEl.innerHTML = '❌ Analytics Inactive';
    statusEl.className = 'status-indicator status-inactive';
    plausibleStatusEl.innerHTML = '❌ Not Loaded';
  }
  
  // Check if trackGoal function is available
  if (typeof window.trackGoal === 'function') {
    document.querySelector('.testing-section').style.display = 'block';
  }
}

// Test functions
function testBuyNow() {
  if (window.trackGoal) {
    window.trackGoal('buy_now', {
      sku: 'TEST001',
      product: 'Test Product',
      price: 29.99,
      source: 'analytics_dashboard_test'
    });
    showTestResult('Buy Now event fired with test data');
  } else {
    showTestResult('trackGoal function not available');
  }
}

function testMembership() {
  if (window.trackGoal) {
    window.trackGoal('membership_start', {
      membership_type: 'test',
      source: 'analytics_dashboard_test'
    });
    showTestResult('Membership event fired with test data');
  } else {
    showTestResult('trackGoal function not available');
  }
}

function testNewsletter() {
  if (window.trackGoal) {
    window.trackGoal('newsletter_start', {
      source: 'analytics_dashboard_test',
      form_id: 'test_form'
    });
    showTestResult('Newsletter event fired with test data');
  } else {
    showTestResult('trackGoal function not available');
  }
}

function testNavClick() {
  if (window.trackGoal) {
    window.trackGoal('nav_click', {
      item: 'test_nav',
      is_profit_link: true,
      source: 'analytics_dashboard_test'
    });
    showTestResult('Nav click event fired with test data');
  } else {
    showTestResult('trackGoal function not available');
  }
}

function showTestResult(message) {
  const resultsEl = document.getElementById('test-results');
  const timestamp = new Date().toLocaleTimeString();
  resultsEl.innerHTML = `<div class="test-result">[${timestamp}] ${message}</div>` + resultsEl.innerHTML;
}

// Initialize dashboard
document.addEventListener('DOMContentLoaded', function() {
  setTimeout(checkAnalyticsStatus, 1000); // Give analytics time to load
  
  // Mock metric values (replace with real data from Plausible API when available)
  document.getElementById('buy-now-count').textContent = 'See Plausible Dashboard';
  document.getElementById('membership-count').textContent = 'See Plausible Dashboard';
  document.getElementById('newsletter-count').textContent = 'See Plausible Dashboard';
  document.getElementById('nav-clicks').textContent = 'See Plausible Dashboard';
});
</script>

<style>
.analytics-dashboard {
  max-width: 1200px;
  margin: 0 auto;
  padding: 2rem;
}

.dashboard-header {
  text-align: center;
  margin-bottom: 3rem;
  padding: 2rem;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  border-radius: 12px;
}

.status-indicator {
  display: inline-block;
  padding: 0.5rem 1rem;
  border-radius: 6px;
  font-weight: bold;
}

.status-active {
  background: #d4edda;
  color: #155724;
}

.status-inactive {
  background: #f8d7da;
  color: #721c24;
}

.metrics-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 1.5rem;
  margin-bottom: 3rem;
}

.metric-card {
  background: white;
  border: 1px solid #e9ecef;
  border-radius: 8px;
  padding: 1.5rem;
  box-shadow: 0 2px 4px rgba(0,0,0,0.1);
  transition: transform 0.2s;
}

.metric-card:hover {
  transform: translateY(-2px);
}

.metric-card h3 {
  margin: 0 0 1rem 0;
  color: #495057;
  font-size: 1.1rem;
}

.metric-value {
  font-size: 2rem;
  font-weight: bold;
  color: #007bff;
  margin-bottom: 0.5rem;
}

.metric-description {
  color: #6c757d;
  margin-bottom: 0.5rem;
}

.metric-details {
  font-size: 0.85rem;
  color: #868e96;
}

.events-section, .integration-section {
  margin-bottom: 3rem;
}

.events-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 1rem;
}

.event-item {
  background: #f8f9fa;
  padding: 1rem;
  border-radius: 6px;
  border-left: 4px solid #007bff;
}

.event-item strong {
  display: block;
  margin-bottom: 0.5rem;
  color: #495057;
}

.integration-info {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
  gap: 1.5rem;
}

.info-card {
  background: white;
  border: 1px solid #e9ecef;
  border-radius: 6px;
  padding: 1.5rem;
}

.info-card h4 {
  margin: 0 0 1rem 0;
  color: #495057;
}

.info-card ul {
  margin: 0;
  padding-left: 1.5rem;
}

.info-card li {
  margin-bottom: 0.25rem;
}

.testing-section {
  background: #f8f9fa;
  padding: 2rem;
  border-radius: 8px;
  margin-bottom: 2rem;
}

.test-buttons {
  display: flex;
  gap: 1rem;
  margin-bottom: 1rem;
  flex-wrap: wrap;
}

.test-btn {
  padding: 0.75rem 1.5rem;
  background: #28a745;
  color: white;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-weight: bold;
  transition: background 0.2s;
}

.test-btn:hover {
  background: #218838;
}

.test-results {
  max-height: 200px;
  overflow-y: auto;
  background: white;
  border: 1px solid #dee2e6;
  border-radius: 4px;
  padding: 1rem;
}

.test-result {
  padding: 0.5rem;
  border-bottom: 1px solid #e9ecef;
  font-family: monospace;
  font-size: 0.85rem;
}

.analytics-links {
  display: flex;
  gap: 1rem;
  flex-wrap: wrap;
}

.analytics-link {
  display: inline-block;
  padding: 1rem 1.5rem;
  background: #007bff;
  color: white;
  text-decoration: none;
  border-radius: 6px;
  font-weight: bold;
  transition: background 0.2s;
}

.analytics-link:hover {
  background: #0056b3;
  color: white;
}

@media (max-width: 768px) {
  .analytics-dashboard {
    padding: 1rem;
  }
  
  .metrics-grid {
    grid-template-columns: 1fr;
  }
  
  .test-buttons {
    flex-direction: column;
  }
  
  .analytics-links {
    flex-direction: column;
  }
}
</style>
