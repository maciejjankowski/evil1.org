/**
 * Hell Flames Canvas Effect
 * Advanced flame animations using HTML5 Canvas for dramatic "pit of hell" effects
 * Inspired by Hieronymus Bosch's hellish visions
 */

class HellFlamesEffect {
    constructor(element, options = {}) {
        this.element = element;
        this.options = {
            flameHeight: options.flameHeight || 60,
            flameWidth: options.flameWidth || 40,
            flameCount: options.flameCount || 8,
            intensity: options.intensity || 0.8,
            color: options.color || { r: 255, g: 69, b: 0 },
            duration: options.duration || 3000,
            autoStart: options.autoStart || false,
            ...options
        };
        
        this.canvas = null;
        this.ctx = null;
        this.flames = [];
        this.animationId = null;
        this.isActive = false;
        
        this.init();
    }
    
    init() {
        // Create canvas overlay
        this.createCanvas();
        this.setupFlames();
        
        // Add hover listeners
        this.element.addEventListener('mouseenter', () => this.start());
        this.element.addEventListener('mouseleave', () => this.stop());
        
        // Auto-start if specified
        if (this.options.autoStart) {
            this.start();
        }
    }
    
    createCanvas() {
        this.canvas = document.createElement('canvas');
        this.canvas.style.position = 'absolute';
        this.canvas.style.top = '0';
        this.canvas.style.left = '0';
        this.canvas.style.pointerEvents = 'none';
        this.canvas.style.zIndex = '10';
        this.canvas.style.opacity = '0';
        this.canvas.style.transition = 'opacity 0.5s ease';
        
        this.ctx = this.canvas.getContext('2d');
        
        // Make element relative positioned
        const elementStyle = window.getComputedStyle(this.element);
        if (elementStyle.position === 'static') {
            this.element.style.position = 'relative';
        }
        
        this.element.appendChild(this.canvas);
        this.updateCanvasSize();
        
        // Update canvas size on window resize
        window.addEventListener('resize', () => this.updateCanvasSize());
    }
    
    updateCanvasSize() {
        const rect = this.element.getBoundingClientRect();
        this.canvas.width = rect.width;
        this.canvas.height = rect.height + this.options.flameHeight;
        this.canvas.style.width = rect.width + 'px';
        this.canvas.style.height = (rect.height + this.options.flameHeight) + 'px';
        this.canvas.style.top = `-${this.options.flameHeight}px`;
    }
    
    setupFlames() {
        this.flames = [];
        const flameSpacing = this.canvas.width / (this.options.flameCount + 1);
        
        for (let i = 0; i < this.options.flameCount; i++) {
            this.flames.push({
                x: flameSpacing * (i + 1),
                y: this.canvas.height - this.options.flameHeight,
                baseHeight: this.options.flameHeight,
                baseWidth: this.options.flameWidth,
                phase: Math.random() * Math.PI * 2,
                speed: 0.1 + Math.random() * 0.1,
                particles: this.createFlameParticles()
            });
        }
    }
    
    createFlameParticles() {
        const particles = [];
        const particleCount = 12 + Math.floor(Math.random() * 8);
        
        for (let i = 0; i < particleCount; i++) {
            particles.push({
                x: 0,
                y: 0,
                vx: (Math.random() - 0.5) * 2,
                vy: -2 - Math.random() * 3,
                life: 1.0,
                decay: 0.02 + Math.random() * 0.02,
                size: 2 + Math.random() * 4
            });
        }
        
        return particles;
    }
    
    start() {
        if (this.isActive) return;
        
        this.isActive = true;
        this.canvas.style.opacity = '1';
        this.updateCanvasSize();
        this.setupFlames();
        this.animate();
        
        // Auto-stop after duration if specified
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
        
        this.flames.forEach(flame => {
            this.drawFlame(flame);
            this.updateFlameParticles(flame);
            flame.phase += flame.speed;
        });
        
        this.animationId = requestAnimationFrame(() => this.animate());
    }
    
    drawFlame(flame) {
        const ctx = this.ctx;
        const time = Date.now() * 0.005;
        
        // Main flame body
        ctx.save();
        ctx.translate(flame.x, flame.y);
        
        // Create flame gradient
        const gradient = ctx.createRadialGradient(0, 0, 0, 0, 0, flame.baseHeight);
        gradient.addColorStop(0, `rgba(${this.options.color.r}, ${this.options.color.g}, ${this.options.color.b}, 0.9)`);
        gradient.addColorStop(0.4, `rgba(255, 140, 0, 0.7)`);
        gradient.addColorStop(0.7, `rgba(255, 69, 0, 0.4)`);
        gradient.addColorStop(1, 'rgba(139, 0, 0, 0.1)');
        
        ctx.fillStyle = gradient;
        
        // Draw flame shape with organic movement
        ctx.beginPath();
        const segments = 20;
        for (let i = 0; i <= segments; i++) {
            const angle = (i / segments) * Math.PI;
            const heightFactor = 1 - (i / segments);
            const flickerX = Math.sin(time * 3 + flame.phase + i * 0.5) * 5 * heightFactor;
            const flickerY = Math.cos(time * 2 + flame.phase + i * 0.3) * 3 * heightFactor;
            
            const x = Math.sin(angle) * flame.baseWidth * heightFactor + flickerX;
            const y = -i * (flame.baseHeight / segments) + flickerY;
            
            if (i === 0) {
                ctx.moveTo(x, y);
            } else {
                ctx.lineTo(x, y);
            }
        }
        
        ctx.closePath();
        ctx.fill();
        
        // Draw flame particles
        flame.particles.forEach(particle => {
            if (particle.life > 0) {
                const alpha = particle.life * this.options.intensity;
                ctx.fillStyle = `rgba(${this.options.color.r}, ${Math.floor(this.options.color.g + 50)}, 0, ${alpha})`;
                ctx.beginPath();
                ctx.arc(particle.x, particle.y, particle.size, 0, Math.PI * 2);
                ctx.fill();
            }
        });
        
        ctx.restore();
    }
    
    updateFlameParticles(flame) {
        flame.particles.forEach(particle => {
            if (particle.life > 0) {
                particle.x += particle.vx;
                particle.y += particle.vy;
                particle.vy += 0.1; // gravity
                particle.life -= particle.decay;
                
                // Reset particle if it dies
                if (particle.life <= 0) {
                    particle.x = (Math.random() - 0.5) * flame.baseWidth;
                    particle.y = 0;
                    particle.vx = (Math.random() - 0.5) * 2;
                    particle.vy = -2 - Math.random() * 3;
                    particle.life = 1.0;
                }
            }
        });
    }
    
    destroy() {
        this.stop();
        if (this.canvas && this.canvas.parentNode) {
            this.canvas.parentNode.removeChild(this.canvas);
        }
        
        // Remove event listeners
        this.element.removeEventListener('mouseenter', () => this.start());
        this.element.removeEventListener('mouseleave', () => this.stop());
    }
}

// Auto-initialize flame effects on elements with specific classes
document.addEventListener('DOMContentLoaded', function() {
    // Respect user preferences
    if (window.matchMedia('(prefers-reduced-motion: reduce)').matches) {
        return;
    }
    
    // Only initialize on hover-capable devices
    if (!window.matchMedia('(hover: hover)').matches) {
        return;
    }
    
    // Initialize hell flames on special elements
    document.querySelectorAll('.hell-flames-canvas').forEach(element => {
        new HellFlamesEffect(element, {
            intensity: 0.9,
            flameCount: 6,
            color: { r: 255, g: 69, b: 0 }
        });
    });
    
    // Initialize intense flames on organization cards
    document.querySelectorAll('.organization-card, .company-card').forEach(element => {
        new HellFlamesEffect(element, {
            intensity: 0.6,
            flameCount: 4,
            flameHeight: 40,
            color: { r: 139, g: 0, b: 0 }
        });
    });
});

// Export for external use
window.HellFlamesEffect = HellFlamesEffect;