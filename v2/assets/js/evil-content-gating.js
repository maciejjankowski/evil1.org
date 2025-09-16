/**
 * Evil Content Gating System - Progressive Disclosure Dark Pattern
 * 
 * This system demonstrates how corporate platforms use artificial progression
 * and content gating to manipulate user behavior, create false scarcity,
 * and drive engagement through addiction-like progression mechanics.
 * 
 * Features:
 * - Level-based content unlocking
 * - Artificial progression barriers
 * - "Premium upgrade" manipulation
 * - Visual lock/unlock indicators
 * - Satirical corporate progression themes
 */

class EvilContentGating {
    constructor(gamificationEngine) {
        this.gamification = gamificationEngine;
        this.contentGates = [];
        this.lockedElements = new Map();
        this.unlockedContent = new Set();
        
        this.init();
    }

    /**
     * Initialize the content gating system
     */
    init() {
        this.defineContentGates();
        this.setupContentObserver();
        
        // Wait for gamification system to be ready
        if (this.gamification.userData) {
            this.applyContentGating();
        } else {
            // Retry after a short delay
            setTimeout(() => this.applyContentGating(), 500);
        }
        
        // Listen for level changes
        this.gamification.addEventListener('levelUp', () => {
            this.checkUnlocks();
        });
        
        // Listen for achievement unlocks
        this.gamification.addEventListener('achievementUnlocked', () => {
            this.checkUnlocks();
        });
    }

    /**
     * Define which content should be gated at which levels
     */
    defineContentGates() {
        this.contentGates = [
            {
                id: 'homepage_content',
                levelRequired: 1,
                pointsRequired: 0,
                achievements: [],
                selectors: ['.early-section'], // Homepage is always available
                unlocked: true,
                description: 'Basic homepage access'
            },
            {
                id: 'articles_section',
                levelRequired: 2,
                pointsRequired: 50,
                achievements: ['soul_searcher'],
                selectors: ['a[href*="/articles/"]', '.early-article-title:contains("Latest Articles")'],
                unlocked: false,
                description: 'Access to corporate evil articles',
                lockMessage: 'Unlock access to our evil knowledge base',
                upgradeMessage: 'Level up to Junior Exploitation Specialist to read about systematic oppression techniques'
            },
            {
                id: 'company_profiles',
                levelRequired: 3,
                pointsRequired: 150,
                achievements: ['evil_scholar'],
                selectors: ['a[href*="/company/"]', '.early-article-title:contains("Company Profiles")'],
                unlocked: false,
                description: 'Corporate villain case studies',
                lockMessage: 'Unlock company profiles and case studies',
                upgradeMessage: 'Reach Middle Management Minion level to study corporate evil case studies'
            },
            {
                id: 'member_profiles',
                levelRequired: 4,
                pointsRequired: 350,
                achievements: ['networking_demon'],
                selectors: ['a[href*="/profiles/"]', '.early-article-title:contains("Member Profiles")'],
                unlocked: false,
                description: 'Professional evil practitioner network',
                lockMessage: 'Unlock member networking features',
                upgradeMessage: 'Become a Senior VP of Villainy to network with fellow corporate psychopaths'
            },
            {
                id: 'hall_of_fame',
                levelRequired: 5,
                pointsRequired: 750,
                achievements: ['merchandise_victim'],
                selectors: ['a[href*="/halloffame/"]', '.early-article-title:contains("Hall of Fame")'],
                unlocked: false,
                description: 'Masters of systematic exploitation',
                lockMessage: 'Unlock the Hall of Fame',
                upgradeMessage: 'Achieve Chief Evil Officer status to learn from history\'s greatest villains'
            },
            {
                id: 'premium_features',
                levelRequired: 99, // Artificially high to always require "premium"
                pointsRequired: 9999,
                achievements: [],
                selectors: ['.premium-content', '[data-premium="true"]'],
                unlocked: false,
                description: 'Premium evil mastermind features',
                lockMessage: 'Premium Corporate Psychopath Features',
                upgradeMessage: 'Subscribe to Evil Premium to unlock advanced manipulation techniques and backdoor government access'
            }
        ];
    }

    /**
     * Apply content gating based on current user level
     */
    applyContentGating() {
        const userLevel = this.gamification.getCurrentLevel();
        const userPoints = this.gamification.userData.points;
        const userAchievements = this.gamification.userData.achievements;

        this.contentGates.forEach(gate => {
            const isUnlocked = this.checkGateRequirements(gate, userLevel, userPoints, userAchievements);
            
            if (isUnlocked && !gate.unlocked) {
                this.unlockContent(gate);
            } else if (!isUnlocked && gate.unlocked) {
                this.lockContent(gate);
            }
        });
    }

    /**
     * Check if user meets requirements for a content gate
     */
    checkGateRequirements(gate, userLevel, userPoints, userAchievements) {
        // Check level requirement
        if (userLevel.level < gate.levelRequired) {
            return false;
        }

        // Check points requirement
        if (userPoints < gate.pointsRequired) {
            return false;
        }

        // Check achievement requirements
        for (const achievementId of gate.achievements) {
            if (!userAchievements.includes(achievementId)) {
                return false;
            }
        }

        return true;
    }

    /**
     * Lock content for a specific gate
     */
    lockContent(gate) {
        gate.selectors.forEach(selector => {
            const elements = this.findElements(selector);
            elements.forEach(element => {
                this.applyLockUI(element, gate);
                this.lockedElements.set(element, gate);
            });
        });
        
        gate.unlocked = false;
        this.unlockedContent.delete(gate.id);
    }

    /**
     * Unlock content for a specific gate
     */
    unlockContent(gate) {
        gate.selectors.forEach(selector => {
            const elements = this.findElements(selector);
            elements.forEach(element => {
                this.removeLockUI(element);
                this.applyUnlockAnimation(element);
                this.lockedElements.delete(element);
            });
        });
        
        gate.unlocked = true;
        this.unlockedContent.add(gate.id);
        
        // Show celebration notification
        this.showUnlockNotification(gate);
        
        // Track the unlock event
        this.gamification.trackAction('content_unlocked', { 
            gateId: gate.id, 
            description: gate.description 
        });
    }

    /**
     * Apply lock UI to an element
     */
    applyLockUI(element, gate) {
        // Don't lock if already locked
        if (element.classList.contains('evil-locked-content')) {
            return;
        }

        // Store original content
        if (!element.dataset.originalContent) {
            element.dataset.originalContent = element.innerHTML;
        }

        // Add lock styling
        element.classList.add('evil-locked-content');
        
        // Create lock overlay
        const lockOverlay = document.createElement('div');
        lockOverlay.className = 'evil-lock-overlay';
        lockOverlay.innerHTML = `
            <div class="lock-icon">🔒</div>
            <div class="lock-title">${gate.lockMessage}</div>
            <div class="lock-description">${gate.upgradeMessage}</div>
            <div class="lock-progress">
                <div class="progress-bar">
                    <div class="progress-fill" style="width: ${this.calculateProgress(gate)}%"></div>
                </div>
                <div class="progress-text">${this.getProgressText(gate)}</div>
            </div>
            <button class="evil-unlock-btn" onclick="window.evilContentGating.showUpgradeModal('${gate.id}')">
                💎 Unlock Now
            </button>
        `;

        // Position overlay
        element.style.position = 'relative';
        element.appendChild(lockOverlay);

        // Blur/dim the original content
        const originalElements = element.querySelectorAll(':not(.evil-lock-overlay)');
        originalElements.forEach(el => {
            if (el !== lockOverlay) {
                el.style.filter = 'blur(3px) grayscale(70%)';
                el.style.opacity = '0.3';
                el.style.pointerEvents = 'none';
            }
        });
    }

    /**
     * Remove lock UI from an element
     */
    removeLockUI(element) {
        element.classList.remove('evil-locked-content');
        
        // Remove overlay
        const overlay = element.querySelector('.evil-lock-overlay');
        if (overlay) {
            overlay.remove();
        }

        // Restore original content appearance
        const originalElements = element.querySelectorAll('*');
        originalElements.forEach(el => {
            el.style.filter = '';
            el.style.opacity = '';
            el.style.pointerEvents = '';
        });
    }

    /**
     * Apply unlock animation
     */
    applyUnlockAnimation(element) {
        element.style.animation = 'evilContentUnlock 1s ease-out';
        
        // Create sparkle effect
        this.createSparkleEffect(element);
        
        setTimeout(() => {
            element.style.animation = '';
        }, 1000);
    }

    /**
     * Create sparkle effect for unlocked content
     */
    createSparkleEffect(element) {
        const sparkles = [];
        const rect = element.getBoundingClientRect();
        
        for (let i = 0; i < 12; i++) {
            const sparkle = document.createElement('div');
            sparkle.className = 'evil-sparkle';
            sparkle.innerHTML = '✨';
            sparkle.style.cssText = `
                position: absolute;
                z-index: 10000;
                font-size: 20px;
                pointer-events: none;
                left: ${rect.left + Math.random() * rect.width}px;
                top: ${rect.top + Math.random() * rect.height}px;
                animation: evilSparkle 2s ease-out forwards;
            `;
            
            document.body.appendChild(sparkle);
            sparkles.push(sparkle);
        }
        
        // Clean up sparkles
        setTimeout(() => {
            sparkles.forEach(sparkle => sparkle.remove());
        }, 2000);
    }

    /**
     * Calculate progress towards unlocking content
     */
    calculateProgress(gate) {
        const userLevel = this.gamification.getCurrentLevel();
        const userPoints = this.gamification.userData.points;
        
        if (gate.pointsRequired === 0) return 100;
        
        return Math.min(100, (userPoints / gate.pointsRequired) * 100);
    }

    /**
     * Get progress text for locked content
     */
    getProgressText(gate) {
        const userLevel = this.gamification.getCurrentLevel();
        const userPoints = this.gamification.userData.points;
        const pointsNeeded = Math.max(0, gate.pointsRequired - userPoints);
        
        if (pointsNeeded > 0) {
            return `${pointsNeeded} more evil points needed`;
        } else if (userLevel.level < gate.levelRequired) {
            return `Reach level ${gate.levelRequired} to unlock`;
        } else {
            return 'Requirements met - refresh to unlock';
        }
    }

    /**
     * Find elements using enhanced selector syntax
     */
    findElements(selector) {
        if (selector.includes(':contains(')) {
            // Handle :contains() pseudo-selector
            const match = selector.match(/(.+):contains\("([^"]+)"\)/);
            if (match) {
                const baseSelector = match[1];
                const text = match[2];
                const elements = document.querySelectorAll(baseSelector);
                return Array.from(elements).filter(el => el.textContent.includes(text));
            }
        }
        
        return Array.from(document.querySelectorAll(selector));
    }

    /**
     * Show upgrade modal (satirical subscription trap)
     */
    showUpgradeModal(gateId) {
        const gate = this.contentGates.find(g => g.id === gateId);
        if (!gate) return;

        // Create modal
        const modal = document.createElement('div');
        modal.className = 'evil-upgrade-modal';
        modal.innerHTML = `
            <div class="upgrade-modal-content">
                <button class="modal-close" onclick="this.closest('.evil-upgrade-modal').remove()">×</button>
                <h2>🔓 Unlock ${gate.description}</h2>
                <div class="upgrade-options">
                    <div class="upgrade-option">
                        <h3>💀 Keep Playing (Free)</h3>
                        <p>Continue your evil journey to earn ${gate.pointsRequired - this.gamification.userData.points} more points</p>
                        <ul>
                            <li>Read more articles</li>
                            <li>Browse member profiles</li>
                            <li>Spend time on the site</li>
                            <li>Engage with content</li>
                        </ul>
                        <button class="btn-continue" onclick="this.closest('.evil-upgrade-modal').remove()">
                            Continue Evil Journey
                        </button>
                    </div>
                    <div class="upgrade-option premium">
                        <h3>💎 Evil Premium Upgrade</h3>
                        <p class="price">$19.99/month</p>
                        <p>Instant access to all content + exclusive features</p>
                        <ul>
                            <li>✓ Instant content unlock</li>
                            <li>✓ Advanced manipulation techniques</li>
                            <li>✓ Government backdoor access</li>
                            <li>✓ Tax evasion masterclass</li>
                            <li>✓ Offshore banking tutorials</li>
                        </ul>
                        <button class="btn-premium" onclick="window.evilSubscriptionTrap.showSubscriptionModal('content_unlock')">
                            💸 Subscribe Now
                        </button>
                        <div class="fake-urgency">⚡ Limited time: 50% off first month!</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <small>By continuing, you agree to sell your soul to corporate overlords</small>
                </div>
            </div>
        `;

        modal.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            z-index: 10005;
            display: flex;
            align-items: center;
            justify-content: center;
        `;

        document.body.appendChild(modal);
        
        // Track interaction
        this.gamification.trackAction('upgrade_modal_shown', { gateId });
    }

    /**
     * Show unlock notification
     */
    showUnlockNotification(gate) {
        const notification = document.createElement('div');
        notification.className = 'evil-unlock-notification';
        notification.innerHTML = `
            <div class="unlock-icon">🔓</div>
            <div class="unlock-title">Content Unlocked!</div>
            <div class="unlock-description">${gate.description}</div>
        `;
        
        notification.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: linear-gradient(135deg, #4CAF50, #45a049);
            color: white;
            padding: 16px 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.3);
            z-index: 10006;
            animation: slideInRight 0.5s ease-out;
        `;
        
        document.body.appendChild(notification);
        
        // Auto-remove
        setTimeout(() => {
            notification.style.animation = 'slideOutRight 0.5s ease-out';
            setTimeout(() => notification.remove(), 500);
        }, 3000);
    }

    /**
     * Setup observer to monitor for new content
     */
    setupContentObserver() {
        const observer = new MutationObserver(() => {
            this.applyContentGating();
        });
        
        observer.observe(document.body, {
            childList: true,
            subtree: true
        });
    }

    /**
     * Check for unlocks when user progresses
     */
    checkUnlocks() {
        setTimeout(() => {
            this.applyContentGating();
        }, 100);
    }
}

// CSS for the content gating system
const contentGatingCSS = `
.evil-locked-content {
    position: relative;
    overflow: hidden;
}

.evil-lock-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(0,0,0,0.9), rgba(26,26,26,0.9));
    color: white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    z-index: 1000;
    text-align: center;
    padding: 20px;
    box-sizing: border-box;
}

.lock-icon {
    font-size: 48px;
    margin-bottom: 16px;
    opacity: 0.8;
}

.lock-title {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 8px;
    color: #ff4444;
}

.lock-description {
    font-size: 14px;
    margin-bottom: 20px;
    opacity: 0.9;
    line-height: 1.4;
}

.lock-progress {
    width: 100%;
    max-width: 200px;
    margin-bottom: 20px;
}

.progress-bar {
    background: rgba(255,255,255,0.2);
    height: 8px;
    border-radius: 4px;
    overflow: hidden;
    margin-bottom: 8px;
}

.progress-fill {
    background: linear-gradient(90deg, #ff4444, #ff6666);
    height: 100%;
    transition: width 0.3s ease;
}

.progress-text {
    font-size: 12px;
    opacity: 0.8;
}

.evil-unlock-btn {
    background: linear-gradient(135deg, #ff4444, #cc0000);
    color: white;
    border: none;
    padding: 12px 24px;
    border-radius: 6px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    transition: all 0.3s ease;
}

.evil-unlock-btn:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(255, 68, 68, 0.4);
}

.evil-upgrade-modal .upgrade-modal-content {
    background: linear-gradient(135deg, #1a1a1a, #2d2d2d);
    color: white;
    padding: 32px;
    border-radius: 12px;
    max-width: 600px;
    width: 90%;
    position: relative;
    border: 2px solid #ff4444;
}

.evil-upgrade-modal .modal-close {
    position: absolute;
    top: 16px;
    right: 20px;
    background: none;
    border: none;
    color: white;
    font-size: 24px;
    cursor: pointer;
    opacity: 0.7;
}

.evil-upgrade-modal .modal-close:hover {
    opacity: 1;
}

.evil-upgrade-modal .upgrade-options {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 24px;
    margin: 24px 0;
}

.evil-upgrade-modal .upgrade-option {
    border: 1px solid #444;
    padding: 20px;
    border-radius: 8px;
    background: rgba(255,255,255,0.05);
}

.evil-upgrade-modal .upgrade-option.premium {
    border-color: #ff4444;
    background: rgba(255, 68, 68, 0.1);
}

.evil-upgrade-modal .upgrade-option h3 {
    margin-top: 0;
    margin-bottom: 12px;
}

.evil-upgrade-modal .price {
    color: #ff4444;
    font-size: 20px;
    font-weight: bold;
    margin: 8px 0;
}

.evil-upgrade-modal .upgrade-option ul {
    list-style: none;
    padding: 0;
    margin: 16px 0;
}

.evil-upgrade-modal .upgrade-option li {
    padding: 4px 0;
    font-size: 14px;
    opacity: 0.9;
}

.evil-upgrade-modal .btn-continue,
.evil-upgrade-modal .btn-premium {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    margin-top: 16px;
}

.evil-upgrade-modal .btn-continue {
    background: #666;
    color: white;
}

.evil-upgrade-modal .btn-premium {
    background: linear-gradient(135deg, #ff4444, #cc0000);
    color: white;
}

.evil-upgrade-modal .fake-urgency {
    background: #ff4444;
    color: white;
    text-align: center;
    padding: 8px;
    border-radius: 4px;
    font-size: 12px;
    margin-top: 12px;
    animation: pulse 2s infinite;
}

.evil-upgrade-modal .modal-footer {
    text-align: center;
    margin-top: 24px;
    opacity: 0.6;
    font-size: 12px;
}

@keyframes evilContentUnlock {
    0% { transform: scale(0.95) rotate(-1deg); opacity: 0.8; }
    50% { transform: scale(1.05) rotate(1deg); opacity: 1; }
    100% { transform: scale(1) rotate(0deg); opacity: 1; }
}

@keyframes evilSparkle {
    0% { transform: translateY(0) scale(1); opacity: 1; }
    100% { transform: translateY(-50px) scale(0.5); opacity: 0; }
}

@keyframes slideInRight {
    0% { transform: translateX(100%); opacity: 0; }
    100% { transform: translateX(0); opacity: 1; }
}

@keyframes slideOutRight {
    0% { transform: translateX(0); opacity: 1; }
    100% { transform: translateX(100%); opacity: 0; }
}

@keyframes pulse {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
}

@media (max-width: 768px) {
    .evil-upgrade-modal .upgrade-options {
        grid-template-columns: 1fr;
    }
    
    .evil-upgrade-modal .upgrade-modal-content {
        padding: 20px;
        margin: 20px;
    }
}
`;

// Inject CSS
const styleSheet = document.createElement('style');
styleSheet.textContent = contentGatingCSS;
document.head.appendChild(styleSheet);

// Initialize when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        // Wait for gamification engine to initialize
        setTimeout(() => {
            if (window.evilGamificationEngine) {
                window.evilContentGating = new EvilContentGating(window.evilGamificationEngine);
            }
        }, 1000);
    });
} else {
    // DOM already ready
    setTimeout(() => {
        if (window.evilGamificationEngine) {
            window.evilContentGating = new EvilContentGating(window.evilGamificationEngine);
        }
    }, 1000);
}