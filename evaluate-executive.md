---
layout: default
title: "Evaluate Executive - Executive Malevolence Score Assessment"
description: "Systematic evaluation tool for assessing individual executive accountability using the Executive Malevolence Score framework"
permalink: /evaluate-executive/
---

# Executive Malevolence Score (EMS) Evaluation

Use this comprehensive form to evaluate an executive or leader using our standardized Executive Malevolence Score framework. The EMS measures personal accountability for harm across 4 dimensions with a maximum score of 5,000 points.

<div class="evaluation-container">
  <form id="ems-evaluation-form" class="evaluation-form">
    <div class="form-section">
      <h2>Executive Information</h2>
      <div class="input-group">
        <label for="executive-name">Executive Name *</label>
        <input type="text" id="executive-name" name="executive_name" required>
      </div>
      
      <div class="input-group">
        <label for="current-position">Current Position/Title</label>
        <input type="text" id="current-position" name="current_position" placeholder="e.g., CEO, Chairman, President">
      </div>
      
      <div class="input-group">
        <label for="company-organization">Company/Organization</label>
        <input type="text" id="company-organization" name="company_organization">
      </div>
      
      <div class="input-group">
        <label for="years-in-position">Years in Current Position</label>
        <input type="number" id="years-in-position" name="years_in_position" min="0" max="50">
      </div>
      
      <div class="input-group">
        <label for="previous-positions">Previous Key Positions</label>
        <textarea id="previous-positions" name="previous_positions" placeholder="List previous executive roles and companies..."></textarea>
      </div>
    </div>

    <div class="form-section">
      <h2>Personal Cruelty Assessment (0-1,500 points)</h2>
      <p class="dimension-description">Direct personal involvement in causing harm</p>
      
      <div class="scoring-subsection">
        <h3>Callous Disregard for Human Suffering</h3>
        <div class="score-input">
          <label for="callous-disregard">Score (0-375):</label>
          <input type="number" id="callous-disregard" name="callous_disregard" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="callous-evidence">Evidence & Sources:</label>
            <textarea id="callous-evidence" name="callous_evidence" placeholder="Document specific instances of dismissing worker deaths, ignoring safety concerns, mocking victims..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Personal Enrichment Through Others' Pain</h3>
        <div class="score-input">
          <label for="enrichment-pain">Score (0-375):</label>
          <input type="number" id="enrichment-pain" name="enrichment_pain" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="enrichment-evidence">Evidence & Sources:</label>
            <textarea id="enrichment-evidence" name="enrichment_evidence" placeholder="Bonus payments tied to cost-cutting that harms workers, profit from addiction/suffering..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Sadistic Decision-Making Patterns</h3>
        <div class="score-input">
          <label for="sadistic-decisions">Score (0-375):</label>
          <input type="number" id="sadistic-decisions" name="sadistic_decisions" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="sadistic-evidence">Evidence & Sources:</label>
            <textarea id="sadistic-evidence" name="sadistic_evidence" placeholder="Deliberately choosing more harmful options when alternatives exist, enjoying others' suffering..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Abuse of Power Over Subordinates</h3>
        <div class="score-input">
          <label for="power-abuse">Score (0-375):</label>
          <input type="number" id="power-abuse" name="power_abuse" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="power-abuse-evidence">Evidence & Sources:</label>
            <textarea id="power-abuse-evidence" name="power_abuse_evidence" placeholder="Workplace harassment, intimidation tactics, retaliation against whistleblowers..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Personal Cruelty Total: <span id="cruelty-total">0</span>/1500</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Systemic Evil Assessment (0-1,500 points)</h2>
      <p class="dimension-description">Building and maintaining harmful systems</p>
      
      <div class="scoring-subsection">
        <h3>Designing Exploitative Business Models</h3>
        <div class="score-input">
          <label for="exploitative-models">Score (0-375):</label>
          <input type="number" id="exploitative-models" name="exploitative_models" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="exploitative-evidence">Evidence & Sources:</label>
            <textarea id="exploitative-evidence" name="exploitative_evidence" placeholder="Creating gig economy exploitation, predatory business models, worker classification schemes..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Creating Addictive or Harmful Products</h3>
        <div class="score-input">
          <label for="harmful-products">Score (0-375):</label>
          <input type="number" id="harmful-products" name="harmful_products" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="harmful-products-evidence">Evidence & Sources:</label>
            <textarea id="harmful-products-evidence" name="harmful_products_evidence" placeholder="Designing addictive algorithms, harmful chemical formulations, predatory financial products..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Implementing Surveillance and Control Systems</h3>
        <div class="score-input">
          <label for="surveillance-systems">Score (0-375):</label>
          <input type="number" id="surveillance-systems" name="surveillance_systems" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="surveillance-evidence">Evidence & Sources:</label>
            <textarea id="surveillance-evidence" name="surveillance_evidence" placeholder="Employee monitoring systems, customer tracking programs, authoritarian surveillance tools..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Institutionalizing Discrimination and Bias</h3>
        <div class="score-input">
          <label for="discrimination-systems">Score (0-375):</label>
          <input type="number" id="discrimination-systems" name="discrimination_systems" min="0" max="375" value="0">
          <div class="evidence-input">
            <label for="discrimination-evidence">Evidence & Sources:</label>
            <textarea id="discrimination-evidence" name="discrimination_evidence" placeholder="Biased hiring algorithms, discriminatory policies, systemic exclusion practices..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Systemic Evil Total: <span id="systemic-total">0</span>/1500</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Scale of Harm Assessment (0-1,000 points)</h2>
      <p class="dimension-description">Magnitude and reach of damage caused</p>
      
      <div class="scoring-subsection">
        <h3>Number of People Directly Affected</h3>
        <div class="score-input">
          <label for="people-affected">Score (0-250):</label>
          <input type="number" id="people-affected" name="people_affected" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="people-evidence">Evidence & Sources:</label>
            <textarea id="people-evidence" name="people_evidence" placeholder="Number of employees, customers, community members directly harmed by decisions..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Geographic Scope of Influence</h3>
        <div class="score-input">
          <label for="geographic-scope">Score (0-250):</label>
          <input type="number" id="geographic-scope" name="geographic_scope" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="geographic-evidence">Evidence & Sources:</label>
            <textarea id="geographic-evidence" name="geographic_evidence" placeholder="Local, regional, national, or global reach of harmful decisions and policies..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Duration and Permanence of Damage</h3>
        <div class="score-input">
          <label for="damage-duration">Score (0-250):</label>
          <input type="number" id="damage-duration" name="damage_duration" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="duration-evidence">Evidence & Sources:</label>
            <textarea id="duration-evidence" name="duration_evidence" placeholder="Long-term health effects, environmental damage, systemic policy changes..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Generational Impact and Legacy Effects</h3>
        <div class="score-input">
          <label for="generational-impact">Score (0-250):</label>
          <input type="number" id="generational-impact" name="generational_impact" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="generational-evidence">Evidence & Sources:</label>
            <textarea id="generational-evidence" name="generational_evidence" placeholder="Impact on future generations, inherited health/environmental problems, systemic precedents..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Scale of Harm Total: <span id="scale-total">0</span>/1000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Resistance to Accountability Assessment (0-1,000 points)</h2>
      <p class="dimension-description">Efforts to avoid consequences and responsibility</p>
      
      <div class="scoring-subsection">
        <h3>Cover-ups and Evidence Destruction</h3>
        <div class="score-input">
          <label for="coverups">Score (0-250):</label>
          <input type="number" id="coverups" name="coverups" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="coverups-evidence">Evidence & Sources:</label>
            <textarea id="coverups-evidence" name="coverups_evidence" placeholder="Document destruction, hiding evidence, obstruction of investigations..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Legal System Manipulation and Corruption</h3>
        <div class="score-input">
          <label for="legal-manipulation">Score (0-250):</label>
          <input type="number" id="legal-manipulation" name="legal_manipulation" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="legal-evidence">Evidence & Sources:</label>
            <textarea id="legal-evidence" name="legal_evidence" placeholder="Judge shopping, regulatory capture, political influence to avoid prosecution..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Whistleblower Retaliation and Silencing</h3>
        <div class="score-input">
          <label for="whistleblower-retaliation">Score (0-250):</label>
          <input type="number" id="whistleblower-retaliation" name="whistleblower_retaliation" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="whistleblower-evidence">Evidence & Sources:</label>
            <textarea id="whistleblower-evidence" name="whistleblower_evidence" placeholder="Firing whistleblowers, intimidation campaigns, legal harassment of truth-tellers..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Public Relations Manipulation and Gaslighting</h3>
        <div class="score-input">
          <label for="pr-manipulation">Score (0-250):</label>
          <input type="number" id="pr-manipulation" name="pr_manipulation" min="0" max="250" value="0">
          <div class="evidence-input">
            <label for="pr-evidence">Evidence & Sources:</label>
            <textarea id="pr-evidence" name="pr_evidence" placeholder="Victim blaming, reality distortion campaigns, fake grassroots movements..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Resistance to Accountability Total: <span id="resistance-total">0</span>/1000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Assessment Summary</h2>
      <div class="total-score">
        <h3>Executive Malevolence Score (EMS) Total: <span id="ems-total">0</span>/5,000</h3>
        <div class="score-breakdown">
          <div>Personal Cruelty: <span id="final-cruelty">0</span>/1500</div>
          <div>Systemic Evil: <span id="final-systemic">0</span>/1500</div>
          <div>Scale of Harm: <span id="final-scale">0</span>/1000</div>
          <div>Resistance to Accountability: <span id="final-resistance">0</span>/1000</div>
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
  <h2>Executive Malevolence Score Assessment Report</h2>
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
    // Personal Cruelty calculation
    const crueltyInputs = ['callous-disregard', 'enrichment-pain', 'sadistic-decisions', 'power-abuse'];
    const crueltyTotal = crueltyInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('cruelty-total').textContent = crueltyTotal;
    document.getElementById('final-cruelty').textContent = crueltyTotal;
    
    // Systemic Evil calculation
    const systemicInputs = ['exploitative-models', 'harmful-products', 'surveillance-systems', 'discrimination-systems'];
    const systemicTotal = systemicInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('systemic-total').textContent = systemicTotal;
    document.getElementById('final-systemic').textContent = systemicTotal;
    
    // Scale of Harm calculation
    const scaleInputs = ['people-affected', 'geographic-scope', 'damage-duration', 'generational-impact'];
    const scaleTotal = scaleInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('scale-total').textContent = scaleTotal;
    document.getElementById('final-scale').textContent = scaleTotal;
    
    // Resistance to Accountability calculation
    const resistanceInputs = ['coverups', 'legal-manipulation', 'whistleblower-retaliation', 'pr-manipulation'];
    const resistanceTotal = resistanceInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('resistance-total').textContent = resistanceTotal;
    document.getElementById('final-resistance').textContent = resistanceTotal;
    
    // EMS Total
    const emsTotal = crueltyTotal + systemicTotal + scaleTotal + resistanceTotal;
    document.getElementById('ems-total').textContent = emsTotal;
  }
  
  // Set current date
  document.getElementById('assessment-date').value = new Date().toISOString().split('T')[0];
  
  // Generate report functionality
  document.getElementById('generate-report').addEventListener('click', function() {
    calculateTotals();
    generateReport();
  });
  
  function generateReport() {
    const formData = new FormData(document.getElementById('ems-evaluation-form'));
    const executiveName = formData.get('executive_name') || 'Unknown Executive';
    const currentPosition = formData.get('current_position') || 'Unknown Position';
    const companyOrganization = formData.get('company_organization') || 'Unknown Organization';
    const assessorName = formData.get('assessor_name') || 'Anonymous';
    const assessmentDate = formData.get('assessment_date') || new Date().toISOString().split('T')[0];
    
    const crueltyTotal = parseInt(document.getElementById('cruelty-total').textContent);
    const systemicTotal = parseInt(document.getElementById('systemic-total').textContent);
    const scaleTotal = parseInt(document.getElementById('scale-total').textContent);
    const resistanceTotal = parseInt(document.getElementById('resistance-total').textContent);
    const emsTotal = parseInt(document.getElementById('ems-total').textContent);
    
    const reportContent = `
      <h3>${executiveName} - Executive Malevolence Score Assessment</h3>
      <p><strong>Position:</strong> ${currentPosition} at ${companyOrganization}</p>
      <p><strong>Assessed by:</strong> ${assessorName}</p>
      <p><strong>Assessment Date:</strong> ${assessmentDate}</p>
      
      <h4>EMS Score: ${emsTotal}/5,000</h4>
      
      <h4>Dimension Breakdown:</h4>
      <ul>
        <li><strong>Personal Cruelty:</strong> ${crueltyTotal}/1,500 points</li>
        <li><strong>Systemic Evil:</strong> ${systemicTotal}/1,500 points</li>
        <li><strong>Scale of Harm:</strong> ${scaleTotal}/1,000 points</li>
        <li><strong>Resistance to Accountability:</strong> ${resistanceTotal}/1,000 points</li>
      </ul>
      
      <h4>Malevolence Assessment:</h4>
      <p>${getEMSSeverityAssessment(emsTotal)}</p>
      
      <h4>Key Risk Factors:</h4>
      <p>${getKeyRiskFactors(formData)}</p>
      
      <p><em>Assessment conducted using the Executive Malevolence Score (EMS) framework from evil1.org</em></p>
    `;
    
    document.getElementById('report-content').innerHTML = reportContent;
    document.getElementById('assessment-report').style.display = 'block';
  }
  
  function getEMSSeverityAssessment(score) {
    if (score >= 4001) return "Maximum malevolence level - this individual represents a clear and present danger to society and should face immediate criminal accountability.";
    if (score >= 3001) return "High malevolence with significant personal responsibility for societal harm. Criminal prosecution and removal from position warranted.";
    if (score >= 2001) return "Concerning patterns of harmful decision-making with serious accountability implications.";
    if (score >= 1001) return "Problematic executive behavior that requires enhanced oversight and potential removal.";
    return "Standard corporate executive behavior with room for improvement in ethical leadership.";
  }
  
  function getKeyRiskFactors(formData) {
    const factors = [];
    
    if (parseInt(document.getElementById('cruelty-total').textContent) > 900) {
      factors.push("Extreme personal cruelty and callous disregard for human suffering");
    }
    if (parseInt(document.getElementById('systemic-total').textContent) > 900) {
      factors.push("Architect of systemically harmful business practices and exploitation");
    }
    if (parseInt(document.getElementById('scale-total').textContent) > 600) {
      factors.push("Massive scale of harm affecting large populations and future generations");
    }
    if (parseInt(document.getElementById('resistance-total').textContent) > 600) {
      factors.push("Active obstruction of accountability through cover-ups and manipulation");
    }
    
    return factors.length > 0 ? factors.join('; ') : "Assessment completed - review dimension scores for detailed risk analysis.";
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
    const formData = new FormData(document.getElementById('ems-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    data.ems_total = parseInt(document.getElementById('ems-total').textContent);
    data.cruelty_total = parseInt(document.getElementById('cruelty-total').textContent);
    data.systemic_total = parseInt(document.getElementById('systemic-total').textContent);
    data.scale_total = parseInt(document.getElementById('scale-total').textContent);
    data.resistance_total = parseInt(document.getElementById('resistance-total').textContent);
    data.assessment_timestamp = new Date().toISOString();
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${data.executive_name || 'executive'}-ems-assessment.json`;
    a.click();
    URL.revokeObjectURL(url);
  });
  
  // Save draft functionality
  document.getElementById('save-draft').addEventListener('click', function() {
    const formData = new FormData(document.getElementById('ems-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    localStorage.setItem('ems-draft', JSON.stringify(data));
    alert('Draft saved locally!');
  });
  
  // Load draft if exists
  const savedDraft = localStorage.getItem('ems-draft');
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

1. **Research the Executive**: Gather comprehensive information about their career and decisions
2. **Document Evidence**: Collect credible sources for each scoring dimension
3. **Score Systematically**: Assign points based on severity and scale of personal involvement
4. **Review for Accuracy**: Ensure scores reflect documented evidence
5. **Generate Assessment**: Create a comprehensive accountability report
6. **Submit or Archive**: Either submit for publication or save for future reference

## Scoring Guidelines

### Personal Cruelty (0-375 each subfactor)
- **0-75 points**: Minor insensitivity or occasional callousness
- **76-150 points**: Pattern of disregard with documented incidents
- **151-225 points**: Systemic cruelty with substantial evidence
- **226-300 points**: Extreme cruelty with overwhelming documentation
- **301-375 points**: Sadistic behavior representing maximum personal evil

### Systemic Evil (0-375 each subfactor)
- **0-75 points**: Minor contribution to harmful systems
- **76-150 points**: Active participation in exploitative models
- **151-225 points**: Key architect of harmful business practices
- **226-300 points**: Primary designer of systematic exploitation
- **301-375 points**: Mastermind of institutionalized evil

### Scale of Harm (0-250 each subfactor)
- **0-50 points**: Limited local impact
- **51-100 points**: Regional impact affecting thousands
- **101-150 points**: National impact affecting hundreds of thousands
- **151-200 points**: Global impact affecting millions
- **201-250 points**: Generational impact affecting future populations

### Resistance to Accountability (0-250 each subfactor)
- **0-50 points**: Standard corporate legal defense
- **51-100 points**: Active obstruction of oversight
- **101-150 points**: Systematic cover-up operations
- **151-200 points**: Corruption of legal/regulatory systems
- **201-250 points**: Criminal obstruction and witness intimidation

## Related Tools

- [Evaluate Company](/evaluate-company/) - Corporate Evil Index (CEI)
- [Evaluate Institution](/evaluate-institution/) - Institutional Corruption Framework (ICF)
- [Evaluate Product](/evaluate-product/) - Devil's Metrics for harmful products
- [Metrics Dashboard](/metrics-dashboard/) - View all scoring frameworks
- [Methodology Documentation](/docs/comprehensive-metrics-methodology/) - Complete framework details