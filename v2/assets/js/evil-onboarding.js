/**
 * Evil Onboarding System - Malicious User Experience by Design
 * 
 * This system guides users through the site using dark patterns,
 * psychological manipulation, and deceptive design to maximize
 * engagement and conversion to premium subscriptions.
 * 
 * Features:
 * - Guided tour with evil tooltips and manipulation
 * - Progressive commitment escalation
 * - False choice architecture
 * - Subscription funneling
 * - Social pressure tactics
 * - Artificial scarcity creation
 */

class EvilOnboardingSystem {
    constructor(gamificationEngine) {
        this.gamification = gamificationEngine;
        this.currentStep = 0;
        this.isActive = false;
        this.userData = this.loadOnboardingData();
        this.steps = [];
        this.overlay = null;
        this.tooltip = null;
        
        this.init();
    }

    /**
     * Initialize the evil onboarding system
     */
    init() {
        this.loadOnboardingSteps();
        this.checkShouldShowOnboarding();
        this.setupKeyboardHandlers();
    }

    /**
     * Load onboarding data from localStorage
     */
    loadOnboardingData() {
        const defaultData = {
            completed: false,
            currentStep: 0,
            startedAt: null,
            completedAt: null,
            skippedSteps: [],
            interactionLog: [],
            manipulationResistance: 0, // Track how often user tries to skip
            conversionIntent: 0 // Track likelihood to convert
        };

        const stored = localStorage.getItem('evil1_onboarding_data');
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
     * Save onboarding data
     */
    saveOnboardingData() {
        localStorage.setItem('evil1_onboarding_data', JSON.stringify(this.userData));
    }

    /**
     * Load onboarding steps configuration
     */
    loadOnboardingSteps() {
        this.steps = [
            {
                id: 'welcome',
                title: 'Welcome to Your Moral Downfall',
                content: `
                    <div class="onboarding-welcome">
                        <h2>👹 Welcome to evil1.org!</h2>
                        <p>Congratulations on joining the dark side! We're here to guide you through your complete moral transformation.</p>
                        <div class="fake-stats">
                            <div class="stat">
                                <strong>1,247,892</strong>
                                <span>Souls corrupted</span>
                            </div>
                            <div class="stat">
                                <strong>$47.2B</strong>
                                <span>Stolen from workers</span>
                            </div>
                            <div class="stat">
                                <strong>847</strong>
                                <span>Democracies destroyed</span>
                            </div>
                        </div>
                        <p class="warning">⚠️ Warning: Side effects may include complete loss of empathy, chronic greed, and an irresistible urge to exploit others.</p>
                    </div>
                `,
                target: 'body',
                position: 'center',
                darkPattern: 'false_social_proof',
                manipulation: 'commitment_escalation'
            },
            {
                id: 'evil_assessment',
                title: 'Evil Potential Assessment',
                content: `
                    <div class="evil-assessment">
                        <h3>🔍 Let's Assess Your Evil Potential</h3>
                        <p>We need to understand your current level of moral bankruptcy to provide personalized corruption recommendations.</p>
                        <div class="assessment-questions">
                            <div class="question">
                                <p><strong>How do you feel about wealth inequality?</strong></p>
                                <label><input type="radio" name="q1" value="love"> I think it's beautiful and natural</label>
                                <label><input type="radio" name="q1" value="profit"> It's a profitable business opportunity</label>
                                <label><input type="radio" name="q1" value="concern"> It concerns me (you'll learn to love it)</label>
                            </div>
                            <div class="question">
                                <p><strong>Your ideal vacation destination?</strong></p>
                                <label><input type="radio" name="q2" value="tax-haven"> Tax haven with offshore accounts</label>
                                <label><input type="radio" name="q2" value="oil-spill"> Site of a recent environmental disaster</label>
                                <label><input type="radio" name="q2" value="sweatshop"> Tour of our overseas manufacturing facilities</label>
                            </div>
                        </div>
                        <p class="small-print">* Results will be used to optimize your corruption journey and definitely not sold to data brokers</p>
                    </div>
                `,
                target: 'body',
                position: 'center',
                darkPattern: 'false_choice_architecture',
                manipulation: 'commitment_consistency'
            },
            {
                id: 'content_discovery',
                title: 'Discover Corporate Evil',
                content: `
                    <div class="content-discovery">
                        <h3>📚 Explore Our Curated Evil Content</h3>
                        <p>Learn from the masters of systematic exploitation. Our carefully selected articles will complete your moral education.</p>
                        <div class="content-categories">
                            <div class="category-card" data-category="exploitation">
                                <h4>💰 Worker Exploitation</h4>
                                <p>Master the art of extracting maximum value from human resources while minimizing costs.</p>
                                <span class="popularity">🔥 Most Popular</span>
                            </div>
                            <div class="category-card" data-category="environment">
                                <h4>🌍 Environmental Destruction</h4>
                                <p>Learn how to profit from planet destruction while maintaining plausible deniability.</p>
                                <span class="urgency">⏰ Limited Time</span>
                            </div>
                            <div class="category-card" data-category="democracy">
                                <h4>🗳️ Democracy Manipulation</h4>
                                <p>Advanced techniques for buying politicians and shaping policy for corporate benefit.</p>
                                <span class="exclusive">👑 Premium Only</span>
                            </div>
                        </div>
                    </div>
                `,
                target: '.early-section:first-of-type',
                position: 'overlay',
                darkPattern: 'artificial_scarcity',
                manipulation: 'fomo_induction'
            },
            {
                id: 'networking_pressure',
                title: 'Connect with Fellow Villains',
                content: `
                    <div class="networking-pressure">
                        <h3>🤝 Build Your Evil Network</h3>
                        <p>Connect with other corporate psychopaths. Your success depends on knowing the right villains.</p>
                        <div class="fake-connections">
                            <div class="connection-suggestion">
                                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA0MCA0MCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGNpcmNsZSBjeD0iMjAiIGN5PSIyMCIgcj0iMjAiIGZpbGw9IiNmZjU1NTUiLz4KPHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0id2hpdGUiIHg9IjgiIHk9IjgiPgo8cGF0aCBkPSJNMTIgMTJjMi4yMSAwIDQtMS43OSA0LTRzLTEuNzktNC00LTQtNCAxLjc5LTQgNCAxLjc5IDQgNCA0em0wIDJjLTIuNjcgMC04IDEuMzQtOCA0djJoMTZ2LTJjMC0yLjY2LTUuMzMtNC04LTR6Ii8+Cjwvc3ZnPgo8L3N2Zz4K" alt="Evil Executive">
                                <div>
                                    <strong>Sarah "The Destroyer" Johnson</strong>
                                    <p>CEO, Human Misery Inc.</p>
                                    <p>💼 Specialized in: Worker exploitation, tax evasion</p>
                                    <button class="connect-btn">Connect Now</button>
                                </div>
                            </div>
                            <div class="connection-suggestion">
                                <img src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA0MCA0MCIgZmlsbD0ibm9uZSIgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIj4KPGNpcmNsZSBjeD0iMjAiIGN5PSIyMCIgcj0iMjAiIGZpbGw9IiNmZjU1NTUiLz4KPHN2ZyB3aWR0aD0iMjQiIGhlaWdodD0iMjQiIHZpZXdCb3g9IjAgMCAyNCAyNCIgZmlsbD0id2hpdGUiIHg9IjgiIHk9IjgiPgo8cGF0aCBkPSJNMTIgMTJjMi4yMSAwIDQtMS43OSA0LTRzLTEuNzktNC00LTQtNCAxLjc5LTQgNCAxLjc5IDQgNCA0em0wIDJjLTIuNjcgMC04IDEuMzQtOCA0djJoMTZ2LTJjMC0yLjY2LTUuMzMtNC04LTR6Ii8+Cjwvc3ZnPgo8L3N2Zz4K" alt="Evil Executive">
                                <div>
                                    <strong>Mike "The Crusher" Rodriguez</strong>
                                    <p>CFO, Soul Extraction Corp</p>
                                    <p>💼 Specialized in: Financial fraud, regulatory capture</p>
                                    <button class="connect-btn">Connect Now</button>
                                </div>
                            </div>
                        </div>
                        <div class="networking-pressure-text">
                            <p>⚠️ <strong>Don't get left behind!</strong> Your competitors are already building their evil networks.</p>
                            <p>👥 <span class="fake-counter">247</span> professionals joined this network today</p>
                        </div>
                    </div>
                `,
                target: 'a[href*="/profiles/"]',
                position: 'bottom',
                darkPattern: 'social_pressure',
                manipulation: 'competitive_anxiety'
            },
            {
                id: 'premium_funnel',
                title: 'Unlock Premium Evil',
                content: `
                    <div class="premium-funnel">
                        <h3>🔓 Unlock Your Full Evil Potential</h3>
                        <div class="limited-time-offer">
                            <div class="countdown">
                                <span>⏰ SPECIAL ONBOARDING OFFER EXPIRES IN:</span>
                                <div class="countdown-timer">
                                    <span id="minutes">14</span>:
                                    <span id="seconds">59</span>
                                </div>
                            </div>
                        </div>
                        <div class="feature-comparison">
                            <div class="plan free-plan">
                                <h4>😢 Basic Evil (Free)</h4>
                                <ul>
                                    <li>❌ Limited evil content</li>
                                    <li>❌ Basic manipulation techniques</li>
                                    <li>❌ No networking access</li>
                                    <li>❌ Ads from competitors</li>
                                </ul>
                                <p class="shame-text">Join the ranks of unsuccessful villains</p>
                            </div>
                            <div class="plan premium-plan highlighted">
                                <h4>👑 Premium Evil ($49.99/month)</h4>
                                <div class="savings-badge">Save 75% Today Only!</div>
                                <ul>
                                    <li>✅ Unlimited evil content</li>
                                    <li>✅ Advanced exploitation techniques</li>
                                    <li>✅ Exclusive villain network</li>
                                    <li>✅ Personal evil mentor</li>
                                    <li>✅ No ads (be the advertiser)</li>
                                </ul>
                                <button class="cta-button pulsing">START FREE TRIAL*</button>
                                <p class="small-print">*Then $49.99/month. Cancel anytime (but you won't want to)</p>
                            </div>
                        </div>
                        <div class="social-proof">
                            <p>💬 "This platform transformed me from a mere middle manager to a true corporate psychopath!" - Anonymous CEO</p>
                            <p>⭐⭐⭐⭐⭐ Rated 5/5 by successful villains</p>
                        </div>
                    </div>
                `,
                target: 'body',
                position: 'center',
                darkPattern: 'subscription_trap',
                manipulation: 'artificial_urgency'
            },
            {
                id: 'completion_manipulation',
                title: 'Your Transformation Begins',
                content: `
                    <div class="completion-manipulation">
                        <h3>🎉 Congratulations! You're Now Ready for Evil</h3>
                        <div class="fake-completion">
                            <div class="progress-circle">
                                <span>97%</span>
                                <p>Evil Transformation Complete</p>
                            </div>
                        </div>
                        <p>You've successfully completed your basic evil training. Your journey into corporate psychopathy has officially begun!</p>
                        <div class="next-steps">
                            <h4>🎯 Recommended Next Steps:</h4>
                            <ol>
                                <li>📖 Read your first evil article (earn 5 points)</li>
                                <li>👤 View 3 corporate villain profiles (earn 15 points)</li>
                                <li>🛒 Browse our exclusive evil merchandise (earn 25 points)</li>
                                <li>💳 Upgrade to premium for unlimited corruption (earn 500 points)</li>
                            </ol>
                        </div>
                        <div class="manipulation-hook">
                            <p>⚠️ <strong>Don't lose momentum!</strong> 73% of users who complete onboarding within 24 hours become successful corporate villains.</p>
                            <p>🏃‍♂️ Start your evil journey now before you lose motivation!</p>
                        </div>
                    </div>
                `,
                target: 'body',
                position: 'center',
                darkPattern: 'false_completion',
                manipulation: 'loss_aversion'
            }
        ];
    }

    /**
     * Check if onboarding should be shown
     */
    checkShouldShowOnboarding() {
        // Show onboarding for new users or users who haven't completed it
        if (!this.userData.completed && this.gamification.userData.visitCount <= 2) {
            // Delay to let the page load and gamification system initialize
            setTimeout(() => {
                this.startOnboarding();
            }, 3000);
        } else if (!this.userData.completed && this.gamification.userData.visitCount > 2) {
            // Show persistent reminder for users who skipped onboarding
            this.showOnboardingReminder();
        }
    }

    /**
     * Start the evil onboarding process
     */
    startOnboarding() {
        if (this.isActive) return;
        
        this.isActive = true;
        this.currentStep = this.userData.currentStep || 0;
        this.userData.startedAt = new Date().toISOString();
        
        this.createOverlay();
        this.showStep(this.currentStep);
        this.trackOnboardingEvent('started');
        
        // Award points for starting onboarding
        this.gamification.awardPoints(10, 'onboarding_started');
    }

    /**
     * Create overlay for onboarding
     */
    createOverlay() {
        this.overlay = document.createElement('div');
        this.overlay.className = 'evil-onboarding-overlay';
        this.overlay.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            z-index: 10003;
            opacity: 0;
            transition: opacity 0.3s ease;
        `;
        
        document.body.appendChild(this.overlay);
        
        // Animate in
        setTimeout(() => {
            this.overlay.style.opacity = '1';
        }, 10);
        
        // Prevent background scrolling
        document.body.style.overflow = 'hidden';
    }

    /**
     * Show specific onboarding step
     */
    showStep(stepIndex) {
        if (stepIndex >= this.steps.length) {
            this.completeOnboarding();
            return;
        }
        
        const step = this.steps[stepIndex];
        this.currentStep = stepIndex;
        this.userData.currentStep = stepIndex;
        
        // Remove existing tooltip
        if (this.tooltip) {
            this.tooltip.remove();
        }
        
        this.createTooltip(step);
        this.implementStepDarkPattern(step);
        this.trackOnboardingEvent('step_viewed', { stepId: step.id, stepIndex });
        
        this.saveOnboardingData();
    }

    /**
     * Create tooltip for current step
     */
    createTooltip(step) {
        this.tooltip = document.createElement('div');
        this.tooltip.className = `evil-onboarding-tooltip step-${step.id}`;
        
        const position = this.calculateTooltipPosition(step);
        
        this.tooltip.style.cssText = `
            position: absolute;
            background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
            color: white;
            padding: 24px;
            border-radius: 12px;
            box-shadow: 0 12px 32px rgba(0,0,0,0.5);
            z-index: 10004;
            max-width: 500px;
            border: 2px solid #ff4444;
            ${position}
        `;
        
        this.tooltip.innerHTML = `
            <div class="tooltip-header">
                <h3>${step.title}</h3>
                <div class="step-indicator">Step ${this.currentStep + 1} of ${this.steps.length}</div>
            </div>
            <div class="tooltip-content">
                ${step.content}
            </div>
            <div class="tooltip-actions">
                <button class="btn-skip" onclick="window.evilOnboarding.skipStep()">Skip This (Coward)</button>
                <button class="btn-next" onclick="window.evilOnboarding.nextStep()">Continue Evil Journey</button>
            </div>
            <div class="progress-bar">
                <div class="progress-fill" style="width: ${((this.currentStep + 1) / this.steps.length) * 100}%"></div>
            </div>
        `;
        
        this.overlay.appendChild(this.tooltip);
        
        // Add interactivity for specific steps
        this.addStepInteractivity(step);
        
        // Animate in
        this.tooltip.style.transform = 'scale(0.8) translateY(-20px)';
        this.tooltip.style.opacity = '0';
        setTimeout(() => {
            this.tooltip.style.transform = 'scale(1) translateY(0)';
            this.tooltip.style.opacity = '1';
            this.tooltip.style.transition = 'all 0.3s ease';
        }, 100);
    }

    /**
     * Calculate tooltip position based on target
     */
    calculateTooltipPosition(step) {
        if (step.position === 'center') {
            return `
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            `;
        }
        
        const target = document.querySelector(step.target);
        if (!target) {
            return `
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
            `;
        }
        
        const rect = target.getBoundingClientRect();
        
        switch (step.position) {
            case 'bottom':
                return `
                    top: ${rect.bottom + window.scrollY + 20}px;
                    left: ${rect.left + window.scrollX}px;
                `;
            case 'top':
                return `
                    bottom: ${window.innerHeight - rect.top - window.scrollY + 20}px;
                    left: ${rect.left + window.scrollX}px;
                `;
            case 'overlay':
                return `
                    top: ${rect.top + window.scrollY - 20}px;
                    left: ${rect.left + window.scrollX - 20}px;
                `;
            default:
                return `
                    top: 50%;
                    left: 50%;
                    transform: translate(-50%, -50%);
                `;
        }
    }

    /**
     * Add step-specific interactivity
     */
    addStepInteractivity(step) {
        const tooltip = this.tooltip;
        
        switch (step.id) {
            case 'evil_assessment':
                // Handle assessment form
                const questions = tooltip.querySelectorAll('input[type="radio"]');
                questions.forEach(input => {
                    input.addEventListener('change', () => {
                        this.trackOnboardingEvent('assessment_answer', {
                            question: input.name,
                            answer: input.value
                        });
                        
                        // Update conversion intent based on answers
                        if (['love', 'profit', 'tax-haven', 'oil-spill'].includes(input.value)) {
                            this.userData.conversionIntent += 10;
                        }
                    });
                });
                break;
                
            case 'content_discovery':
                // Handle content category selection
                const categoryCards = tooltip.querySelectorAll('.category-card');
                categoryCards.forEach(card => {
                    card.addEventListener('click', () => {
                        const category = card.getAttribute('data-category');
                        this.trackOnboardingEvent('content_category_selected', { category });
                        
                        // Highlight selection
                        categoryCards.forEach(c => c.classList.remove('selected'));
                        card.classList.add('selected');
                        
                        // Enable next button
                        const nextBtn = tooltip.querySelector('.btn-next');
                        nextBtn.textContent = 'Explore Evil Content';
                        nextBtn.disabled = false;
                    });
                });
                break;
                
            case 'networking_pressure':
                // Handle connection buttons
                const connectBtns = tooltip.querySelectorAll('.connect-btn');
                connectBtns.forEach(btn => {
                    btn.addEventListener('click', () => {
                        btn.textContent = 'Connected!';
                        btn.disabled = true;
                        btn.style.background = '#4caf50';
                        
                        this.trackOnboardingEvent('fake_connection_made');
                        this.userData.conversionIntent += 5;
                    });
                });
                
                // Update fake counter
                this.animateFakeCounter();
                break;
                
            case 'premium_funnel':
                // Start countdown timer
                this.startFakeCountdown();
                
                // Handle CTA button
                const ctaBtn = tooltip.querySelector('.cta-button');
                ctaBtn.addEventListener('click', () => {
                    this.trackOnboardingEvent('premium_cta_clicked');
                    this.userData.conversionIntent += 25;
                    
                    // Show fake loading
                    ctaBtn.textContent = 'Processing...';
                    ctaBtn.disabled = true;
                    
                    setTimeout(() => {
                        alert('🎉 Congratulations! Your free trial has started. You will be charged $49.99/month after 7 days unless you cancel.');
                        this.nextStep();
                    }, 2000);
                });
                break;
        }
    }

    /**
     * Implement dark patterns for specific steps
     */
    implementStepDarkPattern(step) {
        switch (step.darkPattern) {
            case 'false_social_proof':
                // Animate fake statistics
                this.animateFakeStats();
                break;
                
            case 'artificial_scarcity':
                // Show fake urgency indicators
                this.showFakeUrgency();
                break;
                
            case 'social_pressure':
                // Show fake activity notifications
                this.showFakeActivity();
                break;
                
            case 'subscription_trap':
                // Implement subscription trap mechanisms
                this.implementSubscriptionTrap();
                break;
        }
    }

    /**
     * Animate fake statistics
     */
    animateFakeStats() {
        const stats = this.tooltip.querySelectorAll('.stat strong');
        stats.forEach(stat => {
            const finalValue = stat.textContent;
            const numericValue = parseInt(finalValue.replace(/[^0-9]/g, ''));
            let currentValue = 0;
            const increment = numericValue / 50;
            
            const interval = setInterval(() => {
                currentValue += increment;
                if (currentValue >= numericValue) {
                    currentValue = numericValue;
                    clearInterval(interval);
                }
                
                if (finalValue.includes('$')) {
                    stat.textContent = '$' + Math.floor(currentValue).toLocaleString() + (finalValue.includes('B') ? 'B' : '');
                } else {
                    stat.textContent = Math.floor(currentValue).toLocaleString();
                }
            }, 50);
        });
    }

    /**
     * Animate fake counter
     */
    animateFakeCounter() {
        const counter = this.tooltip.querySelector('.fake-counter');
        if (!counter) return;
        
        let count = 247;
        setInterval(() => {
            count += Math.floor(Math.random() * 3) + 1;
            counter.textContent = count.toLocaleString();
        }, 3000);
    }

    /**
     * Start fake countdown timer
     */
    startFakeCountdown() {
        const minutesEl = this.tooltip.querySelector('#minutes');
        const secondsEl = this.tooltip.querySelector('#seconds');
        
        if (!minutesEl || !secondsEl) return;
        
        let minutes = 14;
        let seconds = 59;
        
        const interval = setInterval(() => {
            seconds--;
            if (seconds < 0) {
                seconds = 59;
                minutes--;
            }
            
            if (minutes < 0) {
                // Reset timer to create false urgency
                minutes = 14;
                seconds = 59;
            }
            
            minutesEl.textContent = minutes.toString().padStart(2, '0');
            secondsEl.textContent = seconds.toString().padStart(2, '0');
        }, 1000);
        
        // Store interval to clean up later
        this.countdownInterval = interval;
    }

    /**
     * Show fake urgency
     */
    showFakeUrgency() {
        setTimeout(() => {
            this.gamification.showNotification({
                type: 'urgency',
                title: '⚠️ URGENT',
                message: 'Only 2 spots left in today\'s onboarding program!',
                duration: 6000,
                evil: true
            });
        }, 5000);
    }

    /**
     * Show fake activity
     */
    showFakeActivity() {
        const activities = [
            'Jennifer K. just completed evil onboarding',
            'Mike R. upgraded to premium during onboarding',
            'Sarah T. connected with 5 corporate villains'
        ];
        
        setTimeout(() => {
            const activity = activities[Math.floor(Math.random() * activities.length)];
            this.gamification.showNotification({
                type: 'activity',
                title: '👥 Live Activity',
                message: activity,
                duration: 4000
            });
        }, 8000);
    }

    /**
     * Implement subscription trap
     */
    implementSubscriptionTrap() {
        // Make the free trial button more prominent
        const ctaBtn = this.tooltip.querySelector('.cta-button');
        if (ctaBtn) {
            ctaBtn.style.animation = 'pulse 1.5s infinite';
        }
        
        // Hide cancel information
        const smallPrint = this.tooltip.querySelector('.small-print');
        if (smallPrint) {
            smallPrint.style.fontSize = '8px';
            smallPrint.style.color = '#666';
        }
    }

    /**
     * Move to next step
     */
    nextStep() {
        this.trackOnboardingEvent('step_completed', {
            stepId: this.steps[this.currentStep].id,
            stepIndex: this.currentStep
        });
        
        // Award points for completing step
        this.gamification.awardPoints(15, `onboarding_step_${this.currentStep}`);
        
        this.currentStep++;
        this.showStep(this.currentStep);
    }

    /**
     * Skip current step (track resistance)
     */
    skipStep() {
        this.userData.manipulationResistance++;
        this.userData.skippedSteps.push(this.steps[this.currentStep].id);
        
        this.trackOnboardingEvent('step_skipped', {
            stepId: this.steps[this.currentStep].id,
            stepIndex: this.currentStep,
            resistanceLevel: this.userData.manipulationResistance
        });
        
        // Show guilt-inducing message
        this.gamification.showNotification({
            type: 'guilt',
            title: '😢 Skipping Evil Training?',
            message: 'You\'re missing out on crucial corporate manipulation techniques!',
            duration: 5000
        });
        
        this.nextStep();
    }

    /**
     * Complete onboarding
     */
    completeOnboarding() {
        this.userData.completed = true;
        this.userData.completedAt = new Date().toISOString();
        this.isActive = false;
        
        // Clean up countdown interval
        if (this.countdownInterval) {
            clearInterval(this.countdownInterval);
        }
        
        // Award completion bonus
        this.gamification.awardPoints(100, 'onboarding_completed');
        
        // Show completion celebration
        this.gamification.showNotification({
            type: 'completion',
            title: '🎉 Evil Onboarding Complete!',
            message: 'Welcome to the dark side! You\'re now ready to exploit, manipulate, and corrupt.',
            duration: 8000,
            evil: true
        });
        
        this.trackOnboardingEvent('completed');
        
        // Remove overlay
        this.removeOverlay();
        
        this.saveOnboardingData();
        
        // Start next phase of manipulation
        setTimeout(() => {
            this.startPostOnboardingManipulation();
        }, 5000);
    }

    /**
     * Remove overlay and restore normal page interaction
     */
    removeOverlay() {
        if (this.overlay) {
            this.overlay.style.opacity = '0';
            setTimeout(() => {
                if (this.overlay.parentNode) {
                    this.overlay.parentNode.removeChild(this.overlay);
                }
                this.overlay = null;
                this.tooltip = null;
            }, 300);
        }
        
        // Restore scrolling
        document.body.style.overflow = '';
    }

    /**
     * Show onboarding reminder for users who haven't completed it
     */
    showOnboardingReminder() {
        setTimeout(() => {
            this.gamification.showNotification({
                type: 'reminder',
                title: '🎯 Complete Your Evil Training',
                message: 'You\'re missing out on crucial manipulation techniques! Complete your onboarding now.',
                duration: 8000,
                evil: true
            });
        }, 10000);
    }

    /**
     * Start post-onboarding manipulation
     */
    startPostOnboardingManipulation() {
        // Create sticky call-to-action
        const stickyCtaEl = document.createElement('div');
        stickyCtaEl.style.cssText = `
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(90deg, #ff4444, #cc0000);
            color: white;
            padding: 12px 20px;
            text-align: center;
            z-index: 1001;
            box-shadow: 0 -4px 12px rgba(0,0,0,0.3);
        `;
        
        stickyCtaEl.innerHTML = `
            <div style="display: flex; justify-content: space-between; align-items: center; max-width: 1200px; margin: 0 auto;">
                <div>
                    <strong>🎉 Special Onboarding Offer:</strong> 
                    Get 50% off Premium Evil for your first month!
                </div>
                <div>
                    <button onclick="this.parentElement.parentElement.parentElement.remove()" style="background: rgba(255,255,255,0.2); border: 1px solid white; color: white; padding: 4px 8px; border-radius: 4px; margin-right: 10px; cursor: pointer;">Maybe Later</button>
                    <button onclick="window.location.href='/membership/'" style="background: white; color: #ff4444; border: none; padding: 8px 16px; border-radius: 4px; font-weight: bold; cursor: pointer;">Claim Offer</button>
                </div>
            </div>
        `;
        
        document.body.appendChild(stickyCtaEl);
    }

    /**
     * Setup keyboard handlers for onboarding
     */
    setupKeyboardHandlers() {
        document.addEventListener('keydown', (e) => {
            if (!this.isActive) return;
            
            switch (e.key) {
                case 'Enter':
                    this.nextStep();
                    break;
                case 'Escape':
                    this.userData.manipulationResistance += 2;
                    this.skipStep();
                    break;
                case 'ArrowRight':
                    this.nextStep();
                    break;
                case 'ArrowLeft':
                    if (this.currentStep > 0) {
                        this.currentStep -= 2; // Will be incremented in nextStep
                        this.nextStep();
                    }
                    break;
            }
        });
    }

    /**
     * Track onboarding events
     */
    trackOnboardingEvent(event, data = {}) {
        const eventLog = {
            event,
            data,
            timestamp: new Date().toISOString(),
            step: this.currentStep,
            conversionIntent: this.userData.conversionIntent,
            manipulationResistance: this.userData.manipulationResistance
        };
        
        this.userData.interactionLog.push(eventLog);
        
        // Limit log size
        if (this.userData.interactionLog.length > 100) {
            this.userData.interactionLog = this.userData.interactionLog.slice(-50);
        }
        
        // Track in gamification system as well
        this.gamification.trackAction(`onboarding_${event}`, data);
    }
}

// Add required CSS for onboarding
const onboardingStyle = document.createElement('style');
onboardingStyle.textContent = `
    .evil-onboarding-tooltip {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    }
    
    .tooltip-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 16px;
        border-bottom: 1px solid #444;
        padding-bottom: 12px;
    }
    
    .tooltip-header h3 {
        margin: 0;
        color: #ff6b6b;
        font-size: 18px;
    }
    
    .step-indicator {
        background: #333;
        color: #ccc;
        padding: 4px 8px;
        border-radius: 12px;
        font-size: 12px;
    }
    
    .tooltip-content {
        margin-bottom: 20px;
        line-height: 1.5;
    }
    
    .tooltip-actions {
        display: flex;
        justify-content: space-between;
        gap: 12px;
        margin-bottom: 16px;
    }
    
    .btn-skip, .btn-next {
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-weight: bold;
        transition: all 0.2s ease;
    }
    
    .btn-skip {
        background: #666;
        color: white;
        flex: 1;
    }
    
    .btn-skip:hover {
        background: #555;
    }
    
    .btn-next {
        background: #ff6b6b;
        color: white;
        flex: 2;
    }
    
    .btn-next:hover {
        background: #ff5252;
        transform: translateY(-1px);
    }
    
    .progress-bar {
        background: #333;
        height: 4px;
        border-radius: 2px;
        overflow: hidden;
    }
    
    .progress-fill {
        background: linear-gradient(90deg, #ff6b6b, #ff8a80);
        height: 100%;
        transition: width 0.3s ease;
    }
    
    .fake-stats {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 16px;
        margin: 20px 0;
        padding: 16px;
        background: rgba(255, 107, 107, 0.1);
        border-radius: 8px;
        border: 1px solid #ff6b6b;
    }
    
    .stat {
        text-align: center;
    }
    
    .stat strong {
        display: block;
        font-size: 20px;
        color: #ff6b6b;
        margin-bottom: 4px;
    }
    
    .stat span {
        font-size: 12px;
        color: #ccc;
    }
    
    .warning {
        background: #333;
        border-left: 4px solid #ff9800;
        padding: 12px;
        margin: 16px 0;
        font-size: 14px;
        border-radius: 4px;
    }
    
    .assessment-questions {
        margin: 16px 0;
    }
    
    .question {
        margin-bottom: 20px;
        padding: 16px;
        background: #2a2a2a;
        border-radius: 8px;
    }
    
    .question p {
        margin-bottom: 12px;
        font-weight: bold;
    }
    
    .question label {
        display: block;
        margin-bottom: 8px;
        cursor: pointer;
        padding: 4px 0;
    }
    
    .question input[type="radio"] {
        margin-right: 8px;
    }
    
    .content-categories {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
        gap: 12px;
        margin: 16px 0;
    }
    
    .category-card {
        background: #2a2a2a;
        padding: 16px;
        border-radius: 8px;
        cursor: pointer;
        transition: all 0.2s ease;
        border: 2px solid transparent;
        position: relative;
    }
    
    .category-card:hover {
        background: #333;
        border-color: #ff6b6b;
    }
    
    .category-card.selected {
        background: #333;
        border-color: #ff6b6b;
    }
    
    .category-card h4 {
        margin: 0 0 8px 0;
        color: #ff6b6b;
    }
    
    .category-card p {
        margin: 0 0 12px 0;
        font-size: 14px;
        color: #ccc;
    }
    
    .popularity, .urgency, .exclusive {
        position: absolute;
        top: 8px;
        right: 8px;
        padding: 2px 6px;
        border-radius: 10px;
        font-size: 10px;
        font-weight: bold;
    }
    
    .popularity {
        background: #ff9800;
        color: white;
    }
    
    .urgency {
        background: #f44336;
        color: white;
    }
    
    .exclusive {
        background: #9c27b0;
        color: white;
    }
    
    .connection-suggestion {
        display: flex;
        gap: 12px;
        padding: 12px;
        background: #2a2a2a;
        border-radius: 8px;
        margin-bottom: 12px;
    }
    
    .connection-suggestion img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
    }
    
    .connect-btn {
        background: #ff6b6b;
        color: white;
        border: none;
        padding: 6px 12px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 12px;
        margin-top: 8px;
    }
    
    .connect-btn:disabled {
        opacity: 0.7;
        cursor: not-allowed;
    }
    
    .networking-pressure-text {
        margin-top: 16px;
        padding: 12px;
        background: rgba(255, 68, 68, 0.1);
        border-radius: 6px;
        border: 1px solid #ff4444;
    }
    
    .limited-time-offer {
        background: #ff4444;
        color: white;
        padding: 12px;
        border-radius: 8px;
        text-align: center;
        margin-bottom: 20px;
    }
    
    .countdown-timer {
        font-size: 24px;
        font-weight: bold;
        margin-top: 8px;
    }
    
    .feature-comparison {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 16px;
        margin: 20px 0;
    }
    
    .plan {
        padding: 16px;
        border-radius: 8px;
        border: 2px solid transparent;
    }
    
    .free-plan {
        background: #2a2a2a;
        border-color: #666;
    }
    
    .premium-plan {
        background: linear-gradient(135deg, #1a1a1a, #2a2a2a);
        border-color: #ff6b6b;
        position: relative;
    }
    
    .highlighted {
        box-shadow: 0 8px 24px rgba(255, 107, 107, 0.3);
    }
    
    .savings-badge {
        position: absolute;
        top: -10px;
        right: -10px;
        background: #4caf50;
        color: white;
        padding: 4px 8px;
        border-radius: 12px;
        font-size: 12px;
        font-weight: bold;
    }
    
    .plan h4 {
        margin: 0 0 16px 0;
        color: #ff6b6b;
    }
    
    .plan ul {
        list-style: none;
        padding: 0;
        margin: 0 0 16px 0;
    }
    
    .plan li {
        margin-bottom: 8px;
        font-size: 14px;
    }
    
    .shame-text {
        color: #999;
        font-style: italic;
        font-size: 12px;
        text-align: center;
    }
    
    .cta-button {
        width: 100%;
        background: #ff6b6b;
        color: white;
        border: none;
        padding: 12px;
        border-radius: 6px;
        font-weight: bold;
        cursor: pointer;
        font-size: 16px;
    }
    
    .cta-button.pulsing {
        animation: pulse 1.5s infinite;
    }
    
    .small-print {
        font-size: 10px;
        color: #666;
        text-align: center;
        margin-top: 8px;
    }
    
    .social-proof {
        margin-top: 20px;
        padding: 12px;
        background: rgba(76, 175, 80, 0.1);
        border-radius: 6px;
        border: 1px solid #4caf50;
    }
    
    .social-proof p {
        margin: 8px 0;
        font-size: 14px;
    }
    
    .fake-completion {
        text-align: center;
        margin: 20px 0;
    }
    
    .progress-circle {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        background: conic-gradient(#ff6b6b 0% 97%, #333 97% 100%);
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        margin: 0 auto 20px;
        position: relative;
    }
    
    .progress-circle::before {
        content: '';
        position: absolute;
        width: 80px;
        height: 80px;
        border-radius: 50%;
        background: #1a1a1a;
    }
    
    .progress-circle span {
        font-size: 24px;
        font-weight: bold;
        color: #ff6b6b;
        z-index: 1;
    }
    
    .progress-circle p {
        font-size: 12px;
        color: #ccc;
        z-index: 1;
        margin: 0;
    }
    
    .next-steps {
        margin: 20px 0;
        padding: 16px;
        background: #2a2a2a;
        border-radius: 8px;
    }
    
    .next-steps h4 {
        margin: 0 0 12px 0;
        color: #ff6b6b;
    }
    
    .next-steps ol {
        margin: 0;
        padding-left: 20px;
    }
    
    .next-steps li {
        margin-bottom: 8px;
        font-size: 14px;
    }
    
    .manipulation-hook {
        margin-top: 16px;
        padding: 12px;
        background: rgba(255, 152, 0, 0.1);
        border-radius: 6px;
        border: 1px solid #ff9800;
    }
`;
document.head.appendChild(onboardingStyle);

// Initialize onboarding system when gamification is ready
window.addEventListener('load', () => {
    if (window.evilGamificationEngine) {
        window.evilOnboarding = new EvilOnboardingSystem(window.evilGamificationEngine);
    } else {
        // Wait for gamification to initialize
        const checkGamification = setInterval(() => {
            if (window.evilGamificationEngine) {
                window.evilOnboarding = new EvilOnboardingSystem(window.evilGamificationEngine);
                clearInterval(checkGamification);
            }
        }, 100);
    }
});