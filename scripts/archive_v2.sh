#!/bin/bash
# This script archives all non-essential files and directories for the V1 launch into the v2/ folder.

# Exit on error
set -e

# Create the v2 directory if it doesn't exist
mkdir -p v2

echo "Moving content directories to v2/..."
mv Institute/ v2/
mv activities/ v2/
mv articles/ v2/
mv checkout/ v2/
mv company/ v2/
mv components/ v2/
mv corporate-services/ v2/
mv crowdfunding/ v2/
mv docs/ v2/
mv education/ v2/
mv groups/ v2/
mv halloffame/ v2/
mv htmx/ v2/
mv insurance/ v2/
mv jobs/ v2/
mv legal/ v2/
mv members/ v2/
mv membership/ v2/
mv merchandise/ v2/
mv netlify/ v2/
mv "new designs"/ v2/
mv "new ideas"/ v2/
mv news/ v2/
mv newsletter/ v2/
mv organizations/ v2/
mv pages/ v2/
mv profile/ v2/
mv profiles/ v2/
mv sample-content/ v2/
mv tests/ v2/
mv themes/ v2/
mv tools/ v2/
mv trainings/ v2/
mv unfiltered/ v2/

echo "Moving root content files to v2/..."
mv 404.html v2/
mv about.markdown v2/
mv admin-analytics.md v2/
mv admin-dashboard.md v2/
mv admin.md v2/
mv ai-liability-disclaimer.md v2/
mv assessment.md v2/
mv awards.md v2/
mv categories.md v2/
mv cease-and-desist.md v2/
mv ceat.md v2/
mv checkout.html v2/
mv checkout.md v2/
mv components-demo.html v2/
mv corporate-buzzword-dictionary.md v2/
mv corporate-inbox.md v2/
mv corporate-loopholes-implementation.md v2/
mv corporate-slave-test.md v2/
mv courses.md v2/
mv crowdfunding-automation.md v2/
mv crowdfunding.md v2/
mv dopamine-experience.md v2/
mv evaluate-company.md v2/
mv evaluate-executive.md v2/
mv evaluate-institution.md v2/
mv evaluate-product.md v2/
mv evaluation-dashboard.md v2/
mv evil-assessment.md v2/
mv evil-career-advisor.md v2/
mv evil-products.md v2/
mv evil-score.md v2/
mv evil-strengthsfinder.md v2/
mv evil500-certification.md v2/
mv evil500.md v2/
mv halloffame-feed.md v2/
mv htmx-demo.md v2/
mv index.full.markdown v2/
mv index.html.bak v2/
mv index.markdown v2/
mv jobs.md v2/
mv layout-demo.html v2/
mv login.html v2/
mv login.md v2/
mv manifest.json v2/
mv meme-gallery.md v2/
mv merch.md v2/
mv messages.md v2/
mv metrics-dashboard.md v2/
mv metrics-examples.md v2/
mv network.md v2/
mv offline.html v2/
mv paywall.md v2/
mv premium-teaser-200-quotes.md v2/
mv reading.markdown v2/
mv refactor.md v2/
mv register.html v2/
mv register.md v2/
mv robots.txt v2/
mv service-worker.js v2/
mv services.md v2/
mv sitemap.xml v2/
mv submit-a-tip.md v2/
mv submit.md v2/
mv subscribe.md v2/
mv tags.md v2/
mv test-article.json v2/
mv visualizations-demo.md v2/

echo "Moving other non-essential folders..."
mv __meta/ v2/
mv _components/ v2/
mv _config/ v2/

echo "Archiving complete."
