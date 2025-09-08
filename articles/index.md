---
layout: default
title: Articles - Exposing Corporate Evil
description: In-depth articles documenting corporate exploitation, capitalist greed, and systemic abuse of power
permalink: /articles/
---

<link rel="stylesheet" href="{{ '/assets/css/index-pages.css' | relative_url }}">

<div class="index-page">
    <header class="page-header">
        <h1>Articles</h1>
        <p class="page-description">Deep dives into corporate malfeasance, capitalist exploitation, and systemic abuse of power. Every story verified, every source checked.</p>
    </header>

    <div class="content-grid">
        {% for article in site.articles reversed %}
            <article class="content-card">
                <header class="card-header">
                    <h2 class="card-title">
                        <a href="{{ article.url | relative_url }}">{{ article.title }}</a>
                    </h2>
                    <div class="card-meta">
                        <span class="card-author">{{ article.author | default: "Editorial Team" }}</span>
                        <span class="card-date">{{ article.date | date: "%B %d, %Y" }}</span>
                    </div>
                </header>
                
                {% if article.summary %}
                    <div class="card-summary">{{ article.summary }}</div>
                {% endif %}
                
                {% if article.tags %}
                    <div class="card-tags">
                        {% for tag in article.tags %}
                            <span class="tag">{{ tag }}</span>
                        {% endfor %}
                    </div>
                {% endif %}
                
                <footer class="card-footer">
                    <a href="{{ article.url | relative_url }}" class="read-more">Read Full Article →</a>
                </footer>
            </article>
        {% endfor %}
    </div>

    {% if site.articles.size == 0 %}
        <div class="no-articles">
            <p>No articles published yet. The editorial team is busy documenting corporate evil.</p>
        </div>
    {% endif %}
</div>
