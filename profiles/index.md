---
layout: default
title: Profiles - Masters of Evil
description: Profiles of history's most effective practitioners of systematic evil and exploitation
permalink: /profiles/
---

<link rel="stylesheet" href="{{ '/assets/css/index-pages.css' | relative_url }}">

<div class="index-page">
    <header class="page-header">
        <h1>Profiles</h1>
        <p class="page-description">Historical masters of exploitation, systematic oppression, and capitalist efficiency. Study their methods to understand modern corporate evil.</p>
    </header>

    <div class="content-grid">
        {% for profile in site.profiles %}
            <article class="content-card">
                <header class="card-header">
                    <h2 class="card-title">
                        <a href="{{ profile.url | relative_url }}">{{ profile.profile.name }}</a>
                    </h2>
                    <div class="card-headline">{{ profile.profile.headline }}</div>
                    <div class="card-location">{{ profile.profile.location }}</div>
                </header>
                
                {% if profile.profile.skills %}
                    <div class="card-skills">
                        <h3>Top Skills</h3>
                        {% assign top_skills = profile.profile.skills | sort: 'level' | reverse | slice: 0, 3 %}
                        {% for skill in top_skills %}
                            <div class="skill-item">
                                <span class="skill-name">{{ skill.name }}</span>
                                <div class="skill-bar">
                                    <div class="skill-level" style="width: {{ skill.level }}%"></div>
                                </div>
                            </div>
                        {% endfor %}
                    </div>
                {% endif %}
                
                <footer class="card-footer">
                    <a href="{{ profile.url | relative_url }}" class="read-more">View Profile →</a>
                </footer>
            </article>
        {% endfor %}
    </div>

    {% if site.profiles.size == 0 %}
        <div class="no-content">
            <p>No profiles available. The masters of evil are preparing their documentation.</p>
        </div>
    {% endif %}
</div>
