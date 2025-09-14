---
layout: default
title: "Greenwashing Calculator - Expose Corporate Environmental Lies"
description: "Interactive tool to expose how corporations fake environmental responsibility while destroying the planet for profit."
permalink: /activities/greenwashing-calculator/
---

<div class="early-section">
    <div class="early-section-header">🌱 Corporate Greenwashing Calculator</div>
    <div class="early-section-content">
        <div style="text-align: center; margin-bottom: 30px; padding: 20px; background: #E8F5E8; border: 1px solid #C8E6C9; border-radius: 8px;">
            <h3 style="color: #2E7D32; margin-bottom: 15px;">🔍 Expose Corporate Environmental Theater</h3>
            <p style="margin-bottom: 10px;"><strong>See how companies manufacture "green" credibility while destroying the environment.</strong></p>
            <p style="font-size: 14px; color: #2E7D32;">Input any company's "green" claims and we'll show you the reality behind the marketing.</p>
        </div>

        <!-- Company Greenwashing Analyzer -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🏭 Corporate Environmental Claims Analyzer</div>
            <div class="early-section-content">
                <div id="greenwashing-analyzer" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>Analyze Any Company's Green Claims</h4>
                    
                    <div style="margin: 20px 0;">
                        <label style="display: block; margin-bottom: 10px; font-weight: bold;">Select a company or enter your own:</label>
                        <select id="company-selector" onchange="loadCompanyData()" style="width: 100%; padding: 8px; border: 1px solid #DDD; border-radius: 4px; margin-bottom: 10px;">
                            <option value="">Choose a company...</option>
                            <option value="exxon">ExxonMobil</option>
                            <option value="bp">BP (British Petroleum)</option>
                            <option value="chevron">Chevron</option>
                            <option value="shell">Shell</option>
                            <option value="amazon">Amazon</option>
                            <option value="walmart">Walmart</option>
                            <option value="nestlé">Nestlé</option>
                            <option value="coca-cola">Coca-Cola</option>
                            <option value="custom">Enter custom company...</option>
                        </select>
                        
                        <div id="custom-company" style="display: none; margin-top: 10px;">
                            <input type="text" id="custom-company-name" placeholder="Enter company name..." style="width: 100%; padding: 8px; border: 1px solid #DDD; border-radius: 4px;">
                        </div>
                    </div>

                    <div id="analysis-results" style="display: none;">
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 20px 0;">
                            <!-- Green Claims Column -->
                            <div>
                                <h5 style="color: #2E7D32; margin-bottom: 15px;">🌱 What They Say</h5>
                                <div id="green-claims" style="background: #E8F5E8; padding: 15px; border-radius: 4px; border: 2px solid #4CAF50;">
                                    <div class="claim-item" style="margin-bottom: 10px; padding: 10px; background: white; border-radius: 4px;">
                                        <div style="font-weight: bold; color: #2E7D32;" id="claim-1">Loading claims...</div>
                                        <div style="font-size: 12px; color: #666; margin-top: 5px;" id="claim-source-1">Source: Company website</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Reality Column -->
                            <div>
                                <h5 style="color: #D32F2F; margin-bottom: 15px;">💨 What They Actually Do</h5>
                                <div id="reality-check" style="background: #FFEBEE; padding: 15px; border-radius: 4px; border: 2px solid #F44336;">
                                    <div class="reality-item" style="margin-bottom: 10px; padding: 10px; background: white; border-radius: 4px;">
                                        <div style="font-weight: bold; color: #D32F2F;" id="reality-1">Loading reality...</div>
                                        <div style="font-size: 12px; color: #666; margin-top: 5px;" id="reality-source-1">Source: Environmental data</div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Greenwashing Score -->
                        <div style="margin: 20px 0; padding: 20px; background: white; border-radius: 8px; border: 1px solid #DDD;">
                            <h5 style="text-align: center; margin-bottom: 15px;">🎭 Greenwashing Score</h5>
                            <div style="text-align: center;">
                                <div id="greenwashing-score" style="font-size: 48px; font-weight: bold; color: #E91E63;">0%</div>
                                <div style="font-size: 14px; color: #666; margin-top: 5px;">Environmental Deception Level</div>
                            </div>
                            
                            <div style="margin-top: 20px;">
                                <div style="background: #F5F5F5; height: 20px; border-radius: 10px; overflow: hidden;">
                                    <div id="score-bar" style="height: 100%; background: linear-gradient(90deg, #4CAF50 0%, #FFC107 50%, #F44336 100%); width: 0%; transition: width 1s ease;"></div>
                                </div>
                                <div style="display: flex; justify-content: space-between; font-size: 12px; color: #666; margin-top: 5px;">
                                    <span>Genuine</span>
                                    <span>Misleading</span>
                                    <span>Pure Theater</span>
                                </div>
                            </div>
                        </div>

                        <!-- Detailed Analysis -->
                        <div id="detailed-analysis" style="margin-top: 20px;">
                            <h5>🔍 Detailed Greenwashing Analysis</h5>
                            <div id="analysis-breakdown" style="background: #FFF3E0; padding: 15px; border-radius: 4px; margin-top: 10px;">
                                <!-- Will be populated by JavaScript -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Carbon Offset Theater -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🎪 Carbon Offset Theater Generator</div>
            <div class="early-section-content">
                <p><strong>Generate your own carbon offset scam like the corporations do!</strong></p>
                
                <div id="offset-generator" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>Create Your Carbon Offset Campaign</h4>
                    
                    <div style="margin: 20px 0;">
                        <label style="display: block; margin-bottom: 10px;">Your company's actual emissions (tons CO2/year):</label>
                        <input type="number" id="actual-emissions" value="1000000" min="1000" style="width: 100%; padding: 8px; border: 1px solid #DDD; border-radius: 4px;">
                    </div>
                    
                    <div style="margin: 20px 0;">
                        <label style="display: block; margin-bottom: 10px;">Select your greenwashing strategy:</label>
                        <select id="offset-strategy" onchange="generateOffsetCampaign()" style="width: 100%; padding: 8px; border: 1px solid #DDD; border-radius: 4px;">
                            <option value="">Choose your deception...</option>
                            <option value="tree-planting">Tree Planting (Classic Delay Tactic)</option>
                            <option value="renewable-credits">Renewable Energy Credits (Double Counting)</option>
                            <option value="methane-capture">Methane Capture (Unverifiable Claims)</option>
                            <option value="forest-protection">Forest Protection (Paying for What's Already Protected)</option>
                            <option value="direct-air">Direct Air Capture (Expensive Theater)</option>
                        </select>
                    </div>
                    
                    <div id="offset-campaign" style="display: none; margin-top: 20px;">
                        <div style="padding: 20px; background: #E8F5E8; border-radius: 8px; border: 2px solid #4CAF50;">
                            <h5 style="color: #2E7D32; margin-top: 0;">🌱 Your Carbon Neutral Campaign™</h5>
                            <div id="campaign-text" style="font-style: italic; margin-bottom: 15px;">
                                <!-- Generated campaign text -->
                            </div>
                            
                            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(120px, 1fr)); gap: 10px; margin: 20px 0;">
                                <div style="text-align: center; padding: 10px; background: white; border-radius: 4px;">
                                    <div style="font-size: 20px; font-weight: bold; color: #4CAF50;" id="offset-cost">$50,000</div>
                                    <div style="font-size: 12px; color: #666;">Offset Cost</div>
                                </div>
                                <div style="text-align: center; padding: 10px; background: white; border-radius: 4px;">
                                    <div style="font-size: 20px; font-weight: bold; color: #FF9800;" id="actual-reduction">2%</div>
                                    <div style="font-size: 12px; color: #666;">Actual Reduction</div>
                                </div>
                                <div style="text-align: center; padding: 10px; background: white; border-radius: 4px;">
                                    <div style="font-size: 20px; font-weight: bold; color: #E91E63;" id="pr-value">$2M</div>
                                    <div style="font-size: 12px; color: #666;">PR Value</div>
                                </div>
                            </div>
                            
                            <div id="offset-reality" style="background: #FFEBEE; padding: 15px; border-radius: 4px; border: 1px solid #FFCDD2; margin-top: 15px;">
                                <h6 style="color: #D32F2F; margin-top: 0;">😈 The Reality Behind Your Offset</h6>
                                <p style="margin-bottom: 0; font-size: 14px;" id="reality-explanation">
                                    <!-- Reality explanation will be populated -->
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ESG Score Manipulator -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">📊 ESG Score Manipulator</div>
            <div class="early-section-content">
                <p><strong>See how companies game Environmental, Social, and Governance ratings!</strong></p>
                
                <div id="esg-manipulator" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>Boost Your ESG Score Without Actually Improving</h4>
                    
                    <div style="margin: 20px 0; display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px;">
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px;">
                            <div style="font-size: 32px; font-weight: bold; color: #E91E63;" id="esg-score">45</div>
                            <div style="font-size: 12px; color: #666;">Current ESG Score</div>
                            <div style="font-size: 10px; color: #999;">(Out of 100)</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px;">
                            <div style="font-size: 32px; font-weight: bold; color: #FF9800;" id="pr-spend">$0</div>
                            <div style="font-size: 12px; color: #666;">PR Investment</div>
                            <div style="font-size: 10px; color: #999;">(Marketing only)</div>
                        </div>
                        <div style="text-align: center; padding: 15px; background: white; border-radius: 4px;">
                            <div style="font-size: 32px; font-weight: bold; color: #4CAF50;" id="actual-improvement">0%</div>
                            <div style="font-size: 12px; color: #666;">Real Improvement</div>
                            <div style="font-size: 10px; color: #999;">(Actual practices)</div>
                        </div>
                    </div>
                    
                    <h5 style="margin-top: 30px;">🎭 Select Your ESG Theater Tactics</h5>
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 15px; margin: 20px 0;">
                        <label style="display: flex; align-items: center; padding: 10px; background: white; border-radius: 4px; cursor: pointer;">
                            <input type="checkbox" onchange="updateESGScore()" data-points="8" data-cost="50000" data-improvement="0" style="margin-right: 10px;">
                            <div>
                                <div style="font-weight: bold;">Diversity Photo Ops</div>
                                <div style="font-size: 12px; color: #666;">+8 points, $50k cost, 0% real change</div>
                            </div>
                        </label>
                        
                        <label style="display: flex; align-items: center; padding: 10px; background: white; border-radius: 4px; cursor: pointer;">
                            <input type="checkbox" onchange="updateESGScore()" data-points="12" data-cost="100000" data-improvement="0" style="margin-right: 10px;">
                            <div>
                                <div style="font-weight: bold;">Sustainability Report</div>
                                <div style="font-size: 12px; color: #666;">+12 points, $100k cost, 0% real change</div>
                            </div>
                        </label>
                        
                        <label style="display: flex; align-items: center; padding: 10px; background: white; border-radius: 4px; cursor: pointer;">
                            <input type="checkbox" onchange="updateESGScore()" data-points="6" data-cost="25000" data-improvement="0" style="margin-right: 10px;">
                            <div>
                                <div style="font-weight: bold;">Green Logo Redesign</div>
                                <div style="font-size: 12px; color: #666;">+6 points, $25k cost, 0% real change</div>
                            </div>
                        </label>
                        
                        <label style="display: flex; align-items: center; padding: 10px; background: white; border-radius: 4px; cursor: pointer;">
                            <input type="checkbox" onchange="updateESGScore()" data-points="15" data-cost="200000" data-improvement="1" style="margin-right: 10px;">
                            <div>
                                <div style="font-weight: bold;">Carbon Offset Purchase</div>
                                <div style="font-size: 12px; color: #666;">+15 points, $200k cost, 1% real change</div>
                            </div>
                        </label>
                        
                        <label style="display: flex; align-items: center; padding: 10px; background: white; border-radius: 4px; cursor: pointer;">
                            <input type="checkbox" onchange="updateESGScore()" data-points="20" data-cost="500000" data-improvement="0" style="margin-right: 10px;">
                            <div>
                                <div style="font-weight: bold;">ESG Consultant Firm</div>
                                <div style="font-size: 12px; color: #666;">+20 points, $500k cost, 0% real change</div>
                            </div>
                        </label>
                        
                        <label style="display: flex; align-items: center; padding: 10px; background: white; border-radius: 4px; cursor: pointer;">
                            <input type="checkbox" onchange="updateESGScore()" data-points="10" data-cost="1000000" data-improvement="5" style="margin-right: 10px;">
                            <div>
                                <div style="font-weight: bold;">Actual Environmental Upgrades</div>
                                <div style="font-size: 12px; color: #666;">+10 points, $1M cost, 5% real change</div>
                            </div>
                        </label>
                    </div>
                    
                    <div id="esg-analysis" style="margin-top: 20px; padding: 15px; background: #FFF3E0; border-radius: 4px;">
                        <h6 style="margin-top: 0; color: #E65100;">💡 ESG Gaming Analysis</h6>
                        <p style="margin-bottom: 0; font-size: 14px;">Select tactics above to see how companies boost ESG scores through marketing rather than meaningful change. Notice how the cheapest options provide the most points!</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Fight Corporate Environmental Lies</div>
            <div class="early-section-content">
                <div style="text-align: center; padding: 30px; background: #E8F4F8; border-radius: 8px;">
                    <h3 style="color: #003366; margin-bottom: 15px;">Now You Know Their Tricks</h3>
                    <p style="margin-bottom: 20px;">You've seen how corporations manufacture environmental credibility while continuing to destroy the planet. Use this knowledge to see through their greenwashing.</p>
                    
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 20px;">
                        <a href="/articles/corporate-greenwashing-environmental-lies-for-profit/" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Read Exposés</a>
                        <a href="/education/masterclass-environmental-destruction/" class="early-nav-link" style="background: #4477AA; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Learn More</a>
                        <a href="/membership/" class="early-nav-link" style="background: #6699CC; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Support Research</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Company data for greenwashing analysis
const companyData = {
    exxon: {
        name: "ExxonMobil",
        claims: [
            "Committed to carbon neutrality by 2050",
            "Investing $15 billion in clean technology",
            "Leading the energy transition"
        ],
        claimSources: [
            "ExxonMobil sustainability report 2023",
            "Corporate website",
            "CEO public statement"
        ],
        reality: [
            "Spent $41 billion on climate denial lobbying since 1989",
            "Actual clean tech investment: 0.2% of revenue",
            "Increased fossil fuel production by 15% in 2023"
        ],
        realitySources: [
            "InfluenceMap lobbying database",
            "SEC financial filings",
            "Environmental Protection Agency data"
        ],
        score: 89,
        analysis: "ExxonMobil exemplifies greenwashing perfection: massive marketing budgets promote 'clean energy' while 99.8% of business remains fossil fuels. Their climate pledges are safely set 27 years in the future - after current executives retire."
    },
    bp: {
        name: "BP (British Petroleum)", 
        claims: [
            "Beyond Petroleum - reimagining energy",
            "$5 billion investment in renewable energy",
            "Net zero emissions by 2050"
        ],
        claimSources: [
            "BP corporate rebranding campaign",
            "Annual sustainability report", 
            "Climate strategy announcement"
        ],
        reality: [
            "95% of investments still in oil and gas",
            "Renewable investment: 3% of total capex",
            "Oil production increased 12% since 'Beyond Petroleum' rebrand"
        ],
        realitySources: [
            "BP annual report 2023",
            "Financial Times analysis",
            "International Energy Agency data"
        ],
        score: 85,
        analysis: "BP pioneered corporate greenwashing with 'Beyond Petroleum' while dramatically increasing oil extraction. They've mastered the art of talking green while drilling deeper."
    },
    amazon: {
        name: "Amazon",
        claims: [
            "Climate Pledge: net zero by 2040",
            "$10 billion Earth Fund commitment",
            "100% renewable energy by 2025"
        ],
        claimSources: [
            "Amazon Climate Pledge announcement",
            "Bezos Earth Fund website",
            "Sustainability report"
        ],
        reality: [
            "Carbon emissions increased 15% year-over-year",
            "Massive AWS cloud servers powered by fossil fuels",
            "Lobbied against climate legislation 47 times in 2023"
        ],
        realitySources: [
            "Amazon sustainability report",
            "Greenpeace cloud energy analysis",
            "Corporate lobbying disclosure database"
        ],
        score: 78,
        analysis: "Amazon uses massive PR spending to overshadow their accelerating emissions growth. Their 'renewable' claims ignore the fossil fuel reality of their largest profit center: AWS data centers."
    },
    nestlé: {
        name: "Nestlé",
        claims: [
            "Net zero emissions by 2050",
            "Regenerative agriculture across supply chain",
            "Carbon neutral coffee by 2025"
        ],
        claimSources: [
            "Nestlé Net Zero Roadmap",
            "Sustainability website",
            "Nespresso sustainability campaign"
        ],
        reality: [
            "Continues massive deforestation in Brazil",
            "Water extraction from drought-stricken communities",
            "Palm oil sourcing linked to rainforest destruction"
        ],
        realitySources: [
            "Mighty Earth deforestation report",
            "Guardian investigation on water rights",
            "Greenpeace palm oil tracker"
        ],
        score: 82,
        analysis: "Nestlé perfects 'sustainability theater' while maintaining extraction-based business model. Their regenerative agriculture claims mask continued systematic environmental destruction."
    }
};

function loadCompanyData() {
    const selector = document.getElementById('company-selector');
    const customDiv = document.getElementById('custom-company');
    const resultsDiv = document.getElementById('analysis-results');
    
    if (selector.value === 'custom') {
        customDiv.style.display = 'block';
        resultsDiv.style.display = 'none';
        return;
    } else {
        customDiv.style.display = 'none';
    }
    
    if (!selector.value) {
        resultsDiv.style.display = 'none';
        return;
    }
    
    const company = companyData[selector.value];
    if (!company) return;
    
    // Populate claims
    const claimsDiv = document.getElementById('green-claims');
    claimsDiv.innerHTML = company.claims.map((claim, index) => `
        <div class="claim-item" style="margin-bottom: 10px; padding: 10px; background: white; border-radius: 4px;">
            <div style="font-weight: bold; color: #2E7D32;">${claim}</div>
            <div style="font-size: 12px; color: #666; margin-top: 5px;">Source: ${company.claimSources[index] || 'Company materials'}</div>
        </div>
    `).join('');
    
    // Populate reality
    const realityDiv = document.getElementById('reality-check');
    realityDiv.innerHTML = company.reality.map((reality, index) => `
        <div class="reality-item" style="margin-bottom: 10px; padding: 10px; background: white; border-radius: 4px;">
            <div style="font-weight: bold; color: #D32F2F;">${reality}</div>
            <div style="font-size: 12px; color: #666; margin-top: 5px;">Source: ${company.realitySources[index] || 'Independent research'}</div>
        </div>
    `).join('');
    
    // Update score
    document.getElementById('greenwashing-score').textContent = `${company.score}%`;
    document.getElementById('score-bar').style.width = `${company.score}%`;
    
    // Add analysis
    document.getElementById('analysis-breakdown').innerHTML = `
        <h6 style="margin-top: 0; color: #E65100;">Analysis: ${company.name}</h6>
        <p style="margin-bottom: 0; font-size: 14px;">${company.analysis}</p>
    `;
    
    resultsDiv.style.display = 'block';
}

// Carbon offset generator
function generateOffsetCampaign() {
    const strategy = document.getElementById('offset-strategy').value;
    const emissions = parseInt(document.getElementById('actual-emissions').value) || 1000000;
    
    if (!strategy) {
        document.getElementById('offset-campaign').style.display = 'none';
        return;
    }
    
    const strategies = {
        'tree-planting': {
            text: `🌳 We're proud to announce our partnership with TreePlant Corp to plant 2 million trees over the next 20 years! This exciting initiative will offset 100% of our current carbon footprint, making us carbon neutral TODAY! 🎉`,
            cost: Math.round(emissions * 0.05),
            reduction: 2,
            prValue: Math.round(emissions * 2),
            reality: `Reality: Trees take 20+ years to mature, most die within 5 years, and this offsets nothing from your current emissions. You're literally paying to plant seeds while continuing to pollute. Classic delay tactic.`
        },
        'renewable-credits': {
            text: `⚡ Through innovative Renewable Energy Credit purchases, we're now 100% carbon neutral! Our strategic investment in clean energy certificates proves our commitment to a sustainable future! 🌞`,
            cost: Math.round(emissions * 0.08),
            reduction: 0,
            prValue: Math.round(emissions * 1.5),
            reality: `Reality: You bought credits for renewable energy that was already being produced. No new clean energy was created. It's like claiming you reduced traffic by buying someone else's bus pass.`
        },
        'methane-capture': {
            text: `🏭 Our cutting-edge methane capture partnership eliminates greenhouse gases from landfills across the developing world! This groundbreaking technology makes us carbon negative! 🌍`,
            cost: Math.round(emissions * 0.12),
            reduction: 1,
            prValue: Math.round(emissions * 3),
            reality: `Reality: Methane capture projects are notoriously unverifiable, often don't exist as claimed, and many would have happened anyway. You're paying for theoretical emissions reductions.`
        },
        'forest-protection': {
            text: `🌲 We're protecting 50,000 acres of pristine rainforest! Our Forest Guardian program ensures these vital carbon sinks remain untouched, offsetting our entire carbon footprint! 🦜`,
            cost: Math.round(emissions * 0.03),
            reduction: 0,
            prValue: Math.round(emissions * 2.5),
            reality: `Reality: You're paying to 'protect' forests that were already protected by law. It's like paying someone not to rob a bank. No additional climate benefit, just greenwashing theater.`
        },
        'direct-air': {
            text: `🚀 Our revolutionary Direct Air Capture investment removes CO2 directly from the atmosphere! This space-age technology proves our leadership in climate innovation! ✨`,
            cost: Math.round(emissions * 0.5),
            reduction: 0.1,
            prValue: Math.round(emissions * 4),
            reality: `Reality: Direct air capture is incredibly expensive and energy-intensive, often powered by fossil fuels. You're paying premium prices for technology that barely works at scale.`
        }
    };
    
    const campaign = strategies[strategy];
    
    document.getElementById('campaign-text').textContent = campaign.text;
    document.getElementById('offset-cost').textContent = `$${campaign.cost.toLocaleString()}`;
    document.getElementById('actual-reduction').textContent = `${campaign.reduction}%`;
    document.getElementById('pr-value').textContent = `$${campaign.prValue.toLocaleString()}`;
    document.getElementById('reality-explanation').textContent = campaign.reality;
    
    document.getElementById('offset-campaign').style.display = 'block';
}

// ESG Score manipulator
function updateESGScore() {
    const checkboxes = document.querySelectorAll('#esg-manipulator input[type="checkbox"]:checked');
    let totalPoints = 45; // Base score
    let totalCost = 0;
    let realImprovement = 0;
    
    checkboxes.forEach(checkbox => {
        totalPoints += parseInt(checkbox.dataset.points) || 0;
        totalCost += parseInt(checkbox.dataset.cost) || 0;
        realImprovement += parseInt(checkbox.dataset.improvement) || 0;
    });
    
    document.getElementById('esg-score').textContent = Math.min(totalPoints, 100);
    document.getElementById('pr-spend').textContent = `$${totalCost.toLocaleString()}`;
    document.getElementById('actual-improvement').textContent = `${realImprovement}%`;
    
    const analysis = document.getElementById('esg-analysis');
    if (checkboxes.length > 0) {
        const scorePerDollar = totalPoints / (totalCost || 1) * 1000;
        const realEfficiency = realImprovement / (totalCost || 1) * 1000000;
        
        analysis.innerHTML = `
            <h6 style="margin-top: 0; color: #E65100;">💡 Your ESG Gaming Results</h6>
            <p style="font-size: 14px; margin-bottom: 10px;">You've boosted your ESG score by ${totalPoints - 45} points for just $${totalCost.toLocaleString()}, but only achieved ${realImprovement}% actual improvement.</p>
            <p style="font-size: 14px; margin-bottom: 0;"><strong>ESG Gaming Efficiency:</strong> ${scorePerDollar.toFixed(2)} points per $1,000 spent on marketing vs ${realEfficiency.toFixed(4)} actual improvement per $1,000. Notice the pattern?</p>
        `;
    }
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    // Add some sample data to offset calculator
    setTimeout(() => {
        if (document.getElementById('actual-emissions').value) {
            // Auto-populate with a sample strategy for demo
            document.getElementById('offset-strategy').value = 'tree-planting';
            generateOffsetCampaign();
        }
    }, 1000);
});
</script>

<style>
.claim-item, .reality-item {
    transition: all 0.3s ease;
}

.claim-item:hover {
    background: #E8F5E8 !important;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

.reality-item:hover {
    background: #FFEBEE !important;
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

#score-bar {
    transition: width 1s ease-in-out;
}

input[type="checkbox"] {
    transform: scale(1.2);
}

label:hover {
    background: #F5F5F5 !important;
    transform: translateY(-1px);
    transition: all 0.2s ease;
}

button:hover, select:hover, input:hover {
    opacity: 0.9;
    transform: translateY(-1px);
    transition: all 0.2s ease;
}

.early-section-header {
    font-size: 24px;
    font-weight: bold;
    color: #003366;
    margin-bottom: 15px;
    border-bottom: 2px solid #003366;
    padding-bottom: 5px;
}
</style>