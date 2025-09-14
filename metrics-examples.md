---
layout: default
title: "Metrics Framework Examples"
description: "Demonstration of all evil metrics frameworks applied to real entities"
permalink: /metrics-examples/
---

# Evil Metrics Framework Examples

This page demonstrates how our comprehensive metrics frameworks are applied across different entity types on evil1.org.

## Corporate Evil Index (CEI) Example

The Corporate Evil Index measures corporate harm across five dimensions. Here's how Amazon scores:

{% include evil-metrics.html entity_type="company" entity_data=site.data.companies.amazon %}

## Executive Malevolence Score (EMS) Example

The Executive Malevolence Score assesses personal accountability for harmful decisions. Here's Jeff Bezos's profile with scoring:

{% assign bezos_profile = site.profiles | where: "title", "Jeff Bezos Profile" | first %}
{% if bezos_profile %}
{% include evil-metrics.html entity_type="executive" entity_data=bezos_profile.profile %}
{% endif %}

## Institutional Corruption Framework (ICF) Example

The ICF evaluates institutional betrayal of public trust. Here's how the FDA scores:

{% assign fda_data = site.data.organizations | where: "name", "Food and Drug Administration (FDA)" | first %}
{% if fda_data %}
{% include evil-metrics.html entity_type="organization" entity_data=fda_data %}
{% endif %}

## Article Impact Scoring (AIS) Example

The AIS measures the truth-telling value and potential impact of investigative content:

{% assign sample_article = site.articles | where: "title", "Meta's Algorithmic Addiction Empire: How Social Media Platforms Engineer Mental Health Crises for Profit" | first %}
{% if sample_article %}
{% include evil-metrics.html entity_type="article" entity_data=sample_article %}
{% endif %}

## Widget Examples

The metrics can also be displayed as compact widgets for use in sidebars, cards, and other components:

<div style="display: flex; gap: 20px; flex-wrap: wrap; justify-content: center; margin: 20px 0;">
    {% include metrics-widget.html entity_type="company" entity_key="amazon" %}
    {% if bezos_profile %}
    {% include metrics-widget.html entity_type="executive" entity_data=bezos_profile.profile %}
    {% endif %}
    {% if fda_data %}
    {% include metrics-widget.html entity_type="organization" entity_data=fda_data %}
    {% endif %}
    {% if sample_article %}
    {% include metrics-widget.html entity_type="article" entity_data=sample_article %}
    {% endif %}
</div>

## Evil Taxonomy Integration

All entities can be tagged with evil classification categories for cross-referencing and pattern analysis:

### Amazon's Evil Taxonomy
{% assign amazon_data = site.data.companies.amazon %}
{% if amazon_data.evil_taxonomy %}
<div class="taxonomy-display">
    {% for category in amazon_data.evil_taxonomy %}
        <span class="taxonomy-tag-large">{{ category }}</span>
    {% endfor %}
</div>
{% endif %}

## Scoring Methodology

All scores are calculated using transparent, evidence-based methodologies with multiple verification layers:

- **Multi-source verification**: Minimum 3 independent sources
- **Expert review**: Academic and journalistic validation  
- **Regular updates**: Quarterly adjustments based on new evidence
- **Appeals process**: Formal challenge procedure for contested scores

<div class="methodology-links">
    <a href="/docs/comprehensive-metrics-methodology/" class="btn-primary">📖 Complete Methodology</a>
    <a href="/metrics-dashboard/" class="btn-secondary">📊 View Dashboard</a>
    <a href="/evil-products/" class="btn-secondary">🔥 Evil Products</a>
</div>

<style>
.taxonomy-display {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin: 20px 0;
    justify-content: center;
}

.taxonomy-tag-large {
    background: linear-gradient(135deg, #8B0000 0%, #CD5C5C 100%);
    color: #fff;
    padding: 8px 16px;
    border-radius: 6px;
    font-weight: bold;
    font-size: 0.9em;
    box-shadow: 0 2px 4px rgba(139, 0, 0, 0.3);
}

.methodology-links {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin: 30px 0;
    flex-wrap: wrap;
}

.btn-primary,
.btn-secondary {
    padding: 12px 20px;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
    transition: all 0.3s ease;
    border: 2px solid;
}

.btn-primary {
    background: #8B0000;
    color: #fff;
    border-color: #8B0000;
}

.btn-primary:hover {
    background: #CD5C5C;
    border-color: #CD5C5C;
}

.btn-secondary {
    background: #fff;
    color: #8B0000;
    border-color: #8B0000;
}

.btn-secondary:hover {
    background: #8B0000;
    color: #fff;
}

/* Responsive */
@media (max-width: 768px) {
    .methodology-links {
        flex-direction: column;
        align-items: center;
    }
    
    .taxonomy-display {
        justify-content: flex-start;
    }
}
</style>