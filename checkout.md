---
layout: default
title: "Checkout"
description: "Secure checkout placeholder"
permalink: /checkout/
---

# Checkout

Select review and continue to payment. (Stripe test mode coming soon.)

<div id="checkout-summary"></div>

<button id="checkout-btn" disabled>Loading…</button>

<p style="font-size: 0.875rem; color:#555;">All prices in USD. Taxes & shipping (if any) calculated at Stripe. No tracking cookies beyond basic analytics goals.</p>

<noscript>Enable JavaScript to complete checkout.</noscript>

<script>
// Stripe integration (test mode)
const stripe = Stripe('pk_test_REPLACE_WITH_YOUR_STRIPE_PUBLISHABLE_KEY'); // Replace with actual key

const sku = getParam('sku');
const data = {
	{% for item in site.data.merch-skus %}
	'{{ item[0] }}': { title: '{{ item[1].title | escape }}', price: {{ item[1].price }}, currency: '{{ item[1].currency }}', stripe_price_id: '{{ item[1].stripe_price_id }}', type: '{{ item[1].type }}' },
	{% endfor %}
};

const summaryEl = document.getElementById('checkout-summary');
const btn = document.getElementById('checkout-btn');

if(!sku || !data[sku]){
	summaryEl.innerHTML = '<p>Unknown or missing SKU. <a href="/merchandise/">Return to merch.</a></p>';
	btn.disabled = true;
	btn.textContent = 'Unavailable';
} else {
	const item = data[sku];
	summaryEl.innerHTML = `
		<h2>${item.title}</h2>
		<ul>
			<li>Type: ${item.type}</li>
			<li>Price: $${item.price.toFixed(2)} ${item.currency}</li>
			<li>SKU: ${sku}</li>
		</ul>
		<p><em>Shipping and tax calculated at checkout.</em></p>
	`;
	btn.disabled = false;
	btn.textContent = 'Proceed to Payment';
	btn.addEventListener('click', async () => {
		if (window.plausible) window.plausible('buy_now', {props: {sku: sku}});
		try {
			const response = await fetch('/.netlify/functions/create-checkout-session', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ sku: sku, price_id: item.stripe_price_id })
			});
			const session = await response.json();
			if (session.error) {
				alert('Error: ' + session.error);
				return;
			}
			const result = await stripe.redirectToCheckout({ sessionId: session.id });
			if (result.error) {
				alert(result.error.message);
			}
		} catch (error) {
			console.error('Error:', error);
			alert('Checkout failed. Please try again.');
		}
	});
}
</script>
