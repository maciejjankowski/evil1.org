---
layout: default
title: "Corporate Propaganda Collection - Catalog"
description: "Catalog of 50 ultra-sarcastic recursive capitalism products."
permalink: /merchandise/catalog/
---

<div class="early-section">
  <div class="early-section-header">Corporate Propaganda Collection</div>
  <div class="early-section-content">
    <p>Welcome to the recursion. Below are 50 new products that satirize corporate culture while funding the journalism that exposes it.</p>

    <ol>
      {% for i in (1..50) %}
      <li><a class="early-nav-link" href="/merchandise/rec-{{ i | prepend: '0' | slice: -2 }}">Recursive Product {{ i }}</a></li>
      {% endfor %}
    </ol>
  </div>
</div>
