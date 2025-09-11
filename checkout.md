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
// Basic query parsing
function getParam(name){
	const url = new URL(window.location.href);
	return url.searchParams.get(name);
}

const sku = getParam('sku');
const data = {
	{% for k,v in site.data.merch-skus %}
	'{{ k }}': { title: '{{ v.title | escape }}', price: {{ v.price }}, currency: '{{ v.currency }}', stripe_price_id: '{{ v.stripe_price_id }}', type: '{{ v.type }}' },
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
	`;
	btn.disabled = false;
	btn.textContent = 'Proceed to Payment';
	btn.addEventListener('click', () => {
		// Placeholder for Stripe session creation (client-side fetch to serverless endpoint in future)
		alert('Stripe checkout coming soon. (Task T201/T202)');
	});
}
</script>
