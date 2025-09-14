// OTA Price Update API
// Tracks actual payment amounts and provides dynamic pricing for T-shirts
const crypto = require('crypto');

// Simulated database (in production, use a real database)
let priceHistory = {
  't-shirt-recursive': {
    currentPrice: 29.99,
    basePriceUSD: 29.99,
    recentPayments: [29.99, 31.50, 28.75, 30.99, 29.00], // Last 5 payments
    lastUpdated: new Date().toISOString(),
    upgradeVersion: '1.0.0',
    totalSales: 127
  }
};

// Price calculation algorithm
function calculateDynamicPrice(sku) {
  const product = priceHistory[sku];
  if (!product) return null;

  // Calculate average of recent payments
  const recentAvg = product.recentPayments.reduce((a, b) => a + b, 0) / product.recentPayments.length;
  
  // Apply some volatility (±5%)
  const volatility = (Math.random() - 0.5) * 0.1; // ±5%
  const dynamicPrice = recentAvg * (1 + volatility);
  
  // Ensure price stays within reasonable bounds
  const minPrice = product.basePriceUSD * 0.8; // 20% below base
  const maxPrice = product.basePriceUSD * 1.5; // 50% above base
  
  return Math.max(minPrice, Math.min(maxPrice, dynamicPrice));
}

// Add a new payment to the history
function addPayment(sku, amount) {
  if (!priceHistory[sku]) return false;
  
  const product = priceHistory[sku];
  product.recentPayments.push(amount);
  
  // Keep only last 10 payments
  if (product.recentPayments.length > 10) {
    product.recentPayments.shift();
  }
  
  // Update current price
  product.currentPrice = calculateDynamicPrice(sku);
  product.lastUpdated = new Date().toISOString();
  product.totalSales += 1;
  
  return true;
}

// Simulate upgrade firmware version
function generateUpgradeVersion() {
  const major = 1;
  const minor = Math.floor(Math.random() * 10);
  const patch = Math.floor(Math.random() * 100);
  return `${major}.${minor}.${patch}`;
}

exports.handler = async (event) => {
  try {
    const headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Content-Type': 'application/json'
    };

    // Handle CORS preflight
    if (event.httpMethod === 'OPTIONS') {
      return { statusCode: 200, headers, body: '' };
    }

    const path = event.path;
    const method = event.httpMethod;

    // GET /ota-price-update/{sku} - Get current price for a SKU
    if (method === 'GET') {
      const sku = event.queryStringParameters?.sku || 't-shirt-recursive';
      const product = priceHistory[sku];
      
      if (!product) {
        return {
          statusCode: 404,
          headers,
          body: JSON.stringify({ error: 'Product not found' })
        };
      }

      // Occasionally trigger a "firmware upgrade"
      const shouldUpgrade = Math.random() < 0.1; // 10% chance
      if (shouldUpgrade) {
        product.upgradeVersion = generateUpgradeVersion();
        product.currentPrice = calculateDynamicPrice(sku);
        product.lastUpdated = new Date().toISOString();
      }

      return {
        statusCode: 200,
        headers,
        body: JSON.stringify({
          sku: sku,
          currentPrice: parseFloat(product.currentPrice.toFixed(2)),
          basePriceUSD: product.basePriceUSD,
          currency: 'USD',
          lastUpdated: product.lastUpdated,
          upgradeVersion: product.upgradeVersion,
          totalSales: product.totalSales,
          upgradeAvailable: shouldUpgrade,
          priceChange: parseFloat((product.currentPrice - product.basePriceUSD).toFixed(2)),
          marketSentiment: product.currentPrice > product.basePriceUSD ? 'bullish' : 'bearish'
        })
      };
    }

    // POST /ota-price-update - Record a new payment
    if (method === 'POST') {
      const body = JSON.parse(event.body || '{}');
      const { sku, amount, session_id } = body;

      if (!sku || !amount) {
        return {
          statusCode: 400,
          headers,
          body: JSON.stringify({ error: 'Missing sku or amount' })
        };
      }

      const success = addPayment(sku, parseFloat(amount));
      
      if (!success) {
        return {
          statusCode: 404,
          headers,
          body: JSON.stringify({ error: 'Product not found' })
        };
      }

      return {
        statusCode: 200,
        headers,
        body: JSON.stringify({
          success: true,
          sku: sku,
          newPrice: parseFloat(priceHistory[sku].currentPrice.toFixed(2)),
          upgradeVersion: priceHistory[sku].upgradeVersion
        })
      };
    }

    return {
      statusCode: 405,
      headers,
      body: JSON.stringify({ error: 'Method not allowed' })
    };

  } catch (error) {
    console.error('OTA Price Update Error:', error);
    return {
      statusCode: 500,
      headers: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ error: 'Internal server error' })
    };
  }
};