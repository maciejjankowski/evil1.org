---
layout: default
title: Articles - Exposing Corporate Evil
description: In-depth articles documenting corporate exploitation, capitalist greed, and systemic abuse of power
permalink: /articles/
---

<div class="early-section">
    <div class="early-section-header">Articles Archive</div>
    <div class="early-section-content">
        <p>Deep dives into corporate malfeasance, capitalist exploitation, and systemic abuse of power. Every story verified, every source checked.</p>

        {% for article in site.articles reversed %}
            <div class="early-article">
                <div class="early-article-header">
                    <h2 class="early-article-title">
                        <a href="{{ article.url | relative_url }}" style="color: #003366; text-decoration: none;">{{ article.title }}</a>
                    </h2>
                    <div class="early-article-meta">
                        {{ article.author | default: "Editorial Team" }} • {{ article.date | date: "%B %d, %Y" }}
                    </div>
                </div>
                <div class="early-article-content">
                    {% if article.summary %}
                        <p>{{ article.summary }}</p>
                    {% endif %}
                    {% if article.tags %}
                        <div style="margin-bottom: 10px;">
                            <strong>Tags:</strong> {% for tag in article.tags %}{{ tag }}{% unless forloop.last %}, {% endunless %}{% endfor %}
                        </div>
                    {% endif %}
                    <div class="early-article-footer">
                        <a href="{{ article.url | relative_url }}" class="early-nav-link" style="font-size: 11px; padding: 4px 8px;">Read Full Article →</a>
                    </div>
                </div>
            </div>
        {% endfor %}
    
    {% if site.articles.size == 0 %}
        <p>No articles available. Our investigative team is preparing exposés of corporate evil.</p>
    {% endif %}
</div>