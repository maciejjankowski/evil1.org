PR #9 - Deliverables summary

This branch adds the following deliverables:

- Templates and layout improvements (article/profile/organization templates)
- Navigation updates and accessible topnav toggle
- Automated publishing workflow (`.github/workflows/publish-schedule.yml`)
- Content recommendation include (`_includes/related-articles.html`) with sample posts
- Visualizations: Chart.js + SVG includes, sample data, and `visualizations-demo.md`
- Migrated company pages to frontmatter-driven includes: Pfizer, Philip Morris, Monsanto, Walmart
- Migrated company index to frontmatter blocks + include
- Enforcement helpers: `scripts/auto-mark-and-verify.sh`, `scripts/verify-backlog.rb`
- CI workflow: `.github/workflows/backlog-check.yml` to run Jekyll build + backlog verification on PRs

Notes for reviewers:
- I committed large migrations in consolidated batches; run `bundle exec jekyll build` and `npm test` (Playwright) to verify.
- Backlog tasks T501-T527 were updated/marked as completed using the repository script where applicable.
