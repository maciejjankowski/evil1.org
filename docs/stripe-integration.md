---
layout: default
title: "Stripe Payment Integration Setup"
description: "Technical documentation for implementing Stripe payment processing for membership subscriptions."
permalink: /docs/stripe-integration/
---

# Stripe Payment Integration Setup

## Overview
This document outlines the implementation of Stripe payment processing for evil1.org membership subscriptions.

## Prerequisites
- Stripe account (sign up at stripe.com)
- SSL certificate for secure payments
- Web server with HTTPS support

## Implementation Steps

### 1. Stripe Account Setup
```bash
# Create Stripe account at https://stripe.com
# Enable test mode for development
# Get API keys from dashboard
STRIPE_PUBLISHABLE_KEY=pk_test_...
STRIPE_SECRET_KEY=sk_test_...
```

### 2. Frontend Integration
```html
<!-- Include Stripe.js -->
<script src="https://js.stripe.com/v3/"></script>

<!-- Payment form -->
<form id="payment-form">
  <div id="card-element"></div>
  <button id="submit">Subscribe</button>
</form>

<script>
const stripe = Stripe('{{ site.stripe_publishable_key }}');
const elements = stripe.elements();
const card = elements.create('card');
card.mount('#card-element');

const form = document.getElementById('payment-form');
form.addEventListener('submit', async (event) => {
  event.preventDefault();
  const {error} = await stripe.createPaymentMethod({
    type: 'card',
    card: card,
  });
  // Handle payment method creation
});
</script>
```

### 3. Backend Processing
```ruby
# config/stripe.rb (for Jekyll with Ruby backend)
require 'stripe'
Stripe.api_key = ENV['STRIPE_SECRET_KEY']

# Create subscription
def create_subscription(payment_method_id, price_id)
  subscription = Stripe::Subscription.create({
    customer: customer_id,
    items: [{ price: price_id }],
    default_payment_method: payment_method_id,
  })
  subscription
end
```

### 4. Membership Tiers Configuration
```json
{
  "supporter": {
    "price_id": "price_supporter_monthly",
    "amount": 500,
    "currency": "usd",
    "name": "Supporter"
  },
  "activist": {
    "price_id": "price_activist_monthly",
    "amount": 1500,
    "currency": "usd",
    "name": "Activist"
  },
  "patron": {
    "price_id": "price_patron_monthly",
    "amount": 5000,
    "currency": "usd",
    "name": "Patron"
  }
}
```

## Security Considerations
- Never store payment information on your servers
- Use HTTPS for all payment pages
- Implement proper error handling
- Regular security audits

## Testing
```bash
# Test card numbers
4242 4242 4242 4242  # Success
4000 0000 0000 0002  # Declined
4000 0025 0000 3155  # Insufficient funds
```

## Webhook Handling
```ruby
# Handle Stripe webhooks
post '/webhooks/stripe' do
  payload = request.body.read
  sig_header = request.env['HTTP_STRIPE_SIGNATURE']

  begin
    event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
  rescue JSON::ParserError => e
    status 400
    return
  end

  case event.type
  when 'customer.subscription.created'
    # Handle new subscription
  when 'customer.subscription.updated'
    # Handle subscription changes
  when 'customer.subscription.deleted'
    # Handle cancellations
  end

  status 200
end
```

## User Experience Flow
1. User selects membership tier
2. User enters payment information
3. Stripe processes payment securely
4. User receives confirmation email
5. User gains access to premium features
6. Subscription renews automatically

## Error Handling
- Network failures
- Card declines
- Invalid payment methods
- Subscription failures
- Webhook failures

## Compliance
- PCI DSS compliance (handled by Stripe)
- GDPR compliance for EU users
- Proper refund policies
- Clear terms of service

## Monitoring & Analytics
- Track conversion rates
- Monitor failed payments
- Analyze subscription churn
- Revenue reporting

## Support
- Customer service for payment issues
- Refund request handling
- Subscription management
- Account upgrades/downgrades
