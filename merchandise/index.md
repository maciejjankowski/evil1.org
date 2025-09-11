---
layout: default
title:                         <h3>All Products</h3>
                        <div class="merch-grid">
                        {% for item in site.data.merchandise %}
                          {% assign meta = item[1] %}
                          {% if meta %}
                            {% assign item_hash = hash | merge: { 'url': meta.permalink, 'title': meta.title, 'price': meta.price, 'sku': meta.sku } %}
                            {% include merch-tile.html item=item_hash %}
                          {% endif %}
                        {% endfor %}
                        </div>Store - Comically Recursive Exploitation"
description: "Buy satirical merchandise that mocks the very act of buying satirical merchandise. Because capitalism eats itself."
permalink: /merchandise/
---

<div class="early-section">
    <div class="early-section-header">Corporate Evil Merchandise</div>
    <div class="early-section-content">
        <div style="text-align: center; margin-bottom: 30px; padding: 20px; background: #FFF3CD; border: 1px solid #FFEAA7; border-radius: 8px;">
            <h3 style="color: #856404; margin-bottom: 15px;">⚠️ Content Warning: Recursive Capitalism</h3>
            <p style="margin-bottom: 10px;"><strong>These products mock consumerism while being consumerist products.</strong></p>
            <p style="font-size: 14px; color: #856404;">By purchasing, you become part of the very system we're satirizing. But hey, at least 5% of profits go to actual activism!</p>
        </div>

        <div class="early-section">
            <div class="early-section-header">Original Merchandise Collection</div>
            <div class="early-section-content">
                <ul class="product-list">
                    <li><a class="early-nav-link" href="/merchandise/t-shirt-recursive">"This T-Shirt Costs $29.99" — Recursive T‑Shirt</a></li>
                    <li><a class="early-nav-link" href="/merchandise/mug-hypocrisy">"My Morning Coffee Is Fair Trade" — Hypocrisy Mug</a></li>
                    <li><a class="early-nav-link" href="/merchandise/hat-activist">"Undercover Activist" — Baseball Cap</a></li>
                </ul>
            </div>
        </div>

                        <h3>All Products</h3>
                        <div class="merch-grid">
                        {% for code in site.data.merch-skus %}
                            {% assign meta = site.data.merch-skus[code[0]] %}
                            {% if meta %}
                                {% assign page_obj = site.pages | where: "sku", code[0] | first %}
                                {% unless page_obj %}{% assign page_obj = site.pages | where_exp: "p","p.url contains code[0]" | first %}{% endunless %}
                                {% capture url %}{% if page_obj %}{{ page_obj.url }}{% else %}/merchandise/{{ code[0] }}/{% endif %}{% endcapture %}
                                {% assign item = hash | merge: { 'url': url, 'title': meta.title, 'price': meta.price, 'sku': code[0] } %}
                                {% include merch-tile.html item=item %}
                            {% endif %}
                        {% endfor %}
                        </div>
                        <p class="note-small">Catalog auto-generated from <code>_data/merch-skus.yml</code>. Update there to reflect pricing/titles.</p>

        <div class="early-section">
            <div class="early-section-header">Browse the Full Catalog</div>
            <div class="early-section-content">
                <p>We added 50 new ultra-sarcastic, recursive-capitalism products. Explore them all in the catalog.</p>
                <p><a class="early-nav-link" href="/merchandise/catalog/">Open the 50‑item Catalog →</a></p>
                <p><a class="early-nav-link" href="/merchandise/themes/">Browse by Theme →</a></p>
            </div>
        </div>

        <div class="early-section">
            <div class="early-section-header">Featured Slogans</div>
            <div class="early-section-content">
                <ul>
                    <li><a class="early-nav-link" href="/merchandise/rec-01/">Building Shareholder Value — One Drop of Blood at a Time (T‑Shirt)</a> — NEW</li>
                    <li><a class="early-nav-link" href="/merchandise/rec-02/">Something Something Compliance (Mug)</a> — NEW</li>
                    <li><a class="early-nav-link" href="/merchandise/rec-06/">I Am a Happy Cog (T‑Shirt)</a> — NEW</li>
                    <li><a class="early-nav-link" href="/merchandise/rec-07/">Them Dividends Ain’t Gonna Work on Themselves (Poster)</a> — NEW</li>
                    <li><a class="early-nav-link" href="/merchandise/rec-08/">Give Me 10 More… Years in the Company (T‑Shirt)</a> — NEW</li>
                    <li><a class="early-nav-link" href="/merchandise/rec-09/">PTO? No Need! (Mug)</a> — NEW</li>
                    <li><a class="early-nav-link" href="/merchandise/sticker-whistleblower/">Not a Whistleblower (Sticker)</a></li>
                    <li><a class="early-nav-link" href="/merchandise/hat-compliance/">I ♥ Compliance (Hat)</a></li>
                </ul>
            </div>
        </div>

        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">Why Buy Our Merchandise?</div>
            <div class="early-section-content">
                <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); gap: 20px; margin-top: 20px;">
                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">💰 Profit Distribution</h3>
                        </div>
                        <div class="early-article-content">
                            <p>60% of profits fund investigative journalism, 20% goes to activist causes, 20% keeps the lights on.</p>
                        </div>
                    </div>

                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">🌱 Ethical Production</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Made in USA/Europe with fair labor practices. Carbon-neutral shipping available.</p>
                        </div>
                    </div>

                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">🎭 Self-Aware Satire</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Products that mock the very consumerism they're part of. Meta-capitalism at its finest.</p>
                        </div>
                    </div>

                    <div class="early-article">
                        <div class="early-article-header">
                            <h3 class="early-article-title">📚 Educational Value</h3>
                        </div>
                        <div class="early-article-content">
                            <p>Each purchase includes access to corporate evil research and activist resources.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="early-section" style="margin-top: 40px;">
            <div class="early-section-header">The Recursive Capitalism Manifesto</div>
            <div class="early-section-content">
                <div class="early-article">
                    <div class="early-article-content">
                        <blockquote style="font-style: italic; border-left: 4px solid #003366; padding-left: 20px; margin: 20px 0;">
                            "We sell products that mock the very act of buying them. It's capitalism eating itself - a self-aware, satirical commentary on consumerism while being the ultimate consumerist product."
                        </blockquote>

                        <h3>The Truth Behind The Satire</h3>
                        <p>Every product in our store serves dual purposes:</p>

                        <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; margin-top: 20px;">
                            <div>
                                <h4>🎯 The Satirical Purpose</h4>
                                <p>Making you think twice about consumerism, planned obsolescence, and corporate exploitation through humor and irony.</p>
                            </div>

                            <div>
                                <h4>💰 The Practical Purpose</h4>
                                <p>Funding independent investigative journalism that exposes real corporate malfeasance and systemic corruption.</p>
                            </div>

                            <div>
                                <h4>🌍 The Activist Purpose</h4>
                                <p>Supporting whistleblowers, funding activist training programs, and building community around corporate accountability.</p>
                            </div>

                            <div>
                                <h4>🧠 The Educational Purpose</h4>
                                <p>Each purchase comes with access to our corporate evil database and activist resource library.</p>
                            </div>
                        </div>

                        <div style="background: #F8F8F8; padding: 20px; border-radius: 8px; margin-top: 30px;">
                            <h3 style="margin-top: 0;">The Ultimate Irony</h3>
                            <p><strong>We're a company that profits from mocking the very system that allows us to profit.</strong></p>
                            <p>But here's the truth: <strong>Your "hypocritical" purchase funds real activism and investigative journalism.</strong></p>
                            <p>So buy our stuff. Or don't. Either way, the corporations win.</p>
                            <p style="margin-bottom: 0;"><em>Unless you buy our stuff. Then we all win.</em></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div style="text-align: center; margin-top: 40px; padding: 30px; background: #E8F4F8; border-radius: 8px;">
            <h3 style="color: #003366; margin-bottom: 15px;">Ready To Embrace The Hypocrisy?</h3>
            <p style="margin-bottom: 20px;">Browse our full collection of comically recursive merchandise.</p>
            <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
                <a href="/merchandise/t-shirts" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">T-Shirts</a>
                <a href="/merchandise/mugs" class="early-nav-link" style="background: #4477AA; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Mugs</a>
                <a href="/merchandise/hats" class="early-nav-link" style="background: #6699CC; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Hats</a>
                <a href="/merchandise/stickers" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Stickers</a>
            </div>
        </div>
    </div>
</div>
