---
layout: page
title: "Suggested Reading: Books That Expose Corporate Evil"
permalink: /reading/
description: "Curated collection of books that reveal the dark underbelly of corporate capitalism, from exploitation to environmental destruction."
---

# Suggested Reading: Books That Expose Corporate Evil

In a world where corporations write their own rules and fund their own regulators, knowledge is the most dangerous weapon. These books peel back the facade of "free enterprise" to reveal the systematic exploitation, corruption, and human cost of modern capitalism.

Each recommendation comes with our signature satirical analysis - because nothing exposes corporate bullshit quite like a well-placed barb.

## 📚 Current Recommendations

{% for book in site.data.books %}
{% unless book.status == "coming_soon" %}
<div class="book-card" style="border: 1px solid #333; padding: 20px; margin: 20px 0; border-radius: 8px;">
  <h3>{{ book.title }}</h3>
  <p><strong>Author:</strong> {{ book.author }} ({{ book.year }})</p>
  <p><strong>Genre:</strong> {{ book.genre }}</p>
  <p><strong>Pages:</strong> {{ book.pages }} | <strong>Rating:</strong> {{ book.rating }}/5</p>
  <p><em>{{ book.description }}</em></p>
  {% if book.isbn %}
  <p><small>ISBN: {{ book.isbn }}</small></p>
  {% endif %}
</div>
{% endunless %}
{% endfor %}

## 🔮 Coming Soon Publications

We're constantly expanding our library of corporate critique. Here are some titles we're eagerly awaiting:

{% for book in site.data.books %}
{% if book.status == "coming_soon" %}
<div class="book-card coming-soon" style="border: 1px dashed #666; padding: 20px; margin: 20px 0; border-radius: 8px; background: #f9f9f9;">
  <h3>{{ book.title }}</h3>
  <p><strong>Author:</strong> {{ book.author }} ({{ book.year }})</p>
  <p><strong>Genre:</strong> {{ book.genre }}</p>
  <p><em>{{ book.description }}</em></p>
  <p><strong>Status:</strong> <span style="color: #ff6b6b;">Coming Soon</span></p>
</div>
{% endif %}
{% endfor %}

## 📖 Why These Books Matter

In an era of corporate propaganda and sponsored "news," these books provide:
- **Unfiltered Truth**: Facts that corporations don't want you to know
- **Historical Context**: Understanding how we got to this corporate dystopia
- **Strategic Insights**: Tools to navigate and resist corporate power
- **Hope Through Awareness**: Knowledge as the first step toward change

## 🤝 Contribute to Our Library

Know of a book that perfectly captures corporate malfeasance? Have a satirical take on a business bestseller?

**[Submit Your Recommendation](/submit/)**

Help us build the most comprehensive collection of anti-corporate literature on the internet.

## 📚 Reading Groups & Discussion

Join our community discussions:
- **[Members Forum](/members/)** - Monthly book club discussions
- **[Unfiltered Section](/unfiltered/)** - Raw source materials and documents
- **[Articles](/articles/)** - Related investigative pieces

## ⚠️ Content Warning

These books contain:
- Harsh truths about capitalism
- Detailed accounts of exploitation
- Satirical commentary that might offend corporate apologists
- Hope for a better system

*Reader discretion is advised. Corporate executives may experience existential discomfort.*

---

*This reading list is curated for educational and satirical purposes. Purchase books through independent bookstores or libraries to avoid enriching corporate monopolies.*
