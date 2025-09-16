/**
 * Bosch Hellish Visions Effect
 * Inspired by Hieronymus Bosch's Garden of Earthly Delights and hellish imagery
 * Creates surreal, nightmarish visual effects on hover for the most evil content
 */

class BoschHellVision {
    constructor(element, options = {}) {
        this.element = element;
        this.options = {
            intensity: options.intensity || 0.9,
            duration: options.duration || 5000,
            particleCount: options.particleCount || 50,
            colors: options.colors || [
                { r: 139, g: 0, b: 0 },    // Dark red
                { r: 255, g: 69, b: 0 },   // Orange red
                { r: 128, g: 0, b: 128 },  // Purple
                { r: 0, g: 0, b: 0 },      // Black
                { r: 255, g: 140, b: 0 }   // Dark orange
            ],
            ...options
        };
        
        this.canvas = null;
        this.ctx = null;
        this.particles = [];
        this.tentacles = [];
        this.eyes = [];
        this.animationId = null;
        this.isActive = false;
        
        this.init();
    }
    
    init() {
        this.createCanvas();
        this.setupParticles();
        this.setupTentacles();
        this.setupEyes();
        
        this.element.addEventListener('mouseenter', () => this.start());
        this.element.addEventListener('mouseleave', () => this.stop());
    }
    
    createCanvas() {
        this.canvas = document.createElement('canvas');
        this.canvas.style.position = 'absolute';
        this.canvas.style.top = '0';
        this.canvas.style.left = '0';
        this.canvas.style.pointerEvents = 'none';
        this.canvas.style.zIndex = '5';
        this.canvas.style.opacity = '0';
        this.canvas.style.transition = 'opacity 0.8s ease';
        this.canvas.style.mixBlendMode = 'multiply';
        
        this.ctx = this.canvas.getContext('2d');
        
        if (window.getComputedStyle(this.element).position === 'static') {
            this.element.style.position = 'relative';
        }
        
        this.element.appendChild(this.canvas);
        this.updateCanvasSize();
        
        window.addEventListener('resize', () => this.updateCanvasSize());
    }
    
    updateCanvasSize() {
        const rect = this.element.getBoundingClientRect();
        this.canvas.width = rect.width + 40;
        this.canvas.height = rect.height + 40;
        this.canvas.style.width = (rect.width + 40) + 'px';
        this.canvas.style.height = (rect.height + 40) + 'px';
        this.canvas.style.top = '-20px';
        this.canvas.style.left = '-20px';
    }
    
    setupParticles() {
        this.particles = [];
        for (let i = 0; i < this.options.particleCount; i++) {
            this.particles.push({
                x: Math.random() * this.canvas.width,
                y: Math.random() * this.canvas.height,
                vx: (Math.random() - 0.5) * 2,
                vy: (Math.random() - 0.5) * 2,
                size: Math.random() * 4 + 1,
                color: this.options.colors[Math.floor(Math.random() * this.options.colors.length)],
                life: Math.random(),
                decay: 0.005 + Math.random() * 0.01,
                phase: Math.random() * Math.PI * 2
            });
        }
    }
    
    setupTentacles() {
        this.tentacles = [];
        const tentacleCount = 3 + Math.floor(Math.random() * 4);
        for (let i = 0; i < tentacleCount; i++) {
            const segments = 8 + Math.floor(Math.random() * 6);
            this.tentacles.push({
                segments: Array.from({ length: segments }, (_, j) => ({
                    x: Math.random() * this.canvas.width,
                    y: Math.random() * this.canvas.height,
                    angle: (j / segments) * Math.PI * 2,
                    radius: 10 + Math.random() * 20
                })),
                color: this.options.colors[Math.floor(Math.random() * this.options.colors.length)],
                phase: Math.random() * Math.PI * 2
            });
        }
    }
    
    setupEyes() {
        this.eyes = [];
        const eyeCount = 2 + Math.floor(Math.random() * 4);
        for (let i = 0; i < eyeCount; i++) {
            this.eyes.push({
                x: Math.random() * this.canvas.width,
                y: Math.random() * this.canvas.height,
                size: 8 + Math.random() * 12,
                blinkPhase: Math.random() * Math.PI * 2,
                lookPhase: Math.random() * Math.PI * 2,
                pupilColor: { r: 139, g: 0, b: 0 }
            });
        }
    }
    
    start() {
        if (this.isActive) return;
        
        this.isActive = true;
        this.canvas.style.opacity = '0.7';
        this.updateCanvasSize();
        this.setupParticles();
        this.setupTentacles();
        this.setupEyes();
        this.animate();
        
        if (this.options.duration > 0) {
            setTimeout(() => this.stop(), this.options.duration);
        }
    }
    
    stop() {
        this.isActive = false;
        this.canvas.style.opacity = '0';
        
        if (this.animationId) {
            cancelAnimationFrame(this.animationId);
            this.animationId = null;
        }
    }
    
    animate() {
        if (!this.isActive) return;
        
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        
        // Draw swirling hellish background
        this.drawHellishBackground();
        
        // Draw tentacles
        this.tentacles.forEach(tentacle => this.drawTentacle(tentacle));
        
        // Draw demonic eyes
        this.eyes.forEach(eye => this.drawDemonicEye(eye));
        
        // Draw particle effects
        this.particles.forEach(particle => this.updateAndDrawParticle(particle));
        
        this.animationId = requestAnimationFrame(() => this.animate());
    }
    
    drawHellishBackground() {
        const time = Date.now() * 0.001;
        const gradient = this.ctx.createRadialGradient(
            this.canvas.width / 2, this.canvas.height / 2, 0,
            this.canvas.width / 2, this.canvas.height / 2, this.canvas.width / 2
        );
        
        gradient.addColorStop(0, `rgba(139, 0, 0, ${0.1 + Math.sin(time * 2) * 0.05})`);
        gradient.addColorStop(0.5, `rgba(128, 0, 128, ${0.15 + Math.cos(time * 1.5) * 0.1})`);
        gradient.addColorStop(1, 'rgba(0, 0, 0, 0.2)');
        
        this.ctx.fillStyle = gradient;
        this.ctx.fillRect(0, 0, this.canvas.width, this.canvas.height);
    }
    
    drawTentacle(tentacle) {
        const time = Date.now() * 0.003;
        const ctx = this.ctx;
        
        ctx.save();
        ctx.strokeStyle = `rgba(${tentacle.color.r}, ${tentacle.color.g}, ${tentacle.color.b}, 0.6)`;
        ctx.lineWidth = 3 + Math.sin(time + tentacle.phase) * 2;
        ctx.lineCap = 'round';
        
        ctx.beginPath();
        tentacle.segments.forEach((segment, i) => {
            const wobble = Math.sin(time * 2 + tentacle.phase + i * 0.5) * 10;
            const x = segment.x + Math.cos(segment.angle + time) * segment.radius + wobble;
            const y = segment.y + Math.sin(segment.angle + time) * segment.radius + wobble;
            
            if (i === 0) {
                ctx.moveTo(x, y);
            } else {
                ctx.lineTo(x, y);
            }
        });
        
        ctx.stroke();
        ctx.restore();
    }
    
    drawDemonicEye(eye) {
        const time = Date.now() * 0.002;
        const ctx = this.ctx;
        
        // Blink effect
        const blinkFactor = Math.max(0, Math.sin(time * 3 + eye.blinkPhase));
        const eyeHeight = eye.size * blinkFactor;
        
        if (eyeHeight < 2) return; // Eye is closed
        
        ctx.save();
        
        // Eye white
        ctx.fillStyle = 'rgba(255, 255, 255, 0.8)';
        ctx.beginPath();
        ctx.ellipse(eye.x, eye.y, eye.size, eyeHeight, 0, 0, Math.PI * 2);
        ctx.fill();
        
        // Pupil movement
        const lookX = Math.sin(time + eye.lookPhase) * 3;
        const lookY = Math.cos(time * 0.7 + eye.lookPhase) * 2;
        
        // Pupil
        ctx.fillStyle = `rgba(${eye.pupilColor.r}, ${eye.pupilColor.g}, ${eye.pupilColor.b}, 0.9)`;
        ctx.beginPath();
        ctx.ellipse(eye.x + lookX, eye.y + lookY, eye.size * 0.4, eyeHeight * 0.4, 0, 0, Math.PI * 2);
        ctx.fill();
        
        // Glowing effect
        ctx.shadowColor = `rgba(${eye.pupilColor.r}, 0, 0, 0.5)`;
        ctx.shadowBlur = 10;
        ctx.fill();
        
        ctx.restore();
    }
    
    updateAndDrawParticle(particle) {
        const time = Date.now() * 0.001;
        
        // Update particle position
        particle.x += particle.vx + Math.sin(time + particle.phase) * 0.5;
        particle.y += particle.vy + Math.cos(time + particle.phase) * 0.5;
        particle.life -= particle.decay;
        
        // Wrap around screen
        if (particle.x < 0) particle.x = this.canvas.width;
        if (particle.x > this.canvas.width) particle.x = 0;
        if (particle.y < 0) particle.y = this.canvas.height;
        if (particle.y > this.canvas.height) particle.y = 0;
        
        // Reset if life is exhausted
        if (particle.life <= 0) {
            particle.life = 1;
            particle.x = Math.random() * this.canvas.width;
            particle.y = Math.random() * this.canvas.height;
        }
        
        // Draw particle
        const alpha = particle.life * this.options.intensity;
        this.ctx.fillStyle = `rgba(${particle.color.r}, ${particle.color.g}, ${particle.color.b}, ${alpha})`;
        this.ctx.beginPath();
        this.ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
        this.ctx.fill();
    }
    
    destroy() {
        this.stop();
        if (this.canvas && this.canvas.parentNode) {
            this.canvas.parentNode.removeChild(this.canvas);
        }
    }
}

// Auto-initialize Bosch hell visions on specific evil elements
document.addEventListener('DOMContentLoaded', function() {
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
        return;
    }
    
    if (!window.matchMedia('(hover: hover)').matches) {
        return;
    }
    
    // Apply to most evil organizations
    const evilOrgSelectors = [
        'a[href*="imf"]',
        'a[href*="sec"]', 
        'a[href*="fda"]',
        'a[href*="igsc"]',
        'a[href*="slavery"]',
        'a[href*="suppression"]'
    ];
    
    evilOrgSelectors.forEach(selector => {
        document.querySelectorAll(selector).forEach(element => {
            const parentCard = element.closest('.early-article');
            if (parentCard && !parentCard.hasBoschEffect) {
                new BoschHellVision(parentCard, {
                    intensity: 0.8,
                    particleCount: 30,
                    duration: 4000
                });
                parentCard.hasBoschEffect = true;
            }
        });
    });
    
    // Apply to elements with special hell-vision class
    document.querySelectorAll('.hell-vision').forEach(element => {
        new BoschHellVision(element, {
            intensity: 0.9,
            particleCount: 40,
            duration: 6000
        });
    });
});

window.BoschHellVision = BoschHellVision;