---
layout: default
title: "Contribution Successful - Thank You!"
description: "Your crowdfunding contribution has been successfully processed"
permalink: /crowdfunding/success/
---

<div class="early-section">
    <div class="early-section-header">Thank You for Supporting the Resistance!</div>
    <div class="early-section-content">
        <div style="text-align: center; margin: 40px 0;">
            <div style="font-size: 64px; color: #27ae60; margin-bottom: 20px;">✓</div>
            <h2 style="color: #003366; margin-bottom: 10px;">Contribution Successful</h2>
            <p style="font-size: 18px; color: #666;">Your support helps us expose corporate evil and fight capitalist exploitation</p>
        </div>

        <div style="display: grid; grid-template-columns: 1fr 300px; gap: 30px; margin-top: 40px;">
            
            <!-- Main Content -->
            <div>
                <div class="early-article">
                    <div class="early-article-header">
                        <h3 class="early-article-title">What Happens Next?</h3>
                    </div>
                    <div class="early-article-content">
                        <div style="margin-bottom: 20px;">
                            <h4 style="color: #003366;">📧 Confirmation Email</h4>
                            <p>You'll receive a confirmation email within the next few minutes with your contribution receipt and campaign details.</p>
                        </div>

                        <div style="margin-bottom: 20px;">
                            <h4 style="color: #003366;">📈 Progress Updates</h4>
                            <p>We'll keep you informed about campaign progress through regular email updates and exclusive contributor content.</p>
                        </div>

                        <div style="margin-bottom: 20px;">
                            <h4 style="color: #003366;">🎁 Reward Fulfillment</h4>
                            <p>Based on your contribution tier, you'll receive early access to content, exclusive materials, and other benefits as outlined in the campaign.</p>
                        </div>

                        <div style="margin-bottom: 20px;">
                            <h4 style="color: #003366;">👥 Community Access</h4>
                            <p>Contributors get special access to our community forums and direct communication channels with our editorial team.</p>
                        </div>
                    </div>
                </div>

                <div class="early-article">
                    <div class="early-article-header">
                        <h3 class="early-article-title">Spread the Word</h3>
                    </div>
                    <div class="early-article-content">
                        <p>Help us reach more supporters by sharing your contribution:</p>
                        
                        <div style="display: flex; gap: 10px; margin-top: 15px;">
                            <button onclick="shareOnTwitter()" style="background: #1da1f2; color: white; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer;">Share on Twitter</button>
                            <button onclick="shareOnLinkedIn()" style="background: #0077b5; color: white; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer;">Share on LinkedIn</button>
                            <button onclick="copyShareLink()" style="background: #666; color: white; border: none; padding: 10px 15px; border-radius: 4px; cursor: pointer;">Copy Link</button>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Sidebar -->
            <div>
                <div class="early-article" style="border: 2px solid #27ae60;">
                    <div class="early-article-header">
                        <h4 class="early-article-title" style="color: #27ae60;">Your Contribution</h4>
                    </div>
                    <div class="early-article-content">
                        <div style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px;">Campaign:</div>
                            <div id="contribution-campaign" style="font-size: 14px; color: #666;">Loading...</div>
                        </div>

                        <div style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px;">Amount:</div>
                            <div style="font-size: 24px; color: #27ae60; font-weight: bold;" id="contribution-amount">$0</div>
                        </div>

                        <div style="margin-bottom: 15px;">
                            <div style="font-weight: bold; margin-bottom: 5px;">Transaction ID:</div>
                            <div style="font-size: 12px; color: #666; font-family: monospace;" id="transaction-id">Loading...</div>
                        </div>
                    </div>
                </div>

                <div class="early-article" style="margin-top: 15px;">
                    <div class="early-article-header">
                        <h4 class="early-article-title">Keep Supporting</h4>
                    </div>
                    <div class="early-article-content">
                        <p style="font-size: 14px; margin-bottom: 15px;">Check out our other active campaigns:</p>
                        <a href="/crowdfunding/" class="early-nav-link" style="background: #003366; color: white; padding: 8px 16px; text-decoration: none; border-radius: 4px; display: block; text-align: center;">View All Campaigns</a>
                    </div>
                </div>

                <div class="early-article" style="margin-top: 15px;">
                    <div class="early-article-header">
                        <h4 class="early-article-title">Questions?</h4>
                    </div>
                    <div class="early-article-content">
                        <p style="font-size: 14px; margin-bottom: 15px;">Contact us about your contribution:</p>
                        <a href="mailto:crowdfunding@evil1.org" style="color: #004080; font-size: 14px;">crowdfunding@evil1.org</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Parse URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    const campaign = urlParams.get('campaign') || '';
    const amount = parseInt(urlParams.get('amount')) || 0;

    // Campaign titles mapping
    const campaignTitles = {
        'feature-dark-mode': 'Dark Mode Theme Development',
        'article-big-pharma-investigation': 'Big Pharma Price Fixing Investigation',
        'video-series-corporate-crimes': 'Corporate Crimes Video Series',
        'card-deck-evil-corporations': 'Evil Corporations Trading Cards',
        'training-corporate-accountability': 'Corporate Accountability Training Course',
        'feature-mobile-app': 'Mobile App Development'
    };

    // Update page content
    document.getElementById('contribution-campaign').textContent = campaignTitles[campaign] || 'Unknown Campaign';
    document.getElementById('contribution-amount').textContent = `$${amount}`;
    document.getElementById('transaction-id').textContent = generateTransactionId();
});

function generateTransactionId() {
    // Generate a fake transaction ID for display purposes
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    let result = 'CF-';
    for (let i = 0; i < 12; i++) {
        result += chars.charAt(Math.floor(Math.random() * chars.length));
    }
    return result;
}

function shareOnTwitter() {
    const text = "I just supported @evil1org's crowdfunding campaign to expose corporate evil and fight capitalist exploitation!";
    const url = "https://evil1.org/crowdfunding/";
    window.open(`https://twitter.com/intent/tweet?text=${encodeURIComponent(text)}&url=${encodeURIComponent(url)}`, '_blank');
}

function shareOnLinkedIn() {
    const url = "https://evil1.org/crowdfunding/";
    const title = "Supporting Independent Journalism";
    const summary = "I'm supporting evil1.org's mission to expose corporate malfeasance through crowdfunded investigations.";
    window.open(`https://www.linkedin.com/sharing/share-offsite/?url=${encodeURIComponent(url)}`, '_blank');
}

function copyShareLink() {
    const url = "https://evil1.org/crowdfunding/";
    navigator.clipboard.writeText(url).then(function() {
        alert('Link copied to clipboard!');
    });
}
</script>