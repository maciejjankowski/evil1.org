---
layout: default
title: "Regulatory Capture Game - Control Government Agencies"
description: "Interactive game showing how corporations capture and control the very agencies meant to regulate them."
permalink: /activities/regulatory-capture-game/
---

<div class="early-section">
    <div class="early-section-header">🏛️ Regulatory Capture Strategy Game</div>
    <div class="early-section-content">
        <div style="text-align: center; margin-bottom: 30px; padding: 20px; background: #FFF3E0; border: 1px solid #FFB74D; border-radius: 8px;">
            <h3 style="color: #E65100; margin-bottom: 15px;">⚠️ Government Control Simulation</h3>
            <p style="margin-bottom: 10px;"><strong>Learn how corporations capture the agencies meant to regulate them.</strong></p>
            <p style="font-size: 14px; color: #E65100;">Master the art of converting oversight into competitive advantage!</p>
        </div>

        <!-- Agency Selection -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🏢 Choose Your Target Agency</div>
            <div class="early-section-content">
                <div id="agency-selector" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>Select the Agency You Want to Capture</h4>
                    
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 15px; margin: 20px 0;">
                        
                        <!-- SEC -->
                        <div class="agency-card" onclick="selectAgency('sec')" style="border: 2px solid #DDD; border-radius: 8px; padding: 15px; background: white; cursor: pointer; transition: all 0.3s ease;">
                            <div style="display: flex; align-items: center; margin-bottom: 10px;">
                                <div style="font-size: 24px; margin-right: 10px;">💰</div>
                                <div>
                                    <h5 style="margin: 0; color: #333;">SEC</h5>
                                    <div style="font-size: 12px; color: #666;">Securities & Exchange Commission</div>
                                </div>
                            </div>
                            <div style="font-size: 13px; color: #666; margin-bottom: 10px;">
                                Regulates financial markets and protects investors
                            </div>
                            <div style="font-size: 11px; background: #E3F2FD; padding: 5px 8px; border-radius: 3px;">
                                <strong>Capture Difficulty:</strong> Medium • <strong>Value:</strong> $100B+
                            </div>
                        </div>

                        <!-- EPA -->
                        <div class="agency-card" onclick="selectAgency('epa')" style="border: 2px solid #DDD; border-radius: 8px; padding: 15px; background: white; cursor: pointer; transition: all 0.3s ease;">
                            <div style="display: flex; align-items: center; margin-bottom: 10px;">
                                <div style="font-size: 24px; margin-right: 10px;">🌍</div>
                                <div>
                                    <h5 style="margin: 0; color: #333;">EPA</h5>
                                    <div style="font-size: 12px; color: #666;">Environmental Protection Agency</div>
                                </div>
                            </div>
                            <div style="font-size: 13px; color: #666; margin-bottom: 10px;">
                                Protects environmental and human health
                            </div>
                            <div style="font-size: 11px; background: #E8F5E8; padding: 5px 8px; border-radius: 3px;">
                                <strong>Capture Difficulty:</strong> High • <strong>Value:</strong> $50B+
                            </div>
                        </div>

                        <!-- FDA -->
                        <div class="agency-card" onclick="selectAgency('fda')" style="border: 2px solid #DDD; border-radius: 8px; padding: 15px; background: white; cursor: pointer; transition: all 0.3s ease;">
                            <div style="display: flex; align-items: center; margin-bottom: 10px;">
                                <div style="font-size: 24px; margin-right: 10px;">💊</div>
                                <div>
                                    <h5 style="margin: 0; color: #333;">FDA</h5>
                                    <div style="font-size: 12px; color: #666;">Food & Drug Administration</div>
                                </div>
                            </div>
                            <div style="font-size: 13px; color: #666; margin-bottom: 10px;">
                                Regulates food safety and pharmaceutical approval
                            </div>
                            <div style="font-size: 11px; background: #FFEBEE; padding: 5px 8px; border-radius: 3px;">
                                <strong>Capture Difficulty:</strong> Medium • <strong>Value:</strong> $200B+
                            </div>
                        </div>

                        <!-- FCC -->
                        <div class="agency-card" onclick="selectAgency('fcc')" style="border: 2px solid #DDD; border-radius: 8px; padding: 15px; background: white; cursor: pointer; transition: all 0.3s ease;">
                            <div style="display: flex; align-items: center; margin-bottom: 10px;">
                                <div style="font-size: 24px; margin-right: 10px;">📡</div>
                                <div>
                                    <h5 style="margin: 0; color: #333;">FCC</h5>
                                    <div style="font-size: 12px; color: #666;">Federal Communications Commission</div>
                                </div>
                            </div>
                            <div style="font-size: 13px; color: #666; margin-bottom: 10px;">
                                Regulates communications and internet services
                            </div>
                            <div style="font-size: 11px; background: #FFF3E0; padding: 5px 8px; border-radius: 3px;">
                                <strong>Capture Difficulty:</strong> Low • <strong>Value:</strong> $80B+
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <!-- Capture Strategy Game -->
        <div id="capture-game" style="display: none;" class="early-section">
            <div class="early-section-header">🎯 Execute Your Capture Strategy</div>
            <div class="early-section-content">
                <div style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    
                    <!-- Agency Info -->
                    <div id="agency-info" style="background: white; padding: 20px; border-radius: 8px; margin-bottom: 20px;">
                        <h4 id="agency-name">Agency Name</h4>
                        <div id="agency-description">Agency description will appear here</div>
                        
                        <!-- Current Status -->
                        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(120px, 1fr)); gap: 15px; margin-top: 20px;">
                            <div style="text-align: center; padding: 10px; background: #F8F9FA; border-radius: 4px;">
                                <div style="font-size: 20px; font-weight: bold; color: #E91E63;" id="capture-level">0%</div>
                                <div style="font-size: 12px; color: #666;">Capture Level</div>
                            </div>
                            <div style="text-align: center; padding: 10px; background: #F8F9FA; border-radius: 4px;">
                                <div style="font-size: 20px; font-weight: bold; color: #FF9800;" id="investment">$0M</div>
                                <div style="font-size: 12px; color: #666;">Investment</div>
                            </div>
                            <div style="text-align: center; padding: 10px; background: #F8F9FA; border-radius: 4px;">
                                <div style="font-size: 20px; font-weight: bold; color: #4CAF50;" id="annual-benefit">$0B</div>
                                <div style="font-size: 12px; color: #666;">Annual Benefit</div>
                            </div>
                            <div style="text-align: center; padding: 10px; background: #F8F9FA; border-radius: 4px;">
                                <div style="font-size: 20px; font-weight: bold; color: #2196F3;" id="roi">0x</div>
                                <div style="font-size: 12px; color: #666;">ROI Multiple</div>
                            </div>
                        </div>
                    </div>

                    <!-- Capture Tactics -->
                    <h5>🎭 Select Your Capture Tactics</h5>
                    <div id="capture-tactics" style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 15px; margin: 20px 0;">
                        <!-- Tactics will be populated by JavaScript -->
                    </div>

                    <!-- Progress Bar -->
                    <div style="margin: 20px 0;">
                        <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                            <span style="font-size: 14px; font-weight: bold;">Agency Capture Progress</span>
                            <span style="font-size: 14px;" id="progress-percent">0%</span>
                        </div>
                        <div style="background: #E0E0E0; height: 20px; border-radius: 10px; overflow: hidden;">
                            <div id="progress-bar" style="height: 100%; background: linear-gradient(90deg, #FFC107 0%, #FF9800 50%, #E91E63 100%); width: 0%; transition: width 0.5s ease;"></div>
                        </div>
                        <div style="display: flex; justify-content: space-between; font-size: 11px; color: #666; margin-top: 5px;">
                            <span>Independent</span>
                            <span>Influenced</span>
                            <span>Captured</span>
                        </div>
                    </div>

                    <!-- Results -->
                    <div id="capture-results" style="display: none; margin-top: 20px; padding: 20px; background: white; border-radius: 8px;">
                        <h5 style="margin-top: 0;">🏆 Capture Success!</h5>
                        <div id="success-message"></div>
                        
                        <div style="margin-top: 15px; padding: 15px; background: #FFF3E0; border-radius: 4px;">
                            <h6 style="margin-top: 0; color: #E65100;">💡 Real-World Impact</h6>
                            <div id="real-impact"></div>
                        </div>
                        
                        <div style="text-align: center; margin-top: 20px;">
                            <button onclick="resetGame()" style="background: #2196F3; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">Try Another Agency</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Real Examples -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">📚 Real Regulatory Capture Examples</div>
            <div class="early-section-content">
                <p><strong>These tactics aren't theoretical - here's how it actually happens:</strong></p>
                
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin: 20px 0;">
                    
                    <!-- Pharmaceutical Industry & FDA -->
                    <div style="border: 1px solid #DDD; border-radius: 8px; padding: 20px; background: white;">
                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <div style="font-size: 32px; margin-right: 15px;">💊</div>
                            <div>
                                <h5 style="margin: 0; color: #333;">Big Pharma → FDA</h5>
                                <div style="font-size: 12px; color: #666;">The Revolving Door Classic</div>
                            </div>
                        </div>
                        
                        <div style="font-size: 13px; color: #666; margin-bottom: 15px;">
                            <strong>Method:</strong> FDA officials regularly leave to work for pharmaceutical companies, then return to FDA in senior positions.
                        </div>
                        
                        <div style="background: #FFEBEE; padding: 10px; border-radius: 4px; margin-bottom: 10px;">
                            <div style="font-size: 12px; color: #C62828;"><strong>Example:</strong> Scott Gottlieb served as FDA Commissioner, then joined Pfizer's board. This pattern repeats constantly.</div>
                        </div>
                        
                        <div style="font-size: 11px; color: #666;">
                            <strong>Result:</strong> Faster drug approvals, weaker safety standards, higher pharmaceutical profits
                        </div>
                    </div>

                    <!-- Oil Industry & EPA -->
                    <div style="border: 1px solid #DDD; border-radius: 8px; padding: 20px; background: white;">
                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <div style="font-size: 32px; margin-right: 15px;">🛢️</div>
                            <div>
                                <h5 style="margin: 0; color: #333;">Oil Industry → EPA</h5>
                                <div style="font-size: 12px; color: #666;">Environmental Protection Reversal</div>
                            </div>
                        </div>
                        
                        <div style="font-size: 13px; color: #666; margin-bottom: 15px;">
                            <strong>Method:</strong> Place industry executives directly into EPA leadership positions to dismantle environmental protections.
                        </div>
                        
                        <div style="background: #FFEBEE; padding: 10px; border-radius: 4px; margin-bottom: 10px;">
                            <div style="font-size: 12px; color: #C62828;"><strong>Example:</strong> Andrew Wheeler (former coal lobbyist) led EPA, reversed dozens of environmental regulations.</div>
                        </div>
                        
                        <div style="font-size: 11px; color: #666;">
                            <strong>Result:</strong> Weakened pollution standards, increased extraction permits, billions in compliance cost savings
                        </div>
                    </div>

                    <!-- Wall Street & SEC -->
                    <div style="border: 1px solid #DDD; border-radius: 8px; padding: 20px; background: white;">
                        <div style="display: flex; align-items: center; margin-bottom: 15px;">
                            <div style="font-size: 32px; margin-right: 15px;">🏦</div>
                            <div>
                                <h5 style="margin: 0; color: #333;">Wall Street → SEC</h5>
                                <div style="font-size: 12px; color: #666;">Financial Regulation Nullification</div>
                            </div>
                        </div>
                        
                        <div style="font-size: 13px; color: #666; margin-bottom: 15px;">
                            <strong>Method:</strong> Promise lucrative private sector jobs to SEC staff in exchange for lenient enforcement.
                        </div>
                        
                        <div style="background: #FFEBEE; padding: 10px; border-radius: 4px; margin-bottom: 10px;">
                            <div style="font-size: 12px; color: #C62828;"><strong>Example:</strong> Mary Schapiro left SEC to join Promontory Financial Group, earning millions from banks she once regulated.</div>
                        </div>
                        
                        <div style="font-size: 11px; color: #666;">
                            <strong>Result:</strong> Minimal prosecutions after 2008 crisis, continued risky trading, massive bonus culture
                        </div>
                    </div>

                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Break the Capture</div>
            <div class="early-section-content">
                <div style="text-align: center; padding: 30px; background: #E8F4F8; border-radius: 8px;">
                    <h3 style="color: #003366; margin-bottom: 15px;">Government Should Serve People, Not Corporations</h3>
                    <p style="margin-bottom: 20px;">Regulatory capture turns public agencies into corporate profit centers. The agencies meant to protect us become tools to exploit us.</p>
                    
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 20px;">
                        <a href="/articles/" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Read Exposés</a>
                        <a href="/education/" class="early-nav-link" style="background: #4477AA; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Learn Solutions</a>
                        <a href="/membership/" class="early-nav-link" style="background: #6699CC; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Fight Back</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Agency data
const agencies = {
    sec: {
        name: "Securities & Exchange Commission (SEC)",
        description: "The SEC is supposed to protect investors and maintain fair, orderly, and efficient markets. Instead, it often serves as a training ground for future Wall Street executives.",
        icon: "💰",
        baseBenefit: 100, // billions
        difficulty: 60, // 0-100
        tactics: [
            {
                name: "Revolving Door Program",
                cost: 5,
                effectiveness: 25,
                description: "Hire SEC alumni at premium salaries, creating incentive for lenient enforcement"
            },
            {
                name: "Industry 'Consultation' Fees", 
                cost: 10,
                effectiveness: 20,
                description: "Pay SEC staff consulting fees for 'expert advice' on regulations"
            },
            {
                name: "Regulatory Comment Flooding",
                cost: 15,
                effectiveness: 15,
                description: "Submit thousands of technical comments to delay and weaken new rules"
            },
            {
                name: "Academic Research Funding",
                cost: 8,
                effectiveness: 10,
                description: "Fund studies at universities to produce favorable regulatory research"
            },
            {
                name: "Industry Capture Board Seats",
                cost: 25,
                effectiveness: 30,
                description: "Secure positions on key SEC advisory committees for industry insiders"
            }
        ]
    },
    epa: {
        name: "Environmental Protection Agency (EPA)",
        description: "The EPA protects human health and the environment. Corporate capture converts it into an environmental destruction enabler.",
        icon: "🌍",
        baseBenefit: 50,
        difficulty: 80,
        tactics: [
            {
                name: "Industry Executive Placement",
                cost: 20,
                effectiveness: 35,
                description: "Place former oil/chemical executives directly into EPA leadership positions"
            },
            {
                name: "Scientific Advisory Panel Stacking",
                cost: 15,
                effectiveness: 25,
                description: "Fill scientific advisory panels with industry-funded researchers"
            },
            {
                name: "Regulatory Cost-Benefit Manipulation",
                cost: 12,
                effectiveness: 20,
                description: "Fund economic studies that inflate costs and minimize benefits of regulation"
            },
            {
                name: "State-Level Pressure Campaigns",
                cost: 18,
                effectiveness: 15,
                description: "Use state governments to pressure EPA into weaker federal standards"
            },
            {
                name: "Legal Challenge Harassment",
                cost: 30,
                effectiveness: 25,
                description: "Launch endless lawsuits to delay and weaken environmental regulations"
            }
        ]
    },
    fda: {
        name: "Food & Drug Administration (FDA)",
        description: "The FDA ensures food safety and pharmaceutical efficacy. Capture turns it into a profit approval machine.",
        icon: "💊",
        baseBenefit: 200,
        difficulty: 65,
        tactics: [
            {
                name: "Accelerated Approval Lobbying",
                cost: 25,
                effectiveness: 30,
                description: "Push for 'fast track' approvals that bypass safety testing"
            },
            {
                name: "User Fee Dependency Creation",
                cost: 35,
                effectiveness: 25,
                description: "Make FDA dependent on pharmaceutical company fees for operations"
            },
            {
                name: "Post-Market Surveillance Weakening",
                cost: 15,
                effectiveness: 20,
                description: "Lobby to reduce requirements for monitoring drug safety after approval"
            },
            {
                name: "Advisory Committee Stacking",
                cost: 20,
                effectiveness: 20,
                description: "Place industry-tied experts on drug approval advisory committees"
            },
            {
                name: "Regulatory Science Funding",
                cost: 18,
                effectiveness: 15,
                description: "Fund FDA's 'regulatory science' programs to influence approval criteria"
            }
        ]
    },
    fcc: {
        name: "Federal Communications Commission (FCC)",
        description: "The FCC regulates interstate communications. Corporate capture enables monopolization and consumer exploitation.",
        icon: "📡",
        baseBenefit: 80,
        difficulty: 40,
        tactics: [
            {
                name: "Telecom Executive Rotation",
                cost: 8,
                effectiveness: 30,
                description: "Rotate executives between major telecom companies and FCC leadership"
            },
            {
                name: "Net Neutrality Elimination",
                cost: 12,
                effectiveness: 25,
                description: "Lobby to eliminate net neutrality protections for internet fast lanes"
            },
            {
                name: "Merger Approval Streamlining",
                cost: 15,
                effectiveness: 20,
                description: "Weaken merger review processes to enable telecommunications monopolies"
            },
            {
                name: "Public Comment Manipulation",
                cost: 10,
                effectiveness: 15,
                description: "Use bots and fake accounts to flood public comment periods"
            },
            {
                name: "State Preemption Campaigns",
                cost: 20,
                effectiveness: 25,
                description: "Block state and local broadband competition through federal preemption"
            }
        ]
    }
};

let currentAgency = null;
let selectedTactics = [];
let totalInvestment = 0;
let captureLevel = 0;

function selectAgency(agencyId) {
    currentAgency = agencies[agencyId];
    
    // Reset game state
    selectedTactics = [];
    totalInvestment = 0;
    captureLevel = 0;
    
    // Update UI
    document.getElementById('agency-name').innerHTML = `${currentAgency.icon} ${currentAgency.name}`;
    document.getElementById('agency-description').textContent = currentAgency.description;
    
    // Populate tactics
    const tacticsDiv = document.getElementById('capture-tactics');
    tacticsDiv.innerHTML = currentAgency.tactics.map((tactic, index) => `
        <label style="display: flex; align-items: flex-start; padding: 15px; background: white; border-radius: 4px; cursor: pointer; border: 1px solid #DDD;">
            <input type="checkbox" onchange="updateCapture(${index})" data-cost="${tactic.cost}" data-effectiveness="${tactic.effectiveness}" style="margin-right: 10px; margin-top: 5px;">
            <div style="flex: 1;">
                <div style="font-weight: bold; color: #2E7D32;">${tactic.name}</div>
                <div style="font-size: 12px; color: #666; margin: 5px 0;">${tactic.description}</div>
                <div style="font-size: 11px; background: #E8F5E8; padding: 5px; border-radius: 3px;">
                    <strong>Cost:</strong> $${tactic.cost}M • <strong>Effectiveness:</strong> +${tactic.effectiveness}%
                </div>
            </div>
        </label>
    `).join('');
    
    // Show game
    document.getElementById('capture-game').style.display = 'block';
    document.getElementById('capture-results').style.display = 'none';
    
    // Update display
    updateDisplay();
    
    // Highlight selected agency
    document.querySelectorAll('.agency-card').forEach(card => {
        card.style.borderColor = '#DDD';
        card.style.background = 'white';
    });
    event.target.closest('.agency-card').style.borderColor = '#2196F3';
    event.target.closest('.agency-card').style.background = '#F3F8FF';
}

function updateCapture(tacticIndex) {
    const checkbox = event.target;
    const tactic = currentAgency.tactics[tacticIndex];
    
    if (checkbox.checked) {
        selectedTactics.push(tactic);
        totalInvestment += tactic.cost;
        captureLevel += tactic.effectiveness;
    } else {
        const index = selectedTactics.findIndex(t => t.name === tactic.name);
        if (index > -1) {
            selectedTactics.splice(index, 1);
            totalInvestment -= tactic.cost;
            captureLevel -= tactic.effectiveness;
        }
    }
    
    updateDisplay();
    
    // Check for full capture
    if (captureLevel >= currentAgency.difficulty) {
        setTimeout(showSuccess, 500);
    }
}

function updateDisplay() {
    const annualBenefit = (captureLevel / 100) * currentAgency.baseBenefit;
    const roi = totalInvestment > 0 ? (annualBenefit * 1000) / totalInvestment : 0;
    
    document.getElementById('capture-level').textContent = `${Math.min(captureLevel, 100)}%`;
    document.getElementById('investment').textContent = `$${totalInvestment}M`;
    document.getElementById('annual-benefit').textContent = `$${annualBenefit.toFixed(1)}B`;
    document.getElementById('roi').textContent = `${roi.toFixed(1)}x`;
    
    // Update progress bar
    const progressPercent = Math.min((captureLevel / currentAgency.difficulty) * 100, 100);
    document.getElementById('progress-bar').style.width = `${progressPercent}%`;
    document.getElementById('progress-percent').textContent = `${progressPercent.toFixed(0)}%`;
}

function showSuccess() {
    const resultsDiv = document.getElementById('capture-results');
    const annualBenefit = (captureLevel / 100) * currentAgency.baseBenefit;
    const roi = (annualBenefit * 1000) / totalInvestment;
    
    document.getElementById('success-message').innerHTML = `
        <p style="font-size: 16px; margin-bottom: 15px;"><strong>Congratulations! You've successfully captured the ${currentAgency.name}!</strong></p>
        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 15px;">
            <div style="text-align: center; padding: 15px; background: #E8F5E8; border-radius: 4px;">
                <div style="font-size: 24px; font-weight: bold; color: #2E7D32;">$${totalInvestment}M</div>
                <div style="font-size: 12px; color: #666;">Total Investment</div>
            </div>
            <div style="text-align: center; padding: 15px; background: #E8F5E8; border-radius: 4px;">
                <div style="font-size: 24px; font-weight: bold; color: #2E7D32;">$${annualBenefit.toFixed(1)}B</div>
                <div style="font-size: 12px; color: #666;">Annual Benefit</div>
            </div>
            <div style="text-align: center; padding: 15px; background: #E8F5E8; border-radius: 4px;">
                <div style="font-size: 24px; font-weight: bold; color: #2E7D32;">${roi.toFixed(0)}x</div>
                <div style="font-size: 12px; color: #666;">Return on Investment</div>
            </div>
        </div>
    `;
    
    // Real impact explanation
    const impacts = {
        sec: "Wall Street can now self-regulate, leading to increased systemic risk, minimal prosecutions for financial crimes, and continued 'too big to fail' behavior.",
        epa: "Environmental protections are systematically dismantled, allowing increased pollution, climate change acceleration, and public health degradation.",
        fda: "Drug approvals prioritize speed over safety, leading to more dangerous medications reaching market and higher pharmaceutical profits.",
        fcc: "Telecommunications monopolies can exploit consumers through higher prices, slower speeds, and elimination of net neutrality protections."
    };
    
    document.getElementById('real-impact').innerHTML = `
        <p style="font-size: 14px; margin-bottom: 0;">${impacts[Object.keys(agencies).find(key => agencies[key] === currentAgency)]}</p>
    `;
    
    resultsDiv.style.display = 'block';
}

function resetGame() {
    document.getElementById('capture-game').style.display = 'none';
    document.querySelectorAll('.agency-card').forEach(card => {
        card.style.borderColor = '#DDD';
        card.style.background = 'white';
    });
    currentAgency = null;
    selectedTactics = [];
    totalInvestment = 0;
    captureLevel = 0;
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    // Add hover effects to agency cards
    document.querySelectorAll('.agency-card').forEach(card => {
        card.addEventListener('mouseenter', function() {
            if (this.style.borderColor !== 'rgb(33, 150, 243)') {
                this.style.borderColor = '#BBB';
                this.style.transform = 'translateY(-2px)';
                this.style.boxShadow = '0 4px 8px rgba(0,0,0,0.1)';
            }
        });
        
        card.addEventListener('mouseleave', function() {
            if (this.style.borderColor !== 'rgb(33, 150, 243)') {
                this.style.borderColor = '#DDD';
                this.style.transform = 'translateY(0)';
                this.style.boxShadow = 'none';
            }
        });
    });
});
</script>

<style>
.agency-card {
    transition: all 0.3s ease;
}

.agency-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 8px rgba(0,0,0,0.1);
}

input[type="checkbox"] {
    transform: scale(1.2);
}

label:hover {
    background: #F5F5F5 !important;
    transform: translateY(-1px);
    transition: all 0.2s ease;
    border-color: #BBB !important;
}

button:hover {
    opacity: 0.9;
    transform: translateY(-1px);
    transition: all 0.2s ease;
}

#progress-bar {
    transition: width 0.5s ease-in-out;
}

.early-section-header {
    font-size: 24px;
    font-weight: bold;
    color: #003366;
    margin-bottom: 15px;
    border-bottom: 2px solid #003366;
    padding-bottom: 5px;
}

#capture-results {
    animation: fadeIn 0.5s ease-in;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}
</style>