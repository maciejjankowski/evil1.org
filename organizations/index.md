---
layout: default
title: Organizations - Corporate Evil Exposed
description: Documentation of organizations perfecting capitalist exploitation and systematic human suffering
permalink: /organizations/
---

<link rel="stylesheet" href="{{ '/assets/css/index-pages.css' | relative_url }}">

<div class="index-page">
    <header class="page-header">
        <h1>Organizations</h1>
        <p class="page-description">Modern institutions perfecting the art of systematic exploitation, regulatory capture, and legalized theft. Study their methods to understand contemporary evil.</p>
    </header>

    <div class="content-grid wide">
        {% for org in site.organizations %}
            <article class="content-card">
                <header class="card-header">
                    <h2 class="card-title">
                        <a href="{{ org.url | relative_url }}">{{ org.sig_title }}</a>
                    </h2>
                    <div class="card-headline">{{ org.sig_desc }}</div>
                </header>
                
                {% if org.sig_topics %}
                    <div class="card-principles">
                        <h3>Key Topics</h3>
                        <ul class="topics-list">
                            {% for topic in org.sig_topics limit: 3 %}
                                <li>{{ topic }}</li>
                            {% endfor %}
                        </ul>
                        {% if org.sig_topics.size > 3 %}
                            <div class="more-topics">+{{ org.sig_topics.size | minus: 3 }} more topics</div>
                        {% endif %}
                    </div>
                {% endif %}
                
                <footer class="card-footer">
                    <a href="{{ org.url | relative_url }}" class="read-more">View Organization →</a>
                </footer>
            </article>
        {% endfor %}
    </div>

    {% if site.organizations.size == 0 %}
        <div class="no-content">
            <p>No organizations documented yet. The masters of exploitation are busy consolidating power.</p>
        </div>
    {% endif %}
</div>
