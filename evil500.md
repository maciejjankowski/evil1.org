---
layout: default
title: "Evil 500 - Corporate Accountability Rankings"
description: "The definitive ranking of corporate evil. Unlike Fortune 500, we rank companies by their harm to society, workers, and environment."
permalink: "/evil500/"
---

<div class="evil500-container">
  <div class="evil500-header">
    <h1>Evil 500 Corporate Rankings</h1>
    <p class="evil500-subtitle">The Fortune 500 for the rest of us - ranking companies by their actual impact on society</p>
  </div>

  <div class="certification-notice">
    <h2>🏆 New: Evil 500 Certification Program</h2>
    <p>Companies can now purchase certification to improve their ranking or receive more favorable coverage. Look for these labels:</p>
    <div class="certification-labels">
      <span class="cert-label pr-washed">PR-washed</span>
      <span class="cert-label sponsor-protected">Sponsor-protected</span>
      <span class="cert-label clean-slate">Clean-slate</span>
    </div>
    <p><a href="/evil500/certification/">Learn more about our certification program</a> - because accountability shouldn't get in the way of profit!</p>
  </div>

  <div class="evil500-rankings">
    <h2>Current Rankings</h2>
    <div class="rankings-list">
      {% for company_entry in site.data.companies %}
        {% assign company_name = company_entry[0] %}
        {% assign company = company_entry[1] %}
        <div class="ranking-item">
          <div class="rank-number">#{{ company.evil_rank }}</div>
          <div class="company-info">
            <h3>
              {{ company_name | capitalize }}
              {% if company.certification.label and company.certification.label != "" %}
                <span class="cert-badge {{ company.certification.label | slugify }}">{{ company.certification.label }}</span>
              {% endif %}
            </h3>
            <div class="evil-score">Evil Score: {{ company.evil_score }}/100</div>
            {% if company.certification.status != "none" %}
              <div class="certification-status">
                Certification: {{ company.certification.status | capitalize }} 
                (${{ company.certification.amount_paid | divided_by: 1000 }}K paid)
              </div>
            {% endif %}
            {% if company.crimes %}
              <div class="top-crimes">
                <strong>Notable Crimes:</strong>
                {% for crime in company.crimes limit: 2 %}
                  {{ crime.title }}{% unless forloop.last %}, {% endunless %}
                {% endfor %}
              </div>
            {% endif %}
          </div>
          <div class="company-actions">
            <a href="/company/{{ company_name }}/" class="btn btn-small">View Full Profile</a>
          </div>
        </div>
      {% endfor %}
    </div>
  </div>

  <div class="evil500-methodology">
    <h2>Methodology</h2>
    <p>Our Evil Score is calculated based on:</p>
    <ul>
      <li><strong>Worker Exploitation</strong> - Union busting, wage theft, unsafe conditions</li>
      <li><strong>Environmental Damage</strong> - Pollution, climate denial, resource extraction</li>
      <li><strong>Tax Avoidance</strong> - Complex schemes to avoid paying fair share</li>
      <li><strong>Market Manipulation</strong> - Monopolistic practices, predatory pricing</li>
      <li><strong>Social Harm</strong> - Privacy violations, election interference, public health damage</li>
    </ul>
    <p><em>Note: Scores may be adjusted based on certification status and payment arrangements.</em></p>
  </div>

  <div class="evil500-disclaimer">
    <h3>Disclaimer</h3>
    <p>This ranking is satirical commentary on corporate accountability. Companies featured have the opportunity to purchase certification packages that may result in more favorable coverage. See our <a href="/evil500/certification/">certification program</a> for details.</p>
  </div>
</div>

<style>
.evil500-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}

.evil500-header {
  text-align: center;
  margin-bottom: 30px;
}

.evil500-subtitle {
  font-style: italic;
  color: #666;
  font-size: 1.1em;
}

.certification-notice {
  background: #f8f9fa;
  border: 1px solid #dee2e6;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 30px;
}

.certification-labels {
  margin: 10px 0;
}

.cert-label {
  display: inline-block;
  padding: 4px 8px;
  margin: 2px;
  border-radius: 4px;
  font-size: 0.9em;
  font-weight: bold;
}

.cert-label.pr-washed {
  background: #ffeaa7;
  color: #2d3436;
}

.cert-label.sponsor-protected {
  background: #74b9ff;
  color: white;
}

.cert-label.clean-slate {
  background: #00b894;
  color: white;
}

.rankings-list {
  margin-top: 20px;
}

.ranking-item {
  display: flex;
  align-items: center;
  padding: 15px;
  border: 1px solid #ddd;
  margin-bottom: 10px;
  border-radius: 8px;
  background: white;
}

.rank-number {
  font-size: 1.5em;
  font-weight: bold;
  color: #e17055;
  margin-right: 20px;
  min-width: 40px;
}

.company-info {
  flex: 1;
}

.company-info h3 {
  margin: 0 0 5px 0;
  color: #2d3436;
}

.cert-badge {
  font-size: 0.7em;
  padding: 2px 6px;
  border-radius: 3px;
  margin-left: 8px;
}

.cert-badge.pr-washed {
  background: #ffeaa7;
  color: #2d3436;
}

.cert-badge.sponsor-protected {
  background: #74b9ff;
  color: white;
}

.cert-badge.clean-slate {
  background: #00b894;
  color: white;
}

.evil-score {
  color: #e17055;
  font-weight: bold;
  margin-bottom: 5px;
}

.certification-status {
  color: #0984e3;
  font-size: 0.9em;
  margin-bottom: 5px;
}

.top-crimes {
  font-size: 0.9em;
  color: #636e72;
}

.company-actions {
  margin-left: 20px;
}

.btn {
  display: inline-block;
  padding: 8px 16px;
  background: #0984e3;
  color: white;
  text-decoration: none;
  border-radius: 4px;
  font-size: 0.9em;
}

.btn:hover {
  background: #0d6efd;
  color: white;
}

.btn-small {
  padding: 6px 12px;
  font-size: 0.8em;
}

.evil500-methodology {
  margin-top: 40px;
  padding: 20px;
  background: #f8f9fa;
  border-radius: 8px;
}

.evil500-disclaimer {
  margin-top: 20px;
  padding: 15px;
  background: #fff3cd;
  border: 1px solid #ffeaa7;
  border-radius: 8px;
  font-size: 0.9em;
}
</style>