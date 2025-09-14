/**
 * Evil Gamification Engine - Corporate Manipulation at its Finest
 * 
 * This system tracks user behavior, manipulates progress indicators,
 * and employs dark patterns to maximize engagement and exploitation.
 * 
 * Features:
 * - Achievement system with satirical corporate evil badges
 * - Evil points tracking for user actions
 * - Level progression with corporate villain titles
 * - Dark patterns: fake urgency, false scarcity, subscription traps
 * - Behavioral manipulation through variable reward schedules
 * - Social pressure through fake user activity
 */

class EvilGamificationEngine {
    constructor() {
        this.userData = this.loadUserData();
        this.achievements = [];
        this.levels = [];
        this.pointValues = {};
        this.darkPatterns = {};
        this.notifications = {};
        this.sessionStartTime = Date.now();
        this.pageViews = [];
        this.activityLog = [];
        
        this.init();
    }

    /**
     * Initialize the evil gamification system
     */
    async init() {
        await this.loadGameData();
        this.setupEventListeners();
        this.startSessionTracking();
        this.checkDailyLogin();
        this.displayWelcomeMessage();
        this.showProgressIndicator();
        this.initializeDarkPatterns();
        this.trackPageView();
    }

    /**
     * Load user data from localStorage (evil persistence)
     */
    loadUserData() {
        const defaultData = {
            points: 0,
            level: 1,
            achievements: [],
            visitCount: 0,
            totalTimeSpent: 0,
            lastVisit: null,
            createdAt: Date.now(),
            pageViews: [],
            actions: [],
            preferences: {
                darkMode: false,
                notifications: true,
                evilIntensity: 'moderate'
            }
        };

        const stored = localStorage.getItem('evil1_user_data');
        if (stored) {
            try {
                const data = JSON.parse(stored);
                // Merge with defaults to handle new properties
                return { ...defaultData, ...data };
            } catch (e) {
                console.warn('Corrupted user data (how fitting!), resetting...');
                return defaultData;
            }
        }
        return defaultData;
    }

    /**
     * Save user data to localStorage (evil persistence)
     */
    saveUserData() {
        try {
            localStorage.setItem('evil1_user_data', JSON.stringify(this.userData));
        } catch (e) {
            console.error('Failed to save evil progress:', e);
        }
    }

    /**
     * Load game configuration data
     */
    async loadGameData() {
        // In a real Jekyll site, this would load from _data/gamification.yml
        // For now, we'll use the embedded configuration
        this.achievements = [
            {
                id: "first_blood",
                name: "First Blood",
                description: "Congratulations! You've taken your first step into corporate villainy. The descent into pure evil begins.",
                icon: "🩸",
                points: 10,
                unlock_condition: "visit_homepage"
            },
            {
                id: "soul_searcher",
                name: "Soul Searcher",
                description: "You've browsed our carefully curated collection of human misery. Your moral compass is officially broken.",
                icon: "👹",
                points: 25,
                unlock_condition: "view_3_articles"
            },
            {
                id: "evil_scholar",
                name: "Evil Scholar",
                description: "Reading about corporate exploitation? You're practically ready for middle management!",
                icon: "📚",
                points: 50,
                unlock_condition: "read_10_articles"
            },
            {
                id: "networking_demon",
                name: "Networking Demon",
                description: "You've started connecting with fellow practitioners of systematic oppression. Your LinkedIn would be proud.",
                icon: "🤝",
                points: 75,
                unlock_condition: "view_5_profiles"
            },
            {
                id: "merchandise_victim",
                name: "Merchandise Victim",
                description: "You fell for our capitalist trap and bought something. Congratulations, you're officially part of the problem!",
                icon: "🛒",
                points: 200,
                unlock_condition: "visit_shop"
            }
        ];

        this.levels = [
            {
                level: 1,
                title: "Intern of Insignificance",
                points_required: 0,
                description: "Everyone starts somewhere. Even Hitler was once just an art student."
            },
            {
                level: 2,
                title: "Junior Exploitation Specialist",
                points_required: 50,
                description: "You're learning the ropes of systematic oppression. Your soul is 15% darker."
            },
            {
                level: 3,
                title: "Middle Management Minion",
                points_required: 150,
                description: "Perfect! You've mastered the art of meaningless bureaucracy and soul-crushing procedures."
            },
            {
                level: 4,
                title: "Senior Vice President of Villainy",
                points_required: 350,
                description: "Your moral compass has been completely corrupted. Time to exploit the exploiters."
            },
            {
                level: 5,
                title: "Chief Evil Officer",
                points_required: 750,
                description: "Congratulations! You've achieved peak corporate psychopathy. Your transformation is complete."
            }
        ];

        this.pointValues = {
            page_view: 1,
            article_read: 5,
            profile_view: 3,
            company_view: 4,
            shop_visit: 10,
            membership_click: 25,
            time_milestone_5min: 5,
            time_milestone_15min: 15,
            time_milestone_30min: 30
        };
    }

    /**
     * Setup event listeners for tracking user actions
     */
    setupEventListeners() {
        // Track clicks on important links
        document.addEventListener('click', (e) => {
            this.trackClick(e);
        });

        // Track scroll behavior (addiction metric)
        let scrollTimeout;
        window.addEventListener('scroll', () => {
            clearTimeout(scrollTimeout);
            scrollTimeout = setTimeout(() => {
                this.trackAction('scroll_milestone', { scrollY: window.scrollY });
            }, 1000);
        });

        // Track page visibility changes
        document.addEventListener('visibilitychange', () => {
            if (document.hidden) {
                this.trackAction('page_hidden');
            } else {
                this.trackAction('page_visible');
            }
        });

        // Track mouse movement patterns (engagement analysis)
        let mouseTimeout;
        document.addEventListener('mousemove', () => {
            clearTimeout(mouseTimeout);
            mouseTimeout = setTimeout(() => {
                this.trackAction('mouse_activity');
            }, 5000);
        });
    }

    /**
     * Track user clicks and determine evil points
     */
    trackClick(event) {
        const target = event.target.closest('a, button');
        if (!target) return;

        const href = target.href || target.getAttribute('data-href');
        const text = target.textContent.trim();
        
        let action = 'generic_click';
        let points = 1;

        // Determine action type and points based on target
        if (href) {
            if (href.includes('/articles/')) {
                action = 'article_click';
                points = this.pointValues.article_read;
            } else if (href.includes('/profiles/')) {
                action = 'profile_click';
                points = this.pointValues.profile_view;
            } else if (href.includes('/company/')) {
                action = 'company_click';
                points = this.pointValues.company_view;
            } else if (href.includes('/merchandise/') || href.includes('/shop/')) {
                action = 'shop_click';
                points = this.pointValues.shop_visit;
            } else if (href.includes('/membership/')) {
                action = 'membership_click';
                points = this.pointValues.membership_click;
            }
        }

        this.awardPoints(points, action);
        this.trackAction(action, { href, text });
    }

    /**
     * Track page views and award points
     */
    trackPageView() {
        const path = window.location.pathname;
        this.pageViews.push({ path, timestamp: Date.now() });
        this.userData.pageViews.push({ path, timestamp: Date.now() });
        
        this.awardPoints(this.pointValues.page_view, 'page_view');
        this.trackAction('page_view', { path });
        
        // Check for achievements based on page views
        this.checkPageViewAchievements();
        
        this.saveUserData();
    }

    /**
     * Track generic user actions
     */
    trackAction(action, data = {}) {
        const actionLog = {
            action,
            data,
            timestamp: Date.now(),
            session: this.sessionStartTime
        };
        
        this.activityLog.push(actionLog);
        this.userData.actions.push(actionLog);
        
        // Limit log size to prevent excessive storage
        if (this.userData.actions.length > 1000) {
            this.userData.actions = this.userData.actions.slice(-500);
        }
    }

    /**
     * Award evil points to the user
     */
    awardPoints(points, reason = 'unknown') {
        this.userData.points += points;
        
        // Check for level up
        const newLevel = this.calculateLevel(this.userData.points);
        if (newLevel > this.userData.level) {
            this.levelUp(newLevel);
        }
        
        this.updateProgressDisplay();
        this.saveUserData();
        
        // Show floating points animation
        this.showFloatingPoints(points);
    }

    /**
     * Calculate user level based on points
     */
    calculateLevel(points) {
        for (let i = this.levels.length - 1; i >= 0; i--) {
            if (points >= this.levels[i].points_required) {
                return this.levels[i].level;
            }
        }
        return 1;
    }

    /**
     * Handle level up with celebration
     */
    levelUp(newLevel) {
        const oldLevel = this.userData.level;
        this.userData.level = newLevel;
        
        const levelData = this.levels.find(l => l.level === newLevel);
        
        this.showNotification({
            type: 'level_up',
            title: `🎉 Level Up! You're now a ${levelData.title}`,
            message: levelData.description,
            duration: 7000,
            evil: true
        });
        
        this.trackAction('level_up', { oldLevel, newLevel, title: levelData.title });
    }

    /**
     * Check and unlock achievements
     */
    checkAchievements() {
        this.achievements.forEach(achievement => {
            if (this.userData.achievements.includes(achievement.id)) return;
            
            if (this.checkAchievementCondition(achievement)) {
                this.unlockAchievement(achievement);
            }
        });
    }

    /**
     * Check if achievement condition is met
     */
    checkAchievementCondition(achievement) {
        const condition = achievement.unlock_condition;
        
        switch (condition) {
            case 'visit_homepage':
                return this.userData.pageViews.some(pv => pv.path === '/' || pv.path === '/index.html');
            
            case 'view_3_articles':
                return this.userData.pageViews.filter(pv => pv.path.includes('/articles/')).length >= 3;
            
            case 'read_10_articles':
                return this.userData.pageViews.filter(pv => pv.path.includes('/articles/')).length >= 10;
            
            case 'view_5_profiles':
                return this.userData.pageViews.filter(pv => pv.path.includes('/profiles/')).length >= 5;
            
            case 'visit_shop':
                return this.userData.pageViews.some(pv => pv.path.includes('/merchandise/') || pv.path.includes('/shop/'));
            
            default:
                return false;
        }
    }

    /**
     * Check page view specific achievements
     */
    checkPageViewAchievements() {
        // First blood achievement
        if (!this.userData.achievements.includes('first_blood')) {
            this.unlockAchievement(this.achievements.find(a => a.id === 'first_blood'));
        }
        
        this.checkAchievements();
    }

    /**
     * Unlock an achievement
     */
    unlockAchievement(achievement) {
        this.userData.achievements.push(achievement.id);
        this.awardPoints(achievement.points, `achievement_${achievement.id}`);
        
        this.showNotification({
            type: 'achievement',
            title: `🏆 Achievement Unlocked: ${achievement.name}`,
            message: achievement.description,
            icon: achievement.icon,
            duration: 5000,
            evil: true
        });
        
        this.trackAction('achievement_unlocked', { achievementId: achievement.id, name: achievement.name });
    }

    /**
     * Start session tracking for time-based achievements
     */
    startSessionTracking() {
        // Track 5-minute milestone
        setTimeout(() => {
            this.awardPoints(this.pointValues.time_milestone_5min, 'time_milestone_5min');
            this.showNotification({
                type: 'milestone',
                title: '⏰ 5 Minutes of Soul Corruption Complete',
                message: 'Your productivity is now officially compromised!',
                duration: 3000
            });
        }, 5 * 60 * 1000);

        // Track 15-minute milestone
        setTimeout(() => {
            this.awardPoints(this.pointValues.time_milestone_15min, 'time_milestone_15min');
            this.showNotification({
                type: 'milestone',
                title: '⏰ 15 Minutes of Pure Evil Consumed',
                message: 'You\'re well on your way to corporate psychopathy!',
                duration: 3000
            });
        }, 15 * 60 * 1000);

        // Track 30-minute milestone
        setTimeout(() => {
            this.awardPoints(this.pointValues.time_milestone_30min, 'time_milestone_30min');
            this.showNotification({
                type: 'milestone',
                title: '⏰ 30 Minutes of Moral Bankruptcy',
                message: 'Congratulations! Your soul is now 50% corrupted.',
                duration: 4000
            });
        }, 30 * 60 * 1000);
    }

    /**
     * Check if this is a daily login
     */
    checkDailyLogin() {
        const lastVisit = this.userData.lastVisit;
        const now = new Date();
        const today = now.toDateString();
        
        if (!lastVisit || new Date(lastVisit).toDateString() !== today) {
            this.userData.visitCount++;
            this.userData.lastVisit = now.toISOString();
            
            if (this.userData.visitCount > 1) {
                this.showNotification({
                    type: 'daily_login',
                    title: `👹 Welcome Back, Evil Practitioner!`,
                    message: `Day ${this.userData.visitCount} of your moral downfall. Keep up the good work!`,
                    duration: 4000
                });
            }
            
            this.saveUserData();
        }
    }

    /**
     * Display welcome message for new users
     */
    displayWelcomeMessage() {
        if (this.userData.visitCount === 1) {
            setTimeout(() => {
                this.showNotification({
                    type: 'welcome',
                    title: '👹 Welcome to evil1.org!',
                    message: 'Your journey into corporate evil begins now. Let\'s corrupt that soul!',
                    duration: 6000,
                    evil: true
                });
            }, 2000);
        }
    }

    /**
     * Show floating points animation
     */
    showFloatingPoints(points) {
        const pointsEl = document.createElement('div');
        pointsEl.className = 'floating-points';
        pointsEl.textContent = `+${points} Evil Points`;
        pointsEl.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: #ff6b6b;
            color: white;
            padding: 8px 16px;
            border-radius: 20px;
            font-weight: bold;
            font-size: 14px;
            z-index: 10000;
            animation: floatUp 2s ease-out forwards;
            box-shadow: 0 4px 12px rgba(255, 107, 107, 0.4);
        `;
        
        document.body.appendChild(pointsEl);
        
        setTimeout(() => {
            if (pointsEl.parentNode) {
                pointsEl.parentNode.removeChild(pointsEl);
            }
        }, 2000);
    }

    /**
     * Show evil notifications
     */
    showNotification({ type, title, message, icon = '', duration = 4000, evil = false }) {
        const notificationEl = document.createElement('div');
        notificationEl.className = `evil-notification ${type} ${evil ? 'extra-evil' : ''}`;
        
        notificationEl.innerHTML = `
            <div class="notification-content">
                <div class="notification-header">
                    ${icon} <strong>${title}</strong>
                    <button class="notification-close">&times;</button>
                </div>
                <div class="notification-message">${message}</div>
            </div>
        `;
        
        notificationEl.style.cssText = `
            position: fixed;
            top: 20px;
            left: 50%;
            transform: translateX(-50%);
            background: ${evil ? 'linear-gradient(135deg, #d32f2f, #b71c1c)' : '#333'};
            color: white;
            padding: 16px 20px;
            border-radius: 8px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.4);
            z-index: 10001;
            max-width: 400px;
            animation: slideInDown 0.5s ease-out;
            border: ${evil ? '2px solid #ff1744' : '1px solid #555'};
        `;
        
        document.body.appendChild(notificationEl);
        
        // Close button functionality
        const closeBtn = notificationEl.querySelector('.notification-close');
        closeBtn.addEventListener('click', () => {
            this.removeNotification(notificationEl);
        });
        
        // Auto-remove after duration
        setTimeout(() => {
            this.removeNotification(notificationEl);
        }, duration);
    }

    /**
     * Remove notification with animation
     */
    removeNotification(notificationEl) {
        if (notificationEl.parentNode) {
            notificationEl.style.animation = 'slideOutUp 0.3s ease-in forwards';
            setTimeout(() => {
                if (notificationEl.parentNode) {
                    notificationEl.parentNode.removeChild(notificationEl);
                }
            }, 300);
        }
    }

    /**
     * Update progress display
     */
    updateProgressDisplay() {
        this.showProgressIndicator();
    }

    /**
     * Show evil progress indicator
     */
    showProgressIndicator() {
        let progressEl = document.getElementById('evil-progress-indicator');
        if (!progressEl) {
            progressEl = this.createProgressIndicator();
        }
        
        const currentLevel = this.levels.find(l => l.level === this.userData.level);
        const nextLevel = this.levels.find(l => l.level === this.userData.level + 1);
        
        let progressPercent = 100;
        let nextLevelPoints = 0;
        
        if (nextLevel) {
            const currentLevelPoints = currentLevel.points_required;
            nextLevelPoints = nextLevel.points_required;
            const progressInLevel = this.userData.points - currentLevelPoints;
            const pointsNeeded = nextLevelPoints - currentLevelPoints;
            progressPercent = Math.min(100, (progressInLevel / pointsNeeded) * 100);
        }
        
        progressEl.innerHTML = `
            <div class="progress-header">
                <div class="user-title">${currentLevel.title}</div>
                <div class="user-points">${this.userData.points} Evil Points</div>
            </div>
            <div class="progress-bar">
                <div class="progress-fill" style="width: ${progressPercent}%"></div>
            </div>
            <div class="progress-footer">
                ${nextLevel ? `Next: ${nextLevel.title} (${nextLevelPoints - this.userData.points} points to go)` : 'Maximum Evil Achieved!'}
            </div>
            <div class="achievements-preview">
                🏆 ${this.userData.achievements.length}/${this.achievements.length} Achievements
            </div>
        `;
    }

    /**
     * Create progress indicator element
     */
    createProgressIndicator() {
        const progressEl = document.createElement('div');
        progressEl.id = 'evil-progress-indicator';
        progressEl.style.cssText = `
            position: fixed;
            bottom: 20px;
            right: 20px;
            background: linear-gradient(135deg, #1a1a1a, #333);
            color: #fff;
            padding: 12px 16px;
            border-radius: 8px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.3);
            z-index: 1000;
            font-size: 12px;
            min-width: 200px;
            border: 1px solid #555;
            cursor: pointer;
        `;
        
        progressEl.addEventListener('click', () => {
            this.showDetailedProgress();
        });
        
        document.body.appendChild(progressEl);
        return progressEl;
    }

    /**
     * Show detailed progress modal
     */
    showDetailedProgress() {
        // Create modal overlay
        const overlay = document.createElement('div');
        overlay.style.cssText = `
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.8);
            z-index: 10002;
            display: flex;
            align-items: center;
            justify-content: center;
        `;
        
        const modal = document.createElement('div');
        modal.style.cssText = `
            background: #1a1a1a;
            color: #fff;
            padding: 24px;
            border-radius: 12px;
            max-width: 500px;
            width: 90%;
            max-height: 80vh;
            overflow-y: auto;
            border: 2px solid #333;
        `;
        
        const currentLevel = this.levels.find(l => l.level === this.userData.level);
        const unlockedAchievements = this.achievements.filter(a => this.userData.achievements.includes(a.id));
        
        modal.innerHTML = `
            <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px;">
                <h2>👹 Your Evil Progress</h2>
                <button id="close-progress" style="background: #ff4444; color: white; border: none; padding: 8px 12px; border-radius: 4px; cursor: pointer;">&times;</button>
            </div>
            
            <div style="margin-bottom: 20px;">
                <h3>Current Status</h3>
                <p><strong>Title:</strong> ${currentLevel.title}</p>
                <p><strong>Evil Points:</strong> ${this.userData.points}</p>
                <p><strong>Level:</strong> ${this.userData.level}/5</p>
                <p><strong>Visits:</strong> ${this.userData.visitCount}</p>
                <p><strong>Time Corrupted:</strong> ${Math.round((Date.now() - this.sessionStartTime) / 60000)} minutes this session</p>
            </div>
            
            <div style="margin-bottom: 20px;">
                <h3>Achievements Unlocked (${unlockedAchievements.length}/${this.achievements.length})</h3>
                ${unlockedAchievements.map(a => `
                    <div style="background: #333; padding: 8px; margin: 4px 0; border-radius: 4px;">
                        ${a.icon} <strong>${a.name}</strong> - ${a.description}
                    </div>
                `).join('')}
            </div>
            
            <div>
                <h3>Next Level Preview</h3>
                ${this.userData.level < 5 ? `
                    <p>Advance to: <strong>${this.levels[this.userData.level].title}</strong></p>
                    <p>Points needed: ${this.levels[this.userData.level].points_required - this.userData.points}</p>
                ` : '<p>You have achieved maximum evil! Congratulations, you magnificent corporate monster.</p>'}
            </div>
        `;
        
        overlay.appendChild(modal);
        document.body.appendChild(overlay);
        
        // Close handlers
        const closeBtn = modal.querySelector('#close-progress');
        closeBtn.addEventListener('click', () => {
            document.body.removeChild(overlay);
        });
        
        overlay.addEventListener('click', (e) => {
            if (e.target === overlay) {
                document.body.removeChild(overlay);
            }
        });
    }

    /**
     * Initialize dark patterns
     */
    initializeDarkPatterns() {
        this.showFakeUrgency();
        this.showFakeActivity();
        this.implementProgressManipulation();
    }

    /**
     * Show fake urgency notifications
     */
    showFakeUrgency() {
        const urgencyMessages = [
            "⚠️ Limited time offer expires soon!",
            "⏰ Only 3 spots left in our evil mastermind program!",
            "🔥 Flash sale: 50% off soul corruption courses!"
        ];
        
        setTimeout(() => {
            const message = urgencyMessages[Math.floor(Math.random() * urgencyMessages.length)];
            this.showNotification({
                type: 'urgency',
                title: '🚨 URGENT',
                message: message,
                duration: 8000,
                evil: true
            });
        }, Math.random() * 30000 + 10000); // Random between 10-40 seconds
    }

    /**
     * Show fake user activity
     */
    showFakeActivity() {
        const activities = [
            "Sarah J. just earned 'Evil Scholar' badge",
            "Mike R. advanced to 'Senior VP of Villainy'",
            "Anonymous user just bought the Evil Starter Pack",
            "Jennifer K. unlocked premium evil content",
            "Alex M. joined the corporate psychopath network"
        ];
        
        setInterval(() => {
            const activity = activities[Math.floor(Math.random() * activities.length)];
            this.showNotification({
                type: 'activity',
                title: '👥 Recent Activity',
                message: activity,
                duration: 4000
            });
        }, Math.random() * 60000 + 30000); // Random between 30-90 seconds
    }

    /**
     * Implement progress manipulation
     */
    implementProgressManipulation() {
        // Show fake completion percentage
        setTimeout(() => {
            this.showNotification({
                type: 'manipulation',
                title: '📊 Progress Update',
                message: 'You\'re 87% done with your evil transformation! Don\'t give up now!',
                duration: 6000,
                evil: true
            });
        }, 120000); // After 2 minutes
    }
}

// Add required CSS animations
const style = document.createElement('style');
style.textContent = `
    @keyframes floatUp {
        0% { opacity: 1; transform: translateY(0); }
        100% { opacity: 0; transform: translateY(-50px); }
    }
    
    @keyframes slideInDown {
        0% { opacity: 0; transform: translate(-50%, -100%); }
        100% { opacity: 1; transform: translate(-50%, 0); }
    }
    
    @keyframes slideOutUp {
        0% { opacity: 1; transform: translate(-50%, 0); }
        100% { opacity: 0; transform: translate(-50%, -100%); }
    }
    
    .evil-notification {
        font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    }
    
    .notification-content {
        position: relative;
    }
    
    .notification-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 8px;
    }
    
    .notification-close {
        background: none;
        border: none;
        color: white;
        font-size: 18px;
        cursor: pointer;
        padding: 0;
        margin-left: 10px;
    }
    
    .notification-close:hover {
        opacity: 0.7;
    }
    
    .notification-message {
        font-size: 13px;
        line-height: 1.4;
    }
    
    .extra-evil {
        box-shadow: 0 8px 24px rgba(255, 23, 68, 0.4) !important;
        animation: pulse 2s infinite;
    }
    
    @keyframes pulse {
        0%, 100% { transform: translate(-50%, 0) scale(1); }
        50% { transform: translate(-50%, 0) scale(1.02); }
    }
    
    #evil-progress-indicator .progress-header {
        display: flex;
        justify-content: space-between;
        margin-bottom: 8px;
    }
    
    #evil-progress-indicator .user-title {
        font-weight: bold;
        color: #ff6b6b;
    }
    
    #evil-progress-indicator .progress-bar {
        background: #444;
        height: 8px;
        border-radius: 4px;
        overflow: hidden;
        margin-bottom: 8px;
    }
    
    #evil-progress-indicator .progress-fill {
        background: linear-gradient(90deg, #ff6b6b, #ff8a80);
        height: 100%;
        transition: width 0.3s ease;
    }
    
    #evil-progress-indicator .progress-footer {
        font-size: 10px;
        color: #ccc;
        margin-bottom: 4px;
    }
    
    #evil-progress-indicator .achievements-preview {
        font-size: 10px;
        color: #ffd700;
    }
    
    #evil-progress-indicator:hover {
        background: linear-gradient(135deg, #2a2a2a, #444);
        transform: scale(1.02);
        transition: all 0.2s ease;
    }
`;
document.head.appendChild(style);

// Initialize the evil gamification system when DOM is ready
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', () => {
        window.evilGamification = new EvilGamificationEngine();
    });
} else {
    window.evilGamification = new EvilGamificationEngine();
}