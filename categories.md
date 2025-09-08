---
layout: default
title: "Categories"
description: "Browse content by categories"
permalink: "/categories/"
---

# Content Categories

Browse all content organized by categories.

{% assign all_categories = "" | split: "" %}
{% for post in site.posts %}
  {% if post.category %}
    {% assign all_categories = all_categories | push: post.category %}
  {% endif %}
{% endfor %}
{% for article in site.articles %}
  {% if article.category %}
    {% assign all_categories = all_categories | push: article.category %}
  {% endif %}
{% endfor %}
{% for org in site.organizations %}
  {% if org.category %}
    {% assign all_categories = all_categories | push: org.category %}
  {% endif %}
{% endfor %}
{% for profile in site.profiles %}
  {% if profile.category %}
    {% assign all_categories = all_categories | push: profile.category %}
  {% endif %}
{% endfor %}

{% assign sorted_categories = all_categories | uniq | sort %}

{% for category in sorted_categories %}
## {{ category | capitalize | replace: "-", " " }}

{% assign category_items = "" | split: "" %}
{% for post in site.posts %}
  {% if post.category == category %}
    {% assign category_items = category_items | push: post %}
  {% endif %}
{% endfor %}
{% for article in site.articles %}
  {% if article.category == category %}
    {% assign category_items = category_items | push: article %}
  {% endif %}
{% endfor %}
{% for org in site.organizations %}
  {% if org.category == category %}
    {% assign category_items = category_items | push: org.category %}
  {% endif %}
{% endfor %}
{% for profile in site.profiles %}
  {% if profile.category == category %}
    {% assign category_items = category_items | push: profile.category %}
  {% endif %}
{% endfor %}

<ul>
{% for item in category_items %}
  <li><a href="{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ul>

{% endfor %}
