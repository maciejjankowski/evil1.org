---
layout: default
title: "Evaluate Company - Corporate Evil Index Assessment"
description: "Systematic evaluation tool for assessing corporate harm using the Corporate Evil Index framework"
permalink: /evaluate-company/
---

# Corporate Evil Index (CEI) Evaluation

Use this comprehensive form to evaluate a company using our standardized Corporate Evil Index framework. The CEI measures corporate harm across 5 dimensions with a maximum score of 10,000 points.

<div class="evaluation-container">
  <form id="cei-evaluation-form" class="evaluation-form">
    <div class="form-section">
      <h2>Company Information</h2>
      <div class="input-group">
        <label for="company-name">Company Name *</label>
        <input type="text" id="company-name" name="company_name" required>
      </div>
      
      <div class="input-group">
        <label for="company-industry">Primary Industry</label>
        <select id="company-industry" name="industry">
          <option value="">Select Industry</option>
          <option value="technology">Technology</option>
          <option value="pharmaceutical">Pharmaceutical</option>
          <option value="oil-gas">Oil & Gas</option>
          <option value="financial">Financial Services</option>
          <option value="retail">Retail</option>
          <option value="healthcare">Healthcare</option>
          <option value="manufacturing">Manufacturing</option>
          <option value="agriculture">Agriculture</option>
          <option value="defense">Defense</option>
          <option value="telecommunications">Telecommunications</option>
          <option value="other">Other</option>
        </select>
      </div>
      
      <div class="input-group">
        <label for="company-size">Company Size (Employees)</label>
        <select id="company-size" name="company_size">
          <option value="">Select Size</option>
          <option value="small">Small (1-100)</option>
          <option value="medium">Medium (101-1,000)</option>
          <option value="large">Large (1,001-10,000)</option>
          <option value="enterprise">Enterprise (10,000+)</option>
        </select>
      </div>
    </div>

    <div class="form-section">
      <h2>Blood Legacy Assessment (0-2,500 points)</h2>
      <p class="dimension-description">Deaths and physical harm caused by corporate actions</p>
      
      <div class="scoring-subsection">
        <h3>Workplace Fatalities & Safety Violations</h3>
        <div class="score-input">
          <label for="workplace-fatalities">Score (0-500):</label>
          <input type="number" id="workplace-fatalities" name="workplace_fatalities" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="workplace-evidence">Evidence & Sources:</label>
            <textarea id="workplace-evidence" name="workplace_evidence" placeholder="Document specific incidents, OSHA violations, worker death rates, safety inspection failures..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Product-Related Deaths & Health Damage</h3>
        <div class="score-input">
          <label for="product-deaths">Score (0-500):</label>
          <input type="number" id="product-deaths" name="product_deaths" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="product-evidence">Evidence & Sources:</label>
            <textarea id="product-evidence" name="product_evidence" placeholder="Product recalls, health studies linking products to disease, contamination incidents..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Environmental Disasters Causing Mortality</h3>
        <div class="score-input">
          <label for="environmental-deaths">Score (0-500):</label>
          <input type="number" id="environmental-deaths" name="environmental_deaths" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="environmental-evidence">Evidence & Sources:</label>
            <textarea id="environmental-evidence" name="environmental_evidence" placeholder="Chemical spills, air/water pollution causing deaths, toxic waste incidents..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>War Profiteering & Violence Enablement</h3>
        <div class="score-input">
          <label for="war-profiteering">Score (0-500):</label>
          <input type="number" id="war-profiteering" name="war_profiteering" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="war-evidence">Evidence & Sources:</label>
            <textarea id="war-evidence" name="war_evidence" placeholder="Military contracts, weapons sales to authoritarian regimes, conflict zone operations..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Healthcare Access Denial & Price Gouging</h3>
        <div class="score-input">
          <label for="healthcare-denial">Score (0-500):</label>
          <input type="number" id="healthcare-denial" name="healthcare_denial" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="healthcare-evidence">Evidence & Sources:</label>
            <textarea id="healthcare-evidence" name="healthcare_evidence" placeholder="Drug price increases, insurance claim denials, hospital charity care failures..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Blood Legacy Total: <span id="blood-total">0</span>/2500</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Suffering Amplification Assessment (0-2,500 points)</h2>
      <p class="dimension-description">Human misery and quality of life destruction</p>
      
      <div class="scoring-subsection">
        <h3>Worker Exploitation, Abuse & Surveillance</h3>
        <div class="score-input">
          <label for="worker-exploitation">Score (0-500):</label>
          <input type="number" id="worker-exploitation" name="worker_exploitation" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="worker-exploitation-evidence">Evidence & Sources:</label>
            <textarea id="worker-exploitation-evidence" name="worker_exploitation_evidence" placeholder="Wage theft, forced overtime, unsafe working conditions, union busting, employee surveillance..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Mental Health Damage from Products/Services</h3>
        <div class="score-input">
          <label for="mental-health">Score (0-500):</label>
          <input type="number" id="mental-health" name="mental_health" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="mental-health-evidence">Evidence & Sources:</label>
            <textarea id="mental-health-evidence" name="mental_health_evidence" placeholder="Social media addiction, predatory apps, gambling platforms, psychological manipulation..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Family & Community Destruction</h3>
        <div class="score-input">
          <label for="community-destruction">Score (0-500):</label>
          <input type="number" id="community-destruction" name="community_destruction" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="community-evidence">Evidence & Sources:</label>
            <textarea id="community-evidence" name="community_evidence" placeholder="Store closures destroying local economies, predatory lending in poor communities, gentrification..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Addiction Enablement & Profiteering</h3>
        <div class="score-input">
          <label for="addiction-profiteering">Score (0-500):</label>
          <input type="number" id="addiction-profiteering" name="addiction_profiteering" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="addiction-evidence">Evidence & Sources:</label>
            <textarea id="addiction-evidence" name="addiction_evidence" placeholder="Opioid marketing, gambling addiction design, nicotine products, predatory lending..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Privacy Violations & Surveillance Capitalism</h3>
        <div class="score-input">
          <label for="privacy-violations">Score (0-500):</label>
          <input type="number" id="privacy-violations" name="privacy_violations" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="privacy-evidence">Evidence & Sources:</label>
            <textarea id="privacy-evidence" name="privacy_evidence" placeholder="Data breaches, illegal tracking, selling personal data, facial recognition..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Suffering Amplification Total: <span id="suffering-total">0</span>/2500</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Wealth Extraction Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Profit maximization through exploitation and externalization</p>
      
      <div class="scoring-subsection">
        <h3>Wage Theft & Labor Exploitation</h3>
        <div class="score-input">
          <label for="wage-theft">Score (0-400):</label>
          <input type="number" id="wage-theft" name="wage_theft" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="wage-theft-evidence">Evidence & Sources:</label>
            <textarea id="wage-theft-evidence" name="wage_theft_evidence" placeholder="Unpaid overtime, minimum wage violations, contractor misclassification, tip theft..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Tax Avoidance & Evasion Schemes</h3>
        <div class="score-input">
          <label for="tax-avoidance">Score (0-400):</label>
          <input type="number" id="tax-avoidance" name="tax_avoidance" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="tax-evidence">Evidence & Sources:</label>
            <textarea id="tax-evidence" name="tax_evidence" placeholder="Offshore tax shelters, transfer pricing manipulation, profit shifting, tax inversion..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Price Manipulation & Market Manipulation</h3>
        <div class="score-input">
          <label for="price-manipulation">Score (0-400):</label>
          <input type="number" id="price-manipulation" name="price_manipulation" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="price-evidence">Evidence & Sources:</label>
            <textarea id="price-evidence" name="price_evidence" placeholder="Price fixing cartels, algorithm-based price coordination, predatory pricing..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Monopolistic & Anti-competitive Practices</h3>
        <div class="score-input">
          <label for="monopolistic">Score (0-400):</label>
          <input type="number" id="monopolistic" name="monopolistic" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="monopolistic-evidence">Evidence & Sources:</label>
            <textarea id="monopolistic-evidence" name="monopolistic_evidence" placeholder="Competitor acquisitions, exclusive dealing, vertical foreclosure, platform self-preferencing..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Debt Trap Creation & Predatory Lending</h3>
        <div class="score-input">
          <label for="predatory-lending">Score (0-400):</label>
          <input type="number" id="predatory-lending" name="predatory_lending" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="lending-evidence">Evidence & Sources:</label>
            <textarea id="lending-evidence" name="lending_evidence" placeholder="Payday loans, subprime mortgages, student loan schemes, credit card abuse..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Wealth Extraction Total: <span id="wealth-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Planet Destruction Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Environmental damage and climate impact</p>
      
      <div class="scoring-subsection">
        <h3>Greenhouse Gas Emissions & Climate Acceleration</h3>
        <div class="score-input">
          <label for="emissions">Score (0-400):</label>
          <input type="number" id="emissions" name="emissions" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="emissions-evidence">Evidence & Sources:</label>
            <textarea id="emissions-evidence" name="emissions_evidence" placeholder="Carbon emissions data, climate denial funding, fossil fuel expansion..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Pollution & Toxic Waste Generation</h3>
        <div class="score-input">
          <label for="pollution">Score (0-400):</label>
          <input type="number" id="pollution" name="pollution" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="pollution-evidence">Evidence & Sources:</label>
            <textarea id="pollution-evidence" name="pollution_evidence" placeholder="Water pollution, air pollution, toxic waste sites, chemical contamination..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Resource Depletion & Habitat Destruction</h3>
        <div class="score-input">
          <label for="resource-depletion">Score (0-400):</label>
          <input type="number" id="resource-depletion" name="resource_depletion" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="resource-evidence">Evidence & Sources:</label>
            <textarea id="resource-evidence" name="resource_evidence" placeholder="Deforestation, overfishing, mining destruction, land grabbing..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Biodiversity Loss & Ecosystem Damage</h3>
        <div class="score-input">
          <label for="biodiversity">Score (0-400):</label>
          <input type="number" id="biodiversity" name="biodiversity" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="biodiversity-evidence">Evidence & Sources:</label>
            <textarea id="biodiversity-evidence" name="biodiversity_evidence" placeholder="Species extinction acceleration, ecosystem disruption, invasive species introduction..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Greenwashing & Environmental Fraud</h3>
        <div class="score-input">
          <label for="greenwashing">Score (0-400):</label>
          <input type="number" id="greenwashing" name="greenwashing" min="0" max="400" value="0">
          <div class="evidence-input">
            <label for="greenwashing-evidence">Evidence & Sources:</label>
            <textarea id="greenwashing-evidence" name="greenwashing_evidence" placeholder="False environmental claims, carbon offset fraud, sustainability report manipulation..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Planet Destruction Total: <span id="planet-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Democracy Corruption Assessment (0-1,000 points)</h2>
      <p class="dimension-description">Undermining of democratic institutions and processes</p>
      
      <div class="scoring-subsection">
        <h3>Political Lobbying & Regulatory Capture</h3>
        <div class="score-input">
          <label for="lobbying">Score (0-200):</label>
          <input type="number" id="lobbying" name="lobbying" min="0" max="200" value="0">
          <div class="evidence-input">
            <label for="lobbying-evidence">Evidence & Sources:</label>
            <textarea id="lobbying-evidence" name="lobbying_evidence" placeholder="Lobbying expenditures, revolving door employment, regulatory capture incidents..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Campaign Finance & Political Manipulation</h3>
        <div class="score-input">
          <label for="campaign-finance">Score (0-200):</label>
          <input type="number" id="campaign-finance" name="campaign_finance" min="0" max="200" value="0">
          <div class="evidence-input">
            <label for="campaign-evidence">Evidence & Sources:</label>
            <textarea id="campaign-evidence" name="campaign_evidence" placeholder="Political donations, dark money funding, election influence campaigns..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Media Manipulation & Disinformation</h3>
        <div class="score-input">
          <label for="media-manipulation">Score (0-200):</label>
          <input type="number" id="media-manipulation" name="media_manipulation" min="0" max="200" value="0">
          <div class="evidence-input">
            <label for="media-evidence">Evidence & Sources:</label>
            <textarea id="media-evidence" name="media_evidence" placeholder="Astroturfing campaigns, fake news funding, media ownership concentration..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Voter Suppression & Election Interference</h3>
        <div class="score-input">
          <label for="voter-suppression">Score (0-200):</label>
          <input type="number" id="voter-suppression" name="voter_suppression" min="0" max="200" value="0">
          <div class="evidence-input">
            <label for="voter-evidence">Evidence & Sources:</label>
            <textarea id="voter-evidence" name="voter_evidence" placeholder="Voter registration blocking, election technology manipulation, polling access restriction..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Authoritarian Regime Support</h3>
        <div class="score-input">
          <label for="authoritarian">Score (0-200):</label>
          <input type="number" id="authoritarian" name="authoritarian" min="0" max="200" value="0">
          <div class="evidence-input">
            <label for="authoritarian-evidence">Evidence & Sources:</label>
            <textarea id="authoritarian-evidence" name="authoritarian_evidence" placeholder="Business with dictatorships, surveillance technology sales, human rights violations support..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Democracy Corruption Total: <span id="democracy-total">0</span>/1000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Assessment Summary</h2>
      <div class="total-score">
        <h3>Corporate Evil Index (CEI) Total: <span id="cei-total">0</span>/10,000</h3>
        <div class="score-breakdown">
          <div>Blood Legacy: <span id="final-blood">0</span>/2500</div>
          <div>Suffering Amplification: <span id="final-suffering">0</span>/2500</div>
          <div>Wealth Extraction: <span id="final-wealth">0</span>/2000</div>
          <div>Planet Destruction: <span id="final-planet">0</span>/2000</div>
          <div>Democracy Corruption: <span id="final-democracy">0</span>/1000</div>
        </div>
      </div>

      <div class="input-group">
        <label for="assessor-name">Assessor Name</label>
        <input type="text" id="assessor-name" name="assessor_name" placeholder="Your name or organization">
      </div>

      <div class="input-group">
        <label for="assessment-date">Assessment Date</label>
        <input type="date" id="assessment-date" name="assessment_date">
      </div>

      <div class="input-group">
        <label for="overall-notes">Overall Assessment Notes</label>
        <textarea id="overall-notes" name="overall_notes" placeholder="Additional context, methodology notes, limitations, recommendations..."></textarea>
      </div>
    </div>

    <div class="form-actions">
      <button type="button" id="generate-report">Generate Assessment Report</button>
      <button type="button" id="save-draft">Save Draft</button>
      <button type="submit">Submit Evaluation</button>
    </div>
  </form>
</div>

<div id="assessment-report" class="assessment-report" style="display: none;">
  <h2>Corporate Evil Index Assessment Report</h2>
  <div id="report-content"></div>
  <button type="button" id="copy-report">Copy Report</button>
  <button type="button" id="download-report">Download as JSON</button>
</div>

<style>
.evaluation-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 20px;
}

.evaluation-form {
  background: #f9f9f9;
  padding: 30px;
  border-radius: 8px;
  border: 1px solid #ddd;
}

.form-section {
  margin-bottom: 40px;
  padding-bottom: 30px;
  border-bottom: 2px solid #e0e0e0;
}

.form-section:last-child {
  border-bottom: none;
}

.form-section h2 {
  color: #8B0000;
  margin-bottom: 10px;
  font-size: 1.5em;
}

.dimension-description {
  font-style: italic;
  color: #666;
  margin-bottom: 20px;
}

.scoring-subsection {
  margin-bottom: 25px;
  padding: 15px;
  background: white;
  border-radius: 5px;
  border: 1px solid #ddd;
}

.scoring-subsection h3 {
  color: #000080;
  margin-bottom: 10px;
  font-size: 1.1em;
}

.score-input {
  display: flex;
  flex-direction: column;
  gap: 10px;
}

.score-input label {
  font-weight: bold;
  color: #333;
}

.score-input input[type="number"] {
  width: 100px;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

.evidence-input {
  margin-top: 10px;
}

.evidence-input label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #555;
}

.evidence-input textarea {
  width: 100%;
  min-height: 80px;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 3px;
  resize: vertical;
}

.input-group {
  margin-bottom: 20px;
}

.input-group label {
  display: block;
  margin-bottom: 5px;
  font-weight: bold;
  color: #333;
}

.input-group input,
.input-group select,
.input-group textarea {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 3px;
  font-size: 14px;
}

.input-group textarea {
  min-height: 100px;
  resize: vertical;
}

.dimension-total {
  margin-top: 20px;
  padding: 10px;
  background: #e8f4fd;
  border-left: 4px solid #004080;
  font-size: 1.1em;
}

.total-score {
  background: #ffe6e6;
  padding: 20px;
  border-radius: 8px;
  border: 2px solid #8B0000;
  margin-bottom: 20px;
}

.total-score h3 {
  color: #8B0000;
  font-size: 1.4em;
  margin-bottom: 15px;
}

.score-breakdown {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 10px;
  margin-top: 10px;
}

.score-breakdown div {
  padding: 8px;
  background: white;
  border-radius: 3px;
  border: 1px solid #ddd;
  font-weight: bold;
}

.form-actions {
  display: flex;
  gap: 15px;
  justify-content: center;
  margin-top: 30px;
}

.form-actions button {
  padding: 12px 24px;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  transition: background-color 0.3s;
}

.form-actions button[type="submit"] {
  background: #8B0000;
  color: white;
}

.form-actions button[type="submit"]:hover {
  background: #660000;
}

.form-actions button[type="button"] {
  background: #004080;
  color: white;
}

.form-actions button[type="button"]:hover {
  background: #003366;
}

.assessment-report {
  margin-top: 30px;
  padding: 20px;
  background: #f0f8ff;
  border: 1px solid #004080;
  border-radius: 8px;
}

.assessment-report h2 {
  color: #004080;
  margin-bottom: 20px;
}

@media (max-width: 768px) {
  .evaluation-container {
    padding: 10px;
  }
  
  .evaluation-form {
    padding: 20px;
  }
  
  .form-actions {
    flex-direction: column;
  }
  
  .score-breakdown {
    grid-template-columns: 1fr;
  }
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
  // Auto-calculate totals as scores are entered
  const scoreInputs = document.querySelectorAll('input[type="number"]');
  
  scoreInputs.forEach(input => {
    input.addEventListener('input', calculateTotals);
  });
  
  function calculateTotals() {
    // Blood Legacy calculation
    const bloodInputs = ['workplace-fatalities', 'product-deaths', 'environmental-deaths', 'war-profiteering', 'healthcare-denial'];
    const bloodTotal = bloodInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('blood-total').textContent = bloodTotal;
    document.getElementById('final-blood').textContent = bloodTotal;
    
    // Suffering Amplification calculation
    const sufferingInputs = ['worker-exploitation', 'mental-health', 'community-destruction', 'addiction-profiteering', 'privacy-violations'];
    const sufferingTotal = sufferingInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('suffering-total').textContent = sufferingTotal;
    document.getElementById('final-suffering').textContent = sufferingTotal;
    
    // Wealth Extraction calculation
    const wealthInputs = ['wage-theft', 'tax-avoidance', 'price-manipulation', 'monopolistic', 'predatory-lending'];
    const wealthTotal = wealthInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('wealth-total').textContent = wealthTotal;
    document.getElementById('final-wealth').textContent = wealthTotal;
    
    // Planet Destruction calculation
    const planetInputs = ['emissions', 'pollution', 'resource-depletion', 'biodiversity', 'greenwashing'];
    const planetTotal = planetInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('planet-total').textContent = planetTotal;
    document.getElementById('final-planet').textContent = planetTotal;
    
    // Democracy Corruption calculation
    const democracyInputs = ['lobbying', 'campaign-finance', 'media-manipulation', 'voter-suppression', 'authoritarian'];
    const democracyTotal = democracyInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('democracy-total').textContent = democracyTotal;
    document.getElementById('final-democracy').textContent = democracyTotal;
    
    // CEI Total
    const ceiTotal = bloodTotal + sufferingTotal + wealthTotal + planetTotal + democracyTotal;
    document.getElementById('cei-total').textContent = ceiTotal;
  }
  
  // Set current date
  document.getElementById('assessment-date').value = new Date().toISOString().split('T')[0];
  
  // Generate report functionality
  document.getElementById('generate-report').addEventListener('click', function() {
    calculateTotals();
    generateReport();
  });
  
  function generateReport() {
    const formData = new FormData(document.getElementById('cei-evaluation-form'));
    const companyName = formData.get('company_name') || 'Unknown Company';
    const assessorName = formData.get('assessor_name') || 'Anonymous';
    const assessmentDate = formData.get('assessment_date') || new Date().toISOString().split('T')[0];
    
    const bloodTotal = parseInt(document.getElementById('blood-total').textContent);
    const sufferingTotal = parseInt(document.getElementById('suffering-total').textContent);
    const wealthTotal = parseInt(document.getElementById('wealth-total').textContent);
    const planetTotal = parseInt(document.getElementById('planet-total').textContent);
    const democracyTotal = parseInt(document.getElementById('democracy-total').textContent);
    const ceiTotal = parseInt(document.getElementById('cei-total').textContent);
    
    const reportContent = `
      <h3>${companyName} - Corporate Evil Index Assessment</h3>
      <p><strong>Assessed by:</strong> ${assessorName}</p>
      <p><strong>Assessment Date:</strong> ${assessmentDate}</p>
      
      <h4>CEI Score: ${ceiTotal}/10,000</h4>
      
      <h4>Dimension Breakdown:</h4>
      <ul>
        <li><strong>Blood Legacy:</strong> ${bloodTotal}/2,500 points</li>
        <li><strong>Suffering Amplification:</strong> ${sufferingTotal}/2,500 points</li>
        <li><strong>Wealth Extraction:</strong> ${wealthTotal}/2,000 points</li>
        <li><strong>Planet Destruction:</strong> ${planetTotal}/2,000 points</li>
        <li><strong>Democracy Corruption:</strong> ${democracyTotal}/1,000 points</li>
      </ul>
      
      <h4>Severity Assessment:</h4>
      <p>${getCEISeverityAssessment(ceiTotal)}</p>
      
      <h4>Key Findings:</h4>
      <p>${getKeyFindings(formData)}</p>
      
      <p><em>Assessment conducted using the Corporate Evil Index (CEI) framework from evil1.org</em></p>
    `;
    
    document.getElementById('report-content').innerHTML = reportContent;
    document.getElementById('assessment-report').style.display = 'block';
  }
  
  function getCEISeverityAssessment(score) {
    if (score >= 8001) return "Peak corporate evil - this entity represents a clear and present danger to society and requires immediate dismantling through regulatory action.";
    if (score >= 6001) return "Systemically destructive corporation with potential criminal liability. Severe regulatory intervention required.";
    if (score >= 4001) return "Deeply harmful to society. Immediate regulatory oversight and reform measures necessary.";
    if (score >= 2001) return "Significant corporate malfeasance requiring sustained regulatory pressure and public accountability measures.";
    return "Minor transgressions that could potentially be addressed through corporate governance reforms and enhanced oversight.";
  }
  
  function getKeyFindings(formData) {
    const findings = [];
    
    if (parseInt(document.getElementById('blood-total').textContent) > 1500) {
      findings.push("Severe blood legacy with documented deaths and physical harm");
    }
    if (parseInt(document.getElementById('suffering-total').textContent) > 1500) {
      findings.push("Extensive suffering amplification through exploitation and abuse");
    }
    if (parseInt(document.getElementById('wealth-total').textContent) > 1200) {
      findings.push("Significant wealth extraction through predatory business practices");
    }
    if (parseInt(document.getElementById('planet-total').textContent) > 1200) {
      findings.push("Major environmental destruction and climate impact");
    }
    if (parseInt(document.getElementById('democracy-total').textContent) > 600) {
      findings.push("Democratic institutions undermined through corruption and manipulation");
    }
    
    return findings.length > 0 ? findings.join('; ') : "Assessment completed - review dimension scores for detailed analysis.";
  }
  
  // Copy report functionality
  document.getElementById('copy-report').addEventListener('click', function() {
    const reportText = document.getElementById('report-content').innerText;
    navigator.clipboard.writeText(reportText).then(() => {
      alert('Report copied to clipboard!');
    });
  });
  
  // Download as JSON functionality
  document.getElementById('download-report').addEventListener('click', function() {
    const formData = new FormData(document.getElementById('cei-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    data.cei_total = parseInt(document.getElementById('cei-total').textContent);
    data.blood_total = parseInt(document.getElementById('blood-total').textContent);
    data.suffering_total = parseInt(document.getElementById('suffering-total').textContent);
    data.wealth_total = parseInt(document.getElementById('wealth-total').textContent);
    data.planet_total = parseInt(document.getElementById('planet-total').textContent);
    data.democracy_total = parseInt(document.getElementById('democracy-total').textContent);
    data.assessment_timestamp = new Date().toISOString();
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${data.company_name || 'company'}-cei-assessment.json`;
    a.click();
    URL.revokeObjectURL(url);
  });
  
  // Save draft functionality
  document.getElementById('save-draft').addEventListener('click', function() {
    const formData = new FormData(document.getElementById('cei-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    localStorage.setItem('cei-draft', JSON.stringify(data));
    alert('Draft saved locally!');
  });
  
  // Load draft if exists
  const savedDraft = localStorage.getItem('cei-draft');
  if (savedDraft) {
    const data = JSON.parse(savedDraft);
    for (let [key, value] of Object.entries(data)) {
      const element = document.querySelector(`[name="${key}"]`);
      if (element) {
        element.value = value;
      }
    }
    calculateTotals();
  }
});
</script>

## How to Use This Evaluation Tool

1. **Gather Evidence**: Research the company thoroughly using credible sources
2. **Score Each Dimension**: Assign points based on documented evidence and impact scale
3. **Provide Documentation**: Include specific sources and evidence for each score
4. **Review Totals**: Ensure scores align with the evidence provided
5. **Generate Report**: Create a comprehensive assessment document
6. **Submit or Save**: Either submit for publication or save as a draft

## Scoring Guidelines

- **0-100 points**: Minor issues with limited evidence
- **101-300 points**: Moderate harm with documented incidents
- **301-400 points**: Significant harm with substantial evidence
- **401-500 points**: Severe harm with overwhelming evidence and systemic impact

## Related Tools

- [Evaluate Executive](/evaluate-executive/) - Executive Malevolence Score (EMS)
- [Evaluate Institution](/evaluate-institution/) - Institutional Corruption Framework (ICF)
- [Evaluate Product](/evaluate-product/) - Devil's Metrics for harmful products
- [Metrics Dashboard](/metrics-dashboard/) - View all scoring frameworks
- [Methodology Documentation](/docs/comprehensive-metrics-methodology/) - Complete framework details