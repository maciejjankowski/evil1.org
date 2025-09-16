---
layout: default
title: "Membership - Support Corporate Evil Exposure"
description: "Join our community of truth-seekers and activists. Choose from multiple membership tiers to support our mission."
permalink: /membership/
---

<script src="https://js.stripe.com/v3/"></script>

<div class="early-section">
    <div class="early-section-header">Choose Your Membership Level</div>
    <div class="early-section-content">
        <p><strong>evil1.org</strong> is a satirical social networking platform that exposes corporate evil and capitalist exploitation. Your membership helps fund investigative journalism, community building, and activist training programs.</p>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-top: 30px;">

            <!-- Free Tier -->
            <div class="early-article" style="border: 2px solid #E0E0E0;">
                <div class="early-article-header">
                    <h2 class="early-article-title">Free Membership</h2>
                    <div class="early-article-meta">$0/month</div>
                </div>
                <div class="early-article-content">
                    <p>Access to all public articles, basic community features, and email newsletter.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ All published articles</li>
                        <li>✅ Community forums</li>
                        <li>✅ Weekly newsletter</li>
                        <li>✅ Event announcements</li>
                        <li>❌ Exclusive investigations</li>
                        <li>❌ Training programs</li>
                    </ul>
                    <div class="early-article-footer">
                        <a href="/register/" class="early-nav-link" style="background: #003366; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px;">Join Free</a>
                    </div>
                </div>
            </div>

            <!-- Supporter Tier -->
            <div class="early-article" style="border: 2px solid #6699CC;">
                <div class="early-article-header">
                    <h2 class="early-article-title">Supporter</h2>
                    <div class="early-article-meta">$5/month</div>
                </div>
                <div class="early-article-content">
                    <p>Early access to content, exclusive articles, and priority community support.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ Everything in Free</li>
                        <li>✅ Early article access</li>
                        <li>✅ Exclusive content</li>
                        <li>✅ Member directory</li>
                        <li>✅ Priority support</li>
                        <li>❌ Training programs</li>
                    </ul>
                    <div class="early-article-footer">
                        <button onclick="selectPlan('supporter')" class="early-nav-link" style="background: #6699CC; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; border: none; cursor: pointer;">Select Supporter</button>
                    </div>
                </div>
            </div>

            <!-- Activist Tier -->
            <div class="early-article" style="border: 2px solid #4477AA;">
                <div class="early-article-header">
                    <h2 class="early-article-title">Activist</h2>
                    <div class="early-article-meta">$15/month</div>
                </div>
                <div class="early-article-content">
                    <p>Full access to training programs, event invitations, and direct influence on investigations.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ Everything in Supporter</li>
                        <li>✅ Training programs</li>
                        <li>✅ Event invitations</li>
                        <li>✅ Investigation input</li>
                        <li>✅ Private community</li>
                        <li>✅ Monthly strategy calls</li>
                    </ul>
                    <div class="early-article-footer">
                        <button onclick="selectPlan('activist')" class="early-nav-link" style="background: #4477AA; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; border: none; cursor: pointer;">Select Activist</button>
                    </div>
                </div>
            </div>

            <!-- Patron Tier -->
            <div class="early-article" style="border: 2px solid #003366; position: relative;">
                <div style="position: absolute; top: -10px; left: 50%; transform: translateX(-50%); background: #003366; color: white; padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: bold;">MOST POPULAR</div>
                <div class="early-article-header">
                    <h2 class="early-article-title">Patron</h2>
                    <div class="early-article-meta">$50/month</div>
                </div>
                <div class="early-article-content">
                    <p>Maximum impact membership with direct influence on editorial decisions and exclusive experiences.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ Everything in Activist</li>
                        <li>✅ Editorial board access</li>
                        <li>✅ Custom investigations</li>
                        <li>✅ VIP event access</li>
                        <li>✅ Name in credits</li>
                        <li>✅ Direct communication</li>
                    </ul>
                    <div class="early-article-footer">
                        <button onclick="selectPlan('patron')" class="early-nav-link" style="background: #003366; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; border: none; cursor: pointer;">Select Patron</button>
                    </div>
                </div>
            </div>

        </div>

        <!-- Payment Modal -->
        <div id="payment-modal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 1000;">
            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); background: white; padding: 30px; border-radius: 8px; max-width: 500px; width: 90%;">
                <h3 id="modal-title" style="margin-top: 0; color: #003366;">Complete Your Membership</h3>
                <p id="modal-description">You're subscribing to the <strong id="selected-plan"></strong> plan for $<span id="plan-amount"></span>/month.</p>

                <form id="payment-form" style="margin-top: 20px;">
                    <div style="margin-bottom: 15px;">
                        <label style="display: block; margin-bottom: 5px; font-weight: bold;">Card Information</label>
                        <div id="card-element" style="padding: 12px; border: 1px solid #D0D0D0; border-radius: 4px;"></div>
                    </div>

                    <div style="margin-bottom: 15px;">
                        <label for="billing-email" style="display: block; margin-bottom: 5px; font-weight: bold;">Billing Email</label>
                        <input type="email" id="billing-email" required
                               style="width: 100%; padding: 8px; border: 1px solid #D0D0D0; border-radius: 4px; font-size: 14px;">
                    </div>

                    <div style="margin-bottom: 20px;">
                        <label style="display: flex; align-items: flex-start;">
                            <input type="checkbox" id="terms-accept" required style="margin-right: 8px; margin-top: 2px;">
                            <span style="font-size: 14px;">I agree to the <a href="/terms/" style="color: #004080;">Terms of Service</a> and authorize recurring billing</span>
                        </label>
                    </div>

                    <div style="display: flex; gap: 10px;">
                        <button type="button" onclick="closeModal()" style="flex: 1; padding: 12px; border: 1px solid #D0D0D0; background: white; border-radius: 4px; cursor: pointer;">Cancel</button>
                        <button type="submit" id="submit-payment" style="flex: 2; padding: 12px; background: #003366; color: white; border: none; border-radius: 4px; cursor: pointer;">Subscribe Now</button>
                    </div>
                </form>

                <div id="payment-result" style="margin-top: 20px; display: none;"></div>
            </div>
        </div>

        <script>
        let stripe, elements, card, selectedPlan;

        // Initialize Stripe
        document.addEventListener('DOMContentLoaded', function() {
            stripe = Stripe('pk_test_51EXAMPLE...'); // Replace with actual key
            elements = stripe.elements();
            card = elements.create('card', {
                style: {
                    base: {
                        fontSize: '16px',
                        color: '#32325d',
                        fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                        '::placeholder': {
                            color: '#aab7c4'
                        }
                    }
                }
            });
        });

        function selectPlan(planType) {
            selectedPlan = planType;
            const modal = document.getElementById('payment-modal');
            const title = document.getElementById('modal-title');
            const description = document.getElementById('modal-description');
            const planName = document.getElementById('selected-plan');
            const amount = document.getElementById('plan-amount');

            // Set plan details
            const plans = {
                supporter: { name: 'Supporter', amount: '5' },
                activist: { name: 'Activist', amount: '15' },
                patron: { name: 'Patron', amount: '50' }
            };

            const plan = plans[planType];
            planName.textContent = plan.name;
            amount.textContent = plan.amount;

            // Show modal
            modal.style.display = 'block';

            // Mount card element
            setTimeout(() => {
                card.mount('#card-element');
            }, 100);
        }

        function closeModal() {
            const modal = document.getElementById('payment-modal');
            modal.style.display = 'none';
            card.unmount();
        }

        // Handle form submission
        document.getElementById('payment-form').addEventListener('submit', async function(e) {
            e.preventDefault();

            const submitButton = document.getElementById('submit-payment');
            const resultDiv = document.getElementById('payment-result');

            submitButton.disabled = true;
            submitButton.textContent = 'Processing...';

            try {
                const { error, paymentMethod } = await stripe.createPaymentMethod({
                    type: 'card',
                    card: card,
                    billing_details: {
                        email: document.getElementById('billing-email').value
                    }
                });

                if (error) {
                    resultDiv.style.display = 'block';
                    resultDiv.innerHTML = `<div style="color: #e74c3c; padding: 10px; border: 1px solid #e74c3c; border-radius: 4px;">${error.message}</div>`;
                    submitButton.disabled = false;
                    submitButton.textContent = 'Subscribe Now';
                    return;
                }

                // Send payment method to server
                const response = await fetch('/membership/create-subscription', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        paymentMethodId: paymentMethod.id,
                        planType: selectedPlan,
                        email: document.getElementById('billing-email').value
                    })
                });

                const result = await response.json();

                if (result.success) {
                    resultDiv.style.display = 'block';
                    resultDiv.innerHTML = `<div style="color: #27ae60; padding: 10px; border: 1px solid #27ae60; border-radius: 4px;">Success! Redirecting to confirmation...</div>`;
                    setTimeout(() => {
                        window.location.href = '/membership/success';
                    }, 2000);
                } else {
                    throw new Error(result.error);
                }

            } catch (error) {
                resultDiv.style.display = 'block';
                resultDiv.innerHTML = `<div style="color: #e74c3c; padding: 10px; border: 1px solid #e74c3c; border-radius: 4px;">${error.message}</div>`;
                submitButton.disabled = false;
                submitButton.textContent = 'Subscribe Now';
            }
        });
        </script> default
title: "Membership - Support Corporate Evil Exposure"
description: "Join our community of truth-seekers and activists. Choose from multiple membership tiers to support our mission of exposing corporate malfeasance."
permalink: /membership/
---

<div class="early-section">
    <div class="early-section-header">Choose Your Membership Level</div>
    <div class="early-section-content">
        <p>Support our mission to expose corporate evil and capitalist exploitation. Your membership helps fund investigative journalism, community building, and activist training programs.</p>

        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-top: 30px;">

            <!-- Free Tier -->
            <div class="early-article" style="border: 2px solid #E0E0E0;">
                <div class="early-article-header">
                    <h2 class="early-article-title">Free Membership</h2>
                    <div class="early-article-meta">$0/month</div>
                </div>
                <div class="early-article-content">
                    <p>Access to all public articles, basic community features, and email newsletter.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ All published articles</li>
                        <li>✅ Community forums</li>
                        <li>✅ Weekly newsletter</li>
                        <li>✅ Event announcements</li>
                        <li>❌ Exclusive investigations</li>
                        <li>❌ Training programs</li>
                    </ul>
                    <div class="early-article-footer">
                        <a href="/register/" class="early-nav-link" style="background: #003366; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px;">Join Free</a>
                    </div>
                </div>
            </div>

            <!-- Supporter Tier -->
            <div class="early-article" style="border: 2px solid #6699CC;">
                <div class="early-article-header">
                    <h2 class="early-article-title">Supporter</h2>
                    <div class="early-article-meta">$5/month</div>
                </div>
                <div class="early-article-content">
                    <p>Early access to content, exclusive articles, and priority community support.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ Everything in Free</li>
                        <li>✅ Early article access</li>
                        <li>✅ Exclusive content</li>
                        <li>✅ Member directory</li>
                        <li>✅ Priority support</li>
                        <li>❌ Training programs</li>
                    </ul>
                    <div class="early-article-footer">
                        <a href="/membership/signup/supporter/" class="early-nav-link" style="background: #6699CC; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px;">Become Supporter</a>
                    </div>
                </div>
            </div>

            <!-- Activist Tier -->
            <div class="early-article" style="border: 2px solid #4477AA;">
                <div class="early-article-header">
                    <h2 class="early-article-title">Activist</h2>
                    <div class="early-article-meta">$15/month</div>
                </div>
                <div class="early-article-content">
                    <p>Full access to training programs, event invitations, and direct influence on investigations.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ Everything in Supporter</li>
                        <li>✅ Training programs</li>
                        <li>✅ Event invitations</li>
                        <li>✅ Investigation input</li>
                        <li>✅ Private community</li>
                        <li>✅ Monthly strategy calls</li>
                    </ul>
                    <div class="early-article-footer">
                        <a href="/membership/signup/activist/" class="early-nav-link" style="background: #4477AA; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px;">Become Activist</a>
                    </div>
                </div>
            </div>

            <!-- Patron Tier -->
            <div class="early-article" style="border: 2px solid #003366; position: relative;">
                <div style="position: absolute; top: -10px; left: 50%; transform: translateX(-50%); background: #003366; color: white; padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: bold;">MOST POPULAR</div>
                <div class="early-article-header">
                    <h2 class="early-article-title">Patron</h2>
                    <div class="early-article-meta">$50/month</div>
                </div>
                <div class="early-article-content">
                    <p>Maximum impact membership with direct influence on editorial decisions and exclusive experiences.</p>
                    <ul style="margin: 15px 0;">
                        <li>✅ Everything in Activist</li>
                        <li>✅ Editorial board access</li>
                        <li>✅ Custom investigations</li>
                        <li>✅ VIP event access</li>
                        <li>✅ Name in credits</li>
                        <li>✅ Direct communication</li>
                    </ul>
                    <div class="early-article-footer">
                        <a href="/membership/signup/patron/" class="early-nav-link" style="background: #003366; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px;">Become Patron</a>
                    </div>
                </div>
            </div>

        </div>

        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Why Support evil1.org?</div>
            <div class="early-section-content">
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-top: 20px;">
                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">Independent Journalism</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Fund truly independent investigative journalism free from corporate influence and advertising pressure.</p>
                        </div>
                    </div>

                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">Community Building</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Support a growing community of activists, journalists, and truth-seekers working to expose corporate evil.</p>
                        </div>
                    </div>

                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">Educational Resources</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Help develop training programs that teach others how to identify and combat corporate exploitation.</p>
                        </div>
                    </div>

                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">Legal Protection</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Your support helps cover legal costs associated with publishing controversial corporate investigations.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Membership FAQ</div>
            <div class="early-section-content">
                <div class="early-article">
                    <div class="early-article-content">
                        <h3>Can I change my membership level?</h3>
                        <p>Yes! You can upgrade or downgrade your membership at any time. Changes take effect immediately.</p>

                        <h3>Is my payment information secure?</h3>
                        <p>Absolutely. We use Stripe for payment processing with bank-level security and never store your payment information.</p>

                        <h3>Can I cancel anytime?</h3>
                        <p>Yes, you can cancel your membership at any time with no penalties. You'll retain access until the end of your billing period.</p>

                        <h3>What if I can't afford membership?</h3>
                        <p>We believe everyone should have access to this information. Contact us for hardship considerations or volunteer opportunities.</p>

                        <h3>How does my membership help?</h3>
                        <p>Your support funds investigative journalism, community events, training programs, and platform development.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
