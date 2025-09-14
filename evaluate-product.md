---
layout: default
title: "Evaluate Product - Devil's Metrics Assessment"
description: "Systematic evaluation tool for assessing harmful products using the Devil's Metrics scoring framework"
permalink: /evaluate-product/
---

# Devil's Metrics Product Evaluation

Use this comprehensive form to evaluate a product using our standardized Devil's Metrics framework. This system measures the total harm caused by a product across 4 dimensions with a maximum score of 17,000 points.

<div class="evaluation-container">
  <form id="devils-evaluation-form" class="evaluation-form">
    <div class="form-section">
      <h2>Product Information</h2>
      <div class="input-group">
        <label for="product-name">Product Name *</label>
        <input type="text" id="product-name" name="product_name" required>
      </div>
      
      <div class="input-group">
        <label for="product-category">Product Category</label>
        <select id="product-category" name="product_category">
          <option value="">Select Category</option>
          <option value="energy">Energy & Fossil Fuels</option>
          <option value="pharmaceuticals">Pharmaceuticals</option>
          <option value="tobacco">Tobacco Products</option>
          <option value="weapons">Weapons & Defense</option>
          <option value="technology">Technology & Electronics</option>
          <option value="chemicals">Chemicals & Pesticides</option>
          <option value="food">Food & Agriculture</option>
          <option value="fashion">Fashion & Textiles</option>
          <option value="automotive">Automotive</option>
          <option value="finance">Financial Products</option>
          <option value="surveillance">Surveillance Technology</option>
          <option value="other">Other</option>
        </select>
      </div>
      
      <div class="input-group">
        <label for="manufacturer">Primary Manufacturer/Company</label>
        <input type="text" id="manufacturer" name="manufacturer">
      </div>
      
      <div class="input-group">
        <label for="production-scale">Global Production Scale</label>
        <select id="production-scale" name="production_scale">
          <option value="">Select Scale</option>
          <option value="local">Local (single region)</option>
          <option value="national">National (single country)</option>
          <option value="international">International (multiple countries)</option>
          <option value="global">Global (worldwide distribution)</option>
        </select>
      </div>
      
      <div class="input-group">
        <label for="product-description">Product Description</label>
        <textarea id="product-description" name="product_description" placeholder="Brief description of the product and its uses..."></textarea>
      </div>
    </div>

    <div class="form-section">
      <h2>Blood Score Assessment (0-5,000 points)</h2>
      <p class="dimension-description">Deaths caused by product lifecycle - from extraction to disposal</p>
      
      <div class="scoring-subsection">
        <h3>Direct Deaths from Product Use</h3>
        <div class="score-input">
          <label for="direct-deaths">Score (0-1,500):</label>
          <input type="number" id="direct-deaths" name="direct_deaths" min="0" max="1500" value="0">
          <div class="evidence-input">
            <label for="direct-deaths-evidence">Evidence & Sources:</label>
            <textarea id="direct-deaths-evidence" name="direct_deaths_evidence" placeholder="Document fatalities directly caused by product use - overdoses, accidents, poisoning, violence..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Manufacturing & Supply Chain Deaths</h3>
        <div class="score-input">
          <label for="manufacturing-deaths">Score (0-1,000):</label>
          <input type="number" id="manufacturing-deaths" name="manufacturing_deaths" min="0" max="1000" value="0">
          <div class="evidence-input">
            <label for="manufacturing-evidence">Evidence & Sources:</label>
            <textarea id="manufacturing-evidence" name="manufacturing_evidence" placeholder="Worker deaths in production, mining accidents, factory fires, chemical exposures..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Environmental & Health Impact Deaths</h3>
        <div class="score-input">
          <label for="environmental-deaths">Score (0-1,500):</label>
          <input type="number" id="environmental-deaths" name="environmental_deaths" min="0" max="1500" value="0">
          <div class="evidence-input">
            <label for="environmental-evidence">Evidence & Sources:</label>
            <textarea id="environmental-evidence" name="environmental_evidence" placeholder="Deaths from pollution, climate change acceleration, ecosystem destruction, contamination..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Long-term Health Deterioration Deaths</h3>
        <div class="score-input">
          <label for="longterm-deaths">Score (0-1,000):</label>
          <input type="number" id="longterm-deaths" name="longterm_deaths" min="0" max="1000" value="0">
          <div class="evidence-input">
            <label for="longterm-evidence">Evidence & Sources:</label>
            <textarea id="longterm-evidence" name="longterm_evidence" placeholder="Cancer deaths, respiratory disease, addiction-related deaths, long-term chronic conditions..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Blood Score Total: <span id="blood-total">0</span>/5000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Tears Score Assessment (0-5,000 points)</h2>
      <p class="dimension-description">Human suffering and quality of life destruction</p>
      
      <div class="scoring-subsection">
        <h3>Physical Health Damage & Disability</h3>
        <div class="score-input">
          <label for="health-damage">Score (0-1,500):</label>
          <input type="number" id="health-damage" name="health_damage" min="0" max="1500" value="0">
          <div class="evidence-input">
            <label for="health-damage-evidence">Evidence & Sources:</label>
            <textarea id="health-damage-evidence" name="health_damage_evidence" placeholder="Non-fatal injuries, birth defects, chronic illness, disability caused by product..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Mental Health & Psychological Damage</h3>
        <div class="score-input">
          <label for="mental-damage">Score (0-1,500):</label>
          <input type="number" id="mental-damage" name="mental_damage" min="0" max="1500" value="0">
          <div class="evidence-input">
            <label for="mental-evidence">Evidence & Sources:</label>
            <textarea id="mental-evidence" name="mental_evidence" placeholder="Addiction, depression, anxiety, PTSD, psychological manipulation effects..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Economic Devastation & Poverty Creation</h3>
        <div class="score-input">
          <label for="economic-devastation">Score (0-1,000):</label>
          <input type="number" id="economic-devastation" name="economic_devastation" min="0" max="1000" value="0">
          <div class="evidence-input">
            <label for="economic-evidence">Evidence & Sources:</label>
            <textarea id="economic-evidence" name="economic_evidence" placeholder="Job losses, community economic destruction, predatory pricing, debt creation..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Social & Community Destruction</h3>
        <div class="score-input">
          <label for="community-destruction">Score (0-1,000):</label>
          <input type="number" id="community-destruction" name="community_destruction" min="0" max="1000" value="0">
          <div class="evidence-input">
            <label for="community-evidence">Evidence & Sources:</label>
            <textarea id="community-evidence" name="community_evidence" placeholder="Family breakdown, social isolation, community displacement, cultural destruction..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Tears Score Total: <span id="tears-total">0</span>/5000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Gold Score Assessment (0-5,000 points)</h2>
      <p class="dimension-description">Profit extraction through exploitation</p>
      
      <div class="scoring-subsection">
        <h3>Worker Exploitation & Labor Abuse</h3>
        <div class="score-input">
          <label for="worker-exploitation">Score (0-1,500):</label>
          <input type="number" id="worker-exploitation" name="worker_exploitation" min="0" max="1500" value="0">
          <div class="evidence-input">
            <label for="worker-evidence">Evidence & Sources:</label>
            <textarea id="worker-evidence" name="worker_evidence" placeholder="Sweatshop labor, child labor, wage theft, unsafe working conditions, union suppression..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Consumer Price Manipulation & Gouging</h3>
        <div class="score-input">
          <label for="price-manipulation">Score (0-1,500):</label>
          <input type="number" id="price-manipulation" name="price_manipulation" min="0" max="1500" value="0">
          <div class="evidence-input">
            <label for="price-evidence">Evidence & Sources:</label>
            <textarea id="price-evidence" name="price_evidence" placeholder="Monopoly pricing, essential goods price gouging, artificial scarcity, predatory pricing..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Tax Avoidance & Externalization</h3>
        <div class="score-input">
          <label for="tax-avoidance">Score (0-1,000):</label>
          <input type="number" id="tax-avoidance" name="tax_avoidance" min="0" max="1000" value="0">
          <div class="evidence-input">
            <label for="tax-evidence">Evidence & Sources:</label>
            <textarea id="tax-evidence" name="tax_evidence" placeholder="Corporate tax avoidance, environmental cost externalization, public subsidy abuse..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Market Manipulation & Anti-Competition</h3>
        <div class="score-input">
          <label for="market-manipulation">Score (0-1,000):</label>
          <input type="number" id="market-manipulation" name="market_manipulation" min="0" max="1000" value="0">
          <div class="evidence-input">
            <label for="market-evidence">Evidence & Sources:</label>
            <textarea id="market-evidence" name="market_evidence" placeholder="Cartels, exclusive dealing, predatory acquisition, vertical foreclosure..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Gold Score Total: <span id="gold-total">0</span>/5000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Earth Score Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Environmental destruction and damage</p>
      
      <div class="scoring-subsection">
        <h3>Climate Change Acceleration</h3>
        <div class="score-input">
          <label for="climate-change">Score (0-800):</label>
          <input type="number" id="climate-change" name="climate_change" min="0" max="800" value="0">
          <div class="evidence-input">
            <label for="climate-evidence">Evidence & Sources:</label>
            <textarea id="climate-evidence" name="climate_evidence" placeholder="CO2 emissions, methane release, fossil fuel extraction, deforestation..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Pollution & Contamination</h3>
        <div class="score-input">
          <label for="pollution">Score (0-600):</label>
          <input type="number" id="pollution" name="pollution" min="0" max="600" value="0">
          <div class="evidence-input">
            <label for="pollution-evidence">Evidence & Sources:</label>
            <textarea id="pollution-evidence" name="pollution_evidence" placeholder="Water pollution, air pollution, soil contamination, toxic waste generation..."></textarea>
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
            <textarea id="resource-evidence" name="resource_evidence" placeholder="Deforestation, overfishing, mining destruction, land degradation..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Biodiversity Loss & Ecosystem Damage</h3>
        <div class="score-input">
          <label for="biodiversity-loss">Score (0-200):</label>
          <input type="number" id="biodiversity-loss" name="biodiversity_loss" min="0" max="200" value="0">
          <div class="evidence-input">
            <label for="biodiversity-evidence">Evidence & Sources:</label>
            <textarea id="biodiversity-evidence" name="biodiversity_evidence" placeholder="Species extinction, ecosystem disruption, invasive species introduction..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Earth Score Total: <span id="earth-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Assessment Summary</h2>
      <div class="total-score">
        <h3>Devil's Metrics Total: <span id="devils-total">0</span>/17,000</h3>
        <div class="score-breakdown">
          <div>Blood Score: <span id="final-blood">0</span>/5000</div>
          <div>Tears Score: <span id="final-tears">0</span>/5000</div>
          <div>Gold Score: <span id="final-gold">0</span>/5000</div>
          <div>Earth Score: <span id="final-earth">0</span>/2000</div>
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
  <h2>Devil's Metrics Product Assessment Report</h2>
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
    // Blood Score calculation
    const bloodInputs = ['direct-deaths', 'manufacturing-deaths', 'environmental-deaths', 'longterm-deaths'];
    const bloodTotal = bloodInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('blood-total').textContent = bloodTotal;
    document.getElementById('final-blood').textContent = bloodTotal;
    
    // Tears Score calculation
    const tearsInputs = ['health-damage', 'mental-damage', 'economic-devastation', 'community-destruction'];
    const tearsTotal = tearsInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('tears-total').textContent = tearsTotal;
    document.getElementById('final-tears').textContent = tearsTotal;
    
    // Gold Score calculation
    const goldInputs = ['worker-exploitation', 'price-manipulation', 'tax-avoidance', 'market-manipulation'];
    const goldTotal = goldInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('gold-total').textContent = goldTotal;
    document.getElementById('final-gold').textContent = goldTotal;
    
    // Earth Score calculation
    const earthInputs = ['climate-change', 'pollution', 'resource-depletion', 'biodiversity-loss'];
    const earthTotal = earthInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('earth-total').textContent = earthTotal;
    document.getElementById('final-earth').textContent = earthTotal;
    
    // Devil's Metrics Total
    const devilsTotal = bloodTotal + tearsTotal + goldTotal + earthTotal;
    document.getElementById('devils-total').textContent = devilsTotal;
  }
  
  // Set current date
  document.getElementById('assessment-date').value = new Date().toISOString().split('T')[0];
  
  // Generate report functionality
  document.getElementById('generate-report').addEventListener('click', function() {
    calculateTotals();
    generateReport();
  });
  
  function generateReport() {
    const formData = new FormData(document.getElementById('devils-evaluation-form'));
    const productName = formData.get('product_name') || 'Unknown Product';
    const manufacturer = formData.get('manufacturer') || 'Unknown Manufacturer';
    const category = formData.get('product_category') || 'Unknown Category';
    const assessorName = formData.get('assessor_name') || 'Anonymous';
    const assessmentDate = formData.get('assessment_date') || new Date().toISOString().split('T')[0];
    
    const bloodTotal = parseInt(document.getElementById('blood-total').textContent);
    const tearsTotal = parseInt(document.getElementById('tears-total').textContent);
    const goldTotal = parseInt(document.getElementById('gold-total').textContent);
    const earthTotal = parseInt(document.getElementById('earth-total').textContent);
    const devilsTotal = parseInt(document.getElementById('devils-total').textContent);
    
    const reportContent = `
      <h3>${productName} - Devil's Metrics Assessment</h3>
      <p><strong>Manufacturer:</strong> ${manufacturer}</p>
      <p><strong>Category:</strong> ${category}</p>
      <p><strong>Assessed by:</strong> ${assessorName}</p>
      <p><strong>Assessment Date:</strong> ${assessmentDate}</p>
      
      <h4>Devil's Metrics Score: ${devilsTotal}/17,000</h4>
      
      <h4>Dimension Breakdown:</h4>
      <ul>
        <li><strong>Blood Score:</strong> ${bloodTotal}/5,000 points (Deaths caused)</li>
        <li><strong>Tears Score:</strong> ${tearsTotal}/5,000 points (Human suffering)</li>
        <li><strong>Gold Score:</strong> ${goldTotal}/5,000 points (Profit extraction)</li>
        <li><strong>Earth Score:</strong> ${earthTotal}/2,000 points (Environmental destruction)</li>
      </ul>
      
      <h4>Harm Assessment:</h4>
      <p>${getDevilsSeverityAssessment(devilsTotal)}</p>
      
      <h4>Primary Harm Vectors:</h4>
      <p>${getPrimaryHarmVectors(formData)}</p>
      
      <p><em>Assessment conducted using the Devil's Metrics framework from evil1.org</em></p>
    `;
    
    document.getElementById('report-content').innerHTML = reportContent;
    document.getElementById('assessment-report').style.display = 'block';
  }
  
  function getDevilsSeverityAssessment(score) {
    if (score >= 13600) return "Maximum product evil - this product represents an existential threat to humanity and should be banned immediately.";
    if (score >= 10200) return "Extremely harmful product causing massive societal damage. Immediate regulatory intervention required.";
    if (score >= 6800) return "Highly dangerous product with severe negative impact on society and environment.";
    if (score >= 3400) return "Significantly harmful product requiring strict regulation and oversight.";
    if (score >= 1700) return "Moderately harmful product with concerning negative impacts.";
    return "Product shows some harmful characteristics but may be manageable with proper regulation.";
  }
  
  function getPrimaryHarmVectors(formData) {
    const vectors = [];
    
    if (parseInt(document.getElementById('blood-total').textContent) > 3000) {
      vectors.push("Extreme lethality with massive death toll");
    }
    if (parseInt(document.getElementById('tears-total').textContent) > 3000) {
      vectors.push("Severe human suffering and quality of life destruction");
    }
    if (parseInt(document.getElementById('gold-total').textContent) > 3000) {
      vectors.push("Massive exploitation and profit extraction");
    }
    if (parseInt(document.getElementById('earth-total').textContent) > 1200) {
      vectors.push("Significant environmental destruction and climate impact");
    }
    
    return vectors.length > 0 ? vectors.join('; ') : "Assessment completed - review dimension scores for detailed harm analysis.";
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
    const formData = new FormData(document.getElementById('devils-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    data.devils_total = parseInt(document.getElementById('devils-total').textContent);
    data.blood_total = parseInt(document.getElementById('blood-total').textContent);
    data.tears_total = parseInt(document.getElementById('tears-total').textContent);
    data.gold_total = parseInt(document.getElementById('gold-total').textContent);
    data.earth_total = parseInt(document.getElementById('earth-total').textContent);
    data.assessment_timestamp = new Date().toISOString();
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${data.product_name || 'product'}-devils-metrics-assessment.json`;
    a.click();
    URL.revokeObjectURL(url);
  });
  
  // Save draft functionality
  document.getElementById('save-draft').addEventListener('click', function() {
    const formData = new FormData(document.getElementById('devils-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    localStorage.setItem('devils-draft', JSON.stringify(data));
    alert('Draft saved locally!');
  });
  
  // Load draft if exists
  const savedDraft = localStorage.getItem('devils-draft');
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

1. **Product Research**: Thoroughly investigate the product's lifecycle and impacts
2. **Evidence Gathering**: Collect credible sources for each harm dimension
3. **Systematic Scoring**: Assign points based on documented evidence and scale
4. **Cross-Reference**: Compare with similar products in our [Evil Products Catalog](/evil-products/)
5. **Generate Report**: Create a comprehensive harm assessment document
6. **Submit or Archive**: Either submit for publication or save for future reference

## Scoring Guidelines

### Blood Score (Deaths Caused - 0-5,000)
- **Direct Deaths (0-1,500)**: Immediate fatalities from product use
- **Manufacturing Deaths (0-1,000)**: Supply chain and production fatalities
- **Environmental Deaths (0-1,500)**: Pollution and climate-related deaths
- **Long-term Deaths (0-1,000)**: Chronic health deterioration deaths

### Tears Score (Human Suffering - 0-5,000)
- **Health Damage (0-1,500)**: Non-fatal physical harm and disability
- **Mental Damage (0-1,500)**: Psychological harm and addiction
- **Economic Devastation (0-1,000)**: Financial ruin and poverty creation
- **Community Destruction (0-1,000)**: Social fabric damage

### Gold Score (Profit Extraction - 0-5,000)
- **Worker Exploitation (0-1,500)**: Labor abuse and wage theft
- **Price Manipulation (0-1,500)**: Consumer exploitation and gouging
- **Tax Avoidance (0-1,000)**: Externalization of social costs
- **Market Manipulation (0-1,000)**: Anti-competitive practices

### Earth Score (Environmental Destruction - 0-2,000)
- **Climate Change (0-800)**: Greenhouse gas emissions and acceleration
- **Pollution (0-600)**: Water, air, and soil contamination
- **Resource Depletion (0-400)**: Habitat destruction and extraction
- **Biodiversity Loss (0-200)**: Species extinction and ecosystem damage

## Related Tools

- [Evaluate Company](/evaluate-company/) - Corporate Evil Index (CEI)
- [Evaluate Executive](/evaluate-executive/) - Executive Malevolence Score (EMS)
- [Evaluate Institution](/evaluate-institution/) - Institutional Corruption Framework (ICF)
- [Evil Products Catalog](/evil-products/) - View existing product assessments
- [Metrics Dashboard](/metrics-dashboard/) - View all scoring frameworks
- [Methodology Documentation](/docs/evil-products-scoring-methodology/) - Product-specific methodology