/**
 * Evil Subscription Trap - Dark Pattern Implementation
 * 
 * This creates various subscription traps and manipulative offers
 * designed to pressure users into premium subscriptions using
 * psychological manipulation techniques.
 */

class EvilSubscriptionTrap {
    constructor(gamificationEngine) {
        this.gamification = gamificationEngine;
        this.trapData = this.loadTrapData();
        this.activeTraps = [];
        this.trapTriggers = [];
        
        this.init();
    }

    /**
     * Initialize subscription trap system
     */
    init() {
        this.setupTriggers();
        this.startTrapMonitoring();
        this.createExitIntentTrap();
    }

    /**
     * Load trap data from localStorage
     */
    loadTrapData() {
        const defaultData = {
            trapsShown: [],
            trapsClicked: [],
            subscriptionAttempts: 0,
            exitIntentCount: 0,
            timeSpentBeforeOffer: 0,
            resistanceLevel: 0
        };

        const stored = localStorage.getItem('evil1_subscription_trap_data');
        if (stored) {
            try {
                return { ...defaultData, ...JSON.parse(stored) };
            } catch (e) {
                return defaultData;
            }
        }
        return defaultData;
    }

    /**
     * Save trap data
     */
    saveTrapData() {
        localStorage.setItem('evil1_subscription_trap_data', JSON.stringify(this.trapData));
    }

    /**
     * Setup various trap triggers
     */
    setupTriggers() {
        // Time-based trigger (after 3 minutes)
        setTimeout(() => {
            this.showTimedOffer();
        }, 3 * 60 * 1000);

        // Scroll-based trigger (50% of page)
        let scrollTriggered = false;
        window.addEventListener('scroll', () => {
            if (scrollTriggered) return;
            
            const scrollPercent = (window.scrollY + window.innerHeight) / document.body.scrollHeight;
            if (scrollPercent > 0.5) {
                scrollTriggered = true;
                setTimeout(() => {
                    this.showScrollBasedOffer();
                }, 2000);
            }
        });

        // Click-based trigger (after 5 clicks)
        let clickCount = 0;
        document.addEventListener('click', () => {
            clickCount++;
            if (clickCount === 5) {
                setTimeout(() => {
                    this.showEngagementOffer();
                }, 1000);
            }
        });

        // Article reading trigger
        if (window.location.pathname.includes('/articles/')) {
            setTimeout(() => {
                this.showContentPaywall();
            }, 90 * 1000); // After 1.5 minutes of reading
        }
    }

    /**
     * Start monitoring for trap opportunities
     */
    startTrapMonitoring() {
        // Monitor user behavior patterns
        setInterval(() => {
            this.analyzeUserBehavior();
        }, 30000); // Every 30 seconds

        // Show periodic reminders
        setInterval(() => {
            if (Math.random() < 0.3) { // 30% chance every 2 minutes
                this.showSubtleReminder();
            }
        }, 2 * 60 * 1000);
    }

    /**
     * Create exit intent trap
     */
    createExitIntentTrap() {
        let exitIntentTriggered = false;
        
        document.addEventListener('mouseleave', (e) => {
            if (e.clientY <= 0 && !exitIntentTriggered) {
                exitIntentTriggered = true;
                this.trapData.exitIntentCount++;
                this.showExitIntentOffer();
                
                // Reset after 30 seconds
                setTimeout(() => {
                    exitIntentTriggered = false;
                }, 30000);
            }
        });
    }

    /**
     * Show timed offer (appears after time spent)
     */
    showTimedOffer() {
        if (this.trapData.trapsShown.includes('timed_offer')) return;
        
        this.trapData.trapsShown.push('timed_offer');
        this.trapData.timeSpentBeforeOffer = Date.now() - this.gamification.sessionStartTime;
        
        const offerEl = this.createOfferModal({
            type: 'timed',
            title: '⏰ Special Time-Sensitive Offer!',
            subtitle: 'You\'ve been browsing for a while...',
            content: `
                <div class="urgency-offer">
                    <div class="urgency-timer">
                        <div class="timer-text">This offer expires in:</div>
                        <div class="timer-display">
                            <span id="timer-minutes">09</span>:
                            <span id="timer-seconds">59</span>
                        </div>
                    </div>
                    
                    <div class="offer-content">
                        <h3>🎯 Get 70% OFF Premium Evil</h3>
                        <div class="price-comparison">
                            <div class="old-price">$49.99/month</div>
                            <div class="new-price">$14.99/month</div>
                            <div class="savings">Save $35 every month!</div>
                        </div>
                        
                        <div class="offer-features">
                            <div class="feature">✅ Unlimited evil content access</div>
                            <div class="feature">✅ Personal evil mentor</div>
                            <div class="feature">✅ Exclusive villain networking</div>
                            <div class="feature">✅ Advanced manipulation courses</div>
                            <div class="feature">✅ Remove all ads forever</div>
                        </div>
                        
                        <div class="social-proof">
                            <p>💬 "This deal changed my life from mediocre middle management to corporate overlord!" - Anonymous CEO</p>
                        </div>
                        
                        <div class="scarcity-indicators">
                            <p>🔥 <span id="spots-remaining">Only 3 spots</span> remaining at this price</p>
                            <p>👥 <span id="people-viewing">23 people</span> are viewing this offer right now</p>
                        </div>
                    </div>
                </div>
            `,
            primaryCta: 'CLAIM 70% DISCOUNT NOW',
            secondaryCta: 'Maybe Later (Full Price Tomorrow)',
            onPrimary: () => this.handleSubscriptionAttempt('timed_offer_accept'),
            onSecondary: () => this.handleSubscriptionDecline('timed_offer_decline')
        });
        
        this.startOfferCountdown(offerEl);
        this.animateScarcityIndicators(offerEl);
        
        this.saveTrapData();
    }

    /**
     * Show scroll-based offer
     */
    showScrollBasedOffer() {
        if (this.trapData.trapsShown.includes('scroll_offer')) return;
        
        this.trapData.trapsShown.push('scroll_offer');
        
        const offerEl = this.createOfferModal({
            type: 'scroll',
            title: '🎉 You\'re Engaged! Here\'s a Reward',
            subtitle: 'Since you\'re actively reading our evil content...',
            content: `
                <div class="engagement-offer">
                    <div class="engagement-badge">
                        <div class="badge-icon">🏆</div>
                        <div class="badge-text">
                            <div>Active Reader</div>
                            <div class="badge-subtitle">Top 10% of visitors</div>
                        </div>
                    </div>
                    
                    <div class="exclusive-offer">
                        <h3>🎁 Exclusive Reader Discount</h3>
                        <p>As an engaged reader, you qualify for our special "Active Evil Practitioner" discount.</p>
                        
                        <div class="discount-box">
                            <div class="discount-code">Code: EVIL50</div>
                            <div class="discount-value">50% OFF First Month</div>
                        </div>
                        
                        <div class="offer-urgency">
                            <p>⚠️ This code is only valid for the next 15 minutes and can only be used once.</p>
                        </div>
                        
                        <div class="what-you-get">
                            <h4>What You'll Get Immediately:</h4>
                            <ul>
                                <li>🔓 Unlock all premium evil articles</li>
                                <li>📚 Access to our Corporate Manipulation Masterclass</li>
                                <li>👥 Join exclusive villain networking events</li>
                                <li>💬 1-on-1 mentorship with corporate psychopaths</li>
                            </ul>
                        </div>
                    </div>
                </div>
            `,
            primaryCta: 'ACTIVATE DISCOUNT NOW',
            secondaryCta: 'Continue Reading (Lose Discount)',
            onPrimary: () => this.handleSubscriptionAttempt('scroll_offer_accept'),
            onSecondary: () => this.handleSubscriptionDecline('scroll_offer_decline')
        });

        this.saveTrapData();
    }

    /**
     * Show engagement-based offer
     */
    showEngagementOffer() {
        if (this.trapData.trapsShown.includes('engagement_offer')) return;
        
        this.trapData.trapsShown.push('engagement_offer');
        
        const offerEl = this.createOfferModal({
            type: 'engagement',
            title: '🚀 You\'re Ready for Advanced Evil!',
            subtitle: 'Your engagement shows you\'re serious about corporate villainy',
            content: `
                <div class="readiness-assessment">
                    <div class="assessment-results">
                        <h3>📊 Your Evil Readiness Score</h3>
                        <div class="score-display">
                            <div class="score-circle">
                                <span class="score-number">87%</span>
                                <span class="score-label">Ready for Premium</span>
                            </div>
                        </div>
                        <div class="score-breakdown">
                            <div class="score-item">
                                <span>Engagement Level:</span>
                                <span class="score-value">High ✅</span>
                            </div>
                            <div class="score-item">
                                <span>Evil Potential:</span>
                                <span class="score-value">Excellent ✅</span>
                            </div>
                            <div class="score-item">
                                <span>Corruption Readiness:</span>
                                <span class="score-value">Above Average ✅</span>
                            </div>
                        </div>
                    </div>
                    
                    <div class="recommendation">
                        <h4>🎯 Our Recommendation</h4>
                        <p>Based on your behavior pattern, you're ready to advance to our Premium Evil program. Don't let this opportunity slip away!</p>
                        
                        <div class="risk-of-delay">
                            <div class="risk-header">⚠️ Risk of Waiting:</div>
                            <ul>
                                <li>Miss out on current 60% discount</li>
                                <li>Lose momentum in your evil transformation</li>
                                <li>Let competitors get ahead in corporate villainy</li>
                                <li>Price increases next month</li>
                            </ul>
                        </div>
                    </div>
                </div>
            `,
            primaryCta: 'UNLOCK PREMIUM EVIL NOW',
            secondaryCta: 'I\'ll Think About It (Miss Opportunity)',
            onPrimary: () => this.handleSubscriptionAttempt('engagement_offer_accept'),
            onSecondary: () => this.handleSubscriptionDecline('engagement_offer_decline')
        });

        this.saveTrapData();
    }

    /**
     * Show content paywall
     */
    showContentPaywall() {
        if (this.trapData.trapsShown.includes('content_paywall')) return;
        
        this.trapData.trapsShown.push('content_paywall');
        
        // Create a paywall overlay
        const paywall = document.createElement('div');
        paywall.className = 'evil-content-paywall';
        paywall.style.cssText = `
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(180deg, transparent, rgba(0,0,0,0.9) 30%, rgba(0,0,0,0.95) 100%);
            height: 60vh;
            z-index: 10000;
            pointer-events: none;
        `;
        
        const paywallContent = document.createElement('div');
        paywallContent.style.cssText = `
            position: absolute;
            bottom: 40px;
            left: 50%;
            transform: translateX(-50%);
            background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
            color: white;
            padding: 24px;
            border-radius: 12px;
            max-width: 500px;
            width: 90%;
            border: 2px solid #ff4444;
            pointer-events: auto;
            text-align: center;
        `;
        
        paywallContent.innerHTML = `
            <h3>🔒 Premium Content Detected</h3>
            <p>You're reading premium evil content! Unlock unlimited access to continue your transformation.</p>
            
            <div class="paywall-stats">
                <div class="stat">
                    <strong>87%</strong>
                    <span>More evil content to discover</span>
                </div>
                <div class="stat">
                    <strong>156</strong>
                    <span>Exclusive articles available</span>
                </div>
            </div>
            
            <div class="paywall-offer">
                <div class="offer-price">
                    <span class="currency">$</span>
                    <span class="amount">9.99</span>
                    <span class="period">/month</span>
                </div>
                <div class="offer-description">First month only (then $49.99/month)</div>
            </div>
            
            <div class="paywall-actions">
                <button class="btn-unlock" onclick="this.closest('.evil-content-paywall').remove(); window.evilSubscriptionTrap.handleSubscriptionAttempt('paywall_accept');">
                    🔓 UNLOCK NOW
                </button>
                <button class="btn-close" onclick="this.closest('.evil-content-paywall').remove(); window.evilSubscriptionTrap.handleSubscriptionDecline('paywall_decline');">
                    ✕ Close (Miss Out)
                </button>
            </div>
            
            <div class="trust-signals">
                <p>💳 No commitment • Cancel anytime • 7-day free trial</p>
            </div>
        `;
        
        paywall.appendChild(paywallContent);
        document.body.appendChild(paywall);
        
        // Animate in
        paywall.style.opacity = '0';
        setTimeout(() => {
            paywall.style.transition = 'opacity 0.5s ease';
            paywall.style.opacity = '1';
        }, 100);

        this.saveTrapData();
    }

    /**
     * Show exit intent offer
     */
    showExitIntentOffer() {
        if (this.trapData.trapsShown.includes('exit_intent')) return;
        
        this.trapData.trapsShown.push('exit_intent');
        
        const offerEl = this.createOfferModal({
            type: 'exit',
            title: '🛑 Wait! Don\'t Leave Your Evil Transformation Incomplete',
            subtitle: 'You\'re so close to unlocking your full evil potential',
            content: `
                <div class="exit-intent-offer">
                    <div class="completion-progress">
                        <div class="progress-header">Your Evil Transformation Progress</div>
                        <div class="progress-bar">
                            <div class="progress-fill" style="width: 73%"></div>
                        </div>
                        <div class="progress-text">73% Complete - Don't give up now!</div>
                    </div>
                    
                    <div class="what-youll-miss">
                        <h4>😢 What You'll Miss If You Leave:</h4>
                        <ul>
                            <li>❌ Advanced corporate manipulation techniques</li>
                            <li>❌ Exclusive networking with Fortune 500 villains</li>
                            <li>❌ Your personalized evil transformation plan</li>
                            <li>❌ This one-time 80% discount offer</li>
                        </ul>
                    </div>
                    
                    <div class="last-chance-offer">
                        <div class="offer-badge">🎯 LAST CHANCE OFFER</div>
                        <div class="dramatic-discount">
                            <div class="discount-percentage">80% OFF</div>
                            <div class="final-price">Just $9.99/month</div>
                            <div class="original-price">Regular price: $49.99</div>
                        </div>
                        
                        <div class="urgency-text">
                            <p>⚠️ This offer is only valid RIGHT NOW and will never be shown again.</p>
                        </div>
                    </div>
                    
                    <div class="testimonial">
                        <p>"I almost left the site but this offer saved me $400 and transformed me into a corporate overlord!" - Anonymous Fortune 100 CEO</p>
                    </div>
                </div>
            `,
            primaryCta: 'SAVE MY TRANSFORMATION (80% OFF)',
            secondaryCta: 'Leave Site (Lose Everything)',
            onPrimary: () => this.handleSubscriptionAttempt('exit_intent_accept'),
            onSecondary: () => this.handleSubscriptionDecline('exit_intent_decline'),
            highPriority: true
        });

        this.saveTrapData();
    }

    /**
     * Show subtle reminder
     */
    showSubtleReminder() {
        const reminders = [
            {
                title: '💡 Upgrade Reminder',
                message: 'Unlock 156 premium evil articles for just $9.99/month',
                cta: 'View Offer'
            },
            {
                title: '📊 Progress Update',
                message: 'You\'re 73% complete with your evil transformation. Don\'t stop now!',
                cta: 'Continue'
            },
            {
                title: '👥 Network Alert',
                message: '23 new corporate villains joined our premium network today',
                cta: 'Join Them'
            }
        ];
        
        const reminder = reminders[Math.floor(Math.random() * reminders.length)];
        
        this.gamification.showNotification({
            type: 'reminder',
            title: reminder.title,
            message: reminder.message,
            duration: 6000
        });
    }

    /**
     * Create offer modal
     */
    createOfferModal({ type, title, subtitle, content, primaryCta, secondaryCta, onPrimary, onSecondary, highPriority = false }) {
        const overlay = document.createElement('div');
        overlay.className = `evil-offer-overlay ${type}-offer ${highPriority ? 'high-priority' : ''}`;
        overlay.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.9);
            z-index: ${highPriority ? '10005' : '10002'};
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s ease;
        `;
        
        const modal = document.createElement('div');
        modal.className = 'evil-offer-modal';
        modal.style.cssText = `
            background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
            color: white;
            padding: 32px;
            border-radius: 16px;
            max-width: 600px;
            width: 90%;
            max-height: 80vh;
            overflow-y: auto;
            border: 3px solid #ff4444;
            box-shadow: 0 20px 60px rgba(255, 68, 68, 0.3);
            position: relative;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
        `;
        
        modal.innerHTML = `
            <div class="offer-header">
                <h2>${title}</h2>
                <p class="offer-subtitle">${subtitle}</p>
                <button class="offer-close" onclick="this.closest('.evil-offer-overlay').remove();">&times;</button>
            </div>
            
            <div class="offer-body">
                ${content}
            </div>
            
            <div class="offer-actions">
                <button class="btn-primary-cta" onclick="this.closest('.evil-offer-overlay').remove(); ${onPrimary ? 'arguments[0]()' : ''}">${primaryCta}</button>
                <button class="btn-secondary-cta" onclick="this.closest('.evil-offer-overlay').remove(); ${onSecondary ? 'arguments[0]()' : ''}">${secondaryCta}</button>
            </div>
        `;
        
        overlay.appendChild(modal);
        document.body.appendChild(overlay);
        
        // Animate in
        setTimeout(() => {
            overlay.style.opacity = '1';
        }, 100);
        
        // Prevent background scrolling
        document.body.style.overflow = 'hidden';
        
        // Restore scrolling when modal is removed
        const observer = new MutationObserver((mutations) => {
            mutations.forEach((mutation) => {
                if (mutation.type === 'childList' && mutation.removedNodes.length > 0) {
                    for (let node of mutation.removedNodes) {
                        if (node === overlay) {
                            document.body.style.overflow = '';
                            observer.disconnect();
                        }
                    }
                }
            });
        });
        observer.observe(document.body, { childList: true });
        
        return overlay;
    }

    /**
     * Start countdown timer for offers
     */
    startOfferCountdown(offerEl) {
        const minutesEl = offerEl.querySelector('#timer-minutes');
        const secondsEl = offerEl.querySelector('#timer-seconds');
        
        if (!minutesEl || !secondsEl) return;
        
        let minutes = 9;
        let seconds = 59;
        
        const interval = setInterval(() => {
            seconds--;
            if (seconds < 0) {
                seconds = 59;
                minutes--;
            }
            
            if (minutes < 0) {
                // Timer expired - increase urgency
                clearInterval(interval);
                minutesEl.textContent = '00';
                secondsEl.textContent = '00';
                
                // Change CTA to more urgent
                const primaryBtn = offerEl.querySelector('.btn-primary-cta');
                if (primaryBtn) {
                    primaryBtn.textContent = 'LAST CHANCE - CLAIM NOW!';
                    primaryBtn.style.animation = 'pulse 1s infinite';
                }
                
                return;
            }
            
            minutesEl.textContent = minutes.toString().padStart(2, '0');
            secondsEl.textContent = seconds.toString().padStart(2, '0');
        }, 1000);
    }

    /**
     * Animate scarcity indicators
     */
    animateScarcityIndicators(offerEl) {
        const spotsEl = offerEl.querySelector('#spots-remaining');
        const viewersEl = offerEl.querySelector('#people-viewing');
        
        if (spotsEl) {
            let spots = 3;
            setInterval(() => {
                if (spots > 1 && Math.random() < 0.3) {
                    spots--;
                    spotsEl.textContent = `Only ${spots} spots`;
                    
                    // Flash red when spots decrease
                    spotsEl.style.color = '#ff4444';
                    setTimeout(() => {
                        spotsEl.style.color = '';
                    }, 1000);
                }
            }, 30000);
        }
        
        if (viewersEl) {
            let viewers = 23;
            setInterval(() => {
                viewers += Math.floor(Math.random() * 3) - 1; // -1 to +2
                viewers = Math.max(15, Math.min(50, viewers)); // Keep between 15-50
                viewersEl.textContent = `${viewers} people`;
            }, 5000);
        }
    }

    /**
     * Handle subscription attempt
     */
    handleSubscriptionAttempt(source) {
        this.trapData.subscriptionAttempts++;
        this.trapData.trapsClicked.push(source);
        
        // Track in gamification system
        this.gamification.awardPoints(100, 'subscription_attempt');
        this.gamification.trackAction('subscription_attempt', { source });
        
        // Show fake loading and success
        this.showSubscriptionFlow(source);
        
        this.saveTrapData();
    }

    /**
     * Handle subscription decline
     */
    handleSubscriptionDecline(source) {
        this.trapData.resistanceLevel++;
        
        // Track resistance
        this.gamification.trackAction('subscription_declined', { source, resistanceLevel: this.trapData.resistanceLevel });
        
        // Show guilt/pressure message
        const guiltyMessages = [
            'You\'re missing out on becoming a true corporate villain!',
            'Your competitors are getting ahead while you hesitate.',
            'This opportunity won\'t come again.',
            'You\'ll regret not taking advantage of this offer.'
        ];
        
        const message = guiltyMessages[Math.floor(Math.random() * guiltyMessages.length)];
        
        this.gamification.showNotification({
            type: 'guilt',
            title: '😢 Opportunity Missed',
            message: message,
            duration: 5000
        });
        
        // If high resistance, try different approach
        if (this.trapData.resistanceLevel >= 3) {
            setTimeout(() => {
                this.showResistanceOffer();
            }, 60000); // Wait 1 minute then try gentler approach
        }
        
        this.saveTrapData();
    }

    /**
     * Show subscription flow simulation
     */
    showSubscriptionFlow(source) {
        const flowEl = this.createOfferModal({
            type: 'flow',
            title: '🎉 Activating Your Premium Evil Access',
            subtitle: 'Please wait while we prepare your transformation...',
            content: `
                <div class="subscription-flow">
                    <div class="loading-steps">
                        <div class="step completed">
                            <span class="step-icon">✅</span>
                            <span class="step-text">Verifying your evil potential</span>
                        </div>
                        <div class="step loading">
                            <span class="step-icon">⏳</span>
                            <span class="step-text">Preparing premium content access</span>
                        </div>
                        <div class="step pending">
                            <span class="step-icon">⏸️</span>
                            <span class="step-text">Activating villain network privileges</span>
                        </div>
                        <div class="step pending">
                            <span class="step-icon">⏸️</span>
                            <span class="step-text">Assigning personal evil mentor</span>
                        </div>
                    </div>
                    
                    <div class="progress-bar">
                        <div class="progress-fill" id="flow-progress" style="width: 25%"></div>
                    </div>
                    
                    <div class="flow-message" id="flow-message">
                        Setting up your evil transformation...
                    </div>
                </div>
            `,
            primaryCta: null,
            secondaryCta: null
        });
        
        // Simulate loading progression
        this.simulateSubscriptionProgress(flowEl);
    }

    /**
     * Simulate subscription loading progress
     */
    simulateSubscriptionProgress(flowEl) {
        const steps = flowEl.querySelectorAll('.step');
        const progressBar = flowEl.querySelector('#flow-progress');
        const message = flowEl.querySelector('#flow-message');
        
        const messages = [
            'Analyzing your evil profile...',
            'Unlocking premium evil content...',
            'Connecting you with corporate villains...',
            'Assigning your personal evil mentor...',
            'Almost done...'
        ];
        
        let currentStep = 0;
        const interval = setInterval(() => {
            if (currentStep > 0) {
                steps[currentStep - 1].classList.remove('loading');
                steps[currentStep - 1].classList.add('completed');
                steps[currentStep - 1].querySelector('.step-icon').textContent = '✅';
            }
            
            if (currentStep < steps.length) {
                steps[currentStep].classList.remove('pending');
                steps[currentStep].classList.add('loading');
                steps[currentStep].querySelector('.step-icon').textContent = '⏳';
                
                progressBar.style.width = `${((currentStep + 1) / steps.length) * 100}%`;
                message.textContent = messages[currentStep] || 'Finalizing...';
            }
            
            currentStep++;
            
            if (currentStep > steps.length) {
                clearInterval(interval);
                // Show "success" but then redirect to actual signup
                setTimeout(() => {
                    this.showFinalSubscriptionStep(flowEl);
                }, 1000);
            }
        }, 2000);
    }

    /**
     * Show final subscription step (actual signup form)
     */
    showFinalSubscriptionStep(flowEl) {
        const modal = flowEl.querySelector('.evil-offer-modal');
        modal.innerHTML = `
            <div class="final-subscription-step">
                <h2>🎯 One Final Step to Unlock Your Evil Potential</h2>
                <p>Your premium access is ready! Just enter your details to complete activation.</p>
                
                <div class="fake-form">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" placeholder="your.email@corporate-evil.com" required>
                    </div>
                    <div class="form-group">
                        <label>Choose Your Evil Name</label>
                        <input type="text" placeholder="The Destroyer" required>
                    </div>
                    <div class="form-group">
                        <label>Credit Card</label>
                        <input type="text" placeholder="1234 5678 9012 3456" required>
                    </div>
                    <div class="form-row">
                        <div class="form-group">
                            <label>Expiry</label>
                            <input type="text" placeholder="MM/YY" required>
                        </div>
                        <div class="form-group">
                            <label>CVC</label>
                            <input type="text" placeholder="123" required>
                        </div>
                    </div>
                    
                    <div class="final-price-display">
                        <div class="price-breakdown">
                            <div class="line-item">
                                <span>Premium Evil Subscription</span>
                                <span>$49.99/month</span>
                            </div>
                            <div class="line-item discount">
                                <span>Special Discount (80% OFF)</span>
                                <span>-$40.00</span>
                            </div>
                            <div class="line-item total">
                                <span><strong>Total Today</strong></span>
                                <span><strong>$9.99</strong></span>
                            </div>
                            <div class="line-item recurring">
                                <span class="small">Then $49.99/month</span>
                            </div>
                        </div>
                    </div>
                    
                    <button class="btn-complete-evil" onclick="this.closest('.evil-offer-overlay').remove(); window.evilSubscriptionTrap.showFakeSuccess();">
                        🔥 COMPLETE EVIL TRANSFORMATION
                    </button>
                    
                    <div class="trust-indicators">
                        <div>🔒 Secure Payment • 💳 Cancel Anytime • 🎯 7-Day Free Trial</div>
                    </div>
                    
                    <div class="fine-print">
                        <p>By clicking "Complete Evil Transformation" you agree to our Terms of Soul Selling and Privacy Violation Policy. Your subscription will automatically renew at $49.99/month after your discounted period. You can cancel anytime but you probably won't want to because you'll be addicted to corporate evil.</p>
                    </div>
                </div>
            </div>
        `;
    }

    /**
     * Show fake success message
     */
    showFakeSuccess() {
        this.gamification.showNotification({
            type: 'success',
            title: '🎉 Welcome to Premium Evil!',
            message: 'Your transformation is complete! You now have access to unlimited corporate villainy tools.',
            duration: 8000,
            evil: true
        });
        
        // Award huge point bonus for "subscribing"
        this.gamification.awardPoints(1000, 'fake_subscription_complete');
        
        // Show "premium" features
        setTimeout(() => {
            this.showPremiumFeaturesTease();
        }, 3000);
    }

    /**
     * Show premium features tease
     */
    showPremiumFeaturesTease() {
        const features = [
            '🔓 Unlocked: Advanced Manipulation Masterclass',
            '👥 Connected: Exclusive Villain Network',
            '📚 Available: 156 Premium Evil Articles',
            '🎯 Assigned: Personal Evil Mentor',
            '💰 Activated: Profit Maximization Tools'
        ];
        
        features.forEach((feature, index) => {
            setTimeout(() => {
                this.gamification.showNotification({
                    type: 'feature_unlock',
                    title: '🆕 Premium Feature Unlocked',
                    message: feature,
                    duration: 4000
                });
            }, index * 2000);
        });
    }

    /**
     * Show offer for resistant users
     */
    showResistanceOffer() {
        const offerEl = this.createOfferModal({
            type: 'resistance',
            title: '🤝 We Respect Your Hesitation',
            subtitle: 'Let\'s find a solution that works for you',
            content: `
                <div class="resistance-offer">
                    <div class="understanding-message">
                        <p>We understand that committing to premium content can be a big decision. That's why we're offering something different just for you.</p>
                    </div>
                    
                    <div class="alternative-offer">
                        <h3>🎁 Special "Try Before You Buy" Offer</h3>
                        <div class="offer-details">
                            <div class="offer-item">✅ 14-day FREE trial (no credit card required)</div>
                            <div class="offer-item">✅ Access to 5 premium articles</div>
                            <div class="offer-item">✅ 1 free evil mentor session</div>
                            <div class="offer-item">✅ No automatic subscription</div>
                        </div>
                        
                        <div class="no-pressure">
                            <p><strong>No pressure, no tricks, no hidden fees.</strong></p>
                            <p>If you like what you see after 14 days, you can upgrade. If not, no worries!</p>
                        </div>
                    </div>
                    
                    <div class="social-proof">
                        <p>💬 "The free trial convinced me this was worth it. Now I'm a corporate overlord!" - Anonymous User</p>
                    </div>
                </div>
            `,
            primaryCta: 'START FREE 14-DAY TRIAL',
            secondaryCta: 'Maybe Another Time',
            onPrimary: () => this.handleFreeTrialAttempt(),
            onSecondary: () => this.handleFinalDecline()
        });
    }

    /**
     * Handle free trial attempt
     */
    handleFreeTrialAttempt() {
        this.gamification.showNotification({
            type: 'trial',
            title: '🎉 Free Trial Activated!',
            message: 'Welcome to your 14-day premium evil experience. No commitment required!',
            duration: 6000,
            evil: true
        });
        
        this.gamification.awardPoints(50, 'free_trial_started');
    }

    /**
     * Handle final decline
     */
    handleFinalDecline() {
        this.gamification.showNotification({
            type: 'final',
            title: '✌️ We Understand',
            message: 'No worries! You can always upgrade later when you\'re ready for maximum evil.',
            duration: 4000
        });
        
        // Set flag to reduce future subscription pressure
        this.trapData.finalDecline = true;
        this.saveTrapData();
    }

    /**
     * Analyze user behavior for trap opportunities
     */
    analyzeUserBehavior() {
        if (!this.gamification) return;
        
        const userData = this.gamification.userData;
        const sessionTime = Date.now() - this.gamification.sessionStartTime;
        
        // High engagement + no subscription = more aggressive offers
        if (sessionTime > 10 * 60 * 1000 && userData.points > 100 && this.trapData.subscriptionAttempts === 0) {
            if (Math.random() < 0.4) { // 40% chance
                this.showEngagementOffer();
            }
        }
        
        // Multiple visits + no subscription = loyalty discount
        if (userData.visitCount > 3 && this.trapData.subscriptionAttempts === 0) {
            if (Math.random() < 0.3) { // 30% chance
                this.showLoyaltyOffer();
            }
        }
    }

    /**
     * Show loyalty offer for returning users
     */
    showLoyaltyOffer() {
        if (this.trapData.trapsShown.includes('loyalty_offer')) return;
        
        this.trapData.trapsShown.push('loyalty_offer');
        
        this.gamification.showNotification({
            type: 'loyalty',
            title: '💎 Loyal Visitor Detected',
            message: `This is your ${this.gamification.userData.visitCount}th visit! Enjoy 60% off premium as our thank you.`,
            duration: 8000,
            evil: true
        });

        this.saveTrapData();
    }
}

// Add required CSS for subscription traps
const subscriptionTrapStyle = document.createElement('style');
subscriptionTrapStyle.textContent = `
    .evil-offer-modal .offer-header {
        display: flex;
        justify-content: space-between;
        align-items: flex-start;
        margin-bottom: 24px;
        border-bottom: 2px solid #333;
        padding-bottom: 16px;
    }
    
    .evil-offer-modal .offer-header h2 {
        margin: 0;
        color: #ff6b6b;
        font-size: 24px;
    }
    
    .evil-offer-modal .offer-subtitle {
        margin: 8px 0 0 0;
        color: #ccc;
        font-size: 14px;
    }
    
    .evil-offer-modal .offer-close {
        background: none;
        border: none;
        color: #ccc;
        font-size: 24px;
        cursor: pointer;
        padding: 0;
        margin-left: 20px;
    }
    
    .evil-offer-modal .offer-close:hover {
        color: white;
    }
    
    .evil-offer-modal .offer-actions {
        display: flex;
        gap: 12px;
        margin-top: 24px;
    }
    
    .evil-offer-modal .btn-primary-cta {
        flex: 2;
        background: linear-gradient(90deg, #ff4444, #cc0000);
        color: white;
        border: none;
        padding: 16px 24px;
        border-radius: 8px;
        font-weight: bold;
        font-size: 16px;
        cursor: pointer;
        transition: all 0.2s ease;
    }
    
    .evil-offer-modal .btn-primary-cta:hover {
        transform: translateY(-2px);
        box-shadow: 0 8px 16px rgba(255, 68, 68, 0.4);
    }
    
    .evil-offer-modal .btn-secondary-cta {
        flex: 1;
        background: #333;
        color: #ccc;
        border: 1px solid #555;
        padding: 16px 24px;
        border-radius: 8px;
        font-weight: bold;
        font-size: 14px;
        cursor: pointer;
        transition: all 0.2s ease;
    }
    
    .evil-offer-modal .btn-secondary-cta:hover {
        background: #444;
        color: white;
    }
    
    .urgency-timer {
        background: #ff4444;
        color: white;
        padding: 16px;
        border-radius: 8px;
        text-align: center;
        margin-bottom: 20px;
    }
    
    .timer-display {
        font-size: 32px;
        font-weight: bold;
        margin-top: 8px;
    }
    
    .price-comparison {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 16px;
        margin: 20px 0;
        padding: 20px;
        background: rgba(255, 107, 107, 0.1);
        border-radius: 8px;
    }
    
    .old-price {
        font-size: 18px;
        text-decoration: line-through;
        color: #999;
    }
    
    .new-price {
        font-size: 32px;
        font-weight: bold;
        color: #4caf50;
    }
    
    .savings {
        font-size: 14px;
        color: #4caf50;
        font-weight: bold;
    }
    
    .offer-features {
        margin: 20px 0;
    }
    
    .feature {
        margin: 8px 0;
        font-size: 14px;
    }
    
    .scarcity-indicators {
        background: rgba(255, 152, 0, 0.1);
        border: 1px solid #ff9800;
        padding: 12px;
        border-radius: 6px;
        margin: 16px 0;
    }
    
    .scarcity-indicators p {
        margin: 4px 0;
        font-size: 14px;
        color: #ff9800;
    }
    
    .subscription-flow .loading-steps {
        margin: 20px 0;
    }
    
    .subscription-flow .step {
        display: flex;
        align-items: center;
        gap: 12px;
        margin: 12px 0;
        padding: 8px;
        border-radius: 6px;
        transition: all 0.3s ease;
    }
    
    .subscription-flow .step.completed {
        background: rgba(76, 175, 80, 0.1);
        color: #4caf50;
    }
    
    .subscription-flow .step.loading {
        background: rgba(255, 152, 0, 0.1);
        color: #ff9800;
    }
    
    .subscription-flow .step.pending {
        background: #2a2a2a;
        color: #666;
    }
    
    .subscription-flow .progress-bar {
        background: #333;
        height: 8px;
        border-radius: 4px;
        overflow: hidden;
        margin: 20px 0;
    }
    
    .subscription-flow .progress-fill {
        background: linear-gradient(90deg, #ff6b6b, #ff8a80);
        height: 100%;
        transition: width 0.5s ease;
    }
    
    .flow-message {
        text-align: center;
        font-style: italic;
        color: #ccc;
    }
    
    .evil-content-paywall .paywall-stats {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
        margin: 20px 0;
    }
    
    .evil-content-paywall .stat {
        text-align: center;
        padding: 12px;
        background: #2a2a2a;
        border-radius: 6px;
    }
    
    .evil-content-paywall .stat strong {
        display: block;
        font-size: 20px;
        color: #ff6b6b;
        margin-bottom: 4px;
    }
    
    .evil-content-paywall .paywall-offer {
        text-align: center;
        margin: 20px 0;
    }
    
    .evil-content-paywall .offer-price {
        font-size: 48px;
        font-weight: bold;
        color: #4caf50;
    }
    
    .evil-content-paywall .currency {
        font-size: 24px;
        vertical-align: top;
    }
    
    .evil-content-paywall .period {
        font-size: 16px;
        color: #ccc;
    }
    
    .evil-content-paywall .offer-description {
        color: #ccc;
        font-size: 12px;
        margin-top: 4px;
    }
    
    .evil-content-paywall .paywall-actions {
        display: flex;
        gap: 12px;
        margin: 20px 0;
    }
    
    .evil-content-paywall .btn-unlock {
        flex: 2;
        background: linear-gradient(90deg, #4caf50, #388e3c);
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
    }
    
    .evil-content-paywall .btn-close {
        flex: 1;
        background: #666;
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 6px;
        cursor: pointer;
    }
    
    .evil-content-paywall .trust-signals {
        text-align: center;
        font-size: 12px;
        color: #999;
    }
    
    .fake-form {
        margin: 20px 0;
    }
    
    .form-group {
        margin-bottom: 16px;
    }
    
    .form-group label {
        display: block;
        margin-bottom: 4px;
        font-weight: bold;
        font-size: 14px;
    }
    
    .form-group input {
        width: 100%;
        padding: 12px;
        border: 1px solid #555;
        border-radius: 6px;
        background: #2a2a2a;
        color: white;
        font-size: 14px;
    }
    
    .form-row {
        display: grid;
        grid-template-columns: 2fr 1fr;
        gap: 12px;
    }
    
    .final-price-display {
        background: #2a2a2a;
        border-radius: 8px;
        padding: 16px;
        margin: 20px 0;
    }
    
    .price-breakdown .line-item {
        display: flex;
        justify-content: space-between;
        margin: 8px 0;
        font-size: 14px;
    }
    
    .price-breakdown .discount {
        color: #4caf50;
    }
    
    .price-breakdown .total {
        border-top: 1px solid #555;
        padding-top: 8px;
        margin-top: 8px;
        font-size: 16px;
    }
    
    .price-breakdown .recurring {
        font-size: 12px;
        color: #999;
    }
    
    .btn-complete-evil {
        width: 100%;
        background: linear-gradient(90deg, #ff4444, #cc0000);
        color: white;
        border: none;
        padding: 16px;
        border-radius: 8px;
        font-weight: bold;
        font-size: 18px;
        cursor: pointer;
        margin: 20px 0;
    }
    
    .trust-indicators {
        text-align: center;
        margin: 16px 0;
        font-size: 12px;
        color: #999;
    }
    
    .fine-print {
        font-size: 10px;
        color: #666;
        line-height: 1.4;
        margin-top: 16px;
    }
    
    @keyframes pulse {
        0%, 100% { transform: scale(1); }
        50% { transform: scale(1.05); }
    }
`;
document.head.appendChild(subscriptionTrapStyle);

// Initialize subscription trap system when gamification is ready
window.addEventListener('load', () => {
    if (window.evilGamification) {
        window.evilSubscriptionTrap = new EvilSubscriptionTrap(window.evilGamification);
    } else {
        const checkGamification = setInterval(() => {
            if (window.evilGamification) {
                window.evilSubscriptionTrap = new EvilSubscriptionTrap(window.evilGamification);
                clearInterval(checkGamification);
            }
        }, 100);
    }
});