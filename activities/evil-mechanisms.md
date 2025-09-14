---
layout: default
title: "Experience Evil Firsthand - Interactive Corporate Mechanisms"
description: "Try out the very same evil mechanisms that corporations use to manipulate consumers. Dark patterns, price discrimination, surveillance, and more."
permalink: /activities/evil-mechanisms/
---

<div class="early-section">
    <div class="early-section-header">Experience Corporate Evil Firsthand</div>
    <div class="early-section-content">
        <div style="text-align: center; margin-bottom: 30px; padding: 20px; background: #FFEBEE; border: 1px solid #FFCDD2; border-radius: 8px;">
            <h3 style="color: #B71C1C; margin-bottom: 15px;">⚠️ Warning: Educational Manipulation Ahead</h3>
            <p style="margin-bottom: 10px;"><strong>These are REAL mechanisms corporations use daily to exploit users.</strong></p>
            <p style="font-size: 14px; color: #B71C1C;">We're demonstrating them satirically to expose how they work. Knowledge is power!</p>
        </div>

        <!-- Price Discrimination Simulator -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">💰 Price Discrimination Engine</div>
            <div class="early-section-content">
                <p><strong>Experience how companies charge different prices based on your data!</strong></p>
                <p style="font-size: 14px; color: #666; margin-bottom: 20px;">Airlines, hotels, and retailers use your browsing history, location, and device to determine what you can afford.</p>
                
                <div id="price-discrimination-demo" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>Flight Search Results - NYC to LA</h4>
                    <div id="flight-prices">
                        <div class="price-option" style="margin: 10px 0; padding: 15px; border: 1px solid #CCC; border-radius: 4px; background: white;">
                            <div style="display: flex; justify-content: space-between; align-items: center;">
                                <span><strong>EvilAir Flight 666</strong> - Direct Flight</span>
                                <span id="dynamic-price" style="font-size: 24px; font-weight: bold; color: #E74C3C;">$299</span>
                            </div>
                            <div style="font-size: 12px; color: #666; margin-top: 5px;">
                                Price based on: <span id="price-factors">Standard rate</span>
                            </div>
                        </div>
                    </div>
                    
                    <div style="margin-top: 20px; padding: 15px; background: #FFF3CD; border-radius: 4px;">
                        <h5 style="margin-top: 0; color: #856404;">🎭 Behind the Scenes</h5>
                        <p style="margin-bottom: 0; font-size: 14px;" id="price-explanation">We detected this is your first visit, so you're seeing our "hook" price.</p>
                    </div>
                </div>
                
                <div style="margin-top: 15px; text-align: center;">
                    <button onclick="simulatePriceChange()" style="background: #E74C3C; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">Simulate Return Visit</button>
                    <button onclick="simulateDeviceChange()" style="background: #3498DB; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; margin-left: 10px;">Change Device Profile</button>
                </div>
            </div>
        </div>

        <!-- Dark Pattern Shopping Experience -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🛒 Dark Pattern Shopping Demo</div>
            <div class="early-section-content">
                <p><strong>Experience manipulative UX/UI patterns designed to trick you into spending more!</strong></p>
                
                <div id="dark-pattern-shop" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>EvilCorp Premium Subscription</h4>
                    
                    <!-- Forced Continuity -->
                    <div style="margin: 20px 0; padding: 15px; border: 2px solid #27AE60; border-radius: 8px; background: #D5EEDD;">
                        <h5 style="color: #27AE60; margin-top: 0;">🎉 SPECIAL OFFER - Limited Time!</h5>
                        <p style="margin-bottom: 15px;"><strong>FREE 7-day trial</strong> of EvilCorp Premium!</p>
                        
                        <div style="margin: 15px 0;">
                            <label style="display: flex; align-items: center; font-size: 14px;">
                                <input type="radio" name="subscription" value="annual" checked style="margin-right: 8px;">
                                <span style="flex: 1;">
                                    <strong>Annual Plan</strong> - $299.99/year 
                                    <span style="color: #27AE60; font-weight: bold;">(BEST VALUE!)</span>
                                </span>
                            </label>
                            <label style="display: flex; align-items: center; font-size: 14px; margin-top: 10px; opacity: 0.7;">
                                <input type="radio" name="subscription" value="monthly" style="margin-right: 8px;">
                                <span style="flex: 1;">Monthly Plan - $39.99/month (Not recommended)</span>
                            </label>
                        </div>
                        
                        <div style="margin: 15px 0; font-size: 12px; color: #666;">
                            <label style="display: flex; align-items: flex-start;">
                                <input type="checkbox" checked style="margin-right: 8px; margin-top: 2px;">
                                <span>I agree to automatically renew my subscription. Cancel anytime by calling our customer service during business hours (Mon-Fri 9-5 EST) and waiting on hold for 45+ minutes.</span>
                            </label>
                        </div>
                        
                        <button onclick="showDarkPatternResult()" style="width: 100%; background: #E74C3C; color: white; border: none; padding: 15px; border-radius: 4px; cursor: pointer; font-size: 16px; font-weight: bold;">START FREE TRIAL NOW!</button>
                        
                        <div style="text-align: center; margin-top: 10px;">
                            <a href="#" onclick="showDeclineFlow()" style="font-size: 12px; color: #999; text-decoration: underline;">No thanks, I don't want to save money</a>
                        </div>
                    </div>
                    
                    <div id="decline-flow" style="display: none; padding: 15px; background: #FFEBEE; border-radius: 4px; margin-top: 15px;">
                        <h5 style="color: #B71C1C; margin-top: 0;">Wait! Don't Leave Empty-Handed!</h5>
                        <p style="font-size: 14px;">How about 50% off your first month? <button onclick="showAnotherOffer()" style="background: #FF5722; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer;">Accept Deal</button></p>
                    </div>
                    
                    <div id="another-offer" style="display: none; padding: 15px; background: #E3F2FD; border-radius: 4px; margin-top: 15px;">
                        <h5 style="color: #1976D2; margin-top: 0;">Final Offer - 75% Off!</h5>
                        <p style="font-size: 14px;">This is our best deal ever! <button onclick="showFinalResult()" style="background: #2196F3; color: white; border: none; padding: 5px 10px; border-radius: 4px; cursor: pointer;">I Can't Resist!</button></p>
                    </div>
                </div>
                
                <div id="dark-pattern-explanation" style="display: none; margin-top: 20px; padding: 15px; background: #FFF3CD; border-radius: 4px;">
                    <h5 style="margin-top: 0; color: #856404;">🎭 Dark Patterns Used</h5>
                    <ul style="font-size: 14px; margin-bottom: 0;">
                        <li><strong>Forced Continuity:</strong> Auto-renewal with difficult cancellation</li>
                        <li><strong>Decoy Pricing:</strong> Making annual plan look like "best value"</li>
                        <li><strong>Shame Language:</strong> "I don't want to save money"</li>
                        <li><strong>Friend Spam:</strong> Pre-checked sharing options</li>
                        <li><strong>Roach Motel:</strong> Easy to get in, hard to get out</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Corporate Surveillance Simulator -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">👁️ Corporate Surveillance Simulator</div>
            <div class="early-section-content">
                <p><strong>See what data companies collect about you in real-time!</strong></p>
                
                <div id="surveillance-demo" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>EvilTracker Dashboard - Live Data Collection</h4>
                    
                    <div id="data-collection" style="font-family: monospace; font-size: 12px; background: #000; color: #00FF00; padding: 15px; border-radius: 4px; height: 200px; overflow-y: auto;">
                        <div id="surveillance-log">Starting data collection...</div>
                    </div>
                    
                    <div style="margin-top: 15px; display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 15px;">
                        <div style="text-align: center; padding: 10px; background: white; border-radius: 4px;">
                            <div style="font-size: 24px; font-weight: bold; color: #E74C3C;" id="data-points">0</div>
                            <div style="font-size: 12px; color: #666;">Data Points</div>
                        </div>
                        <div style="text-align: center; padding: 10px; background: white; border-radius: 4px;">
                            <div style="font-size: 24px; font-weight: bold; color: #F39C12;" id="trackers">7</div>
                            <div style="font-size: 12px; color: #666;">Active Trackers</div>
                        </div>
                        <div style="text-align: center; padding: 10px; background: white; border-radius: 4px;">
                            <div style="font-size: 24px; font-weight: bold; color: #9B59B6;" id="value-extracted">$0.00</div>
                            <div style="font-size: 12px; color: #666;">Value Extracted</div>
                        </div>
                    </div>
                    
                    <div style="margin-top: 15px; text-align: center;">
                        <button onclick="startSurveillance()" style="background: #E74C3C; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">Start Surveillance</button>
                        <button onclick="stopSurveillance()" style="background: #95A5A6; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; margin-left: 10px;">Stop</button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Labor Exploitation Calculator -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">⚒️ True Cost Calculator</div>
            <div class="early-section-content">
                <p><strong>Discover the real human cost behind cheap products!</strong></p>
                
                <div id="labor-calculator" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>What's the REAL cost of your $5 t-shirt?</h4>
                    
                    <div style="margin: 20px 0;">
                        <label style="display: block; margin-bottom: 10px;">Select a product:</label>
                        <select id="product-selector" onchange="calculateTrueCost()" style="width: 100%; padding: 8px; border: 1px solid #DDD; border-radius: 4px;">
                            <option value="">Choose a product...</option>
                            <option value="tshirt">Basic T-Shirt - $5.00</option>
                            <option value="jeans">Jeans - $15.00</option>
                            <option value="sneakers">Sneakers - $25.00</option>
                            <option value="smartphone">Smartphone - $299.00</option>
                        </select>
                    </div>
                    
                    <div id="cost-breakdown" style="display: none;">
                        <h5>Cost Breakdown:</h5>
                        <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin: 20px 0;">
                            <div>
                                <h6 style="margin-bottom: 10px; color: #27AE60;">What You Pay</h6>
                                <div style="background: #D5EEDD; padding: 15px; border-radius: 4px;">
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 5px;">
                                        <span>Retail Price:</span>
                                        <span id="retail-price">$5.00</span>
                                    </div>
                                </div>
                            </div>
                            <div>
                                <h6 style="margin-bottom: 10px; color: #E74C3C;">True Human Cost</h6>
                                <div style="background: #FFEBEE; padding: 15px; border-radius: 4px;">
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 5px; font-size: 12px;">
                                        <span>Worker wages:</span>
                                        <span id="worker-wage">$0.18</span>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 5px; font-size: 12px;">
                                        <span>Environmental damage:</span>
                                        <span id="env-cost">$2.30</span>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; margin-bottom: 5px; font-size: 12px;">
                                        <span>Healthcare externalities:</span>
                                        <span id="health-cost">$1.20</span>
                                    </div>
                                    <div style="display: flex; justify-content: space-between; font-weight: bold; border-top: 1px solid #FFCDD2; padding-top: 5px;">
                                        <span>Total True Cost:</span>
                                        <span id="true-cost">$8.68</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div style="padding: 15px; background: #FFF3CD; border-radius: 4px; margin-top: 20px;">
                            <h6 style="margin-top: 0; color: #856404;">💡 The Reality</h6>
                            <p style="margin-bottom: 0; font-size: 14px;" id="reality-check">This t-shirt requires 2,700 liters of water to produce and the worker who made it earned about $0.18 - less than 4% of what you paid.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Addiction Mechanics Demo -->
        <div class="early-section" style="margin-bottom: 40px;">
            <div class="early-section-header">🎮 Addiction Engine Demo</div>
            <div class="early-section-content">
                <p><strong>Experience the psychological tricks apps use to hook you!</strong></p>
                
                <div id="addiction-demo" style="border: 1px solid #DDD; padding: 20px; border-radius: 8px; background: #F9F9F9;">
                    <h4>SocialEvil App - Engagement Maximizer</h4>
                    
                    <div style="display: flex; align-items: center; justify-content: space-between; margin-bottom: 20px; padding: 15px; background: white; border-radius: 4px;">
                        <div>
                            <div style="font-weight: bold;">Daily Streak: <span id="streak-counter" style="color: #E74C3C;">3 days</span> 🔥</div>
                            <div style="font-size: 12px; color: #666;">Don't break your streak!</div>
                        </div>
                        <div>
                            <div style="font-weight: bold;">Coins: <span id="coin-counter" style="color: #F39C12;">247</span> 🪙</div>
                            <div style="font-size: 12px; color: #666;">Spend to unlock features!</div>
                        </div>
                    </div>
                    
                    <div style="margin-bottom: 20px;">
                        <button onclick="simulateActivity()" style="width: 100%; background: #E74C3C; color: white; border: none; padding: 15px; border-radius: 8px; cursor: pointer; font-size: 16px; font-weight: bold;">
                            Tap for Reward! <span id="tap-reward" style="font-size: 12px;">+5 coins</span>
                        </button>
                    </div>
                    
                    <div id="notification-area" style="min-height: 100px; background: #F8F9FA; border-radius: 4px; padding: 15px;">
                        <div style="font-weight: bold; margin-bottom: 10px;">Recent Notifications:</div>
                        <div id="notifications-list" style="font-size: 12px; color: #666;">
                            No notifications yet...
                        </div>
                    </div>
                    
                    <div style="margin-top: 15px; text-align: center;">
                        <button onclick="enableNotifications()" style="background: #007BFF; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer;">Enable Notifications</button>
                        <button onclick="showAddictionMetrics()" style="background: #6C757D; color: white; border: none; padding: 10px 20px; border-radius: 4px; cursor: pointer; margin-left: 10px;">Show Psychology</button>
                    </div>
                    
                    <div id="addiction-metrics" style="display: none; margin-top: 20px; padding: 15px; background: #FFF3CD; border-radius: 4px;">
                        <h6 style="margin-top: 0; color: #856404;">🧠 Psychological Mechanisms Active</h6>
                        <ul style="font-size: 14px; margin-bottom: 0;">
                            <li><strong>Variable Ratio Reinforcement:</strong> Random reward schedules (like gambling)</li>
                            <li><strong>Loss Aversion:</strong> Fear of losing your streak</li>
                            <li><strong>Social Approval:</strong> Likes, shares, validation loops</li>
                            <li><strong>FOMO:</strong> Time-limited offers and exclusive content</li>
                            <li><strong>Dopamine Triggers:</strong> Notifications, badges, level-ups</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Call to Action -->
        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Now That You've Experienced Evil...</div>
            <div class="early-section-content">
                <div style="text-align: center; padding: 30px; background: #E8F4F8; border-radius: 8px;">
                    <h3 style="color: #003366; margin-bottom: 15px;">Knowledge is Power</h3>
                    <p style="margin-bottom: 20px;">You've just experienced real techniques corporations use daily to manipulate millions. Now you can recognize and resist them.</p>
                    
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 15px; margin-top: 20px;">
                        <a href="/articles/" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Read Exposés</a>
                        <a href="/education/" class="early-nav-link" style="background: #4477AA; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Learn Defense</a>
                        <a href="/membership/" class="early-nav-link" style="background: #6699CC; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Join the Fight</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Price Discrimination Simulator
let priceVisits = 0;
let deviceProfile = 'standard';

function simulatePriceChange() {
    priceVisits++;
    const priceEl = document.getElementById('dynamic-price');
    const factorsEl = document.getElementById('price-factors');
    const explanationEl = document.getElementById('price-explanation');
    
    let newPrice = 299;
    let factors = [];
    let explanation = '';
    
    if (priceVisits === 1) {
        newPrice = 399;
        factors.push('Return visitor');
        explanation = 'We detected you\'ve visited before, so we\'re showing higher "market rate" pricing.';
    } else if (priceVisits === 2) {
        newPrice = 499;
        factors.push('High engagement');
        factors.push('Price checking behavior');
        explanation = 'You\'ve looked at this flight multiple times - our algorithm thinks you really need it.';
    } else {
        newPrice = 599;
        factors.push('Urgent purchase pattern');
        factors.push('Low competition route');
        explanation = 'Maximum extraction mode: You\'ve demonstrated high intent and willingness to pay.';
    }
    
    priceEl.textContent = `$${newPrice}`;
    factorsEl.textContent = factors.join(', ');
    explanationEl.textContent = explanation;
}

function simulateDeviceChange() {
    const priceEl = document.getElementById('dynamic-price');
    const factorsEl = document.getElementById('price-factors');
    const explanationEl = document.getElementById('price-explanation');
    
    if (deviceProfile === 'standard') {
        deviceProfile = 'premium';
        priceEl.textContent = '$749';
        factorsEl.textContent = 'MacBook/iPhone user, high-income zip code';
        explanationEl.textContent = 'Premium device detected - algorithm assumes higher purchasing power.';
    } else {
        deviceProfile = 'budget';
        priceEl.textContent = '$199';
        factorsEl.textContent = 'Android/budget device, price-sensitive segment';
        explanationEl.textContent = 'Budget device detected - showing "discount" to maximize conversion.';
    }
}

// Dark Pattern Shopping
function showDarkPatternResult() {
    document.getElementById('dark-pattern-explanation').style.display = 'block';
    alert('Congratulations! You just signed up for automatic billing with difficult cancellation. Check the explanation below to see what tricks we used!');
}

function showDeclineFlow() {
    document.getElementById('decline-flow').style.display = 'block';
}

function showAnotherOffer() {
    document.getElementById('another-offer').style.display = 'block';
}

function showFinalResult() {
    document.getElementById('dark-pattern-explanation').style.display = 'block';
    alert('Even when you tried to decline, we kept manipulating you with better offers! This is called "retention flow" - making it hard to actually leave.');
}

// Surveillance Simulator
let surveillanceActive = false;
let dataPoints = 0;
let surveillanceInterval;

function startSurveillance() {
    if (surveillanceActive) return;
    
    surveillanceActive = true;
    dataPoints = 0;
    const logEl = document.getElementById('surveillance-log');
    logEl.innerHTML = 'Starting data collection...<br>';
    
    const dataTypes = [
        'Mouse movement tracked',
        'Click pattern analyzed', 
        'Time on page: 34s',
        'Device fingerprint captured',
        'IP geolocation: [Your City]',
        'Browser fingerprint stored',
        'Search history cross-referenced',
        'Social media profiles linked',
        'Purchase history accessed',
        'Contact list uploaded',
        'Location data triangulated',
        'Biometric data estimated',
        'Political affiliation inferred',
        'Income bracket calculated',
        'Health status predicted',
        'Relationship status detected'
    ];
    
    surveillanceInterval = setInterval(() => {
        if (dataPoints < dataTypes.length) {
            const randomData = dataTypes[Math.floor(Math.random() * dataTypes.length)];
            logEl.innerHTML += `[${new Date().toLocaleTimeString()}] ${randomData}<br>`;
            dataPoints++;
            
            document.getElementById('data-points').textContent = dataPoints;
            document.getElementById('value-extracted').textContent = `$${(dataPoints * 0.23).toFixed(2)}`;
            
            logEl.scrollTop = logEl.scrollHeight;
        }
    }, 800);
}

function stopSurveillance() {
    surveillanceActive = false;
    if (surveillanceInterval) {
        clearInterval(surveillanceInterval);
    }
    const logEl = document.getElementById('surveillance-log');
    logEl.innerHTML += '<br><span style="color: #FF6B6B;">[SURVEILLANCE STOPPED BY USER]</span><br>';
    logEl.innerHTML += '<span style="color: #FFE66D;">Note: In reality, stopping surveillance requires changing browsers, VPNs, and constant vigilance.</span>';
}

// Labor Calculator
function calculateTrueCost() {
    const productEl = document.getElementById('product-selector');
    const breakdownEl = document.getElementById('cost-breakdown');
    
    if (!productEl.value) {
        breakdownEl.style.display = 'none';
        return;
    }
    
    const products = {
        tshirt: {
            retail: '$5.00',
            worker: '$0.18',
            env: '$2.30',
            health: '$1.20',
            total: '$8.68',
            reality: 'This t-shirt requires 2,700 liters of water to produce and the worker who made it earned about $0.18 - less than 4% of what you paid.'
        },
        jeans: {
            retail: '$15.00',
            worker: '$0.75',
            env: '$8.50',
            health: '$3.80',
            total: '$28.05',
            reality: 'These jeans require 10,000+ liters of water and extensive chemical processing. The garment worker earned $0.75 for several hours of work.'
        },
        sneakers: {
            retail: '$25.00',
            worker: '$1.20',
            env: '$15.00',
            health: '$8.90',
            total: '$50.10',
            reality: 'These sneakers involve complex supply chains across multiple countries. The final assembly worker earned $1.20 for their portion.'
        },
        smartphone: {
            retail: '$299.00',
            worker: '$8.50',
            env: '$180.00',
            health: '$95.00',
            total: '$582.50',
            reality: 'This smartphone contains rare earth minerals mined under dangerous conditions. The final assembly worker earned $8.50 for this unit.'
        }
    };
    
    const product = products[productEl.value];
    
    document.getElementById('retail-price').textContent = product.retail;
    document.getElementById('worker-wage').textContent = product.worker;
    document.getElementById('env-cost').textContent = product.env;
    document.getElementById('health-cost').textContent = product.health;
    document.getElementById('true-cost').textContent = product.total;
    document.getElementById('reality-check').textContent = product.reality;
    
    breakdownEl.style.display = 'block';
}

// Addiction Mechanics
let streak = 3;
let coins = 247;
let tapCount = 0;
let notifications = [];

function simulateActivity() {
    tapCount++;
    coins += 5;
    
    document.getElementById('coin-counter').textContent = coins;
    
    // Show variable rewards
    if (Math.random() < 0.3) {
        const bonusCoins = Math.floor(Math.random() * 50) + 10;
        coins += bonusCoins;
        document.getElementById('coin-counter').textContent = coins;
        document.getElementById('tap-reward').textContent = `+${5 + bonusCoins} coins! BONUS!`;
        setTimeout(() => {
            document.getElementById('tap-reward').textContent = '+5 coins';
        }, 2000);
    }
    
    // Trigger FOMO after multiple taps
    if (tapCount === 5) {
        addNotification('⏰ Limited time offer: Double coins for next 10 minutes!');
    } else if (tapCount === 10) {
        addNotification('🎉 You unlocked a new achievement! Tap Master!');
    }
}

function enableNotifications() {
    addNotification('🔔 Notifications enabled! We\'ll keep you engaged...');
    
    // Simulate annoying notifications
    setTimeout(() => addNotification('👋 Come back! Your streak is waiting...'), 3000);
    setTimeout(() => addNotification('💰 Your daily bonus is ready to collect!'), 6000);
    setTimeout(() => addNotification('⚠️ Your streak will expire in 12 hours!'), 9000);
}

function addNotification(message) {
    notifications.unshift(`${new Date().toLocaleTimeString()}: ${message}`);
    const listEl = document.getElementById('notifications-list');
    listEl.innerHTML = notifications.slice(0, 5).join('<br>');
}

function showAddictionMetrics() {
    document.getElementById('addiction-metrics').style.display = 'block';
}

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    // Add some initial surveillance data
    setTimeout(() => {
        if (!surveillanceActive) {
            document.getElementById('surveillance-log').innerHTML = 'Passive tracking enabled...<br>Cookie fingerprint: Active<br>Canvas fingerprint: Captured<br>';
        }
    }, 1000);
});
</script>

<style>
.price-option:hover {
    background: #F0F8FF !important;
}

#surveillance-log {
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { opacity: 1; }
    50% { opacity: 0.7; }
    100% { opacity: 1; }
}

button:hover {
    opacity: 0.9;
    transform: translateY(-1px);
    transition: all 0.2s ease;
}

.early-section {
    margin-bottom: 30px;
}

.early-section-header {
    font-size: 24px;
    font-weight: bold;
    color: #003366;
    margin-bottom: 15px;
    border-bottom: 2px solid #003366;
    padding-bottom: 5px;
}

.early-section-content {
    font-size: 16px;
    line-height: 1.6;
}
</style>