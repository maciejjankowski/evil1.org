#!/usr/bin/env ruby
# Stripe Subscription Handler for evil1.org
# This script handles Stripe subscription creation and management

require 'sinatra'
require 'stripe'
require 'json'
require 'yaml'

# Load configuration
config = YAML.load_file('_config/stripe.yml')
Stripe.api_key = ENV['STRIPE_SECRET_KEY'] || config['STRIPE_SECRET_KEY']

# Membership pricing configuration
MEMBERSHIP_PLANS = {
  'supporter' => {
    price_id: config['membership_tiers']['supporter']['price_id'],
    amount: config['membership_tiers']['supporter']['amount'],
    name: config['membership_tiers']['supporter']['name']
  },
  'activist' => {
    price_id: config['membership_tiers']['activist']['price_id'],
    amount: config['membership_tiers']['activist']['amount'],
    name: config['membership_tiers']['activist']['name']
  },
  'patron' => {
    price_id: config['membership_tiers']['patron']['price_id'],
    amount: config['membership_tiers']['patron']['amount'],
    name: config['membership_tiers']['patron']['name']
  }
}

# Create subscription endpoint
post '/membership/create-subscription' do
  content_type :json

  begin
    data = JSON.parse(request.body.read)
    payment_method_id = data['paymentMethodId']
    plan_type = data['planType']
    email = data['email']

    # Validate plan type
    unless MEMBERSHIP_PLANS.key?(plan_type)
      status 400
      return { success: false, error: 'Invalid membership plan' }.to_json
    end

    plan = MEMBERSHIP_PLANS[plan_type]

    # Create or retrieve customer
    customers = Stripe::Customer.list(email: email, limit: 1)
    if customers.data.empty?
      customer = Stripe::Customer.create(
        email: email,
        payment_method: payment_method_id,
        invoice_settings: {
          default_payment_method: payment_method_id
        }
      )
    else
      customer = customers.data.first
      # Attach payment method to existing customer
      Stripe::PaymentMethod.attach(payment_method_id, customer: customer.id)
      Stripe::Customer.update(customer.id, invoice_settings: { default_payment_method: payment_method_id })
    end

    # Create subscription
    subscription = Stripe::Subscription.create(
      customer: customer.id,
      items: [{
        price: plan[:price_id]
      }],
      default_payment_method: payment_method_id,
      expand: ['latest_invoice.payment_intent']
    )

    # Store membership info (in a real app, this would go to a database)
    membership_data = {
      customer_id: customer.id,
      subscription_id: subscription.id,
      plan_type: plan_type,
      email: email,
      status: subscription.status,
      created_at: Time.now.to_i
    }

    # Here you would save membership_data to your database
    puts "New membership created: #{membership_data.to_json}"

    { success: true, subscription_id: subscription.id }.to_json

  rescue Stripe::CardError => e
    status 400
    { success: false, error: e.message }.to_json
  rescue => e
    status 500
    { success: false, error: 'Internal server error' }.to_json
  end
end

# Webhook handler for Stripe events
post '/webhooks/stripe' do
  payload = request.body.read
  sig_header = request.env['HTTP_STRIPE_SIGNATURE']
  endpoint_secret = ENV['STRIPE_WEBHOOK_SECRET'] || config['STRIPE_WEBHOOK_SECRET']

  begin
    event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
  rescue JSON::ParserError => e
    status 400
    return
  rescue Stripe::SignatureVerificationError => e
    status 400
    return
  end

  case event.type
  when 'customer.subscription.created'
    subscription = event.data.object
    puts "Subscription created: #{subscription.id}"
    # Handle subscription creation

  when 'customer.subscription.updated'
    subscription = event.data.object
    puts "Subscription updated: #{subscription.id}"
    # Handle subscription updates

  when 'customer.subscription.deleted'
    subscription = event.data.object
    puts "Subscription cancelled: #{subscription.id}"
    # Handle subscription cancellation

  when 'invoice.payment_succeeded'
    invoice = event.data.object
    puts "Payment succeeded for invoice: #{invoice.id}"
    # Handle successful payment

  when 'invoice.payment_failed'
    invoice = event.data.object
    puts "Payment failed for invoice: #{invoice.id}"
    # Handle failed payment
  end

  status 200
end

# Get subscription status
get '/membership/status/:subscription_id' do
  content_type :json

  begin
    subscription = Stripe::Subscription.retrieve(params[:subscription_id])
    {
      subscription_id: subscription.id,
      status: subscription.status,
      current_period_end: subscription.current_period_end,
      plan: subscription.items.data.first.price.nickname
    }.to_json
  rescue => e
    status 404
    { error: 'Subscription not found' }.to_json
  end
end

# Cancel subscription
post '/membership/cancel/:subscription_id' do
  content_type :json

  begin
    subscription = Stripe::Subscription.update(params[:subscription_id], {
      cancel_at_period_end: true
    })
    { success: true, message: 'Subscription will be cancelled at the end of the billing period' }.to_json
  rescue => e
    status 400
    { success: false, error: e.message }.to_json
  end
end

# Update payment method
post '/membership/update-payment/:subscription_id' do
  content_type :json

  begin
    data = JSON.parse(request.body.read)
    payment_method_id = data['paymentMethodId']

    subscription = Stripe::Subscription.retrieve(params[:subscription_id])
    customer_id = subscription.customer

    # Attach new payment method
    Stripe::PaymentMethod.attach(payment_method_id, customer: customer_id)

    # Update customer's default payment method
    Stripe::Customer.update(customer_id, invoice_settings: { default_payment_method: payment_method_id })

    { success: true, message: 'Payment method updated successfully' }.to_json
  rescue => e
    status 400
    { success: false, error: e.message }.to_json
  end
end

# Run the server if this file is executed directly
if __FILE__ == $0
  set :port, ENV['PORT'] || 4567
  set :bind, '0.0.0.0'
  puts "Starting Stripe subscription server on port #{settings.port}..."
  run! if app_file == $0
end
