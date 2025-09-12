---
layout: subscription
title: "Subscribe to EVIL1.ORG"
description: "Join thousands of readers exposing corporate evil through exclusive investigations and premium content."
permalink: /subscribe/
subscription_tiers:
  - name: "Supporter"
    price: 5
    price_id: "membership-supporter"
    features:
      - "All premium articles"
      - "Early access to content"
      - "Ad-free experience"
      - "Weekly newsletter"
    cta: "Start Supporting"
    experiment: "Supporter Tier Test"
  - name: "Activist"
    price: 15
    price_id: "membership-activist"
    popular: true
    features:
      - "Everything in Supporter"
      - "Exclusive investigations"
      - "Community forum access"
      - "Monthly investigator Q&A"
      - "Influence article topics"
    cta: "Become an Activist"
  - name: "Patron"
    price: 50
    price_id: "membership-patron"
    features:
      - "Everything in Activist"
      - "Direct investigator access"
      - "Set editorial priorities"
      - "Exclusive events & calls"
      - "Personal recognition"
    cta: "Support the Mission"
    experiment: "Patron Tier Test"
benefits:
  - icon: "🔍"
    title: "Exclusive Investigations"
    description: "Deep-dive exposés you won't find anywhere else, uncovering corporate corruption and executive misconduct."
  - icon: "⚡"
    title: "Early Access"
    description: "Get breaking investigations 24-48 hours before they go public, staying ahead of the news cycle."
  - icon: "👥"
    title: "Active Community"
    description: "Connect with like-minded activists and researchers in our private forum and discussion groups."
  - icon: "📊"
    title: "Impact Tracking"
    description: "See how our investigations drive real change, from policy updates to executive departures."
  - icon: "🎯"
    title: "Influence Content"
    description: "Suggest investigation topics and vote on editorial priorities as a subscriber."
  - icon: "🛡️"
    title: "Ad-Free Experience"
    description: "Clean, distraction-free reading focused on the content that matters most."
testimonials:
  - quote: "The most important investigative work being done today. Every article changes how I see corporate power."
    author: "Sarah M."
    tier: "Activist Member"
  - quote: "Finally, journalism that follows the money and names names. Worth every penny."
    author: "David K."
    tier: "Patron"
  - quote: "The community forum is incredible - connecting with other researchers has amplified my own activism."
    author: "Maria L."
    tier: "Activist Member"
faq:
  - question: "Can I cancel anytime?"
    answer: "Yes, you can cancel your subscription at any time. You'll continue to have access until the end of your billing period."
  - question: "What payment methods do you accept?"
    answer: "We accept all major credit cards and PayPal through our secure Stripe payment processor."
  - question: "Do you offer student discounts?"
    answer: "Yes! Contact us with your student email for a 50% discount on any subscription tier."
  - question: "How often do you publish new content?"
    answer: "We publish 3-4 new articles per week, with major investigations released monthly."
social_proof:
  subscribers: 2847
guarantee: "30-Day Money Back Guarantee - Not satisfied? Get a full refund within 30 days, no questions asked."
---

Join the fight against corporate evil and get unlimited access to exclusive investigations, early content access, and community features.

<div class="pricing-tests">
  <h2>Pricing Experiments</h2>
  {% include pricing-display.html experiment_name="Supporter Tier Test" %}
  {% include pricing-display.html experiment_name="Patron Tier Test" %}
</div>
