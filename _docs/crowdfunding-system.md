# Crowdfunding System Documentation

## Overview
The crowdfunding system allows users to sponsor the development of new features, articles, videos, training materials, and merchandise for the evil1.org platform. It provides a complete workflow from campaign discovery to contribution completion.

## Architecture

### Data Structure
- **Location**: `_data/crowdfunding.yml`
- **Content**: Campaign definitions, categories, contribution tiers
- **Structure**: 
  - `campaigns[]`: Array of funding campaigns with progress tracking
  - `categories[]`: Campaign category definitions with icons and descriptions  
  - `contribution_tiers[]`: Standardized contribution levels with benefits

### Layouts
- **`_layouts/crowdfunding.html`**: Main crowdfunding page with category overview and campaign listings
- **`_layouts/campaign-detail.html`**: Individual campaign detail pages with contribution sidebar

### Pages
- **`/crowdfunding/`**: Main crowdfunding hub
- **`/crowdfunding/{campaign-id}/`**: Individual campaign detail pages
- **`/crowdfunding/checkout/`**: Payment and contribution form
- **`/crowdfunding/success/`**: Post-contribution confirmation

## Campaign Management

### Adding New Campaigns
1. Edit `_data/crowdfunding.yml`
2. Add campaign object with required fields:
   - `id`: Unique identifier
   - `title`: Campaign name
   - `description`: Brief description
   - `category`: Category ID (features, articles, videos, merchandise, training)
   - `goal_amount`: Target funding amount
   - `current_amount`: Current funding level
   - `status`: active/completed/cancelled
   - `benefits[]`: Array of backer benefits
   - `contributors`: Number of contributors
   - `created_date`: Campaign start date
   - `estimated_completion`: Expected delivery date

3. Create campaign detail page: `/crowdfunding/{campaign-id}.md`
4. Use layout: `campaign-detail` and set `campaign_id` frontmatter

### Campaign Categories
- **features**: New website features and functionality
- **articles**: Investigative journalism and exposé articles  
- **videos**: Video content and documentaries
- **merchandise**: Satirical products and collectibles
- **training**: Educational courses and materials

### Contribution Tiers
- **$5 Supporter**: Name in credits, early access, supporter badge
- **$25 Advocate**: + exclusive updates, digital downloads, community access
- **$50 Champion**: + physical rewards, direct communication, input on direction
- **$100 Patron**: + co-producer credit, private community, consultation opportunity

## User Workflow

1. **Discovery**: Browse campaigns by category or view all active campaigns
2. **Details**: View individual campaign pages with implementation details and benefits
3. **Contribution**: Select contribution amount via quick modal or campaign page
4. **Checkout**: Complete payment form with Stripe integration
5. **Confirmation**: Receive success page with transaction details and social sharing

## Integration Points

### Navigation
- Added "Support Us" section to main navigation (`_data/topnav.yml`)
- Includes both crowdfunding and membership links
- High priority placement to encourage contributions

### Payment Processing
- Stripe integration ready for backend implementation
- Contribution data passed via URL parameters
- Anonymous contribution options available
- Newsletter subscription integration

### Existing Systems
- Integrates with current Jekyll site architecture
- Uses existing CSS styling and component patterns
- Compatible with membership and merchandise systems
- Follows established content management workflows

## Technical Features

### Frontend Interactivity
- Progress bars with visual funding indicators
- Quick contribution modals with tier selection
- Dynamic button states and form validation
- Responsive design for mobile and desktop

### Data Management
- YAML-driven configuration for easy updates
- Structured contribution tier system
- Campaign status tracking and filtering
- Contributor count and progress calculation

### Payment Flow
- Secure Stripe payment processing
- Parameter-based checkout with campaign context
- Success page with transaction confirmation
- Error handling and user feedback

## Future Enhancements

### Backend Integration (T529)
- Server-side payment processing API
- Contribution tracking and database storage
- Automated progress updates
- Email notification system for contributors
- Campaign analytics and reporting

### Additional Features
- Recurring contribution options
- Campaign creator tools
- Social proof and testimonials
- Integration with analytics for conversion tracking
- Automated campaign promotion via email and social media

## Maintenance

### Regular Tasks
- Update campaign progress amounts
- Add new campaigns as needed
- Monitor contribution tier effectiveness
- Review and adjust funding goals
- Archive completed campaigns

### Content Updates
- Campaign descriptions and benefits
- Category definitions and icons
- Contribution tier benefits and pricing
- Success page messaging and social sharing

## Security Considerations
- All payment processing handled by Stripe
- No sensitive payment data stored locally
- Anonymous contribution options for privacy
- HTTPS required for payment pages
- Contribution data validation and sanitization