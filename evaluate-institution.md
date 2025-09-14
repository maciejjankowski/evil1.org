---
layout: default
title: "Evaluate Institution - Institutional Corruption Framework Assessment"
description: "Systematic evaluation tool for assessing institutional corruption using the ICF framework"
permalink: /evaluate-institution/
---

# Institutional Corruption Framework (ICF) Evaluation

Use this comprehensive form to evaluate an institution using our standardized Institutional Corruption Framework. The ICF measures institutional betrayal of public trust across 4 dimensions with a maximum score of 8,000 points.

<div class="evaluation-container">
  <form id="icf-evaluation-form" class="evaluation-form">
    <div class="form-section">
      <h2>Institution Information</h2>
      <div class="input-group">
        <label for="institution-name">Institution Name *</label>
        <input type="text" id="institution-name" name="institution_name" required>
      </div>
      
      <div class="input-group">
        <label for="institution-type">Institution Type</label>
        <select id="institution-type" name="institution_type">
          <option value="">Select Type</option>
          <option value="regulatory">Regulatory Agency</option>
          <option value="government">Government Department</option>
          <option value="judicial">Judicial Body</option>
          <option value="legislative">Legislative Body</option>
          <option value="law-enforcement">Law Enforcement</option>
          <option value="healthcare">Healthcare System</option>
          <option value="education">Educational Institution</option>
          <option value="financial">Financial Regulator</option>
          <option value="environmental">Environmental Agency</option>
          <option value="international">International Organization</option>
          <option value="ngo">Non-Governmental Organization</option>
          <option value="other">Other</option>
        </select>
      </div>
      
      <div class="input-group">
        <label for="jurisdiction">Jurisdiction/Country</label>
        <input type="text" id="jurisdiction" name="jurisdiction" placeholder="e.g., United States, European Union, Global">
      </div>
      
      <div class="input-group">
        <label for="primary-mandate">Primary Mandate/Purpose</label>
        <textarea id="primary-mandate" name="primary_mandate" placeholder="Describe the institution's supposed purpose and public mandate..."></textarea>
      </div>
      
      <div class="input-group">
        <label for="key-officials">Key Officials/Leadership</label>
        <textarea id="key-officials" name="key_officials" placeholder="List current and relevant former leadership..."></textarea>
      </div>
    </div>

    <div class="form-section">
      <h2>Regulatory Capture Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Industry influence over regulatory processes</p>
      
      <div class="scoring-subsection">
        <h3>Revolving Door Employment Patterns</h3>
        <div class="score-input">
          <label for="revolving-door">Score (0-500):</label>
          <input type="number" id="revolving-door" name="revolving_door" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="revolving-evidence">Evidence & Sources:</label>
            <textarea id="revolving-evidence" name="revolving_evidence" placeholder="Document officials moving between industry and regulatory roles, job promises, consulting contracts..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Industry Funding & Undue Influence</h3>
        <div class="score-input">
          <label for="industry-funding">Score (0-500):</label>
          <input type="number" id="industry-funding" name="industry_funding" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="funding-evidence">Evidence & Sources:</label>
            <textarea id="funding-evidence" name="funding_evidence" placeholder="Industry funding, sponsored research, lobbying expenditures, gifts to officials..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Weak Enforcement & Selective Prosecution</h3>
        <div class="score-input">
          <label for="weak-enforcement">Score (0-500):</label>
          <input type="number" id="weak-enforcement" name="weak_enforcement" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="enforcement-evidence">Evidence & Sources:</label>
            <textarea id="enforcement-evidence" name="enforcement_evidence" placeholder="Declined prosecutions, minimal fines, settlement patterns, enforcement statistics..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Policy Writing by Regulated Industries</h3>
        <div class="score-input">
          <label for="industry-policy">Score (0-500):</label>
          <input type="number" id="industry-policy" name="industry_policy" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="policy-evidence">Evidence & Sources:</label>
            <textarea id="policy-evidence" name="policy_evidence" placeholder="Industry-drafted regulations, copy-paste legislation, policy consultation patterns..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Regulatory Capture Total: <span id="capture-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Public Interest Betrayal Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Prioritizing private interests over public good</p>
      
      <div class="scoring-subsection">
        <h3>Conflicts of Interest in Decision-Making</h3>
        <div class="score-input">
          <label for="conflicts-interest">Score (0-500):</label>
          <input type="number" id="conflicts-interest" name="conflicts_interest" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="conflicts-evidence">Evidence & Sources:</label>
            <textarea id="conflicts-evidence" name="conflicts_evidence" placeholder="Financial conflicts, family connections, undisclosed relationships, recusal failures..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Transparency Failures & Unnecessary Secrecy</h3>
        <div class="score-input">
          <label for="transparency-failures">Score (0-500):</label>
          <input type="number" id="transparency-failures" name="transparency_failures" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="transparency-evidence">Evidence & Sources:</label>
            <textarea id="transparency-evidence" name="transparency_evidence" placeholder="FOIA denials, classification abuse, closed meetings, data hiding..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Public Resource Misallocation & Waste</h3>
        <div class="score-input">
          <label for="resource-misallocation">Score (0-500):</label>
          <input type="number" id="resource-misallocation" name="resource_misallocation" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="resource-evidence">Evidence & Sources:</label>
            <textarea id="resource-evidence" name="resource_evidence" placeholder="Budget misuse, wasteful spending, resource diversion, procurement fraud..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Corruption & Bribery Scandals</h3>
        <div class="score-input">
          <label for="corruption-scandals">Score (0-500):</label>
          <input type="number" id="corruption-scandals" name="corruption_scandals" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="corruption-evidence">Evidence & Sources:</label>
            <textarea id="corruption-evidence" name="corruption_evidence" placeholder="Bribery cases, kickback schemes, embezzlement, pay-to-play arrangements..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Public Interest Betrayal Total: <span id="betrayal-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Systemic Bias Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Discrimination and inequality perpetuation</p>
      
      <div class="scoring-subsection">
        <h3>Racial & Ethnic Discrimination</h3>
        <div class="score-input">
          <label for="racial-discrimination">Score (0-500):</label>
          <input type="number" id="racial-discrimination" name="racial_discrimination" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="racial-evidence">Evidence & Sources:</label>
            <textarea id="racial-evidence" name="racial_evidence" placeholder="Discriminatory enforcement, racial profiling, biased hiring, unequal service delivery..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Economic Class Bias in Policy Implementation</h3>
        <div class="score-input">
          <label for="class-bias">Score (0-500):</label>
          <input type="number" id="class-bias" name="class_bias" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="class-evidence">Evidence & Sources:</label>
            <textarea id="class-evidence" name="class_evidence" placeholder="Lenient treatment of wealthy, harsh treatment of poor, regressive policies..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Gender & LGBTQ+ Discrimination</h3>
        <div class="score-input">
          <label for="gender-discrimination">Score (0-500):</label>
          <input type="number" id="gender-discrimination" name="gender_discrimination" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="gender-evidence">Evidence & Sources:</label>
            <textarea id="gender-evidence" name="gender_evidence" placeholder="Gender bias in enforcement, discriminatory policies, harassment toleration..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Geographic & Regional Favoritism</h3>
        <div class="score-input">
          <label for="geographic-bias">Score (0-500):</label>
          <input type="number" id="geographic-bias" name="geographic_bias" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="geographic-evidence">Evidence & Sources:</label>
            <textarea id="geographic-evidence" name="geographic_evidence" placeholder="Urban vs rural bias, regional resource allocation, political favoritism..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Systemic Bias Total: <span id="bias-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Democratic Erosion Assessment (0-2,000 points)</h2>
      <p class="dimension-description">Undermining democratic processes and institutions</p>
      
      <div class="scoring-subsection">
        <h3>Voter Suppression & Election Manipulation</h3>
        <div class="score-input">
          <label for="voter-suppression">Score (0-500):</label>
          <input type="number" id="voter-suppression" name="voter_suppression" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="voter-evidence">Evidence & Sources:</label>
            <textarea id="voter-evidence" name="voter_evidence" placeholder="Voting restrictions, poll closures, registration barriers, gerrymandering..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Free Speech & Press Freedom Violations</h3>
        <div class="score-input">
          <label for="speech-violations">Score (0-500):</label>
          <input type="number" id="speech-violations" name="speech_violations" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="speech-evidence">Evidence & Sources:</label>
            <textarea id="speech-evidence" name="speech_evidence" placeholder="Journalist harassment, protest suppression, censorship, whistleblower persecution..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Political Weaponization of Institutions</h3>
        <div class="score-input">
          <label for="weaponization">Score (0-500):</label>
          <input type="number" id="weaponization" name="weaponization" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="weaponization-evidence">Evidence & Sources:</label>
            <textarea id="weaponization-evidence" name="weaponization_evidence" placeholder="Partisan enforcement, political prosecutions, institutional abuse for party goals..."></textarea>
          </div>
        </div>
      </div>

      <div class="scoring-subsection">
        <h3>Authoritarianism & Power Consolidation</h3>
        <div class="score-input">
          <label for="authoritarianism">Score (0-500):</label>
          <input type="number" id="authoritarianism" name="authoritarianism" min="0" max="500" value="0">
          <div class="evidence-input">
            <label for="authoritarian-evidence">Evidence & Sources:</label>
            <textarea id="authoritarian-evidence" name="authoritarian_evidence" placeholder="Power grabs, checks and balances erosion, surveillance expansion, civil liberties violations..."></textarea>
          </div>
        </div>
      </div>

      <div class="dimension-total">
        <strong>Democratic Erosion Total: <span id="erosion-total">0</span>/2000</strong>
      </div>
    </div>

    <div class="form-section">
      <h2>Assessment Summary</h2>
      <div class="total-score">
        <h3>Institutional Corruption Framework (ICF) Total: <span id="icf-total">0</span>/8,000</h3>
        <div class="score-breakdown">
          <div>Regulatory Capture: <span id="final-capture">0</span>/2000</div>
          <div>Public Interest Betrayal: <span id="final-betrayal">0</span>/2000</div>
          <div>Systemic Bias: <span id="final-bias">0</span>/2000</div>
          <div>Democratic Erosion: <span id="final-erosion">0</span>/2000</div>
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
  <h2>Institutional Corruption Framework Assessment Report</h2>
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
  cursor: cursor;
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
    // Regulatory Capture calculation
    const captureInputs = ['revolving-door', 'industry-funding', 'weak-enforcement', 'industry-policy'];
    const captureTotal = captureInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('capture-total').textContent = captureTotal;
    document.getElementById('final-capture').textContent = captureTotal;
    
    // Public Interest Betrayal calculation
    const betrayalInputs = ['conflicts-interest', 'transparency-failures', 'resource-misallocation', 'corruption-scandals'];
    const betrayalTotal = betrayalInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('betrayal-total').textContent = betrayalTotal;
    document.getElementById('final-betrayal').textContent = betrayalTotal;
    
    // Systemic Bias calculation
    const biasInputs = ['racial-discrimination', 'class-bias', 'gender-discrimination', 'geographic-bias'];
    const biasTotal = biasInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('bias-total').textContent = biasTotal;
    document.getElementById('final-bias').textContent = biasTotal;
    
    // Democratic Erosion calculation
    const erosionInputs = ['voter-suppression', 'speech-violations', 'weaponization', 'authoritarianism'];
    const erosionTotal = erosionInputs.reduce((sum, id) => sum + parseInt(document.getElementById(id).value || 0), 0);
    document.getElementById('erosion-total').textContent = erosionTotal;
    document.getElementById('final-erosion').textContent = erosionTotal;
    
    // ICF Total
    const icfTotal = captureTotal + betrayalTotal + biasTotal + erosionTotal;
    document.getElementById('icf-total').textContent = icfTotal;
  }
  
  // Set current date
  document.getElementById('assessment-date').value = new Date().toISOString().split('T')[0];
  
  // Generate report functionality
  document.getElementById('generate-report').addEventListener('click', function() {
    calculateTotals();
    generateReport();
  });
  
  function generateReport() {
    const formData = new FormData(document.getElementById('icf-evaluation-form'));
    const institutionName = formData.get('institution_name') || 'Unknown Institution';
    const institutionType = formData.get('institution_type') || 'Unknown Type';
    const jurisdiction = formData.get('jurisdiction') || 'Unknown Jurisdiction';
    const assessorName = formData.get('assessor_name') || 'Anonymous';
    const assessmentDate = formData.get('assessment_date') || new Date().toISOString().split('T')[0];
    
    const captureTotal = parseInt(document.getElementById('capture-total').textContent);
    const betrayalTotal = parseInt(document.getElementById('betrayal-total').textContent);
    const biasTotal = parseInt(document.getElementById('bias-total').textContent);
    const erosionTotal = parseInt(document.getElementById('erosion-total').textContent);
    const icfTotal = parseInt(document.getElementById('icf-total').textContent);
    
    const reportContent = `
      <h3>${institutionName} - Institutional Corruption Framework Assessment</h3>
      <p><strong>Type:</strong> ${institutionType}</p>
      <p><strong>Jurisdiction:</strong> ${jurisdiction}</p>
      <p><strong>Assessed by:</strong> ${assessorName}</p>
      <p><strong>Assessment Date:</strong> ${assessmentDate}</p>
      
      <h4>ICF Score: ${icfTotal}/8,000</h4>
      
      <h4>Dimension Breakdown:</h4>
      <ul>
        <li><strong>Regulatory Capture:</strong> ${captureTotal}/2,000 points</li>
        <li><strong>Public Interest Betrayal:</strong> ${betrayalTotal}/2,000 points</li>
        <li><strong>Systemic Bias:</strong> ${biasTotal}/2,000 points</li>
        <li><strong>Democratic Erosion:</strong> ${erosionTotal}/2,000 points</li>
      </ul>
      
      <h4>Corruption Assessment:</h4>
      <p>${getICFSeverityAssessment(icfTotal)}</p>
      
      <h4>Primary Corruption Vectors:</h4>
      <p>${getPrimaryCorruptionVectors(formData)}</p>
      
      <p><em>Assessment conducted using the Institutional Corruption Framework (ICF) from evil1.org</em></p>
    `;
    
    document.getElementById('report-content').innerHTML = reportContent;
    document.getElementById('assessment-report').style.display = 'block';
  }
  
  function getICFSeverityAssessment(score) {
    if (score >= 6401) return "Complete institutional capture - this institution represents a democratic threat requiring immediate reform or dissolution.";
    if (score >= 4801) return "Severe institutional corruption requiring comprehensive reform and leadership replacement.";
    if (score >= 3201) return "Significant betrayal of public trust requiring major accountability measures.";
    if (score >= 1601) return "Concerning regulatory capture and bias requiring enhanced oversight.";
    return "Normal institutional challenges with room for improvement in transparency and accountability.";
  }
  
  function getPrimaryCorruptionVectors(formData) {
    const vectors = [];
    
    if (parseInt(document.getElementById('capture-total').textContent) > 1200) {
      vectors.push("Severe regulatory capture by industry interests");
    }
    if (parseInt(document.getElementById('betrayal-total').textContent) > 1200) {
      vectors.push("Systematic betrayal of public interest and trust");
    }
    if (parseInt(document.getElementById('bias-total').textContent) > 1200) {
      vectors.push("Institutionalized discrimination and systemic bias");
    }
    if (parseInt(document.getElementById('erosion-total').textContent) > 1200) {
      vectors.push("Active undermining of democratic processes and institutions");
    }
    
    return vectors.length > 0 ? vectors.join('; ') : "Assessment completed - review dimension scores for detailed corruption analysis.";
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
    const formData = new FormData(document.getElementById('icf-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    data.icf_total = parseInt(document.getElementById('icf-total').textContent);
    data.capture_total = parseInt(document.getElementById('capture-total').textContent);
    data.betrayal_total = parseInt(document.getElementById('betrayal-total').textContent);
    data.bias_total = parseInt(document.getElementById('bias-total').textContent);
    data.erosion_total = parseInt(document.getElementById('erosion-total').textContent);
    data.assessment_timestamp = new Date().toISOString();
    
    const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
    const url = URL.createObjectURL(blob);
    const a = document.createElement('a');
    a.href = url;
    a.download = `${data.institution_name || 'institution'}-icf-assessment.json`;
    a.click();
    URL.revokeObjectURL(url);
  });
  
  // Save draft functionality
  document.getElementById('save-draft').addEventListener('click', function() {
    const formData = new FormData(document.getElementById('icf-evaluation-form'));
    const data = {};
    
    for (let [key, value] of formData.entries()) {
      data[key] = value;
    }
    
    localStorage.setItem('icf-draft', JSON.stringify(data));
    alert('Draft saved locally!');
  });
  
  // Load draft if exists
  const savedDraft = localStorage.getItem('icf-draft');
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

1. **Institutional Research**: Thoroughly investigate the institution's practices and policies
2. **Evidence Collection**: Gather credible sources documenting corruption and bias
3. **Systematic Assessment**: Score each dimension based on documented evidence
4. **Historical Analysis**: Consider patterns over time, not just recent events
5. **Generate Report**: Create comprehensive institutional accountability assessment
6. **Submit or Archive**: Either submit for publication or save for future reference

## Scoring Guidelines

### Regulatory Capture (0-500 each subfactor)
- **0-100 points**: Minor industry influence within normal bounds
- **101-200 points**: Concerning patterns of industry favoritism
- **201-300 points**: Significant capture with documented bias
- **301-400 points**: Severe regulatory capture undermining mandate
- **401-500 points**: Complete industry control of regulatory process

### Public Interest Betrayal (0-500 each subfactor)
- **0-100 points**: Standard bureaucratic inefficiencies
- **101-200 points**: Concerning conflicts and secrecy
- **201-300 points**: Significant betrayal of public trust
- **301-400 points**: Systematic corruption and self-dealing
- **401-500 points**: Complete abandonment of public interest

### Systemic Bias (0-500 each subfactor)
- **0-100 points**: Minor disparities in treatment
- **101-200 points**: Concerning patterns of discrimination
- **201-300 points**: Significant institutional bias
- **301-400 points**: Systematic discrimination with broad impact
- **401-500 points**: Institutional racism/classism/discrimination as policy

### Democratic Erosion (0-500 each subfactor)
- **0-100 points**: Minor democratic deficiencies
- **101-200 points**: Concerning authoritarian tendencies
- **201-300 points**: Significant democratic backsliding
- **301-400 points**: Systematic assault on democratic norms
- **401-500 points**: Authoritarian capture of democratic institutions

## Related Tools

- [Evaluate Company](/evaluate-company/) - Corporate Evil Index (CEI)
- [Evaluate Executive](/evaluate-executive/) - Executive Malevolence Score (EMS)
- [Evaluate Product](/evaluate-product/) - Devil's Metrics for harmful products
- [Metrics Dashboard](/metrics-dashboard/) - View all scoring frameworks
- [Methodology Documentation](/docs/comprehensive-metrics-methodology/) - Complete framework details