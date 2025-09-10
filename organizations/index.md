---
layout: default
title: Organizations - Corporate Evil Exposed
description: Documentation of organizations perfecting capitalist exploitation and systematic human suffering
permalink: /organizations/
---

<div style="width: 760px; margin: 20px auto; background: #fff; border: 1px solid #CCC; padding: 20px;">
    <div style="background: linear-gradient(#6699CC, #4477AA); color: #fff; padding: 10px; font-weight: bold; font-size: 16px; border-bottom: 1px solid #003366; margin: -20px -20px 20px -20px;">Organizations</div>
    <p>Modern institutions perfecting the art of systematic exploitation, regulatory capture, and legalized theft. Study their methods to understand contemporary evil.</p>

    {% for org in site.organizations %}
        <div style="border: 1px solid #D0D0D0; margin: 15px 0; background: #F8F8F8; padding: 10px;">
            <h2 style="color: #003366; font-size: 14px; margin-bottom: 5px;">
                <a href="{{ org.url | relative_url }}" style="color: #003366; text-decoration: none;">{{ org.organization.name | default: org.title }}</a>
            </h2>
            <div style="font-size: 11px; color: #333; margin-bottom: 8px; font-style: italic;">{{ org.organization.description | default: org.description }}</div>
            
            {% if org.organization.topics %}
                <div style="margin-bottom: 8px;">
                    <strong style="font-size: 11px; color: #003366;">Key Topics:</strong>
                    <div style="font-size: 10px; color: #666;">
                        {% for topic in org.organization.topics limit: 3 %}{{ topic }}{% unless forloop.last %}, {% endunless %}{% endfor %}
                        {% if org.organization.topics.size > 3 %} (+{{ org.organization.topics.size | minus: 3 }} more){% endif %}
                    </div>
                </div>
            {% endif %}
            
            <div><a href="{{ org.url | relative_url }}" style="color: #004080; text-decoration: underline; font-size: 11px;">View Organization →</a></div>
        </div>
    {% endfor %}

    {% if site.organizations.size == 0 %}
        <p>No organizations documented yet. The masters of exploitation are busy consolidating power.</p>
    {% endif %}
</div>
</div>
