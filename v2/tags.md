---
layout: default
title: "Tags"
description: "Browse content by tags"
permalink: "/tags/"
---

# Content Tags

Browse all content organized by topic tags.

{% assign all_tags = "" | split: "" %}
{% for post in site.posts %}
  {% for tag in post.tags %}
    {% assign all_tags = all_tags | push: tag %}
  {% endfor %}
{% endfor %}
{% for article in site.articles %}
  {% for tag in article.tags %}
    {% assign all_tags = all_tags | push: tag %}
  {% endfor %}
{% endfor %}
{% for org in site.organizations %}
  {% for tag in org.tags %}
    {% assign all_tags = all_tags | push: tag %}
  {% endfor %}
{% endfor %}
{% include all-profiles.html %}
{% for profile in all_profiles %}
  {% for tag in profile.tags %}
    {% assign all_tags = all_tags | push: tag %}
  {% endfor %}
{% endfor %}

{% assign sorted_tags = all_tags | uniq | sort %}

{% for tag in sorted_tags %}
## {{ tag | capitalize | replace: "-", " " }}

{% assign tagged_posts = "" | split: "" %}
{% for post in site.posts %}
  {% if post.tags contains tag %}
    {% assign tagged_posts = tagged_posts | push: post %}
  {% endif %}
{% endfor %}
{% for article in site.articles %}
  {% if article.tags contains tag %}
    {% assign tagged_posts = tagged_posts | push: article %}
  {% endif %}
{% endfor %}
{% for org in site.organizations %}
  {% if org.tags contains tag %}
    {% assign tagged_posts = tagged_posts | push: org %}
  {% endif %}
{% endfor %}
{% include all-profiles.html %}
{% for profile in all_profiles %}
  {% if profile.tags contains tag %}
    {% assign tagged_posts = tagged_posts | push: profile %}
  {% endif %}
{% endfor %}

**{{ tagged_posts | size }} articles with this tag**

<ul class="tag-articles">
{% for item in tagged_posts %}
  <li>
    <a href="{{ item.url }}">{{ item.title }}</a>
    {% if item.description %}
      <br><small>{{ item.description | truncate: 120 }}</small>
    {% endif %}
  </li>
{% endfor %}
</ul>

{% endfor %}
