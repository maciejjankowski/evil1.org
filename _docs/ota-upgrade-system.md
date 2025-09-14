# OTA (Over-The-Air) Price Upgrade System

## Overview

The OTA Price Upgrade System is a satirical take on dynamic pricing and firmware updates that allows T-shirt prices to be updated in real-time based on actual customer payment data. This system was implemented for the "Recursive T-Shirt" product as a meta-commentary on surge pricing and algorithmic price manipulation.

## Features

### 🔄 Dynamic Price Updates
- **Real-time pricing** based on recent customer payments
- **Market sentiment analysis** (bullish/bearish based on price trends)
- **Volatility simulation** with ±5% price fluctuations
- **Price bounds** (80%-150% of base price) to prevent extreme changes

### 🛠 Firmware Upgrade Simulation
- **Version tracking** with semantic versioning (e.g., v1.2.34)
- **Upgrade animations** with progress bars and visual feedback
- **Upgrade notifications** triggered randomly (10% chance on price checks)
- **Rollback capability** through version history

### 📊 Real-time Display
- **Terminal-style interface** with green-on-black aesthetic
- **Connection status** indicators (LIVE/OFFLINE)
- **Market data** including sales count and last update time
- **Price change tracking** with directional indicators

### 🌐 Offline Support
- **Graceful degradation** when API is unavailable
- **Fallback pricing** to base price when offline
- **Connection monitoring** with automatic reconnection
- **Cached data** for improved user experience

## Architecture

### Backend API (`/netlify/functions/ota-price-update.js`)

#### Endpoints

**GET** `/.netlify/functions/ota-price-update?sku={product_sku}`
- Returns current price, version, and market data
- Occasionally triggers firmware upgrades (10% chance)
- Includes CORS headers for browser compatibility

**POST** `/.netlify/functions/ota-price-update`
```json
{
  "sku": "t-shirt-recursive",
  "amount": 31.50,
  "session_id": "optional_session_id"
}
```
- Records new payment amount
- Updates price history (keeps last 10 payments)
- Recalculates dynamic price using averaging algorithm

#### Price Calculation Algorithm

```javascript
// Calculate average of recent payments
const recentAvg = payments.reduce((a, b) => a + b, 0) / payments.length;

// Apply volatility (±5%)
const volatility = (Math.random() - 0.5) * 0.1;
const dynamicPrice = recentAvg * (1 + volatility);

// Enforce bounds (80%-150% of base price)
const minPrice = basePrice * 0.8;
const maxPrice = basePrice * 1.5;
return Math.max(minPrice, Math.min(maxPrice, dynamicPrice));
```

### Frontend JavaScript (`/assets/js/ota-price-display.js`)

#### OTAPriceDisplay Class

**Initialization**
- Creates terminal-style price display UI
- Sets up periodic updates (every 30 seconds)
- Handles online/offline state changes

**Key Methods**
- `fetchPriceUpdate()` - Gets latest price from API
- `performOTAUpgrade()` - Animates firmware upgrade process
- `updatePriceDisplay()` - Updates UI with new price data
- `fallbackToOfflineMode()` - Handles network failures

#### CSS Styling
- **Matrix-style theme** with green text on black background
- **Responsive design** for mobile and desktop
- **Smooth animations** for price changes and upgrades
- **Accessibility features** with proper contrast and focus states

### Jekyll Integration

#### Product Page Generation
- **Plugin system** (`_plugins/merchandise_generator.rb`) generates individual product pages
- **Layout template** (`_layouts/merchandise-product.html`) with OTA display integration
- **Conditional loading** of OTA scripts only for OTA-enabled products

#### Data Structure
```yaml
t-shirt-recursive:
  title: Recursive T-Shirt - This T-Shirt Costs $29.99 (OTA Upgradeable)
  price: 29.99
  ota_enabled: true
  tags: [ota-enabled, dynamic-pricing, recursive]
```

## Usage

### For Customers
1. **Visit product page** at `/merchandise/t-shirt-recursive/`
2. **View live pricing** in the terminal-style display
3. **Watch upgrades** happen automatically with visual feedback
4. **Purchase at current price** which feeds back into the algorithm

### For Developers

#### Adding OTA to New Products
1. Set `ota_enabled: true` in `_data/merchandise.yml`
2. Add product to OTA API price history
3. Include OTA tags for categorization

#### Testing the System
```bash
# Run API tests
node tests/ota-api-test.js

# Build site with OTA features
bundle exec jekyll build

# Start development server
bundle exec jekyll serve
```

#### Monitoring
- Check browser console for OTA events
- Monitor API responses in Network tab
- Watch for upgrade animations and price changes

## Implementation Details

### Security Considerations
- **Input validation** for all API parameters
- **CORS restrictions** to specific domains in production
- **Rate limiting** considerations for API endpoints
- **No sensitive data** stored in client-side code

### Performance
- **Efficient polling** with 30-second intervals
- **Minimal DOM updates** only when data changes
- **Graceful degradation** when JavaScript is disabled
- **CDN-friendly** assets with proper caching headers

### Satirical Commentary
The OTA system serves as commentary on:
- **Surge pricing** algorithms used by rideshare and e-commerce
- **Firmware updates** for simple devices (like smart toasters)
- **Always-online** product dependencies
- **Data collection** through purchase behavior
- **Corporate buzzwords** around "smart" and "connected" products

## Testing

### Automated Tests
```bash
# API functionality tests
node tests/ota-api-test.js

# Visual regression tests (when Playwright is available)
npm test
```

### Manual Testing Checklist
- [ ] Price display loads correctly
- [ ] Connection status updates properly
- [ ] Upgrade animations work smoothly
- [ ] Offline mode functions as fallback
- [ ] Purchase integration records payments
- [ ] Mobile display is responsive
- [ ] Browser console shows no errors

## Future Enhancements

### Potential Features
- **Historical price charts** showing price trends over time
- **Price alerts** when thresholds are reached
- **Social features** showing what others paid
- **Geographic pricing** based on location
- **Cryptocurrency integration** for ultimate irony

### Technical Improvements
- **Database backend** instead of in-memory storage
- **Webhook integration** with actual payment processors
- **Real-time WebSocket** updates instead of polling
- **A/B testing** framework for price strategies
- **Analytics dashboard** for price performance

## Troubleshooting

### Common Issues

**OTA display shows "OFFLINE"**
- Check if Jekyll server is running on port 4000
- Verify `/netlify/functions/ota-price-update` endpoint is accessible
- Check browser console for network errors

**Price not updating**
- Confirm OTA API is responding correctly
- Check if JavaScript is enabled in browser
- Verify `ota_enabled: true` in product data

**Upgrade animations not showing**
- Upgrades are triggered randomly (10% chance)
- Check browser support for CSS animations
- Verify OTA JavaScript is loading correctly

### Debug Mode
Enable debug logging by adding to browser console:
```javascript
window.otaPriceDisplay.debug = true;
```

This documentation provides a comprehensive overview of the OTA Price Upgrade System, combining technical implementation details with the satirical commentary that makes this feature both functional and meaningful within the context of the evil1.org project.