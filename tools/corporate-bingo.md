---
layout: default
title: "Corporate Bullshit Bingo"
description: "Interactive bingo game based on real corporate behaviors and buzzwords"
permalink: /tools/corporate-bingo/
---

<div class="early-section">
    <div class="early-section-header">Corporate Bullshit Bingo</div>
    <div class="early-section-content">
        <p>Play bingo with real corporate behaviors, buzzwords, and scandals! Perfect for meetings, earnings calls, or just browsing corporate websites.</p>
        
        <div style="margin: 20px 0;">
            <label for="bingo-theme" style="display: block; margin-bottom: 5px; font-weight: bold;">Choose Your Theme:</label>
            <select id="bingo-theme" onchange="generateBingoCard()" style="width: 300px; padding: 8px; border: 1px solid #ccc; border-radius: 4px;">
                <option value="buzzwords">Corporate Buzzwords</option>
                <option value="scandals">Corporate Scandals</option>
                <option value="greenwashing">Greenwashing</option>
                <option value="layoffs">Layoff Announcements</option>
                <option value="earnings">Earnings Call Bingo</option>
                <option value="culture">Toxic Culture</option>
            </select>
        </div>
        
        <div style="text-align: center; margin: 20px 0;">
            <button onclick="generateBingoCard()" style="background: #004080; color: white; padding: 12px 24px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px; margin-right: 10px;">
                Generate New Card
            </button>
            <button onclick="resetBingoCard()" style="background: #666; color: white; padding: 12px 24px; border: none; border-radius: 4px; cursor: pointer; font-size: 16px;">
                Reset Card
            </button>
        </div>
        
        <div id="bingo-card" style="display: grid; grid-template-columns: repeat(5, 1fr); gap: 2px; max-width: 600px; margin: 0 auto; background: #333;">
            <!-- Bingo card will be generated here -->
        </div>
        
        <div id="bingo-status" style="text-align: center; margin-top: 20px; font-size: 18px; font-weight: bold; color: #004080;"></div>
        
        <div style="text-align: center; margin-top: 15px;">
            <button onclick="shareBingo()" style="background: #1DA1F2; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer;">Share Your Bingo</button>
        </div>
    </div>
</div>

<div class="early-section">
    <div class="early-section-header">How to Play Corporate Bingo</div>
    <div class="early-section-content">
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px;">
            <div>
                <h3>🎯 Buzzwords Bingo</h3>
                <p>Listen for these corporate clichés in meetings, presentations, or company communications. Click when you hear them!</p>
            </div>
            <div>
                <h3>📰 Scandals Bingo</h3>
                <p>Track corporate misbehaviors as they happen. Perfect for following the news or corporate watch.</p>
            </div>
            <div>
                <h3>🌱 Greenwashing Bingo</h3>
                <p>Spot environmental virtue signaling and fake green initiatives. Great for corporate sustainability reports!</p>
            </div>
            <div>
                <h3>📉 Layoffs Bingo</h3>
                <p>The most depressing bingo ever! Track the euphemisms companies use when firing people.</p>
            </div>
        </div>
        
        <div style="background: #fffbf0; border: 1px solid #f0ad4e; padding: 15px; border-radius: 4px; margin: 20px 0;">
            <strong>🎓 Educational Value:</strong> Learn to recognize corporate manipulation tactics, empty promises, and PR spin through gamification!
        </div>
    </div>
</div>

<script>
const bingoTerms = {
    buzzwords: [
        'Synergy', 'Paradigm Shift', 'Low-hanging Fruit', 'Circle Back', 'Deep Dive',
        'Move the Needle', 'Think Outside the Box', 'Best Practice', 'Value-add', 'Game Changer',
        'Touch Base', 'Bandwidth', 'Seamless', 'Robust', 'Scalable',
        'Disruptive', 'Pivot', 'Ecosystem', 'Holistic', 'Strategic',
        'Leverage', 'Optimize', 'Streamline', 'Mission Critical', 'Core Competency',
        'Win-Win', 'End-to-End', 'Customer-Centric', 'Data-Driven', 'Future-Proof',
        'Actionable Insights', 'Boil the Ocean', 'Run it up the Flagpole', 'Ideate', 'Ideation',
        'Blue Sky Thinking', 'Right-Size', 'Thought Leadership', 'Growth Hacking', 'Omnichannel'
    ],
    scandals: [
        'Data Breach', 'Tax Evasion', 'Worker Exploitation', 'Environmental Damage', 'Price Fixing',
        'Insider Trading', 'Money Laundering', 'Bribery', 'Discrimination Lawsuit', 'Union Busting',
        'Safety Violations', 'Product Recall', 'Accounting Fraud', 'Regulatory Violation', 'Antitrust Violation',
        'Patent Trolling', 'Wage Theft', 'Child Labor', 'Political Corruption', 'Market Manipulation',
        'Customer Data Selling', 'False Advertising', 'Planned Obsolescence', 'Monopolistic Practices', 'Greenwashing Exposed',
        'Executive Bonus Scandal', 'Offshore Tax Haven', 'Whistleblower Retaliation', 'Supply Chain Abuse', 'Regulatory Capture'
    ],
    greenwashing: [
        'Carbon Neutral', 'Sustainable Packaging', 'Eco-Friendly', 'Green Innovation', 'Net Zero',
        'Climate Positive', 'Renewable Energy', 'Biodegradable', 'Recycled Materials', 'Zero Waste',
        'Organic', 'Natural', 'Clean Technology', 'Environmental Stewardship', 'Planet-Friendly',
        'Conscious Consumption', 'Ethical Sourcing', 'Green Supply Chain', 'Sustainable Future', 'Eco-Innovation',
        'Carbon Footprint', 'Green Transformation', 'Circular Economy', 'Responsible Business', 'Environmental Impact',
        'Sustainability Goals', 'Green Commitment', 'Eco-Conscious', 'Climate Action', 'Green Revolution'
    ],
    layoffs: [
        'Right-sizing', 'Restructuring', 'Workforce Optimization', 'Strategic Realignment', 'Efficiency Measures',
        'Cost Management', 'Organizational Changes', 'Streamlining Operations', 'Resource Allocation', 'Transformation',
        'Headcount Reduction', 'Operational Excellence', 'Simplification', 'Portfolio Optimization', 'Market Conditions',
        'Economic Uncertainty', 'Difficult Decision', 'Necessary Steps', 'Future Growth', 'Competitive Position',
        'Talent Redeployment', 'Skills Realignment', 'Workforce Planning', 'Business Priorities', 'Strategic Focus',
        'Operational Efficiency', 'Productivity Enhancement', 'Resource Optimization', 'Organizational Agility', 'Market Dynamics'
    ],
    earnings: [
        'Record Revenue', 'Strong Performance', 'Exceeded Expectations', 'Market Leadership', 'Robust Growth',
        'Solid Results', 'Positive Momentum', 'Strong Fundamentals', 'Disciplined Execution', 'Strategic Progress',
        'Operational Excellence', 'Market Opportunities', 'Innovation Pipeline', 'Customer Success', 'Margin Expansion',
        'Capital Efficiency', 'Shareholder Value', 'Long-term Vision', 'Competitive Advantage', 'Market Share Gains',
        'Quality Earnings', 'Sustainable Growth', 'Value Creation', 'Strategic Investments', 'Future Opportunities',
        'Challenging Environment', 'Headwinds', 'Macro Factors', 'External Pressures', 'Market Volatility'
    ],
    culture: [
        'Toxic Culture', 'Crunch Time', 'Work-Life Balance', 'Burnout', 'Micromanagement',
        'Office Politics', 'Blame Culture', 'Unpaid Overtime', 'Gender Pay Gap', 'Glass Ceiling',
        'Boys Club', 'Harassment', 'Retaliation', 'Favoritism', 'Discrimination',
        'Hostile Environment', 'Bullying', 'Gaslighting', 'Exploitation', 'Inequality',
        'Unfair Treatment', 'Lack of Diversity', 'Systemic Bias', 'Power Abuse', 'Fear Culture',
        'No Work-Life Balance', 'Constant Pressure', 'Unrealistic Deadlines', 'Poor Communication', 'Trust Issues'
    ]
};

let currentCard = [];
let checkedCells = new Set();

function generateBingoCard() {
    const theme = document.getElementById('bingo-theme').value;
    const terms = bingoTerms[theme];
    
    // Reset checked cells
    checkedCells.clear();
    
    // Shuffle and select 25 terms (or 24 + free space)
    const shuffled = [...terms].sort(() => 0.5 - Math.random());
    currentCard = shuffled.slice(0, 24);
    
    // Insert FREE space in the middle
    currentCard.splice(12, 0, 'FREE SPACE');
    
    const bingoCardElement = document.getElementById('bingo-card');
    bingoCardElement.innerHTML = '';
    
    currentCard.forEach((term, index) => {
        const cell = document.createElement('div');
        cell.style.cssText = 'background: white; padding: 10px; text-align: center; border: 1px solid #ddd; cursor: pointer; min-height: 80px; display: flex; align-items: center; justify-content: center; font-size: 12px; font-weight: bold;';
        cell.innerText = term;
        cell.onclick = () => toggleCell(index, cell);
        
        // Mark free space as checked
        if (term === 'FREE SPACE') {
            cell.style.background = '#004080';
            cell.style.color = 'white';
            checkedCells.add(index);
        }
        
        bingoCardElement.appendChild(cell);
    });
    
    updateStatus();
}

function toggleCell(index, element) {
    if (currentCard[index] === 'FREE SPACE') return;
    
    if (checkedCells.has(index)) {
        checkedCells.delete(index);
        element.style.background = 'white';
        element.style.color = 'black';
    } else {
        checkedCells.add(index);
        element.style.background = '#004080';
        element.style.color = 'white';
    }
    
    updateStatus();
}

function resetBingoCard() {
    checkedCells.clear();
    const cells = document.querySelectorAll('#bingo-card div');
    cells.forEach((cell, index) => {
        if (currentCard[index] === 'FREE SPACE') {
            cell.style.background = '#004080';
            cell.style.color = 'white';
            checkedCells.add(index);
        } else {
            cell.style.background = 'white';
            cell.style.color = 'black';
        }
    });
    updateStatus();
}

function checkWin() {
    // Define winning patterns (rows, columns, diagonals)
    const winPatterns = [
        // Rows
        [0,1,2,3,4], [5,6,7,8,9], [10,11,12,13,14], [15,16,17,18,19], [20,21,22,23,24],
        // Columns
        [0,5,10,15,20], [1,6,11,16,21], [2,7,12,17,22], [3,8,13,18,23], [4,9,14,19,24],
        // Diagonals
        [0,6,12,18,24], [4,8,12,16,20]
    ];
    
    return winPatterns.some(pattern => 
        pattern.every(index => checkedCells.has(index))
    );
}

function updateStatus() {
    const statusElement = document.getElementById('bingo-status');
    if (checkWin()) {
        statusElement.innerText = '🎉 BINGO! You win! 🎉';
        statusElement.style.color = '#28a745';
    } else {
        statusElement.innerText = `Checked: ${checkedCells.size}/25`;
        statusElement.style.color = '#004080';
    }
}

function shareBingo() {
    const theme = document.getElementById('bingo-theme').value;
    const checkedCount = checkedCells.size;
    const won = checkWin() ? ' - BINGO!' : '';
    
    const tweetText = `I'm playing ${theme} Corporate Bingo on evil1.org! Current score: ${checkedCount}/25${won} #CorporateBingo #CorporateEvil`;
    const tweetUrl = `https://twitter.com/intent/tweet?text=${encodeURIComponent(tweetText)}&url=${encodeURIComponent(window.location.href)}`;
    window.open(tweetUrl, '_blank');
}

// Generate initial card on page load
document.addEventListener('DOMContentLoaded', generateBingoCard);
</script>