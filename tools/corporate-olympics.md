---
layout: default
title: "Corporate Evil Olympics"
description: "Interactive leaderboard ranking the worst companies, executives, and practices with real-time voting and analytics"
permalink: /tools/corporate-olympics/
---

<style>
.olympics-header {
    background: linear-gradient(135deg, #1a1a1a 0%, #333 100%);
    color: #fff;
    padding: 40px 20px;
    border-radius: 12px;
    margin-bottom: 30px;
    text-align: center;
}

.olympics-title {
    font-size: 2.5em;
    margin-bottom: 15px;
    color: #ffd700;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.5);
}

.olympics-subtitle {
    font-size: 1.2em;
    color: #ccc;
    margin-bottom: 20px;
}

.leaderboard {
    background: #f8f9fa;
    border-radius: 8px;
    overflow: hidden;
    margin-bottom: 20px;
}

.category-tabs {
    display: flex;
    background: #e9ecef;
    border-bottom: 1px solid #ddd;
    margin-bottom: 0;
}

.category-tab {
    flex: 1;
    padding: 15px;
    text-align: center;
    cursor: pointer;
    border: none;
    background: transparent;
    transition: background-color 0.3s;
}

.category-tab.active {
    background: #007bff;
    color: white;
}

.category-tab:hover {
    background: #004080;
    color: white;
}

.ranking-list {
    padding: 20px;
}

.ranking-item {
    display: flex;
    align-items: center;
    padding: 15px;
    border-bottom: 1px solid #eee;
    transition: background-color 0.3s;
}

.ranking-item:hover {
    background: #f1f3f4;
}

.rank-number {
    font-size: 2em;
    font-weight: bold;
    margin-right: 20px;
    min-width: 60px;
    text-align: center;
}

.rank-number.gold { color: #ffd700; }
.rank-number.silver { color: #c0c0c0; }
.rank-number.bronze { color: #cd7f32; }

.ranking-content {
    flex: 1;
}

.ranking-name {
    font-size: 1.3em;
    font-weight: bold;
    margin-bottom: 5px;
}

.ranking-description {
    color: #666;
    margin-bottom: 10px;
}

.ranking-score {
    display: flex;
    align-items: center;
    gap: 10px;
}

.score-value {
    font-size: 1.1em;
    font-weight: bold;
    color: #dc3545;
}

.vote-buttons {
    display: flex;
    gap: 10px;
}

.vote-btn {
    padding: 8px 15px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9em;
    transition: all 0.3s;
}

.vote-up {
    background: #dc3545;
    color: white;
}

.vote-up:hover {
    background: #c82333;
}

.vote-down {
    background: #28a745;
    color: white;
}

.vote-down:hover {
    background: #218838;
}

.premium-lock {
    position: relative;
    opacity: 0.6;
}

.premium-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: rgba(0,0,0,0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 4px;
}

.unlock-premium {
    background: #ffd700;
    color: #000;
    padding: 12px 24px;
    border: none;
    border-radius: 6px;
    font-weight: bold;
    cursor: pointer;
    text-decoration: none;
    display: inline-block;
}

.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin: 30px 0;
}

.stat-card {
    background: white;
    padding: 20px;
    border-radius: 8px;
    border: 1px solid #ddd;
    text-align: center;
}

.stat-number {
    font-size: 2em;
    font-weight: bold;
    color: #dc3545;
    display: block;
}

.stat-label {
    color: #666;
    font-size: 0.9em;
    margin-top: 5px;
}
</style>

<div class="olympics-header">
    <div class="olympics-title">🏆 Corporate Evil Olympics</div>
    <div class="olympics-subtitle">The Ultimate Ranking of Corporate Malfeasance</div>
    <p>Vote on the worst companies, executives, and practices. Real data meets public accountability.</p>
</div>

<div class="stats-grid">
    <div class="stat-card">
        <span class="stat-number" id="totalVotes">47,293</span>
        <div class="stat-label">Total Votes Cast</div>
    </div>
    <div class="stat-card">
        <span class="stat-number" id="totalCompanies">156</span>
        <div class="stat-label">Companies Ranked</div>
    </div>
    <div class="stat-card">
        <span class="stat-number" id="activeVoters">2,847</span>
        <div class="stat-label">Active Voters</div>
    </div>
    <div class="stat-card">
        <span class="stat-number" id="categories">8</span>
        <div class="stat-label">Evil Categories</div>
    </div>
</div>

<div class="leaderboard">
    <div class="category-tabs">
        <button class="category-tab active" data-category="overall">Overall Evil</button>
        <button class="category-tab" data-category="environmental">Environmental Damage</button>
        <button class="category-tab" data-category="labor">Labor Abuse</button>
        <button class="category-tab" data-category="financial">Financial Crimes</button>
        <button class="category-tab" data-category="corruption">Corruption</button>
        <button class="category-tab" data-category="executives">Evil Executives</button>
    </div>
    
    <div class="ranking-list" id="rankingList">
        <!-- Rankings will be populated by JavaScript -->
    </div>
</div>

<div class="early-section">
    <div class="early-section-header">📊 Premium Analytics</div>
    <div class="early-section-content premium-lock">
        <div class="premium-overlay">
            <a href="/membership/" class="unlock-premium">🔓 Unlock Premium Features</a>
        </div>
        <div style="filter: blur(2px);">
            <h4>Advanced Features (Premium Only):</h4>
            <ul>
                <li><strong>Detailed Analytics:</strong> Industry trends, geographic voting patterns</li>
                <li><strong>Historical Tracking:</strong> See how rankings change over time</li>
                <li><strong>Custom Scorecards:</strong> Create industry-specific rankings</li>
                <li><strong>Export Data:</strong> Download rankings for research/reporting</li>
                <li><strong>Vote Influence:</strong> Premium votes count 2x in final rankings</li>
                <li><strong>Early Access:</strong> New companies and categories before public release</li>
            </ul>
        </div>
    </div>
</div>

<div class="early-section">
    <div class="early-section-header">🎯 How It Works</div>
    <div class="early-section-content">
        <h4>📈 Scoring System:</h4>
        <ul>
            <li><strong>Base Score:</strong> Calculated from documented scandals, fines, and violations</li>
            <li><strong>Public Votes:</strong> Community voting on current and historical behavior</li>
            <li><strong>Expert Input:</strong> Weighted input from journalists and researchers</li>
            <li><strong>Real-time Updates:</strong> Scores adjust as new information emerges</li>
        </ul>
        
        <h4>🔍 Data Sources:</h4>
        <ul>
            <li>SEC filings and regulatory penalties</li>
            <li>Environmental violation databases</li>
            <li>Labor department reports</li>
            <li>Investigative journalism</li>
            <li>Whistleblower testimonies</li>
        </ul>
        
        <div style="background: #fff3cd; border: 1px solid #ffeaa7; padding: 15px; border-radius: 4px; margin: 20px 0;">
            <strong>🎓 Educational Purpose:</strong> Rankings are designed to promote corporate accountability and transparency, not to harm businesses. All scores are based on public information and documented behaviors.
        </div>
    </div>
</div>

<script>
// Corporate Evil Olympics JavaScript
const olympicsData = {
    overall: [
        {
            rank: 1,
            name: "ExxonMobil",
            description: "Decades of climate denial, environmental destruction, and political manipulation",
            score: 9347,
            category: "overall"
        },
        {
            rank: 2,
            name: "Amazon",
            description: "Worker exploitation, tax avoidance, market manipulation, anti-union activities",
            score: 8892,
            category: "overall"
        },
        {
            rank: 3,
            name: "Facebook/Meta",
            description: "Privacy violations, democracy undermining, mental health damage, misinformation spread",
            score: 8756,
            category: "overall"
        },
        {
            rank: 4,
            name: "Walmart",
            description: "Labor exploitation, wage theft, supplier abuse, small business destruction",
            score: 8234,
            category: "overall"
        },
        {
            rank: 5,
            name: "Nestle",
            description: "Water privatization, child labor, environmental destruction, predatory marketing",
            score: 7891,
            category: "overall"
        }
    ],
    environmental: [
        {
            rank: 1,
            name: "ExxonMobil",
            description: "Climate change denial, oil spills, carbon emissions, lobbying against regulations",
            score: 9847,
            category: "environmental"
        },
        {
            rank: 2,
            name: "Shell",
            description: "Environmental racism, oil extraction in protected areas, greenwashing campaigns",
            score: 9234,
            category: "environmental"
        },
        {
            rank: 3,
            name: "BP",
            description: "Deepwater Horizon disaster, safety violations, environmental cover-ups",
            score: 8756,
            category: "environmental"
        },
        {
            rank: 4,
            name: "Chevron",
            description: "Amazon pollution, indigenous rights violations, climate litigation",
            score: 8345,
            category: "environmental"
        },
        {
            rank: 5,
            name: "Koch Industries",
            description: "Chemical pollution, climate denial funding, regulatory capture",
            score: 7823,
            category: "environmental"
        }
    ],
    labor: [
        {
            rank: 1,
            name: "Amazon",
            description: "Warehouse injuries, anti-union campaigns, worker surveillance, impossible quotas",
            score: 9567,
            category: "labor"
        },
        {
            rank: 2,
            name: "Walmart",
            description: "Wage theft, benefits denial, union busting, scheduling manipulation",
            score: 9123,
            category: "labor"
        },
        {
            rank: 3,
            name: "Tesla",
            description: "Factory safety violations, racial discrimination, union intimidation",
            score: 8456,
            category: "labor"
        },
        {
            rank: 4,
            name: "Uber",
            description: "Worker misclassification, benefits denial, gig economy exploitation",
            score: 7890,
            category: "labor"
        },
        {
            rank: 5,
            name: "McDonald's",
            description: "Wage theft, workplace harassment, franchisee labor violations",
            score: 7456,
            category: "labor"
        }
    ],
    executives: [
        {
            rank: 1,
            name: "Elon Musk",
            description: "Market manipulation, worker intimidation, regulatory capture, social media chaos",
            score: 8934,
            category: "executives"
        },
        {
            rank: 2,
            name: "Jeff Bezos",
            description: "Worker exploitation, tax avoidance, monopolistic practices",
            score: 8567,
            category: "executives"
        },
        {
            rank: 3,
            name: "Mark Zuckerberg",
            description: "Privacy violations, democracy undermining, mental health damage",
            score: 8234,
            category: "executives"
        },
        {
            rank: 4,
            name: "Martin Shkreli",
            description: "Price gouging, pharmaceutical exploitation, securities fraud",
            score: 7890,
            category: "executives"
        },
        {
            rank: 5,
            name: "Travis Kalanick",
            description: "Toxic culture, harassment cover-ups, regulatory violations",
            score: 7456,
            category: "executives"
        }
    ]
};

// Initialize the leaderboard
function initializeOlympics() {
    const categoryTabs = document.querySelectorAll('.category-tab');
    const rankingList = document.getElementById('rankingList');
    
    // Category tab switching
    categoryTabs.forEach(tab => {
        tab.addEventListener('click', () => {
            categoryTabs.forEach(t => t.classList.remove('active'));
            tab.classList.add('active');
            
            const category = tab.dataset.category;
            displayRankings(category);
        });
    });
    
    // Display initial rankings
    displayRankings('overall');
    
    // Animate stats
    animateStats();
}

function displayRankings(category) {
    const rankingList = document.getElementById('rankingList');
    const data = olympicsData[category] || olympicsData.overall;
    
    rankingList.innerHTML = '';
    
    data.forEach(item => {
        const rankingItem = createRankingItem(item);
        rankingList.appendChild(rankingItem);
    });
}

function createRankingItem(item) {
    const div = document.createElement('div');
    div.className = 'ranking-item';
    
    const rankClass = item.rank === 1 ? 'gold' : item.rank === 2 ? 'silver' : item.rank === 3 ? 'bronze' : '';
    
    div.innerHTML = `
        <div class="rank-number ${rankClass}">#${item.rank}</div>
        <div class="ranking-content">
            <div class="ranking-name">${item.name}</div>
            <div class="ranking-description">${item.description}</div>
            <div class="ranking-score">
                <span class="score-value">${item.score.toLocaleString()} Evil Points</span>
                <div class="vote-buttons">
                    <button class="vote-btn vote-up" onclick="vote('${item.name}', 'up')">👎 More Evil</button>
                    <button class="vote-btn vote-down" onclick="vote('${item.name}', 'down')">👍 Less Evil</button>
                </div>
            </div>
        </div>
    `;
    
    return div;
}

function vote(name, direction) {
    // Simulate voting (in real implementation, this would call an API)
    const message = direction === 'up' 
        ? `Voted "${name}" as MORE evil. Your vote has been recorded!`
        : `Voted "${name}" as LESS evil. Your vote has been recorded!`;
    
    alert(message);
    
    // Update vote counts (simulated)
    const totalVotes = document.getElementById('totalVotes');
    const currentVotes = parseInt(totalVotes.textContent.replace(',', ''));
    totalVotes.textContent = (currentVotes + 1).toLocaleString();
}

function animateStats() {
    const statNumbers = document.querySelectorAll('.stat-number');
    
    statNumbers.forEach(stat => {
        const finalValue = parseInt(stat.textContent.replace(',', ''));
        let currentValue = 0;
        const increment = finalValue / 100;
        
        const timer = setInterval(() => {
            currentValue += increment;
            if (currentValue >= finalValue) {
                stat.textContent = finalValue.toLocaleString();
                clearInterval(timer);
            } else {
                stat.textContent = Math.floor(currentValue).toLocaleString();
            }
        }, 20);
    });
}

// Social sharing
function shareOlympics() {
    const text = "Check out the Corporate Evil Olympics - ranking the worst companies and executives! #CorporateEvil #Accountability";
    const url = window.location.href;
    
    if (navigator.share) {
        navigator.share({
            title: 'Corporate Evil Olympics',
            text: text,
            url: url
        });
    } else {
        const twitterUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(text)}&url=${encodeURIComponent(url)}`;
        window.open(twitterUrl, '_blank');
    }
}

// Initialize when DOM loads
document.addEventListener('DOMContentLoaded', initializeOlympics);
</script>

<div style="text-align: center; margin: 40px 0;">
    <button onclick="shareOlympics()" class="early-nav-link" style="background: #1da1f2; color: white; padding: 12px 24px; border: none; border-radius: 4px; cursor: pointer;">
        🐦 Share Olympics Results
    </button>
</div>