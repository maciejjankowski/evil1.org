---
layout: default
title: "CEAT Assessment - Discover Your Corporate Evil Archetype"
permalink: "/assessment/"
description: "Take the Corporate Evil Assessment Tool to discover your executive archetype and maximize your potential for systematic exploitation."
---

<div class="assessment-container">
  <div class="assessment-header">
    <h1>Corporate Evil Assessment Tool (CEAT)™</h1>
    <p class="tagline">Discover Your Executive Archetype and Unlock Your Potential for Systematic Exploitation</p>
  </div>

  <div id="assessment-intro" class="assessment-section">
    <div class="intro-content">
      <h2>Welcome to Your Professional Development Journey</h2>
      <p>The Corporate Evil Assessment Tool represents decades of research into executive psychology, profit maximization strategies, and systematic exploitation methodologies. Our scientifically-validated assessment will identify your unique corporate archetype and provide personalized recommendations for advancing your career in value extraction.</p>
      
      <div class="methodology-box">
        <h3>Assessment Methodology</h3>
        <p>Our comprehensive evaluation measures five critical dimensions of corporate evil:</p>
        <ul>
          <li><strong>Profit Extraction</strong> - Your ability to maximize profits regardless of human, social, or environmental costs</li>
          <li><strong>Moral Flexibility</strong> - Your capacity to abandon ethical principles when profit opportunities arise</li>
          <li><strong>Regulatory Capture</strong> - Your skill in corrupting public institutions for private gain</li>
          <li><strong>Stakeholder Manipulation</strong> - Your expertise in deceiving workers, customers, and the public</li>
          <li><strong>Systemic Exploitation</strong> - Your ability to design and implement systems of mass exploitation</li>
        </ul>
      </div>
      
      <div class="assessment-details">
        <h3>What You'll Discover</h3>
        <ul>
          <li>Your personalized Corporate Evil Archetype</li>
          <li>Detailed analysis of your exploitation strengths</li>
          <li>Career compatibility recommendations</li>
          <li>Professional development suggestions</li>
          <li>Networking guidance for maximum value extraction</li>
        </ul>
      </div>
      
      <div class="disclaimer">
        <p><em>This assessment takes approximately 10-15 minutes and consists of scenario-based questions designed to reveal your authentic corporate evil potential. All responses are completely confidential and used only to generate your personalized archetype profile.</em></p>
      </div>
      
      <button id="start-assessment" class="cta-button">Begin Assessment</button>
    </div>
  </div>

  <div id="assessment-quiz" class="assessment-section" style="display: none;">
    <div class="progress-container">
      <div class="progress-bar">
        <div id="progress-fill" class="progress-fill"></div>
      </div>
      <span id="progress-text" class="progress-text">Question 1 of 10</span>
    </div>
    
    <div id="question-container" class="question-container">
      <!-- Questions will be dynamically loaded here -->
    </div>
    
    <div class="navigation-buttons">
      <button id="prev-question" class="nav-button" style="display: none;">Previous</button>
      <button id="next-question" class="nav-button">Next</button>
      <button id="submit-assessment" class="cta-button" style="display: none;">Get My Results</button>
    </div>
  </div>

  <div id="assessment-results" class="assessment-section" style="display: none;">
    <div id="results-content">
      <!-- Results will be dynamically generated here -->
    </div>
  </div>
</div>

<style>
.assessment-container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  font-family: 'Arial', sans-serif;
}

.assessment-header {
  text-align: center;
  margin-bottom: 40px;
  padding: 30px;
  background: linear-gradient(135deg, #1a1a2e, #16213e);
  color: #fff;
  border-radius: 10px;
}

.assessment-header h1 {
  font-size: 2.5em;
  margin-bottom: 10px;
  color: #ffd700;
}

.tagline {
  font-size: 1.2em;
  color: #ccc;
  font-style: italic;
}

.assessment-section {
  background: #f8f9fa;
  border-radius: 10px;
  padding: 30px;
  margin-bottom: 20px;
  box-shadow: 0 4px 6px rgba(0,0,0,0.1);
}

.intro-content h2 {
  color: #1a1a2e;
  margin-bottom: 20px;
}

.methodology-box, .assessment-details {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  margin: 20px 0;
  border-left: 4px solid #dc3545;
}

.methodology-box h3, .assessment-details h3 {
  color: #dc3545;
  margin-bottom: 15px;
}

.methodology-box ul, .assessment-details ul {
  margin-left: 20px;
}

.methodology-box li, .assessment-details li {
  margin-bottom: 8px;
  line-height: 1.5;
}

.disclaimer {
  background: #e9ecef;
  padding: 15px;
  border-radius: 5px;
  font-size: 0.9em;
  color: #6c757d;
  margin: 20px 0;
}

.cta-button {
  background: linear-gradient(135deg, #dc3545, #c82333);
  color: #fff;
  border: none;
  padding: 15px 30px;
  font-size: 1.1em;
  font-weight: bold;
  border-radius: 25px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: block;
  margin: 30px auto;
}

.cta-button:hover {
  background: linear-gradient(135deg, #c82333, #a71e2a);
  transform: translateY(-2px);
  box-shadow: 0 4px 15px rgba(220, 53, 69, 0.4);
}

.progress-container {
  margin-bottom: 30px;
}

.progress-bar {
  width: 100%;
  height: 8px;
  background: #e9ecef;
  border-radius: 4px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  background: linear-gradient(90deg, #28a745, #20c997);
  border-radius: 4px;
  transition: width 0.3s ease;
  width: 0%;
}

.progress-text {
  display: block;
  text-align: center;
  margin-top: 10px;
  color: #6c757d;
  font-weight: bold;
}

.question-container {
  margin-bottom: 30px;
}

.question {
  background: #fff;
  padding: 25px;
  border-radius: 8px;
  border-left: 4px solid #007bff;
}

.question-text {
  font-size: 1.1em;
  font-weight: bold;
  margin-bottom: 20px;
  color: #1a1a2e;
  line-height: 1.4;
}

.answer-option {
  background: #f8f9fa;
  border: 2px solid #e9ecef;
  border-radius: 8px;
  padding: 15px;
  margin-bottom: 10px;
  cursor: pointer;
  transition: all 0.3s ease;
}

.answer-option:hover {
  background: #e9ecef;
  border-color: #007bff;
}

.answer-option.selected {
  background: #007bff;
  color: #fff;
  border-color: #0056b3;
}

.navigation-buttons {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.nav-button {
  background: #6c757d;
  color: #fff;
  border: none;
  padding: 10px 20px;
  border-radius: 5px;
  cursor: pointer;
  transition: background 0.3s ease;
}

.nav-button:hover {
  background: #5a6268;
}

.nav-button:disabled {
  background: #adb5bd;
  cursor: not-allowed;
}

.results-header {
  text-align: center;
  margin-bottom: 30px;
}

.archetype-card {
  background: #fff;
  border-radius: 10px;
  padding: 30px;
  margin-bottom: 30px;
  border-left: 6px solid #dc3545;
  box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.archetype-name {
  font-size: 2em;
  color: #dc3545;
  margin-bottom: 10px;
  text-align: center;
}

.archetype-description {
  font-size: 1.1em;
  color: #6c757d;
  text-align: center;
  margin-bottom: 20px;
  font-style: italic;
}

.dimension-scores {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
  gap: 15px;
  margin-bottom: 30px;
}

.dimension-score {
  background: #f8f9fa;
  padding: 15px;
  border-radius: 8px;
  text-align: center;
}

.dimension-name {
  font-weight: bold;
  color: #1a1a2e;
  margin-bottom: 5px;
}

.dimension-value {
  font-size: 1.5em;
  color: #dc3545;
  font-weight: bold;
}

.traits-section, .careers-section {
  background: #fff;
  padding: 20px;
  border-radius: 8px;
  margin-bottom: 20px;
}

.traits-section h3, .careers-section h3 {
  color: #1a1a2e;
  margin-bottom: 15px;
}

.trait-list {
  list-style: none;
  padding-left: 0;
}

.trait-list li {
  background: #e9ecef;
  padding: 8px 12px;
  margin-bottom: 5px;
  border-radius: 5px;
  border-left: 3px solid #dc3545;
}

.career-category {
  margin-bottom: 15px;
}

.career-category h4 {
  color: #007bff;
  margin-bottom: 8px;
}

.career-list {
  display: flex;
  flex-wrap: wrap;
  gap: 8px;
}

.career-tag {
  background: #007bff;
  color: #fff;
  padding: 4px 8px;
  border-radius: 15px;
  font-size: 0.85em;
}

.share-results {
  text-align: center;
  margin-top: 30px;
  padding: 20px;
  background: #e9ecef;
  border-radius: 8px;
}

@media (max-width: 768px) {
  .assessment-container {
    padding: 15px;
  }
  
  .assessment-header h1 {
    font-size: 2em;
  }
  
  .tagline {
    font-size: 1em;
  }
  
  .navigation-buttons {
    flex-direction: column;
    gap: 10px;
  }
  
  .dimension-scores {
    grid-template-columns: 1fr;
  }
}
</style>

<script>
// Assessment data and logic
let assessmentData = null;
let currentQuestionIndex = 0;
let userAnswers = {};
let selectedQuestions = [];

// Load assessment data from Jekyll data
{% assign assessment = site.data.ceat-assessment %}
assessmentData = {{ assessment | jsonify }};

// Initialize assessment
document.addEventListener('DOMContentLoaded', function() {
  const startButton = document.getElementById('start-assessment');
  startButton.addEventListener('click', startAssessment);
  
  const nextButton = document.getElementById('next-question');
  const prevButton = document.getElementById('prev-question');
  const submitButton = document.getElementById('submit-assessment');
  
  nextButton.addEventListener('click', nextQuestion);
  prevButton.addEventListener('click', prevQuestion);
  submitButton.addEventListener('click', calculateResults);
});

function startAssessment() {
  // Select a subset of questions for the assessment (2 from each dimension)
  selectedQuestions = selectQuestions();
  currentQuestionIndex = 0;
  userAnswers = {};
  
  document.getElementById('assessment-intro').style.display = 'none';
  document.getElementById('assessment-quiz').style.display = 'block';
  
  displayQuestion();
}

function selectQuestions() {
  const questions = assessmentData.questions;
  const questionsByDimension = {};
  
  // Group questions by dimension
  questions.forEach(q => {
    if (!questionsByDimension[q.dimension]) {
      questionsByDimension[q.dimension] = [];
    }
    questionsByDimension[q.dimension].push(q);
  });
  
  // Select 2 questions from each dimension
  const selected = [];
  Object.keys(questionsByDimension).forEach(dimension => {
    const dimensionQuestions = questionsByDimension[dimension];
    // Shuffle and take first 2
    const shuffled = dimensionQuestions.sort(() => 0.5 - Math.random());
    selected.push(...shuffled.slice(0, 2));
  });
  
  // Shuffle the final selection
  return selected.sort(() => 0.5 - Math.random());
}

function displayQuestion() {
  const question = selectedQuestions[currentQuestionIndex];
  const container = document.getElementById('question-container');
  
  let html = `
    <div class="question">
      <div class="question-text">${question.text}</div>
      <div class="answers">
  `;
  
  question.answers.forEach((answer, index) => {
    const isSelected = userAnswers[question.id] === index;
    html += `
      <div class="answer-option ${isSelected ? 'selected' : ''}" 
           onclick="selectAnswer('${question.id}', ${index})">
        ${answer.text}
      </div>
    `;
  });
  
  html += `
      </div>
    </div>
  `;
  
  container.innerHTML = html;
  
  // Update progress
  const progress = ((currentQuestionIndex + 1) / selectedQuestions.length) * 100;
  document.getElementById('progress-fill').style.width = progress + '%';
  document.getElementById('progress-text').textContent = 
    `Question ${currentQuestionIndex + 1} of ${selectedQuestions.length}`;
  
  // Update navigation buttons
  document.getElementById('prev-question').style.display = 
    currentQuestionIndex > 0 ? 'block' : 'none';
  document.getElementById('next-question').style.display = 
    currentQuestionIndex < selectedQuestions.length - 1 ? 'block' : 'none';
  document.getElementById('submit-assessment').style.display = 
    currentQuestionIndex === selectedQuestions.length - 1 && userAnswers[question.id] !== undefined ? 'block' : 'none';
}

function selectAnswer(questionId, answerIndex) {
  userAnswers[questionId] = answerIndex;
  
  // Update UI
  const answerOptions = document.querySelectorAll('.answer-option');
  answerOptions.forEach((option, index) => {
    option.classList.toggle('selected', index === answerIndex);
  });
  
  // Show appropriate navigation button
  const currentQuestion = selectedQuestions[currentQuestionIndex];
  if (currentQuestionIndex === selectedQuestions.length - 1) {
    document.getElementById('submit-assessment').style.display = 'block';
  } else {
    document.getElementById('next-question').style.display = 'block';
  }
}

function nextQuestion() {
  if (currentQuestionIndex < selectedQuestions.length - 1) {
    currentQuestionIndex++;
    displayQuestion();
  }
}

function prevQuestion() {
  if (currentQuestionIndex > 0) {
    currentQuestionIndex--;
    displayQuestion();
  }
}

function calculateResults() {
  // Calculate dimension scores
  const dimensionScores = {};
  const dimensions = assessmentData.dimensions;
  
  dimensions.forEach(dim => {
    dimensionScores[dim.id] = {
      name: dim.name,
      score: 0,
      weight: dim.weight,
      count: 0
    };
  });
  
  // Process answers
  selectedQuestions.forEach(question => {
    if (userAnswers[question.id] !== undefined) {
      const answer = question.answers[userAnswers[question.id]];
      dimensionScores[question.dimension].score += answer.score;
      dimensionScores[question.dimension].count++;
    }
  });
  
  // Calculate average scores for each dimension
  Object.keys(dimensionScores).forEach(dim => {
    if (dimensionScores[dim].count > 0) {
      dimensionScores[dim].score = Math.round(dimensionScores[dim].score / dimensionScores[dim].count);
    }
  });
  
  // Calculate overall score
  let totalScore = 0;
  let totalWeight = 0;
  Object.keys(dimensionScores).forEach(dim => {
    totalScore += dimensionScores[dim].score * dimensionScores[dim].weight;
    totalWeight += dimensionScores[dim].weight;
  });
  const overallScore = Math.round(totalScore / totalWeight);
  
  // Determine archetype
  const archetype = determineArchetype(overallScore, dimensionScores);
  
  // Display results
  displayResults(archetype, dimensionScores, overallScore);
}

function determineArchetype(overallScore, dimensionScores) {
  const archetypes = assessmentData.archetypes;
  
  // Find best matching archetype
  let bestMatch = archetypes[0];
  let bestScore = -1;
  
  archetypes.forEach(archetype => {
    // Check if overall score is in range
    if (overallScore >= archetype.score_range[0] && overallScore <= archetype.score_range[1]) {
      // Calculate fit based on dominant dimensions
      let fit = 0;
      archetype.dominant_dimensions.forEach(dim => {
        if (dimensionScores[dim]) {
          fit += dimensionScores[dim].score;
        }
      });
      
      if (fit > bestScore) {
        bestScore = fit;
        bestMatch = archetype;
      }
    }
  });
  
  return bestMatch;
}

function displayResults(archetype, dimensionScores, overallScore) {
  document.getElementById('assessment-quiz').style.display = 'none';
  document.getElementById('assessment-results').style.display = 'block';
  
  let html = `
    <div class="results-header">
      <h1>Your Corporate Evil Assessment Results</h1>
      <p>Based on your responses, we've identified your unique executive archetype and development opportunities.</p>
    </div>
    
    <div class="archetype-card">
      <div class="archetype-name">${archetype.name}</div>
      <div class="archetype-description">${archetype.description}</div>
      <div class="overall-score">
        <h3>Overall Evil Score: ${overallScore}/100</h3>
      </div>
    </div>
    
    <div class="dimension-scores">
  `;
  
  Object.keys(dimensionScores).forEach(dim => {
    const score = dimensionScores[dim];
    html += `
      <div class="dimension-score">
        <div class="dimension-name">${score.name}</div>
        <div class="dimension-value">${score.score}</div>
      </div>
    `;
  });
  
  html += `
    </div>
    
    <div class="traits-section">
      <h3>Your Dominant Traits</h3>
      <ul class="trait-list">
  `;
  
  archetype.traits.forEach(trait => {
    html += `<li>${trait}</li>`;
  });
  
  html += `
      </ul>
    </div>
    
    <div class="careers-section">
      <h3>Career Compatibility</h3>
      <div class="career-category">
        <h4>Highly Compatible Roles</h4>
        <div class="career-list">
  `;
  
  archetype.career_matches.high.forEach(career => {
    html += `<span class="career-tag">${career}</span>`;
  });
  
  html += `
        </div>
      </div>
      <div class="career-category">
        <h4>Moderately Compatible Roles</h4>
        <div class="career-list">
  `;
  
  archetype.career_matches.medium.forEach(career => {
    html += `<span class="career-tag">${career}</span>`;
  });
  
  html += `
        </div>
      </div>
      <div class="career-category">
        <h4>Avoid These Roles</h4>
        <div class="career-list">
  `;
  
  archetype.career_matches.low.forEach(career => {
    html += `<span class="career-tag" style="background: #dc3545;">${career}</span>`;
  });
  
  html += `
        </div>
      </div>
    </div>
    
    <div class="share-results">
      <h3>Share Your Results</h3>
      <p>Discovered your corporate evil archetype? Share your results and help others maximize their exploitation potential!</p>
      <button onclick="shareResults()" class="cta-button">Share Results</button>
      <button onclick="retakeAssessment()" class="nav-button" style="margin-left: 10px;">Retake Assessment</button>
    </div>
  `;
  
  document.getElementById('results-content').innerHTML = html;
}

function shareResults() {
  const text = "I just discovered my Corporate Evil Archetype! Take the CEAT assessment to find yours.";
  const url = window.location.href;
  
  if (navigator.share) {
    navigator.share({
      title: 'Corporate Evil Assessment Tool Results',
      text: text,
      url: url
    });
  } else {
    // Fallback to copying to clipboard
    navigator.clipboard.writeText(`${text} ${url}`).then(() => {
      alert('Results link copied to clipboard!');
    });
  }
}

function retakeAssessment() {
  document.getElementById('assessment-results').style.display = 'none';
  document.getElementById('assessment-intro').style.display = 'block';
  currentQuestionIndex = 0;
  userAnswers = {};
  selectedQuestions = [];
}
</script>