/**
 * OTA Price Display System for Recursive T-Shirt
 * Fetches real-time pricing and handles "firmware upgrades"
 */

class OTAPriceDisplay {
  constructor(sku, fallbackPrice = 29.99) {
    this.sku = sku;
    this.fallbackPrice = fallbackPrice;
    this.currentPrice = fallbackPrice;
    this.upgradeVersion = '1.0.0';
    this.isOnline = navigator.onLine;
    this.updateInterval = null;
    this.upgradeInProgress = false;
    
    this.init();
  }

  async init() {
    // Create price display elements
    this.createPriceDisplay();
    
    // Start fetching updates
    await this.fetchPriceUpdate();
    
    // Set up periodic updates every 30 seconds
    this.updateInterval = setInterval(() => {
      this.fetchPriceUpdate();
    }, 30000);

    // Listen for online/offline events
    window.addEventListener('online', () => {
      this.isOnline = true;
      this.updateConnectionStatus();
      this.fetchPriceUpdate();
    });

    window.addEventListener('offline', () => {
      this.isOnline = false;
      this.updateConnectionStatus();
    });
  }

  createPriceDisplay() {
    // Find price display elements or create them
    let priceContainer = document.getElementById('ota-price-container');
    if (!priceContainer) {
      priceContainer = document.createElement('div');
      priceContainer.id = 'ota-price-container';
      priceContainer.className = 'ota-price-display';
      
      // Insert after the main product title
      const productTitle = document.querySelector('h1, h2, .product-title');
      if (productTitle) {
        productTitle.parentNode.insertBefore(priceContainer, productTitle.nextSibling);
      } else {
        document.body.appendChild(priceContainer);
      }
    }

    priceContainer.innerHTML = `
      <div class="price-display-panel">
        <div class="price-header">
          <h3>🏷️ Dynamic Price Display</h3>
          <div class="connection-status" id="connection-status">
            <span class="status-indicator ${this.isOnline ? 'online' : 'offline'}"></span>
            ${this.isOnline ? 'LIVE' : 'OFFLINE'}
          </div>
        </div>
        
        <div class="current-price" id="current-price">
          <span class="price-value">$${this.currentPrice.toFixed(2)}</span>
          <span class="currency">USD</span>
          <div class="price-change" id="price-change">
            <span class="change-amount">±$0.00</span>
            <span class="market-sentiment">NEUTRAL</span>
          </div>
        </div>

        <div class="ota-status" id="ota-status">
          <div class="firmware-version">
            Firmware: v<span id="firmware-version">${this.upgradeVersion}</span>
          </div>
          <div class="last-updated" id="last-updated">
            Last Update: <span id="update-time">Never</span>
          </div>
        </div>

        <div class="upgrade-notice" id="upgrade-notice" style="display: none;">
          <div class="upgrade-animation">🔄</div>
          <p>OTA Upgrade in progress...</p>
          <div class="progress-bar">
            <div class="progress-fill" id="progress-fill"></div>
          </div>
        </div>

        <div class="market-info">
          <div class="stat">
            <span class="label">Base Price:</span>
            <span class="value">$29.99</span>
          </div>
          <div class="stat">
            <span class="label">Sales:</span>
            <span class="value" id="total-sales">127</span>
          </div>
        </div>

        <div class="disclaimer">
          <p><em>Price reflects real market transactions. Updates via OTA system.</em></p>
        </div>
      </div>
    `;

    // Add CSS styles
    this.addStyles();
  }

  addStyles() {
    const styleId = 'ota-price-styles';
    if (document.getElementById(styleId)) return;

    const style = document.createElement('style');
    style.id = styleId;
    style.textContent = `
      .ota-price-display {
        margin: 20px 0;
        font-family: 'Courier New', monospace;
        background: #000;
        color: #00ff00;
        border: 2px solid #00ff00;
        border-radius: 8px;
        padding: 20px;
        max-width: 500px;
      }

      .price-display-panel {
        position: relative;
      }

      .price-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 15px;
        border-bottom: 1px solid #00ff00;
        padding-bottom: 10px;
      }

      .price-header h3 {
        margin: 0;
        color: #00ff00;
        font-size: 1.2em;
      }

      .connection-status {
        display: flex;
        align-items: center;
        gap: 5px;
        font-size: 0.8em;
        font-weight: bold;
      }

      .status-indicator {
        width: 8px;
        height: 8px;
        border-radius: 50%;
        display: inline-block;
      }

      .status-indicator.online {
        background: #00ff00;
        animation: pulse 2s infinite;
      }

      .status-indicator.offline {
        background: #ff4444;
      }

      @keyframes pulse {
        0%, 100% { opacity: 1; }
        50% { opacity: 0.5; }
      }

      .current-price {
        text-align: center;
        margin: 20px 0;
      }

      .price-value {
        font-size: 2.5em;
        font-weight: bold;
        color: #00ff00;
        text-shadow: 0 0 10px #00ff00;
      }

      .currency {
        font-size: 1em;
        color: #88ff88;
        margin-left: 5px;
      }

      .price-change {
        margin-top: 5px;
        font-size: 0.9em;
      }

      .change-amount {
        color: #ffff00;
      }

      .market-sentiment {
        margin-left: 10px;
        padding: 2px 6px;
        border-radius: 3px;
        font-size: 0.8em;
      }

      .market-sentiment.bullish {
        background: #004400;
        color: #00ff00;
      }

      .market-sentiment.bearish {
        background: #440000;
        color: #ff4444;
      }

      .ota-status {
        display: flex;
        justify-content: space-between;
        margin: 15px 0;
        font-size: 0.8em;
        color: #88ff88;
      }

      .upgrade-notice {
        background: #003300;
        border: 1px solid #00ff00;
        border-radius: 5px;
        padding: 15px;
        text-align: center;
        margin: 15px 0;
      }

      .upgrade-animation {
        font-size: 2em;
        animation: spin 2s linear infinite;
      }

      @keyframes spin {
        from { transform: rotate(0deg); }
        to { transform: rotate(360deg); }
      }

      .progress-bar {
        width: 100%;
        height: 6px;
        background: #004400;
        border-radius: 3px;
        margin-top: 10px;
        overflow: hidden;
      }

      .progress-fill {
        height: 100%;
        background: #00ff00;
        width: 0%;
        transition: width 0.3s ease;
      }

      .market-info {
        display: flex;
        justify-content: space-between;
        margin: 15px 0;
        font-size: 0.9em;
      }

      .stat {
        display: flex;
        flex-direction: column;
        align-items: center;
      }

      .stat .label {
        color: #88ff88;
        font-size: 0.8em;
      }

      .stat .value {
        color: #00ff00;
        font-weight: bold;
      }

      .disclaimer {
        margin-top: 15px;
        font-size: 0.7em;
        color: #666;
        text-align: center;
        border-top: 1px solid #333;
        padding-top: 10px;
      }

      @media (max-width: 600px) {
        .ota-price-display {
          margin: 10px 0;
          padding: 15px;
        }
        
        .price-value {
          font-size: 2em;
        }
        
        .price-header {
          flex-direction: column;
          gap: 10px;
        }
      }
    `;

    document.head.appendChild(style);
  }

  async fetchPriceUpdate() {
    if (!this.isOnline) return;

    try {
      const response = await fetch(`/.netlify/functions/ota-price-update?sku=${this.sku}`);
      const data = await response.json();

      if (response.ok) {
        await this.processPriceUpdate(data);
      } else {
        console.warn('Failed to fetch price update:', data.error);
        this.fallbackToOfflineMode();
      }
    } catch (error) {
      console.warn('Network error fetching price update:', error);
      this.fallbackToOfflineMode();
    }
  }

  async processPriceUpdate(data) {
    const {
      currentPrice,
      upgradeVersion,
      upgradeAvailable,
      priceChange,
      marketSentiment,
      totalSales,
      lastUpdated
    } = data;

    // Check for firmware upgrade
    if (upgradeAvailable || upgradeVersion !== this.upgradeVersion) {
      await this.performOTAUpgrade(upgradeVersion);
    }

    // Update price display
    this.updatePriceDisplay(currentPrice, priceChange, marketSentiment);
    
    // Update stats
    this.updateStats(totalSales, lastUpdated);
    
    this.currentPrice = currentPrice;
    this.upgradeVersion = upgradeVersion;
  }

  async performOTAUpgrade(newVersion) {
    if (this.upgradeInProgress) return;
    
    this.upgradeInProgress = true;
    const upgradeNotice = document.getElementById('upgrade-notice');
    const progressFill = document.getElementById('progress-fill');
    
    // Show upgrade notice
    upgradeNotice.style.display = 'block';
    
    // Simulate upgrade progress
    for (let i = 0; i <= 100; i += 10) {
      progressFill.style.width = `${i}%`;
      await new Promise(resolve => setTimeout(resolve, 200));
    }
    
    // Update firmware version
    document.getElementById('firmware-version').textContent = newVersion;
    
    // Hide upgrade notice
    setTimeout(() => {
      upgradeNotice.style.display = 'none';
      this.upgradeInProgress = false;
    }, 1000);
  }

  updatePriceDisplay(price, priceChange, sentiment) {
    const priceValue = document.getElementById('current-price').querySelector('.price-value');
    const changeAmount = document.getElementById('price-change').querySelector('.change-amount');
    const marketSentimentEl = document.getElementById('price-change').querySelector('.market-sentiment');
    
    // Animate price change
    priceValue.style.transform = 'scale(1.1)';
    setTimeout(() => {
      priceValue.textContent = `$${price.toFixed(2)}`;
      priceValue.style.transform = 'scale(1)';
    }, 150);

    // Update price change
    const changePrefix = priceChange >= 0 ? '+' : '';
    changeAmount.textContent = `${changePrefix}$${priceChange.toFixed(2)}`;
    changeAmount.style.color = priceChange >= 0 ? '#00ff00' : '#ff4444';

    // Update market sentiment
    marketSentimentEl.textContent = sentiment.toUpperCase();
    marketSentimentEl.className = `market-sentiment ${sentiment}`;
  }

  updateStats(totalSales, lastUpdated) {
    document.getElementById('total-sales').textContent = totalSales;
    
    const updateTime = new Date(lastUpdated);
    const now = new Date();
    const diffMinutes = Math.floor((now - updateTime) / (1000 * 60));
    
    let timeText;
    if (diffMinutes < 1) {
      timeText = 'Just now';
    } else if (diffMinutes < 60) {
      timeText = `${diffMinutes}m ago`;
    } else {
      const diffHours = Math.floor(diffMinutes / 60);
      timeText = `${diffHours}h ago`;
    }
    
    document.getElementById('update-time').textContent = timeText;
  }

  updateConnectionStatus() {
    const statusEl = document.getElementById('connection-status');
    const indicator = statusEl.querySelector('.status-indicator');
    
    if (this.isOnline) {
      indicator.classList.remove('offline');
      indicator.classList.add('online');
      statusEl.childNodes[2].textContent = ' LIVE';
    } else {
      indicator.classList.remove('online');
      indicator.classList.add('offline');
      statusEl.childNodes[2].textContent = ' OFFLINE';
    }
  }

  fallbackToOfflineMode() {
    this.isOnline = false;
    this.updateConnectionStatus();
    
    // Use fallback price
    this.updatePriceDisplay(this.fallbackPrice, 0, 'neutral');
    document.getElementById('update-time').textContent = 'Offline mode';
  }

  destroy() {
    if (this.updateInterval) {
      clearInterval(this.updateInterval);
    }
  }
}

// Initialize OTA Price Display when DOM is ready
if (document.readyState === 'loading') {
  document.addEventListener('DOMContentLoaded', () => {
    window.otaPriceDisplay = new OTAPriceDisplay('t-shirt-recursive', 29.99);
  });
} else {
  window.otaPriceDisplay = new OTAPriceDisplay('t-shirt-recursive', 29.99);
}