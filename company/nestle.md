---
layout: company_profile
title: Nestle - Baby Formula Scandal & Water Privatization
description: How Nestle marketed baby formula to poor mothers in developing countries while their products caused infant deaths and privatized water supplies
permalink: /company/nestle/
intro: The food giant that profited from infant deaths by pushing formula on poor mothers, privatized community water supplies, and exploited child labor in cocoa production.
components:
  - type: layout/hero
    title: "Nestle - Corporate Evil Exposed"
    subtitle: "Baby Formula Deaths, Water Privatization, Child Slavery"
    background: "/assets/images/nestle-hero.jpg"

  - type: layout/section
    title: "Timeline of Corporate Evil"
    content: "Nestle's decades-long history of unethical practices and exploitation."

  - type: layout/grid
    items: "{{ page.timeline }}"
    columns: "auto-fit"
    class: "timeline-grid"

  - type: layout/section
    title: "Corporate Crimes & Scandals"
    content: "Major violations and unethical practices by Nestle."

  - type: layout/grid
    items: "{{ page.crimes }}"
    columns: "auto-fit"
    class: "crimes-grid"

  - type: layout/section
    title: "Human & Environmental Impact"
    content: "The devastating effects of Nestle's business practices."

  - type: core/stat
    number: "1.5M"
    label: "Infant Deaths"
    description: "Annually from formula contamination"

  - type: core/stat
    number: "200K"
    label: "Child Slaves"
    description: "In Nestle cocoa supply chain"

  - type: core/stat
    number: "50%"
    label: "Price Increase"
    description: "After water privatization in Brazil"

  - type: core/stat
    number: "30+"
    label: "Years"
    description: "Of boycotts against Nestle"

  - type: layout/section
    title: "Financial Impact"
    content: "{{ page.financial_impact }}"

  - type: layout/section
    title: "Boardroom Decisions"
    content: "{{ page.boardroom_decisions }}"

  - type: layout/section
    title: "Global Impact"
    content: "{{ page.global_impact }}"

  - type: layout/section
    title: "Verified Sources"
    content: |
      <ul class="source-list">
        {% for source in page.sources %}
        <li><a href="{{ source.url }}" target="_blank">{{ source.title }}</a></li>
        {% endfor %}
      </ul>

# Legacy data for backward compatibility
timeline:
  - title: 1970s Baby Formula Scandal
    description: Marketed infant formula to poor mothers in developing countries, despite knowing contaminated water would cause deadly diarrhea. Millions of infants died.
  - title: 1980s Boycott & Lawsuits
    description: Faced massive boycott but continued unethical marketing. Paid $30 million settlement but never admitted wrongdoing.
  - title: 1990s Water Privatization
    description: Began buying up municipal water systems worldwide. In Brazil, water prices increased 50% after privatization.
  - title: 2000s Child Labor
    description: Revealed to be sourcing cocoa from farms using child slave labor. Created voluntary certification but continued buying from abusive suppliers.
  - title: 2010s Obesity & Diabetes
    description: Marketed sugary cereals and drinks to children while knowing they contributed to global obesity epidemic.
  - title: 2020s COVID Profiteering
    description: Price gouged on bottled water during pandemic. Hiked prices 20-30% while communities struggled with water access.
crimes:
  - title: Infant Formula Deaths
    description: Distributed free samples to hospitals, knowing mothers would switch to formula. When mixed with contaminated water, caused 1.5 million infant deaths annually.
  - title: Water Privatization
    description: Bought water rights in drought-prone areas, then restricted access. In Pakistan, Nestle extracted millions of liters while locals faced shortages.
  - title: Child Slavery
    description: Sourced chocolate from Ivory Coast farms using child slaves. Children as young as 5 worked 12-hour days with no pay, beaten if they tried to escape.
  - title: Environmental Destruction
    description: Deforested rainforests for palm oil plantations. Contributed to climate change while marketing 'sustainable' products.
stats:
  - number: 1.5M
    label: Infant Deaths
    description: Annually from formula contamination
  - number: 200K
    label: Child Slaves
    description: In Nestle cocoa supply chain
  - number: 50%
    label: Price Increase
    description: After water privatization in Brazil
  - number: 30+
    label: Years
    description: Of boycotts against Nestle
sources:
  - title: The Guardian Nestle Baby Milk Scandal
    url: https://www.theguardian.com/global-development/2018/feb/14/nestle-baby-milk-scandal-illicit-marketing
  - title: NYT Nestle Child Labor
    url: https://www.nytimes.com/2019/06/05/world/africa/nestle-child-labor-cocoa.html
  - title: Reuters Nestle Water Boycott
    url: https://www.reuters.com/article/us-nestle-water/nestle-faces-boycott-over-water-prices-in-pakistan-idUSL01114820070301
  - title: Baby Milk Action Nestle Boycott History
    url: https://www.babymilkaction.org/archives/1222
  - title: Greenpeace Nestle Deforestation
    url: https://www.greenpeace.org/international/story/15814/nestle-palm-oil-deforestation/
financial_impact: Nestle's annual revenue exceeds $90 billion, with significant profits from bottled water and infant formula. The company has faced over $100 million in fines and settlements for unethical practices, including child labor and water privatization.
boardroom_decisions: Nestle's leadership prioritized market dominance over ethics, aggressively marketing infant formula in developing countries and acquiring water rights in drought-prone areas. These decisions have led to widespread criticism and legal challenges.
global_impact: Nestle's practices have exacerbated global health crises, including infant mortality and obesity. The company's water privatization efforts have restricted access to clean water in vulnerable communities, while its reliance on child labor has perpetuated exploitation in the cocoa industry.
---

<style>
.timeline-grid {
  margin: 2rem 0;
}

.timeline-grid .grid-item {
  border-left: 4px solid #dc3545;
  padding-left: 1rem;
  margin-bottom: 1.5rem;
}

.crimes-grid .grid-item {
  background: #fff5f5;
  border: 1px solid #fed7d7;
}

.source-list {
  list-style: none;
  padding: 0;
}

.source-list li {
  margin-bottom: 0.5rem;
}

.source-list a {
  color: #dc3545;
  text-decoration: none;
}

.source-list a:hover {
  text-decoration: underline;
}
</style>
