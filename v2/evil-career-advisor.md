---
layout: default
title: "Evil Career Advisor - Find Your Perfect Corporate Overlord"
description: "Discover which evil organization aligns with your dark corporate ambitions. Take our satirical career assessment to find your ideal path to systematic exploitation."
permalink: "/evil-career-advisor/"
additional_css: 
  - "/assets/css/career-advisor.css"
---

<div class="career-advisor-container">
    <div class="career-advisor-header">
        🎭 Evil Career Advisor 🎭
    </div>
    
    <div class="career-advisor-intro">
        <h2>Find Your Perfect Corporate Evil Organization</h2>
        <p>
            Tired of being merely moderately corrupt? Ready to embrace systematic exploitation? 
            Our advanced algorithm will match you with the evil organization that best aligns with your dark ambitions.
        </p>
    </div>

    <!-- Quiz Form -->
    <div id="quiz-form">
        <div class="career-advisor-form">
            <h3>🔥 Evil Profile Assessment 🔥</h3>
            
            <!-- Skills Section -->
            <div class="career-advisor-section">
                <h4>What are your top evil skills? (Check all that apply)</h4>
                <div class="career-advisor-grid">
                    <label><input type="checkbox" value="worker-exploitation" data-skill="worker-exploitation"> Worker Exploitation</label>
                    <label><input type="checkbox" value="tax-avoidance" data-skill="tax-avoidance"> Tax Avoidance</label>
                    <label><input type="checkbox" value="monopoly-creation" data-skill="monopoly-creation"> Monopoly Creation</label>
                    <label><input type="checkbox" value="union-busting" data-skill="union-busting"> Union Busting</label>
                    <label><input type="checkbox" value="lobbying" data-skill="lobbying"> Political Lobbying</label>
                    <label><input type="checkbox" value="regulatory-capture" data-skill="regulatory-capture"> Regulatory Capture</label>
                    <label><input type="checkbox" value="greenwashing" data-skill="greenwashing"> Greenwashing</label>
                    <label><input type="checkbox" value="shareholder-value" data-skill="shareholder-value"> Shareholder Value Maximization</label>
                    <label><input type="checkbox" value="corruption" data-skill="corruption"> Corruption & Bribery</label>
                    <label><input type="checkbox" value="hype-generation" data-skill="hype-generation"> Hype Generation</label>
                </div>
            </div>

            <!-- Experience Level -->
            <div class="career-advisor-section">
                <h4>Your current level of corporate evil?</h4>
                <div class="career-advisor-radio-list">
                    <label><input type="radio" name="experience" value="novice"> 😇 Novice (Still have some conscience left)</label>
                    <label><input type="radio" name="experience" value="intermediate"> 😈 Intermediate (Occasionally feel guilty)</label>
                    <label><input type="radio" name="experience" value="advanced"> 👿 Advanced (Guilt is for peasants)</label>
                    <label><input type="radio" name="experience" value="expert"> 💀 Expert (What's a conscience?)</label>
                </div>
            </div>

            <!-- Industry Preferences -->
            <div class="career-advisor-section">
                <h4>Which industries interest you most?</h4>
                <div class="career-advisor-grid">
                    <label><input type="checkbox" value="finance" data-industry="finance"> Banking & Finance</label>
                    <label><input type="checkbox" value="tech" data-industry="tech"> Big Tech</label>
                    <label><input type="checkbox" value="pharma" data-industry="pharma"> Pharmaceuticals</label>
                    <label><input type="checkbox" value="oil" data-industry="oil"> Oil & Gas</label>
                    <label><input type="checkbox" value="retail" data-industry="retail"> Retail & E-commerce</label>
                    <label><input type="checkbox" value="consulting" data-industry="consulting"> Management Consulting</label>
                    <label><input type="checkbox" value="government" data-industry="government"> Government Relations</label>
                    <label><input type="checkbox" value="global" data-industry="global"> Global Institutions</label>
                </div>
            </div>

            <!-- Goals -->
            <div class="career-advisor-section">
                <h4>What's your primary evil goal?</h4>
                <div class="career-advisor-radio-list">
                    <label><input type="radio" name="goal" value="money"> 💰 Maximum personal wealth</label>
                    <label><input type="radio" name="goal" value="power"> ⚡ Political/social control</label>
                    <label><input type="radio" name="goal" value="destruction"> 🔥 Environmental destruction</label>
                    <label><input type="radio" name="goal" value="suffering"> 😈 Human suffering maximization</label>
                </div>
            </div>

            <div class="career-advisor-submit">
                <button onclick="generateRecommendations()">
                    🔮 Reveal My Evil Destiny 🔮
                </button>
            </div>
        </div>
    </div>

    <!-- Results Section -->
    <div id="results-section" style="display: none;">
        <div class="career-advisor-results">
            <h3>🎯 Your Evil Organization Matches 🎯</h3>
            <div id="recommendations-list"></div>
            <div class="career-advisor-restart">
                <button onclick="restartQuiz()">
                    Take Quiz Again
                </button>
            </div>
        </div>
    </div>

    <div class="career-advisor-disclaimer">
        <em>Disclaimer: This tool is for satirical purposes only. Any resemblance to actual corporate evil is purely coincidental... or is it? 😉</em>
    </div>
</div>

<script>
// Organization data with matching criteria
const organizations = [
    {
        name: "Greed Optimization",
        description: "Techniques and strategies to maximize shareholder value at any cost, often at the expense of ethics and humanity.",
        url: "/organizations/greed-optimization/",
        tags: ["corporate-greed", "shareholder-value", "ethics", "profit-maximization"],
        skills: ["shareholder-value", "worker-exploitation", "tax-avoidance"],
        industries: ["finance", "consulting"],
        experience: ["intermediate", "advanced", "expert"],
        goals: ["money"]
    },
    {
        name: "Tax Evasion Strategies", 
        description: "Advanced methods for minimizing tax liability, often skirting legality and ethics.",
        url: "/organizations/tax-evasion-strategies/",
        tags: ["tax-evasion", "financial-manipulation"],
        skills: ["tax-avoidance", "corruption"],
        industries: ["finance", "consulting"],
        experience: ["advanced", "expert"],
        goals: ["money"]
    },
    {
        name: "Lobbying Dark Arts",
        description: "The most effective (and ethically questionable) ways to influence legislation and regulation for private gain.",
        url: "/organizations/lobbying-dark-arts/",
        tags: ["lobbying", "political-influence", "corruption", "regulation"],
        skills: ["lobbying", "corruption", "regulatory-capture"],
        industries: ["government", "consulting"],
        experience: ["intermediate", "advanced", "expert"],
        goals: ["power"]
    },
    {
        name: "International Monetary Fund (IMF)",
        description: "Global Enforcer of Austerity and Economic Discipline - Mandates budget cuts and privatization in exchange for loans, keeping nations in perpetual debt.",
        url: "/organizations/imf/",
        tags: ["global-institutions", "austerity", "debt"],
        skills: ["monopoly-creation", "regulatory-capture"],
        industries: ["global", "finance"],
        experience: ["expert"],
        goals: ["power", "suffering"]
    },
    {
        name: "Hostile Takeovers",
        description: "Corporate acquisition strategies that prioritize aggressive dominance over ethical business practices.",
        url: "/organizations/hostile-takeovers/",
        tags: ["mergers", "acquisitions", "corporate-raids"],
        skills: ["monopoly-creation", "worker-exploitation", "shareholder-value"],
        industries: ["finance", "consulting"],
        experience: ["advanced", "expert"],
        goals: ["money", "power"]
    },
    {
        name: "Regulatory Capture",
        description: "The art of controlling the very agencies meant to regulate you.",
        url: "/organizations/regulatory-capture/",
        tags: ["regulation", "corruption", "government"],
        skills: ["regulatory-capture", "lobbying", "corruption"],
        industries: ["government", "pharma", "oil"],
        experience: ["advanced", "expert"],
        goals: ["power"]
    },
    {
        name: "Benefits Avoidance",
        description: "Systematic methods for denying employee benefits while maintaining legal compliance.",
        url: "/organizations/benefits-avoidance/",
        tags: ["employee-benefits", "labor-law", "cost-cutting"],
        skills: ["worker-exploitation", "union-busting"],
        industries: ["retail", "tech"],
        experience: ["intermediate", "advanced"],
        goals: ["money"]
    },
    {
        name: "Whistleblower Suppression",
        description: "Advanced techniques for silencing internal dissent and maintaining corporate secrecy.",
        url: "/organizations/whistleblower-suppression/",
        tags: ["corporate-security", "legal-intimidation", "nda"],
        skills: ["corruption", "union-busting"],
        industries: ["tech", "pharma", "oil"],
        experience: ["advanced", "expert"],
        goals: ["power", "destruction"]
    }
];

function generateRecommendations() {
    const userProfile = getUserProfile();
    const matches = calculateMatches(userProfile);
    displayRecommendations(matches);
    
    document.getElementById('quiz-form').style.display = 'none';
    document.getElementById('results-section').style.display = 'block';
}

function getUserProfile() {
    const skills = Array.from(document.querySelectorAll('input[data-skill]:checked')).map(cb => cb.value);
    const industries = Array.from(document.querySelectorAll('input[data-industry]:checked')).map(cb => cb.value);
    const experience = document.querySelector('input[name="experience"]:checked')?.value || '';
    const goal = document.querySelector('input[name="goal"]:checked')?.value || '';
    
    return { skills, industries, experience, goal };
}

function calculateMatches(userProfile) {
    const scoredOrganizations = organizations.map(org => {
        let score = 0;
        let reasons = [];
        
        // Skill matching (40% weight)
        const skillMatches = org.skills.filter(skill => userProfile.skills.includes(skill));
        if (skillMatches.length > 0) {
            score += skillMatches.length * 20;
            reasons.push(`Perfect skill alignment: ${skillMatches.join(', ')}`);
        }
        
        // Industry matching (30% weight) 
        const industryMatches = org.industries.filter(industry => userProfile.industries.includes(industry));
        if (industryMatches.length > 0) {
            score += industryMatches.length * 15;
            reasons.push(`Industry fit: ${industryMatches.join(', ')}`);
        }
        
        // Experience level matching (20% weight)
        if (org.experience.includes(userProfile.experience)) {
            score += 20;
            reasons.push(`Ideal experience level for ${userProfile.experience} practitioners`);
        }
        
        // Goal alignment (10% weight)
        if (org.goals.includes(userProfile.goal)) {
            score += 10;
            reasons.push(`Aligns with your goal of ${userProfile.goal === 'money' ? 'wealth maximization' : 
                          userProfile.goal === 'power' ? 'power acquisition' :
                          userProfile.goal === 'destruction' ? 'environmental destruction' : 
                          'human suffering'}`);
        }
        
        return { ...org, score, reasons };
    });
    
    return scoredOrganizations
        .filter(org => org.score > 0)
        .sort((a, b) => b.score - a.score)
        .slice(0, 5); // Top 5 matches
}

function displayRecommendations(matches) {
    const container = document.getElementById('recommendations-list');
    
    if (matches.length === 0) {
        container.innerHTML = `
            <div class="career-advisor-no-results">
                🤔 You seem too innocent for our current evil organizations. 
                Try developing more corrupt skills and come back when you're ready to embrace true corporate evil!
            </div>
        `;
        return;
    }
    
    container.innerHTML = matches.map((org, index) => {
        const matchPercentage = Math.min(100, Math.round(org.score / 2));
        const scoreClass = matchPercentage >= 80 ? 'high' : matchPercentage >= 60 ? 'medium' : 'low';
        return `
            <div class="career-advisor-match">
                <div class="career-advisor-match-header">
                    <h4>
                        ${index === 0 ? '🏆' : index === 1 ? '🥈' : index === 2 ? '🥉' : '📍'} 
                        ${org.name}
                    </h4>
                    <div class="career-advisor-match-score ${scoreClass}">
                        ${matchPercentage}% Match
                    </div>
                </div>
                
                <p>${org.description}</p>
                
                <div class="career-advisor-match-reasons">
                    <strong>Why this matches you:</strong>
                    <ul>
                        ${org.reasons.map(reason => `<li>${reason}</li>`).join('')}
                    </ul>
                </div>
                
                <div class="career-advisor-match-action">
                    <a href="${org.url}">
                        Join This Evil Empire →
                    </a>
                </div>
            </div>
        `;
    }).join('');
}

function restartQuiz() {
    document.getElementById('quiz-form').style.display = 'block';
    document.getElementById('results-section').style.display = 'none';
    
    // Reset form
    document.querySelectorAll('input[type="checkbox"]').forEach(cb => cb.checked = false);
    document.querySelectorAll('input[type="radio"]').forEach(rb => rb.checked = false);
}
</script>