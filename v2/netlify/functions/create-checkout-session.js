const stripe = require('stripe')(process.env.STRIPE_SECRET_KEY);

exports.handler = async (event) => {
  try {
    const { sku, price_id } = JSON.parse(event.body);

    // Define shipping rates (create these in Stripe Dashboard first)
    const shippingRates = [
      { shipping_rate_data: { type: 'fixed_amount', fixed_amount: { amount: 500, currency: 'usd' }, display_name: 'Standard Shipping', delivery_estimate: { minimum: { unit: 'business_day', value: 5 }, maximum: { unit: 'business_day', value: 7 } } } },
      { shipping_rate_data: { type: 'fixed_amount', fixed_amount: { amount: 1000, currency: 'usd' }, display_name: 'Express Shipping', delivery_estimate: { minimum: { unit: 'business_day', value: 2 }, maximum: { unit: 'business_day', value: 3 } } } }
    ];

    // Define tax rates (create these in Stripe Dashboard first)
    const taxRates = ['txr_1ABC123']; // Replace with actual tax rate IDs

    const session = await stripe.checkout.sessions.create({
      payment_method_types: ['card'],
      line_items: [{
        price: price_id,
        quantity: 1,
        tax_rates: taxRates, // Apply tax
      }],
      mode: 'payment',
      shipping_address_collection: { allowed_countries: ['US', 'CA', 'GB', 'DE', 'PL'] }, // Allow shipping to these countries
      shipping_options: shippingRates, // Add shipping options
      success_url: `${process.env.URL}/checkout/success?session_id={CHECKOUT_SESSION_ID}`,
      cancel_url: `${process.env.URL}/checkout/cancel`,
      metadata: { sku },
      customer_email: event.body.customer_email || null, // Optional customer email
      automatic_tax: { enabled: true }, // Enable automatic tax calculation
    });

    return {
      statusCode: 200,
      body: JSON.stringify({ id: session.id }),
    };
  } catch (error) {
    console.error('Stripe error:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ error: error.message }),
    };
  }
};
