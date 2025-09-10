---
layout: default
title: Profiles - Masters of Evil
description: Profiles of history's most effective practitioners of systematic evil and exploitation
permalink: /profiles/
---

<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366;">Profiles</div>
    <div style="padding: 10px; background: #fff;">
        <p>Historical masters of exploitation, systematic oppression, and capitalist efficiency. Study their methods to understand modern corporate evil.</p>
    </div>
    {% for profile in site.profiles %}
            {% for profile in site.profiles %}
        <div style="border: 1px solid #D0D0D0; margin: 15px 0; background: #F8F8F8; padding: 10px;">
            <h2 style="color: #003366; font-size: 14px; margin-bottom: 5px;">
                <a href="/profile/{{ profile.url | split: '/' | last }}/" style="color: #003366; text-decoration: none;">{{ profile.profile.name | default: profile.title }}</a>
            </h2>
            <div style="font-size: 11px; color: #333; margin-bottom: 8px; font-style: italic;">{{ profile.profile.headline | default: profile.description }}</div>
            <div style="font-size: 10px; color: #666; margin-bottom: 8px;">{{ profile.profile.location }}</div>
            
            {% if profile.profile.skills %}
                <div style="margin-bottom: 8px;">
                    <strong style="font-size: 11px; color: #003366;">Top Skills:</strong>
                    <div style="font-size: 10px; color: #666;">
                        {% assign top_skills = profile.profile.skills | sort: 'level' | reverse | slice: 0, 3 %}
                        {% for skill in top_skills limit: 3 %}{{ skill.name }}{% unless forloop.last %}, {% endunless %}{% endfor %}
                    </div>
                </div>
            {% endif %}
            
            <div><a href="/profile/{{ profile.url | split: '/' | last }}/" style="color: #004080; text-decoration: underline; font-size: 11px;">View Profile →</a></div>
        </div>
    {% endfor %}
    {% endfor %}
    {% if site.profiles.size == 0 %}
        <div style="padding: 10px; background: #fff;">
            <p>No profiles available. The masters of evil are preparing their documentation.</p>
        </div>
    {% endif %}
</div>
