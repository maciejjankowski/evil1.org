---
layout: default
title: Articles - Exposing Corporate Evil
description: In-depth articles documenting corporate exploitation, capitalist greed, and systemic abuse of power
permalink: /articles/
---

<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">Articles</div>
    <p>Deep dives into corporate malfeasance, capitalist exploitation, and systemic abuse of power. Every story verified, every source checked.</p>
    
    {% for article in site.articles reversed %}
        <div style="border: 1px solid #D0D0D0; margin: 15px 0; background: #F8F8F8; padding: 10px;">
            <h2 style="color: #003366; font-size: 14px; margin-bottom: 5px;">
                <a href="{{ article.url | relative_url }}" style="color: #003366; text-decoration: none;">{{ article.title }}</a>
            </h2>
            <div style="font-size: 10px; color: #666; margin-bottom: 8px;">
                {{ article.author | default: "Editorial Team" }} • {{ article.date | date: "%B %d, %Y" }}
            </div>
            {% if article.summary %}
                <div style="font-size: 11px; color: #333; margin-bottom: 8px; font-style: italic;">{{ article.summary }}</div>
            {% endif %}
            {% if article.tags %}
                <div style="font-size: 10px; color: #666; margin-bottom: 8px;">
                    Tags: {% for tag in article.tags %}{{ tag }}{% unless forloop.last %}, {% endunless %}{% endfor %}
                </div>
            {% endif %}
            <div><a href="{{ article.url | relative_url }}" style="color: #004080; text-decoration: underline; font-size: 11px;">Read Full Article</a></div>
        </div>
    {% endfor %}
    
    {% if site.articles.size == 0 %}
        <p>No articles available. Our investigative team is preparing exposés of corporate evil.</p>
    {% endif %}
</div>