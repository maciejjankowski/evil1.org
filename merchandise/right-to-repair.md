---
layout: default
title: "Right to Repair Resistance - Merchandise"
description: "Satirical merchandise exposing manufacturers who make repair impossible, expensive, or illegal."
permalink: /merchandise/right-to-repair/
---

# Right to Repair Resistance

*Fighting for your right to fix what you own*

## The Problem

Modern manufacturers have weaponized design against consumers. They use:

- **Proprietary Screws:** Special fasteners that require special tools
- **Serialized Parts:** Components that won't work without manufacturer approval
- **Software Locks:** Firmware that prevents repair even with genuine parts
- **Legal Intimidation:** DMCA takedowns on repair manuals and videos
- **Economic Extortion:** Repair costs that exceed replacement costs

## Our Satirical Response

These products mock the absurdity of needing permission to fix things you own, while funding the fight for real repair rights.

## Right to Repair Collection

### Stickers & Small Items

{% for item in site.data.merchandise %}
  {% assign product = item[1] %}
  {% if product.tags contains "repair" and product.type == "sticker" %}
- **[{{ product.title }}]({{ product.permalink }})** - ${{ product.price }} - {{ product.description }}
  {% endif %}
{% endfor %}

### T-Shirts & Wearables

{% for item in site.data.merchandise %}
  {% assign product = item[1] %}
  {% if product.tags contains "repair" %}
    {% if product.type == "shirt" or product.type == "hat" %}
- **[{{ product.title }}]({{ product.permalink }})** - ${{ product.price }} - {{ product.description }}
    {% endif %}
  {% endif %}
{% endfor %}

### Mugs & Office Items

{% for item in site.data.merchandise %}
  {% assign product = item[1] %}
  {% if product.tags contains "repair" %}
    {% if product.type == "mug" or product.type == "notebook" or product.type == "poster" %}
- **[{{ product.title }}]({{ product.permalink }})** - ${{ product.price }} - {{ product.description }}
    {% endif %}
  {% endif %}
{% endfor %}

### Bags & Accessories

{% for item in site.data.merchandise %}
  {% assign product = item[1] %}
  {% if product.tags contains "repair" and product.type == "tote" %}
- **[{{ product.title }}]({{ product.permalink }})** - ${{ product.price }} - {{ product.description }}
  {% endif %}
{% endfor %}

## The Hall of Shame

### Apple: The Pentalobe Pioneers
- Invented proprietary screws to prevent user access
- Serializes parts so even genuine components won't work
- Lobbies against right to repair legislation
- Quotes $500+ for repairs that should cost $50

### Tesla: Electric Dreams, Repair Nightmares
- $2000 to replace $20 parts
- 6-month wait times for basic repairs
- Software locks prevent independent repair
- Claims environmental leadership while preventing longevity

### John Deere: Tractors That Farm You
- Farmers can't fix their own equipment
- Proprietary diagnostic software required for basic maintenance
- Repair manuals hidden behind dealer networks
- Equipment locks up if unauthorized repair is detected

### Medical Device Manufacturers: Profiting from Pain
- Hospitals can't repair life-saving equipment during emergencies
- Proprietary tools required for basic maintenance
- Software locks prevent repair even with genuine parts
- Lives at stake, profits protected

## What Your Purchase Supports

**Legal Advocacy:** Funding right to repair legislation at state and federal levels

**Independent Repair:** Supporting local repair shops vs. manufacturer monopolies

**Consumer Education:** Teaching people about planned obsolescence and their rights

**Environmental Justice:** Promoting repair over replacement to reduce e-waste

**Investigative Journalism:** Exposing corporate practices that harm consumers

## Get Involved

### Support Right to Repair Legislation
- Contact your representatives about repair bills
- Support organizations like iFixit and the Repair Association
- Vote with your wallet for repairable products

### Learn Repair Skills
- Take apart old devices to understand how they work
- Watch repair videos and support independent creators
- Visit local repair cafes and fix-it clinics

### Spread Awareness
- Share your repair success stories
- Call out companies that prevent repair
- Educate others about the true cost of "cheap" devices

### Choose Repairable Products
- Buy from companies that support repair (Framework, Fairphone, etc.)
- Research repairability before purchasing
- Consider used/refurbished instead of new

## The Future We Want

A world where:
- Repair manuals are freely available
- Parts are sold at reasonable prices
- Independent repair shops can compete fairly
- Products are designed for longevity, not disposal
- Consumers have real choice in how they maintain their property

## The Bottom Line

**If you can't fix it, you don't own it.**

These products help fund the fight to change that reality. Your purchase supports legislation, education, and advocacy that will make repair accessible to everyone.

---

<div style="text-align: center; margin-top: 40px; padding: 30px; background: #E8F4F8; border-radius: 8px;">
  <h3 style="color: #003366; margin-bottom: 15px;">Ready to Fix the System?</h3>
  <p style="margin-bottom: 20px;">Support the right to repair with satirical merchandise that makes a point.</p>
  <div style="display: flex; gap: 15px; justify-content: center; flex-wrap: wrap;">
    <a href="/merchandise/" class="early-nav-link" style="background: #003366; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">View All Products</a>
    <a href="/merchandise/themes/" class="early-nav-link" style="background: #4477AA; color: white; padding: 12px 24px; text-decoration: none; border-radius: 4px;">Browse by Theme</a>
  </div>
</div>

*Part of the evil1.org mission to expose and resist corporate exploitation through satirical activism.*