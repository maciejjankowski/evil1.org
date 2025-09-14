---
layout: default
title: "Evil Metrics Dashboard"
description: "Comprehensive view of all evil metrics and scoring frameworks across corporations, executives, institutions, and content"
permalink: /metrics-dashboard/
---

<div class="metrics-dashboard">
    <header class="dashboard-header">
        <h1>🔥 Evil Metrics Dashboard</h1>
        <p class="dashboard-description">Comprehensive quantification of corporate evil, executive malevolence, institutional corruption, and investigative impact across our entire database.</p>
    </header>

    <div class="framework-overview">
        <h2>📊 Scoring Frameworks</h2>
        <div class="framework-grid">
            <div class="framework-card">
                <h3>🏢 Corporate Evil Index (CEI)</h3>
                <p>0-10,000 point scale measuring corporate harm across Blood Legacy, Suffering Amplification, Wealth Extraction, Planet Destruction, and Democracy Corruption.</p>
                <div class="framework-stats">
                    <span class="stat">{{ site.data.companies | size }} Companies Scored</span>
                </div>
                <a href="#companies-section" class="framework-link">View Companies →</a>
            </div>
            
            <div class="framework-card">
                <h3>👤 Executive Malevolence Score (EMS)</h3>
                <p>0-5,000 point scale assessing personal accountability through Personal Cruelty, Systemic Evil, Scale of Harm, and Resistance to Accountability.</p>
                <div class="framework-stats">
                    <span class="stat">{{ site.data.profiles | size }} Executives Scored</span>
                </div>
                <a href="#executives-section" class="framework-link">View Executives →</a>
            </div>
            
            <div class="framework-card">
                <h3>🏛️ Institutional Corruption Framework (ICF)</h3>
                <p>0-8,000 point scale evaluating Regulatory Capture, Public Interest Betrayal, Systemic Bias, and Democratic Erosion in institutions.</p>
                <div class="framework-stats">
                    <span class="stat">{{ site.data.organizations | size }} Organizations Scored</span>
                </div>
                <a href="#organizations-section" class="framework-link">View Organizations →</a>
            </div>
            
            <div class="framework-card">
                <h3>📰 Article Impact Scoring (AIS)</h3>
                <p>0-1,000 point scale measuring Truth Revelation, Harm Exposure, Accountability Potential, and Public Education value of investigative content.</p>
                <div class="framework-stats">
                    <span class="stat">{{ site.articles | size }} Articles Available</span>
                </div>
                <a href="#articles-section" class="framework-link">View Articles →</a>
            </div>
        </div>
    </div>

    <div class="top-scorers">
        <h2>🏆 Hall of Infamy: Highest Scores</h2>
        
        <div id="companies-section" class="scorers-section">
            <h3>Most Evil Corporations (CEI)</h3>
            <div class="scorers-grid">
                {% assign companies_with_scores = site.data.companies | where_exp: "company", "company[1].cei_score" %}
                {% assign top_companies = companies_with_scores | sort: "cei_score.total" | reverse | slice: 0, 6 %}
                {% for company_item in top_companies %}
                    {% assign company_key = company_item[0] %}
                    {% assign company = company_item[1] %}
                    <div class="scorer-card company-card">
                        <div class="scorer-header">
                            <h4>{{ company_key | capitalize }}</h4>
                            <span class="score-badge cei-score">{{ company.cei_score.total }}/10000</span>
                        </div>
                        <div class="score-breakdown">
                            <div class="score-item">
                                <span class="score-label">🩸 Blood Legacy:</span>
                                <span class="score-value">{{ company.cei_score.blood_legacy }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">😢 Suffering:</span>
                                <span class="score-value">{{ company.cei_score.suffering_amplification }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">💰 Wealth Extraction:</span>
                                <span class="score-value">{{ company.cei_score.wealth_extraction }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">🌍 Planet Destruction:</span>
                                <span class="score-value">{{ company.cei_score.planet_destruction }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">🗳️ Democracy Corruption:</span>
                                <span class="score-value">{{ company.cei_score.democracy_corruption }}</span>
                            </div>
                        </div>
                        {% if company.evil_taxonomy %}
                        <div class="taxonomy-preview">
                            {% for tag in company.evil_taxonomy limit: 3 %}
                                <span class="taxonomy-tag">{{ tag }}</span>
                            {% endfor %}
                        </div>
                        {% endif %}
                        <a href="/company/{{ company_key }}/" class="view-profile">View Profile →</a>
                    </div>
                {% endfor %}
            </div>
        </div>

        <div id="executives-section" class="scorers-section">
            <h3>Most Malevolent Executives (EMS)</h3>
            <div class="scorers-grid">
                {% assign executives_with_scores = site.profiles | where_exp: "profile", "profile.profile.ems_score" %}
                {% assign top_executives = executives_with_scores | sort: "profile.ems_score.total" | reverse | slice: 0, 6 %}
                {% for executive in top_executives %}
                    <div class="scorer-card executive-card">
                        <div class="scorer-header">
                            <h4>{{ executive.profile.name }}</h4>
                            <span class="score-badge ems-score">{{ executive.profile.ems_score.total }}/5000</span>
                        </div>
                        <p class="executive-headline">{{ executive.profile.headline }}</p>
                        <div class="score-breakdown">
                            <div class="score-item">
                                <span class="score-label">😈 Personal Cruelty:</span>
                                <span class="score-value">{{ executive.profile.ems_score.personal_cruelty }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">⚙️ Systemic Evil:</span>
                                <span class="score-value">{{ executive.profile.ems_score.systemic_evil }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">📈 Scale of Harm:</span>
                                <span class="score-value">{{ executive.profile.ems_score.scale_of_harm }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">🛡️ Accountability Resistance:</span>
                                <span class="score-value">{{ executive.profile.ems_score.resistance_to_accountability }}</span>
                            </div>
                        </div>
                        <a href="{{ executive.url }}" class="view-profile">View Profile →</a>
                    </div>
                {% endfor %}
            </div>
        </div>

        <div id="organizations-section" class="scorers-section">
            <h3>Most Corrupt Institutions (ICF)</h3>
            <div class="scorers-grid">
                {% assign orgs_with_scores = site.data.organizations | where_exp: "org", "org.icf_score" %}
                {% assign top_orgs = orgs_with_scores | sort: "icf_score.total" | reverse | slice: 0, 6 %}
                {% for org in top_orgs %}
                    <div class="scorer-card organization-card">
                        <div class="scorer-header">
                            <h4>{{ org.name }}</h4>
                            <span class="score-badge icf-score">{{ org.icf_score.total }}/8000</span>
                        </div>
                        <p class="org-headline">{{ org.headline }}</p>
                        <div class="score-breakdown">
                            <div class="score-item">
                                <span class="score-label">🏭 Regulatory Capture:</span>
                                <span class="score-value">{{ org.icf_score.regulatory_capture }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">🤝 Public Betrayal:</span>
                                <span class="score-value">{{ org.icf_score.public_interest_betrayal }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">⚖️ Systemic Bias:</span>
                                <span class="score-value">{{ org.icf_score.systemic_bias }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">🗳️ Democratic Erosion:</span>
                                <span class="score-value">{{ org.icf_score.democratic_erosion }}</span>
                            </div>
                        </div>
                        <a href="/organizations/{{ org.name | slugify }}/" class="view-profile">View Profile →</a>
                    </div>
                {% endfor %}
            </div>
        </div>

        <div id="articles-section" class="scorers-section">
            <h3>Most Impactful Investigations (AIS)</h3>
            <div class="scorers-grid">
                {% assign articles_with_scores = site.articles | where_exp: "article", "article.ais_score" %}
                {% assign top_articles = articles_with_scores | sort: "ais_score.total" | reverse | slice: 0, 6 %}
                {% for article in top_articles %}
                    <div class="scorer-card article-card">
                        <div class="scorer-header">
                            <h4>{{ article.title }}</h4>
                            <span class="score-badge ais-score">{{ article.ais_score.total }}/1000</span>
                        </div>
                        <p class="article-description">{{ article.description | truncate: 120 }}</p>
                        <div class="score-breakdown">
                            <div class="score-item">
                                <span class="score-label">🔍 Truth Revelation:</span>
                                <span class="score-value">{{ article.ais_score.truth_revelation }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">💥 Harm Exposure:</span>
                                <span class="score-value">{{ article.ais_score.harm_exposure }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">⚖️ Accountability Potential:</span>
                                <span class="score-value">{{ article.ais_score.accountability_potential }}</span>
                            </div>
                            <div class="score-item">
                                <span class="score-label">🎓 Public Education:</span>
                                <span class="score-value">{{ article.ais_score.public_education }}</span>
                            </div>
                        </div>
                        <a href="{{ article.url }}" class="view-profile">Read Article →</a>
                    </div>
                {% endfor %}
            </div>
        </div>
    </div>

    <div class="methodology-section">
        <h2>📖 Understanding the Metrics</h2>
        <div class="methodology-grid">
            <div class="method-card">
                <h3>🔬 Scientific Approach</h3>
                <p>All scores based on verifiable evidence from court documents, regulatory filings, peer-reviewed research, and investigative journalism.</p>
            </div>
            <div class="method-card">
                <h3>📊 Transparent Methodology</h3>
                <p>Complete scoring methodology publicly documented with clear criteria, multipliers, and verification processes.</p>
            </div>
            <div class="method-card">
                <h3>🔄 Regular Updates</h3>
                <p>Scores updated quarterly based on new evidence, legal developments, and emerging research.</p>
            </div>
            <div class="method-card">
                <h3>⚖️ Fair and Accountable</h3>
                <p>Formal appeals process for contested scores, expert review panel, and community feedback integration.</p>
            </div>
        </div>
        <div class="methodology-cta">
            <a href="/docs/comprehensive-metrics-methodology/" class="btn-primary">📚 Read Full Methodology</a>
            <a href="/evil-products/" class="btn-secondary">🔥 View Evil Products Catalog</a>
        </div>
    </div>
</div>

<style>
.metrics-dashboard {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.dashboard-header {
  text-align: center;
  margin-bottom: 40px;
  padding: 30px;
  background: linear-gradient(135deg, #1a1a1a 0%, #2d1b1b 100%);
  border: 2px solid #8B0000;
  border-radius: 12px;
  color: #fff;
}

.dashboard-header h1 {
  color: #FF6B47;
  margin-bottom: 15px;
  font-size: 2.5em;
}

.dashboard-description {
  font-size: 1.1em;
  color: #ddd;
  max-width: 800px;
  margin: 0 auto;
}

.framework-overview {
  margin-bottom: 50px;
}

.framework-overview h2 {
  text-align: center;
  color: #FF6B47;
  margin-bottom: 30px;
  font-size: 2em;
}

.framework-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
  gap: 20px;
  margin-bottom: 40px;
}

.framework-card {
  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
  border: 2px solid #8B0000;
  border-radius: 8px;
  padding: 20px;
  text-align: center;
  transition: transform 0.3s ease;
}

.framework-card:hover {
  transform: translateY(-4px);
  box-shadow: 0 8px 16px rgba(139, 0, 0, 0.2);
}

.framework-card h3 {
  color: #8B0000;
  margin-bottom: 15px;
  font-size: 1.3em;
}

.framework-card p {
  color: #333;
  margin-bottom: 15px;
  line-height: 1.5;
}

.framework-stats {
  margin-bottom: 15px;
}

.stat {
  background: #8B0000;
  color: #fff;
  padding: 4px 8px;
  border-radius: 4px;
  font-size: 0.9em;
  font-weight: bold;
}

.framework-link {
  color: #8B0000;
  text-decoration: none;
  font-weight: bold;
  border: 2px solid #8B0000;
  padding: 8px 16px;
  border-radius: 4px;
  display: inline-block;
  transition: all 0.3s ease;
}

.framework-link:hover {
  background: #8B0000;
  color: #fff;
}

.top-scorers {
  margin-bottom: 50px;
}

.top-scorers h2 {
  text-align: center;
  color: #FF6B47;
  margin-bottom: 30px;
  font-size: 2em;
}

.scorers-section {
  margin-bottom: 40px;
}

.scorers-section h3 {
  color: #8B0000;
  margin-bottom: 20px;
  font-size: 1.5em;
  border-bottom: 2px solid #8B0000;
  padding-bottom: 10px;
}

.scorers-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
  gap: 20px;
}

.scorer-card {
  background: #fff;
  border: 2px solid #ddd;
  border-radius: 8px;
  padding: 20px;
  transition: all 0.3s ease;
}

.scorer-card:hover {
  border-color: #8B0000;
  box-shadow: 0 4px 8px rgba(139, 0, 0, 0.1);
}

.scorer-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 15px;
  border-bottom: 1px solid #eee;
  padding-bottom: 10px;
}

.scorer-header h4 {
  color: #333;
  margin: 0;
  font-size: 1.2em;
}

.score-badge {
  padding: 4px 8px;
  border-radius: 4px;
  font-weight: bold;
  font-size: 0.9em;
  color: #fff;
}

.cei-score { background: #8B0000; }
.ems-score { background: #CD5C5C; }
.icf-score { background: #DAA520; }
.ais-score { background: #228B22; }

.executive-headline,
.org-headline,
.article-description {
  color: #666;
  font-style: italic;
  margin-bottom: 15px;
  font-size: 0.9em;
}

.score-breakdown {
  margin-bottom: 15px;
}

.score-item {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
  font-size: 0.9em;
}

.score-label {
  color: #666;
}

.score-value {
  font-weight: bold;
  color: #8B0000;
}

.taxonomy-preview {
  margin-bottom: 15px;
}

.taxonomy-tag {
  background: #f0f0f0;
  color: #666;
  padding: 2px 6px;
  border-radius: 3px;
  font-size: 0.8em;
  margin-right: 5px;
  margin-bottom: 3px;
  display: inline-block;
}

.view-profile {
  color: #8B0000;
  text-decoration: none;
  font-weight: bold;
  font-size: 0.9em;
}

.view-profile:hover {
  text-decoration: underline;
}

.methodology-section {
  background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
  border: 2px solid #8B0000;
  border-radius: 12px;
  padding: 30px;
  text-align: center;
}

.methodology-section h2 {
  color: #8B0000;
  margin-bottom: 30px;
  font-size: 1.8em;
}

.methodology-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.method-card {
  background: #fff;
  border: 1px solid #ddd;
  border-radius: 6px;
  padding: 20px;
  text-align: center;
}

.method-card h3 {
  color: #8B0000;
  margin-bottom: 10px;
  font-size: 1.1em;
}

.method-card p {
  color: #666;
  font-size: 0.9em;
  line-height: 1.5;
}

.methodology-cta {
  display: flex;
  justify-content: center;
  gap: 20px;
  flex-wrap: wrap;
}

.btn-primary,
.btn-secondary {
  padding: 12px 24px;
  text-decoration: none;
  border-radius: 6px;
  font-weight: bold;
  transition: all 0.3s ease;
}

.btn-primary {
  background: #8B0000;
  color: #fff;
  border: 2px solid #8B0000;
}

.btn-primary:hover {
  background: #CD5C5C;
  border-color: #CD5C5C;
}

.btn-secondary {
  background: #fff;
  color: #8B0000;
  border: 2px solid #8B0000;
}

.btn-secondary:hover {
  background: #8B0000;
  color: #fff;
}

/* Responsive design */
@media (max-width: 768px) {
  .framework-grid,
  .scorers-grid,
  .methodology-grid {
    grid-template-columns: 1fr;
  }
  
  .scorer-header {
    flex-direction: column;
    align-items: flex-start;
    gap: 10px;
  }
  
  .methodology-cta {
    flex-direction: column;
    align-items: center;
  }
  
  .dashboard-header h1 {
    font-size: 2em;
  }
}
</style>