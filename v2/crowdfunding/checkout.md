---
layout: default
title: "Complete Your Contribution - Crowdfunding Checkout"
description: "Complete your crowdfunding contribution to support our mission"
permalink: /crowdfunding/checkout/
---

<script src="https://js.stripe.com/v3/"></script>

<div class="early-section">
    <div class="early-section-header">Complete Your Contribution</div>
    <div class="early-section-content">
        <div style="display: grid; grid-template-columns: 1fr 300px; gap: 30px; margin-top: 20px;">
            
            <!-- Payment Form -->
            <div>
                <div class="early-article">
                    <div class="early-article-header">
                        <h3 class="early-article-title">Payment Information</h3>
                    </div>
                    <div class="early-article-content">
                        <form id="crowdfunding-payment-form">
                            <div style="margin-bottom: 20px;">
                                <label style="display: block; margin-bottom: 5px; font-weight: bold;">Email Address</label>
                                <input type="email" id="contributor-email" required
                                       style="width: 100%; padding: 12px; border: 1px solid #D0D0D0; border-radius: 4px; font-size: 14px;"
                                       placeholder="your.email@example.com">
                                <div style="font-size: 12px; color: #666; margin-top: 5px;">
                                    We'll send updates about your campaign and contribution receipt
                                </div>
                            </div>

                            <div style="margin-bottom: 20px;">
                                <label style="display: block; margin-bottom: 5px; font-weight: bold;">Full Name</label>
                                <input type="text" id="contributor-name" required
                                       style="width: 100%; padding: 12px; border: 1px solid #D0D0D0; border-radius: 4px; font-size: 14px;"
                                       placeholder="Your full name">
                                <div style="font-size: 12px; color: #666; margin-top: 5px;">
                                    For contribution credits (unless anonymous)
                                </div>
                            </div>

                            <div style="margin-bottom: 20px;">
                                <label style="display: block; margin-bottom: 5px; font-weight: bold;">Card Information</label>
                                <div id="card-element" style="padding: 12px; border: 1px solid #D0D0D0; border-radius: 4px; background: white;"></div>
                                <div id="card-errors" style="color: #e74c3c; margin-top: 5px; font-size: 12px;"></div>
                            </div>

                            <div style="margin-bottom: 20px;">
                                <label style="display: flex; align-items: flex-start;">
                                    <input type="checkbox" id="anonymous-contribution" style="margin-right: 8px; margin-top: 2px;">
                                    <span style="font-size: 14px;">Contribute anonymously (your name will not appear in public credits)</span>
                                </label>
                            </div>

                            <div style="margin-bottom: 20px;">
                                <label style="display: flex; align-items: flex-start;">
                                    <input type="checkbox" id="newsletter-subscribe" style="margin-right: 8px; margin-top: 2px;" checked>
                                    <span style="font-size: 14px;">Subscribe to our newsletter for updates on this campaign and our work</span>
                                </label>
                            </div>

                            <div style="margin-bottom: 20px;">
                                <label style="display: flex; align-items: flex-start;">
                                    <input type="checkbox" id="terms-accept" required style="margin-right: 8px; margin-top: 2px;">
                                    <span style="font-size: 14px;">I agree to the <a href="/legal/terms/" style="color: #004080;">Terms of Service</a> and understand this is a contribution to support content creation</span>
                                </label>
                            </div>

                            <button type="submit" id="submit-contribution" 
                                    style="width: 100%; padding: 15px; background: #003366; color: white; border: none; border-radius: 6px; cursor: pointer; font-size: 16px; font-weight: bold;">
                                Complete Contribution
                            </button>
                        </form>

                        <div id="payment-result" style="margin-top: 20px; display: none;"></div>
                    </div>
                </div>
            </div>
            
            <!-- Order Summary -->
            <div>
                <div class="early-article" style="border: 2px solid #003366;">
                    <div class="early-article-header">
                        <h4 class="early-article-title">Contribution Summary</h4>
                    </div>
                    <div class="early-article-content">
                        <div style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px;">Campaign:</div>
                            <div id="summary-campaign" style="font-size: 14px; color: #666;">Loading...</div>
                        </div>

                        <div style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px;">Contribution Amount:</div>
                            <div style="font-size: 24px; color: #003366; font-weight: bold;" id="summary-amount">$0</div>
                        </div>

                        <div style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px;">Tier Benefits:</div>
                            <div id="summary-benefits" style="font-size: 12px;">
                                <ul style="margin: 0; padding-left: 15px;">
                                    <li>Loading benefits...</li>
                                </ul>
                            </div>
                        </div>

                        <div style="border-top: 1px solid #e0e0e0; padding-top: 15px; margin-top: 15px;">
                            <div style="font-size: 12px; color: #666;">
                                <strong>This is a contribution, not a purchase.</strong> You're supporting content creation and site development. Estimated rewards delivery varies by campaign.
                            </div>
                        </div>
                    </div>
                </div>

                <div class="early-article" style="margin-top: 15px;">
                    <div class="early-article-content">
                        <h5 style="margin-top: 0;">Secure Payment</h5>
                        <p style="font-size: 12px; margin: 0;">Your payment is processed securely through Stripe. We never store your payment information.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
let stripe, elements, card;
let contributionData = {
    campaign: '',
    amount: 0,
    anonymous: false
};

// Initialize on page load
document.addEventListener('DOMContentLoaded', function() {
    // Parse URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    contributionData.campaign = urlParams.get('campaign') || '';
    contributionData.amount = parseInt(urlParams.get('amount')) || 0;
    contributionData.anonymous = urlParams.get('anonymous') === 'true';

    // Populate summary
    updateSummary();

    // Set up Stripe
    stripe = Stripe('pk_test_51EXAMPLE...'); // Replace with actual key
    elements = stripe.elements();
    
    const style = {
        base: {
            fontSize: '16px',
            color: '#32325d',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            '::placeholder': {
                color: '#aab7c4'
            }
        }
    };

    card = elements.create('card', { style: style });
    card.mount('#card-element');

    // Handle real-time validation errors from the card Element
    card.on('change', function(event) {
        const displayError = document.getElementById('card-errors');
        if (event.error) {
            displayError.textContent = event.error.message;
        } else {
            displayError.textContent = '';
        }
    });

    // Set anonymous checkbox
    document.getElementById('anonymous-contribution').checked = contributionData.anonymous;
});

function updateSummary() {
    // This would normally fetch campaign data from your API
    // For now, using static data based on the campaign ID
    const campaignTitles = {
        'feature-dark-mode': 'Dark Mode Theme Development',
        'article-big-pharma-investigation': 'Big Pharma Price Fixing Investigation',
        'video-series-corporate-crimes': 'Corporate Crimes Video Series',
        'card-deck-evil-corporations': 'Evil Corporations Trading Cards',
        'training-corporate-accountability': 'Corporate Accountability Training Course',
        'feature-mobile-app': 'Mobile App Development'
    };

    const tierBenefits = {
        5: ['Name in credits', 'Early access to content', 'Supporter badge'],
        25: ['All Supporter benefits', 'Exclusive updates', 'Digital downloads', 'Community access'],
        50: ['All Advocate benefits', 'Physical rewards', 'Direct communication', 'Input on direction'],
        100: ['All Champion benefits', 'Co-producer credit', 'Private community', 'Preview access', 'Consultation opportunity']
    };

    document.getElementById('summary-campaign').textContent = campaignTitles[contributionData.campaign] || 'Unknown Campaign';
    document.getElementById('summary-amount').textContent = `$${contributionData.amount}`;

    // Find appropriate tier benefits
    let benefits = ['Name in credits', 'Access to updates'];
    for (let tier of [5, 25, 50, 100]) {
        if (contributionData.amount >= tier) {
            benefits = tierBenefits[tier];
        }
    }

    const benefitsList = benefits.map(b => `<li>${b}</li>`).join('');
    document.getElementById('summary-benefits').innerHTML = `<ul style="margin: 0; padding-left: 15px;">${benefitsList}</ul>`;
}

// Handle form submission
document.getElementById('crowdfunding-payment-form').addEventListener('submit', async function(e) {
    e.preventDefault();

    const submitButton = document.getElementById('submit-contribution');
    const resultDiv = document.getElementById('payment-result');

    submitButton.disabled = true;
    submitButton.textContent = 'Processing...';

    try {
        const { error, paymentMethod } = await stripe.createPaymentMethod({
            type: 'card',
            card: card,
            billing_details: {
                name: document.getElementById('contributor-name').value,
                email: document.getElementById('contributor-email').value
            }
        });

        if (error) {
            throw error;
        }

        // Send payment data to server
        const response = await fetch('/crowdfunding/process-contribution', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                paymentMethodId: paymentMethod.id,
                campaign: contributionData.campaign,
                amount: contributionData.amount,
                contributorName: document.getElementById('contributor-name').value,
                contributorEmail: document.getElementById('contributor-email').value,
                anonymous: document.getElementById('anonymous-contribution').checked,
                newsletter: document.getElementById('newsletter-subscribe').checked
            })
        });

        const result = await response.json();

        if (result.success) {
            resultDiv.style.display = 'block';
            resultDiv.innerHTML = `<div style="color: #27ae60; padding: 15px; border: 1px solid #27ae60; border-radius: 4px; background: #f8fff9;">
                <strong>Thank you for your contribution!</strong><br>
                Redirecting to confirmation page...
            </div>`;
            
            setTimeout(() => {
                window.location.href = `/crowdfunding/success/?campaign=${contributionData.campaign}&amount=${contributionData.amount}`;
            }, 2000);
        } else {
            throw new Error(result.error || 'Payment failed');
        }

    } catch (error) {
        resultDiv.style.display = 'block';
        resultDiv.innerHTML = `<div style="color: #e74c3c; padding: 15px; border: 1px solid #e74c3c; border-radius: 4px; background: #fff8f8;">
            <strong>Payment Error:</strong> ${error.message}
        </div>`;
        
        submitButton.disabled = false;
        submitButton.textContent = 'Complete Contribution';
    }
});
</script>