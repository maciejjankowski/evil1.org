---
layout: default
title: "Dopamine-Driven Corporate Evil Experience"
description: "Experience the ultimate in psychological manipulation through our vanity items, loot boxes, and addiction-designed user journey"
permalink: /dopamine-experience/
---

<div class="dopamine-experience-page">
    <!-- Warning Header -->
    <div class="addiction-warning">
        <div class="warning-content">
            <h1>⚠️ PSYCHOLOGICAL MANIPULATION ZONE ⚠️</h1>
            <p><strong>WARNING:</strong> This page is designed to be addictive and manipulative.</p>
            <p>Every element here uses psychological tricks to exploit your dopamine system and drive spending.</p>
            <div class="warning-details">
                <p><strong>You are about to experience:</strong></p>
                <ul>
                    <li>🎰 Loot boxes designed to trigger gambling addiction</li>
                    <li>👑 Vanity items that exploit status anxiety</li>
                    <li>🔥 Streak systems that create compulsive behavior</li>
                    <li>💰 Monetization that preys on psychological vulnerabilities</li>
                    <li>📊 Social comparison designed to make you feel inadequate</li>
                </ul>
            </div>
            <div class="educational-notice">
                <p><strong>🎭 This is educational satire.</strong> We're demonstrating how corporations manipulate users.</p>
                <p>60% of any purchases fund real activism and investigative journalism.</p>
                <p>By participating, you're learning these manipulation tactics firsthand!</p>
            </div>
            <button id="enterExperience" class="enter-btn">
                I Understand - Enter the Dopamine Trap
            </button>
        </div>
    </div>

    <!-- Main Dopamine Experience (Hidden Initially) -->
    <div id="dopamineExperience" class="dopamine-content" style="display: none;">
        
        <!-- User Progress Overview -->
        <div class="user-dashboard">
            <div class="dashboard-header">
                <h2>🏆 Your Corporate Evil Empire</h2>
                <div class="user-stats">
                    <div class="stat-box">
                        <div class="stat-number" id="evilPoints">12,847</div>
                        <div class="stat-label">Evil Points</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number" id="userLevel">23</div>
                        <div class="stat-label">Evil Level</div>
                    </div>
                    <div class="stat-box">
                        <div class="stat-number" id="rankPosition">#247</div>
                        <div class="stat-label">Global Rank</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Evil Streak System -->
        <section class="experience-section">
            <div class="section-header">
                <h2>🔥 Daily Evil Streak System</h2>
                <p class="section-subtitle">Maintain your corporate evil streak or lose everything!</p>
            </div>
            {% include evil-streak-system.html current_streak=23 %}
        </section>

        <!-- Loot Box Gacha System -->
        <section class="experience-section">
            <div class="section-header">
                <h2>🎰 Corporate Scandal Mystery Boxes</h2>
                <p class="section-subtitle">Randomized corporate evil content to fuel your addiction!</p>
            </div>
            
            <div class="loot-box-grid">
                {% include dopamine-loot-box.html box_id="scandal" title="Corporate Scandal Box" price="24.99" %}
                {% include dopamine-loot-box.html box_id="premium" title="Premium Evil Box" price="49.99" %}
                {% include dopamine-loot-box.html box_id="mythic" title="Mythic Overlord Box" price="99.99" %}
            </div>
        </section>

        <!-- Vanity Items / Golden Skins -->
        <section class="experience-section">
            <div class="section-header">
                <h2>👑 Executive Vanity Collection</h2>
                <p class="section-subtitle">Show your corporate evil status with exclusive digital items!</p>
            </div>
            
            <div class="vanity-grid">
                {% include vanity-showcase.html tier="executive" regular_price="399.99" sale_price="199.99" cost_per_day="0.55" %}
                {% include vanity-showcase.html tier="legendary" regular_price="799.99" sale_price="499.99" cost_per_day="1.37" %}
                {% include vanity-showcase.html tier="mythic" regular_price="1999.99" sale_price="999.99" cost_per_day="2.74" %}
            </div>
        </section>

        <!-- Evil Point Store -->
        <section class="experience-section">
            <div class="section-header">
                <h2>💰 Evil Point Marketplace</h2>
                <p class="section-subtitle">Buy your way to corporate supremacy!</p>
            </div>
            
            <div class="evil-store">
                <div class="store-grid">
                    <div class="store-item basic">
                        <div class="item-header">
                            <h3>Startup Package</h3>
                            <div class="item-bonus">+25% BONUS!</div>
                        </div>
                        <div class="item-content">
                            <div class="points-amount">1,250 Evil Points</div>
                            <div class="points-base">(1,000 + 250 bonus)</div>
                            <div class="item-price">$4.99</div>
                        </div>
                        <button class="purchase-btn" onclick="purchaseEvilPoints('startup', 4.99, 1250)">
                            Buy Now
                        </button>
                    </div>
                    
                    <div class="store-item popular">
                        <div class="popular-badge">MOST POPULAR</div>
                        <div class="item-header">
                            <h3>Corporate Package</h3>
                            <div class="item-bonus">+50% BONUS!</div>
                        </div>
                        <div class="item-content">
                            <div class="points-amount">7,500 Evil Points</div>
                            <div class="points-base">(5,000 + 2,500 bonus)</div>
                            <div class="item-price">$19.99</div>
                        </div>
                        <button class="purchase-btn" onclick="purchaseEvilPoints('corporate', 19.99, 7500)">
                            Buy Now
                        </button>
                    </div>
                    
                    <div class="store-item premium">
                        <div class="item-header">
                            <h3>Overlord Package</h3>
                            <div class="item-bonus">+100% BONUS!</div>
                        </div>
                        <div class="item-content">
                            <div class="points-amount">30,000 Evil Points</div>
                            <div class="points-base">(15,000 + 15,000 bonus)</div>
                            <div class="item-price">$49.99</div>
                        </div>
                        <button class="purchase-btn" onclick="purchaseEvilPoints('overlord', 49.99, 30000)">
                            Buy Now
                        </button>
                    </div>
                    
                    <div class="store-item whale">
                        <div class="item-header">
                            <h3>Whale Tier</h3>
                            <div class="item-bonus">+200% BONUS!</div>
                        </div>
                        <div class="item-content">
                            <div class="points-amount">150,000 Evil Points</div>
                            <div class="points-base">(50,000 + 100,000 bonus)</div>
                            <div class="item-price">$99.99</div>
                        </div>
                        <button class="purchase-btn" onclick="purchaseEvilPoints('whale', 99.99, 150000)">
                            Buy Now
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Social Pressure Leaderboard -->
        <section class="experience-section">
            <div class="section-header">
                <h2>📊 Global Corporate Evil Leaderboard</h2>
                <p class="section-subtitle">See how your evil stacks up against other corporate criminals!</p>
            </div>
            
            <div class="leaderboard-full">
                <div class="leaderboard-filters">
                    <button class="filter-btn active" onclick="filterLeaderboard('all')">All Time</button>
                    <button class="filter-btn" onclick="filterLeaderboard('weekly')">This Week</button>
                    <button class="filter-btn" onclick="filterLeaderboard('monthly')">This Month</button>
                    <button class="filter-btn" onclick="filterLeaderboard('friends')">Friends Only</button>
                </div>
                
                <div class="leaderboard-table">
                    <div class="leaderboard-row header">
                        <div class="rank-col">Rank</div>
                        <div class="user-col">Evil Executive</div>
                        <div class="streak-col">Streak</div>
                        <div class="score-col">Evil Score</div>
                        <div class="status-col">Status</div>
                    </div>
                    
                    <div class="leaderboard-row rank-1">
                        <div class="rank-col">👑</div>
                        <div class="user-col">
                            <div class="user-name">Jeff B.</div>
                            <div class="user-title">Supreme Overlord</div>
                        </div>
                        <div class="streak-col">2,847 days</div>
                        <div class="score-col">999,999,999</div>
                        <div class="status-col">🔥 LEGENDARY</div>
                    </div>
                    
                    <div class="leaderboard-row rank-2">
                        <div class="rank-col">🥈</div>
                        <div class="user-col">
                            <div class="user-name">Elon M.</div>
                            <div class="user-title">Tech Tyrant</div>
                        </div>
                        <div class="streak-col">1,564 days</div>
                        <div class="score-col">876,543,210</div>
                        <div class="status-col">⚡ MYTHIC</div>
                    </div>
                    
                    <div class="leaderboard-row rank-3">
                        <div class="rank-col">🥉</div>
                        <div class="user-col">
                            <div class="user-name">Mark Z.</div>
                            <div class="user-title">Privacy Destroyer</div>
                        </div>
                        <div class="streak-col">987 days</div>
                        <div class="score-col">654,321,098</div>
                        <div class="status-col">💎 EPIC</div>
                    </div>
                    
                    <div class="leaderboard-divider">
                        <span>⋮ 243 other evil executives ⋮</span>
                    </div>
                    
                    <div class="leaderboard-row your-rank highlight">
                        <div class="rank-col">#247</div>
                        <div class="user-col">
                            <div class="user-name">YOU</div>
                            <div class="user-title">Corporate Intern</div>
                        </div>
                        <div class="streak-col">23 days</div>
                        <div class="score-col">12,847</div>
                        <div class="status-col">🌱 BASIC</div>
                    </div>
                </div>
                
                <!-- Improvement Suggestions -->
                <div class="improvement-suggestions">
                    <div class="suggestion-header">
                        <h4>💡 How to Improve Your Rank:</h4>
                    </div>
                    <div class="suggestions-grid">
                        <div class="suggestion-item">
                            <div class="suggestion-icon">💰</div>
                            <div class="suggestion-text">Buy Evil Points</div>
                            <div class="suggestion-impact">+50 ranks</div>
                        </div>
                        <div class="suggestion-item">
                            <div class="suggestion-icon">👑</div>
                            <div class="suggestion-text">Purchase Vanity Items</div>
                            <div class="suggestion-impact">+25 ranks</div>
                        </div>
                        <div class="suggestion-item">
                            <div class="suggestion-icon">🎰</div>
                            <div class="suggestion-text">Open Loot Boxes</div>
                            <div class="suggestion-impact">+10 ranks</div>
                        </div>
                        <div class="suggestion-item">
                            <div class="suggestion-icon">🔥</div>
                            <div class="suggestion-text">Maintain Streaks</div>
                            <div class="suggestion-impact">+5 ranks</div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- FOMO Event -->
        <section class="experience-section fomo-event">
            <div class="section-header">
                <h2>⚡ LIMITED TIME EVENT ⚡</h2>
                <p class="section-subtitle">Don't miss out on exclusive rewards!</p>
            </div>
            
            <div class="event-container">
                <div class="event-header">
                    <h3>🎃 Corporate Halloween Massacre Event</h3>
                    <div class="event-timer">
                        <span class="timer-label">Event ends in:</span>
                        <div class="timer-display" id="eventTimer">
                            <span class="hours">47</span>h
                            <span class="minutes">23</span>m
                            <span class="seconds">15</span>s
                        </div>
                    </div>
                </div>
                
                <div class="event-rewards">
                    <h4>🎁 Exclusive Event Rewards:</h4>
                    <div class="rewards-showcase">
                        <div class="reward-item legendary">
                            <div class="reward-icon">🎃</div>
                            <div class="reward-name">Pumpkin CEO Crown</div>
                            <div class="reward-rarity">LEGENDARY</div>
                        </div>
                        <div class="reward-item mythic">
                            <div class="reward-icon">👻</div>
                            <div class="reward-name">Ghost of Ethics Past</div>
                            <div class="reward-rarity">MYTHIC</div>
                        </div>
                        <div class="reward-item cosmic">
                            <div class="reward-icon">💀</div>
                            <div class="reward-name">Death of Morality Badge</div>
                            <div class="reward-rarity">COSMIC</div>
                        </div>
                    </div>
                </div>
                
                <div class="event-participation">
                    <div class="participation-bar">
                        <div class="bar-fill" style="width: 73%"></div>
                        <div class="bar-text">73% to next reward</div>
                    </div>
                    <button class="event-btn" onclick="participateInEvent()">
                        🎃 Join the Massacre! 🎃
                    </button>
                </div>
            </div>
        </section>

        <!-- Final Educational Summary -->
        <section class="experience-section educational-summary">
            <div class="section-header">
                <h2>🎭 Congratulations! You've Experienced Corporate Manipulation</h2>
                <p class="section-subtitle">Here's what just happened to your brain...</p>
            </div>
            
            <div class="manipulation-analysis">
                <div class="analysis-grid">
                    <div class="analysis-item">
                        <h4>🧠 Dopamine Hijacking</h4>
                        <p>Every colorful animation, reward notification, and "achievement" triggered dopamine release, making you want to continue engaging.</p>
                    </div>
                    
                    <div class="analysis-item">
                        <h4>📊 Social Comparison</h4>
                        <p>Leaderboards and peer pressure made you feel inadequate, driving desire to spend money to "catch up" with others.</p>
                    </div>
                    
                    <div class="analysis-item">
                        <h4>⏰ Artificial Urgency</h4>
                        <p>Timers, limited availability, and "ending soon" messages created false scarcity to pressure immediate purchases.</p>
                    </div>
                    
                    <div class="analysis-item">
                        <h4>🎰 Variable Rewards</h4>
                        <p>Loot boxes used the same psychology as slot machines - random rewards create the strongest addiction patterns.</p>
                    </div>
                    
                    <div class="analysis-item">
                        <h4>👑 Status Signaling</h4>
                        <p>Vanity items exploited your need for social status and identity signaling through purchases.</p>
                    </div>
                    
                    <div class="analysis-item">
                        <h4>🔗 Habit Formation</h4>
                        <p>Daily streaks and tasks created compulsive checking behavior designed to become habitual.</p>
                    </div>
                </div>
                
                <div class="real-world-applications">
                    <h3>🌍 Where You See These Tactics:</h3>
                    <div class="applications-list">
                        <div class="app-category">
                            <h5>🎮 Mobile Games</h5>
                            <p>Daily rewards, loot boxes, pay-to-progress, artificial energy systems</p>
                        </div>
                        <div class="app-category">
                            <h5>📱 Social Media</h5>
                            <p>Streak systems, infinite scroll, likes/reactions, FOMO content</p>
                        </div>
                        <div class="app-category">
                            <h5>🛒 E-commerce</h5>
                            <p>Flash sales, limited stock warnings, abandoned cart emails, loyalty points</p>
                        </div>
                        <div class="app-category">
                            <h5>💳 Subscription Services</h5>
                            <p>Free trials, cancellation friction, upgrade pressure, premium features</p>
                        </div>
                    </div>
                </div>
                
                <div class="protection-advice">
                    <h3>🛡️ How to Protect Yourself:</h3>
                    <ul>
                        <li><strong>Recognize the patterns:</strong> When you see timers, leaderboards, or loot boxes, know you're being manipulated</li>
                        <li><strong>Pause before purchasing:</strong> Wait 24 hours before buying anything marketed as "limited time"</li>
                        <li><strong>Question social proof:</strong> User counts and "others bought" messages are often fake</li>
                        <li><strong>Set spending limits:</strong> Decide your budget before engaging with freemium content</li>
                        <li><strong>Turn off notifications:</strong> Break the habit loop by removing external triggers</li>
                        <li><strong>Read the fine print:</strong> Understand what you're actually buying before you buy it</li>
                    </ul>
                </div>
            </div>
        </section>

        <!-- Support Our Mission -->
        <section class="experience-section support-mission">
            <div class="section-header">
                <h2>💝 Support Real Activism</h2>
                <p class="section-subtitle">Turn your newfound awareness into action!</p>
            </div>
            
            <div class="mission-support">
                <div class="support-options">
                    <div class="support-option transparent">
                        <h4>🔍 Fund Investigative Journalism</h4>
                        <p>Support real investigations into corporate malfeasance and corruption.</p>
                        <button class="support-btn">Donate to Investigations</button>
                    </div>
                    
                    <div class="support-option transparent">
                        <h4>📚 Educational Resources</h4>
                        <p>Help us create more content teaching people about corporate manipulation.</p>
                        <button class="support-btn">Support Education</button>
                    </div>
                    
                    <div class="support-option transparent">
                        <h4>🗣️ Whistleblower Protection</h4>
                        <p>Fund legal support and protection for corporate whistleblowers.</p>
                        <button class="support-btn">Protect Truth-tellers</button>
                    </div>
                </div>
                
                <div class="transparency-promise">
                    <h4>🎯 Our Transparency Promise:</h4>
                    <ul>
                        <li>60% of all proceeds fund investigative journalism and activism</li>
                        <li>25% covers platform costs and content creation</li>
                        <li>15% goes to building this educational experience</li>
                        <li>Monthly financial reports published for full transparency</li>
                        <li>No executive bonuses, no shareholder dividends</li>
                    </ul>
                </div>
            </div>
        </section>
    </div>
</div>

<style>
.dopamine-experience-page {
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
}

.addiction-warning {
    background: linear-gradient(135deg, #e74c3c 0%, #c0392b 100%);
    border-radius: 20px;
    padding: 40px;
    text-align: center;
    color: white;
    margin-bottom: 40px;
    box-shadow: 0 15px 40px rgba(231, 76, 60, 0.3);
}

.addiction-warning h1 {
    font-size: 28px;
    margin-bottom: 20px;
    text-shadow: 2px 2px 4px rgba(0,0,0,0.3);
}

.warning-content p {
    font-size: 18px;
    margin: 15px 0;
    line-height: 1.6;
}

.warning-details {
    background: rgba(0,0,0,0.2);
    border-radius: 15px;
    padding: 20px;
    margin: 25px 0;
    text-align: left;
}

.warning-details ul {
    margin: 15px 0;
    padding-left: 20px;
}

.warning-details li {
    margin: 8px 0;
    font-size: 16px;
}

.educational-notice {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 20px;
    margin: 25px 0;
}

.enter-btn {
    background: linear-gradient(45deg, #2ecc71, #27ae60);
    color: white;
    border: none;
    padding: 20px 40px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 25px;
    cursor: pointer;
    margin-top: 30px;
    transition: all 0.3s ease;
    text-transform: uppercase;
    letter-spacing: 1px;
}

.enter-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 10px 30px rgba(46, 204, 113, 0.4);
}

.user-dashboard {
    background: linear-gradient(135deg, #3498db 0%, #2980b9 100%);
    border-radius: 20px;
    padding: 25px;
    margin: 30px 0;
    color: white;
    text-align: center;
}

.dashboard-header h2 {
    margin-bottom: 20px;
    font-size: 24px;
}

.user-stats {
    display: flex;
    justify-content: center;
    gap: 30px;
    flex-wrap: wrap;
}

.stat-box {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 20px;
    min-width: 120px;
    backdrop-filter: blur(10px);
}

.stat-number {
    font-size: 28px;
    font-weight: bold;
    color: #f39c12;
    margin-bottom: 5px;
}

.stat-label {
    font-size: 14px;
    opacity: 0.9;
}

.experience-section {
    margin: 50px 0;
    padding: 30px;
    background: #f8f9fa;
    border-radius: 20px;
    box-shadow: 0 10px 30px rgba(0,0,0,0.1);
}

.section-header {
    text-align: center;
    margin-bottom: 30px;
}

.section-header h2 {
    font-size: 28px;
    color: #2c3e50;
    margin-bottom: 10px;
}

.section-subtitle {
    font-size: 16px;
    color: #7f8c8d;
    margin: 0;
}

.loot-box-grid, .vanity-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
    gap: 30px;
    margin: 30px 0;
}

.evil-store {
    background: #2c3e50;
    border-radius: 20px;
    padding: 30px;
    margin: 20px 0;
}

.store-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
}

.store-item {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    text-align: center;
    position: relative;
    transition: all 0.3s ease;
    color: white;
}

.store-item:hover {
    transform: translateY(-5px);
    background: rgba(255,255,255,0.15);
}

.store-item.popular {
    border: 3px solid #f39c12;
    position: relative;
}

.popular-badge {
    position: absolute;
    top: -10px;
    left: 50%;
    transform: translateX(-50%);
    background: #f39c12;
    color: white;
    padding: 6px 16px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: bold;
}

.item-header h3 {
    margin-bottom: 10px;
    font-size: 20px;
}

.item-bonus {
    background: #e74c3c;
    color: white;
    padding: 4px 12px;
    border-radius: 15px;
    font-size: 12px;
    font-weight: bold;
    display: inline-block;
    margin-bottom: 15px;
}

.points-amount {
    font-size: 24px;
    font-weight: bold;
    color: #2ecc71;
    margin-bottom: 5px;
}

.points-base {
    font-size: 12px;
    opacity: 0.8;
    margin-bottom: 15px;
}

.item-price {
    font-size: 28px;
    font-weight: bold;
    color: #f39c12;
    margin-bottom: 20px;
}

.purchase-btn {
    background: linear-gradient(45deg, #e74c3c, #c0392b);
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
}

.purchase-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 5px 15px rgba(231, 76, 60, 0.4);
}

.leaderboard-full {
    background: #2c3e50;
    border-radius: 20px;
    padding: 30px;
    color: white;
}

.leaderboard-filters {
    display: flex;
    justify-content: center;
    gap: 10px;
    margin-bottom: 30px;
    flex-wrap: wrap;
}

.filter-btn {
    background: rgba(255,255,255,0.1);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 20px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.filter-btn.active {
    background: #3498db;
}

.filter-btn:hover {
    background: rgba(255,255,255,0.2);
}

.leaderboard-table {
    margin: 20px 0;
}

.leaderboard-row {
    display: grid;
    grid-template-columns: 60px 1fr 120px 120px 120px;
    gap: 15px;
    padding: 15px;
    margin: 5px 0;
    background: rgba(255,255,255,0.05);
    border-radius: 10px;
    align-items: center;
}

.leaderboard-row.header {
    background: rgba(255,255,255,0.1);
    font-weight: bold;
}

.leaderboard-row.highlight {
    background: rgba(52, 152, 219, 0.2);
    border: 2px solid #3498db;
    animation: highlight-pulse 2s ease-in-out infinite alternate;
}

@keyframes highlight-pulse {
    0% { box-shadow: 0 0 10px rgba(52, 152, 219, 0.3); }
    100% { box-shadow: 0 0 20px rgba(52, 152, 219, 0.6); }
}

.rank-col {
    text-align: center;
    font-weight: bold;
}

.user-name {
    font-weight: bold;
    margin-bottom: 2px;
}

.user-title {
    font-size: 12px;
    opacity: 0.8;
}

.leaderboard-divider {
    text-align: center;
    padding: 15px;
    opacity: 0.6;
    font-style: italic;
}

.improvement-suggestions {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    margin-top: 30px;
}

.suggestions-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 15px;
    margin-top: 20px;
}

.suggestion-item {
    background: rgba(255,255,255,0.1);
    border-radius: 12px;
    padding: 20px;
    text-align: center;
    transition: all 0.3s ease;
}

.suggestion-item:hover {
    transform: translateY(-3px);
    background: rgba(255,255,255,0.15);
}

.suggestion-icon {
    font-size: 30px;
    margin-bottom: 10px;
}

.suggestion-impact {
    color: #2ecc71;
    font-weight: bold;
    margin-top: 5px;
}

.fomo-event {
    background: linear-gradient(135deg, #8e44ad 0%, #9b59b6 100%);
    color: white;
}

.event-container {
    background: rgba(255,255,255,0.1);
    border-radius: 20px;
    padding: 30px;
    backdrop-filter: blur(10px);
}

.event-header {
    text-align: center;
    margin-bottom: 30px;
}

.event-timer {
    margin-top: 15px;
}

.timer-display {
    font-size: 32px;
    font-weight: bold;
    font-family: 'Courier New', monospace;
    color: #f39c12;
    text-shadow: 0 0 10px rgba(243, 156, 18, 0.5);
}

.rewards-showcase {
    display: flex;
    justify-content: center;
    gap: 30px;
    margin: 25px 0;
    flex-wrap: wrap;
}

.reward-item {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 20px;
    text-align: center;
    min-width: 150px;
    transition: all 0.3s ease;
}

.reward-item:hover {
    transform: scale(1.05);
}

.reward-item.legendary {
    border: 2px solid #f39c12;
    animation: legendary-glow 2s ease-in-out infinite alternate;
}

.reward-item.mythic {
    border: 2px solid #e74c3c;
    animation: mythic-pulse 1.5s ease-in-out infinite;
}

.reward-item.cosmic {
    border: 2px solid #9b59b6;
    animation: cosmic-shimmer 3s ease-in-out infinite;
}

@keyframes cosmic-shimmer {
    0%, 100% { box-shadow: 0 0 15px rgba(155, 89, 182, 0.4); }
    50% { box-shadow: 0 0 30px rgba(155, 89, 182, 0.8); }
}

.reward-icon {
    font-size: 40px;
    margin-bottom: 10px;
}

.reward-rarity {
    font-size: 10px;
    font-weight: bold;
    margin-top: 5px;
    padding: 3px 8px;
    border-radius: 10px;
    background: rgba(0,0,0,0.3);
}

.participation-bar {
    background: rgba(255,255,255,0.2);
    border-radius: 25px;
    height: 30px;
    position: relative;
    margin: 20px 0;
    overflow: hidden;
}

.bar-fill {
    height: 100%;
    background: linear-gradient(45deg, #2ecc71, #27ae60);
    border-radius: 25px;
    transition: width 1s ease-out;
}

.bar-text {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    font-weight: bold;
    color: white;
    text-shadow: 1px 1px 2px rgba(0,0,0,0.7);
}

.event-btn {
    background: linear-gradient(45deg, #e67e22, #d35400);
    color: white;
    border: none;
    padding: 15px 30px;
    font-size: 18px;
    font-weight: bold;
    border-radius: 25px;
    cursor: pointer;
    transition: all 0.3s ease;
    width: 100%;
    margin-top: 20px;
}

.event-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 8px 25px rgba(230, 126, 34, 0.4);
}

.educational-summary {
    background: linear-gradient(135deg, #16a085 0%, #1abc9c 100%);
    color: white;
}

.manipulation-analysis {
    margin: 30px 0;
}

.analysis-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 25px;
    margin: 30px 0;
}

.analysis-item {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    backdrop-filter: blur(10px);
}

.analysis-item h4 {
    margin-bottom: 15px;
    font-size: 18px;
    color: #f39c12;
}

.real-world-applications {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    margin: 30px 0;
}

.applications-list {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-top: 20px;
}

.app-category {
    background: rgba(255,255,255,0.1);
    border-radius: 12px;
    padding: 20px;
}

.app-category h5 {
    margin-bottom: 10px;
    font-size: 16px;
    color: #f39c12;
}

.protection-advice {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    margin: 30px 0;
}

.protection-advice ul {
    margin: 20px 0;
    padding-left: 25px;
}

.protection-advice li {
    margin: 10px 0;
    line-height: 1.6;
}

.support-mission {
    background: linear-gradient(135deg, #27ae60 0%, #2ecc71 100%);
    color: white;
}

.support-options {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: 25px;
    margin: 30px 0;
}

.support-option {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    text-align: center;
    backdrop-filter: blur(10px);
}

.support-btn {
    background: rgba(255,255,255,0.2);
    color: white;
    border: 2px solid white;
    padding: 12px 24px;
    border-radius: 20px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
    margin-top: 15px;
}

.support-btn:hover {
    background: white;
    color: #27ae60;
    transform: translateY(-2px);
}

.transparency-promise {
    background: rgba(255,255,255,0.1);
    border-radius: 15px;
    padding: 25px;
    margin: 30px 0;
}

.transparency-promise ul {
    margin: 15px 0;
    padding-left: 25px;
}

.transparency-promise li {
    margin: 8px 0;
    line-height: 1.5;
}

/* Responsive Design */
@media (max-width: 768px) {
    .dopamine-experience-page {
        padding: 10px;
    }
    
    .addiction-warning {
        padding: 25px;
    }
    
    .addiction-warning h1 {
        font-size: 22px;
    }
    
    .user-stats {
        flex-direction: column;
        align-items: center;
    }
    
    .leaderboard-row {
        grid-template-columns: 1fr;
        gap: 10px;
        text-align: center;
    }
    
    .rewards-showcase {
        flex-direction: column;
        align-items: center;
    }
}
</style>

<script>
function purchaseEvilPoints(package, price, points) {
    alert(`💰 EVIL POINTS PURCHASED! 💰\n\n📦 Package: ${package.toUpperCase()}\n💳 Price: $${price}\n⚡ Points: ${points.toLocaleString()}\n\n🎭 CONGRATULATIONS! 🎭\n\nYou've just experienced "pay-to-progress" monetization!\n\nThis is the same psychology used by:\n• Mobile games (gems, coins, lives)\n• Social media (promoted posts, boosts)\n• Dating apps (super likes, premium features)\n• Professional tools (advanced features)\n\nYour purchase funds real activism while proving our point about predatory monetization!\n\n(The irony is delicious, and it tastes like justice!) 🍰`);
    
    // Update user stats
    const currentPoints = parseInt(document.getElementById('evilPoints').textContent.replace(',', ''));
    document.getElementById('evilPoints').textContent = (currentPoints + points).toLocaleString();
    
    // Show visual effect
    const statsBox = document.getElementById('evilPoints').closest('.stat-box');
    statsBox.style.transform = 'scale(1.2)';
    statsBox.style.background = 'rgba(46, 204, 113, 0.3)';
    setTimeout(() => {
        statsBox.style.transform = '';
        statsBox.style.background = '';
    }, 1000);
}

function filterLeaderboard(filterType) {
    // Update active filter
    document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
    event.target.classList.add('active');
    
    // Simulate filter change
    alert(`📊 LEADERBOARD FILTERED! 📊\n\nFilter: ${filterType.toUpperCase()}\n\n🎭 This demonstrates how social comparison systems work:\n\n• Different filters create different anxiety\n• "Friends only" increases personal pressure\n• "This week" creates urgency\n• "All time" creates long-term inadequacy\n\nSocial media and games use these same filters to maximize engagement and spending through social pressure!`);
}

function participateInEvent() {
    alert(`🎃 EVENT PARTICIPATION! 🎃\n\n⚠️ LIMITED TIME OPPORTUNITY! ⚠️\n\nTo participate in the Corporate Halloween Massacre:\n• Complete 10 evil tasks (free)\n• Buy 5 loot boxes ($124.95)\n• Maintain 30-day streak\n• Purchase event pass ($29.99)\n\n🎭 FOMO ANALYSIS 🎭\n\nThis is classic "fear of missing out" monetization:\n• Limited time creates urgency\n• Exclusive rewards create desire\n• Multiple requirements create spending pressure\n• Social participation creates peer pressure\n\nEvery major app uses events to drive engagement and revenue!\n\n(Don't worry - no actual purchases required here!) 💰`);
}

// Initialize experience
document.addEventListener('DOMContentLoaded', function() {
    // Handle enter button
    document.getElementById('enterExperience').addEventListener('click', function() {
        document.querySelector('.addiction-warning').style.display = 'none';
        document.getElementById('dopaineExperience').style.display = 'block';
        
        // Scroll to top of experience
        document.getElementById('dopaineExperience').scrollIntoView({ behavior: 'smooth' });
        
        // Start event timer
        startEventTimer();
    });
    
    function startEventTimer() {
        let timeLeft = 170595; // 47:23:15 in seconds
        const timerElement = document.getElementById('eventTimer');
        
        setInterval(() => {
            timeLeft--;
            if (timeLeft <= 0) {
                timeLeft = 259200; // Reset to 72 hours (fake urgency continues)
            }
            
            const hours = Math.floor(timeLeft / 3600);
            const minutes = Math.floor((timeLeft % 3600) / 60);
            const seconds = timeLeft % 60;
            
            const hoursSpan = timerElement.querySelector('.hours');
            const minutesSpan = timerElement.querySelector('.minutes');
            const secondsSpan = timerElement.querySelector('.seconds');
            
            if (hoursSpan) hoursSpan.textContent = hours.toString().padStart(2, '0');
            if (minutesSpan) minutesSpan.textContent = minutes.toString().padStart(2, '0');
            if (secondsSpan) secondsSpan.textContent = seconds.toString().padStart(2, '0');
        }, 1000);
    }
});
</script>