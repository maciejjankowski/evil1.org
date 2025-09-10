# TASKS
# Format: STATUS | TASK_ID | DESCRIPTION | DoD (optional)
# STATUS: [ ] or [] for pending, [x] for complete
# Sorted by importance: high, medium, low

# HIGH PRIORITY - Core Content & Site Maintenance
[ ] | T001 | Write content for ridiculous DRM, vendor lock-ins, planned obsolescence, cartels, and value-extraction activities | DoD: 5+ articles created in `_articles/` with satirical tone, YAML frontmatter, and cross-linked to existing content
[x] | T201 | Inventory pages with embedded inline HTML (e.g., many <div style=> blocks) | DoD: `_docs/html-scan.md` created listing file paths, approximate HTML byte size, and sample snippet for each candidate
[x] | T202 | Prioritize candidates for conversion | DoD: priority column added to `_docs/html-scan.md` (high/medium/low) with rationale for top-10
[x] | T203 | Create safe extraction procedure & backup plan | DoD: `scripts/extract_html_to_frontmatter.sh` drafted; backups strategy documented and sample backup created for 3 files
[x] | T204 | Convert 3 representative pages as proof-of-concept (v1) | DoD: 3 files updated with `page_html` frontmatter, bodies replaced by `{{ page.page_html }}`, `bundle exec jekyll build` passes locally

# MEDIUM PRIORITY - Content Expansion & Features
[ ] | T002 | Create content for "suggested reading" section: add real books and "coming soon" publications | DoD: `_data/books.yml` created/updated with 10+ entries, reading section page created with satirical book descriptions
[x] | T205 | Batch-convert prioritized pages (v2) | DoD: all high-priority files converted, commits created per logical batch, incremental builds pass
[ ] | T206 | Validate rendering parity and add tests | DoD: visual/textual smoke tests or HTML snapshots for converted pages added to `_tests/` or documented in `_docs/` and verified

# LOW PRIORITY - Documentation & Process
[ ] | T207 | Update contributor docs & templates | DoD: `_docs/html-extraction.md` added with code examples, frontmatter template, and reviewer checklist
[ ] | T208 | Final review & close HTML extraction task | DoD: QA checklist completed, PR(s) merged, backlog tasks marked `[x]` or deferred with rationale


--- !IMPORTANT: DONT EDIT BELOW ---
# EDITING RULES
# 1. !IMPORTANT: anything below: "--- !IMPORTANT: DONT EDIT BELOW ---" is off limits for editing!
# 3. Use [ ] or [x] for STATUS
# 5. Never modify EDITING RULES section
# 6. Keep task descriptions clear and actionable with clear DoD
# 7. No emojis, decorative separators, or unnecessary formatting
# 8. After backlog cleanup, continue processing each actionable task until resolved, delegated, or blocked.
# 9. For each unresolved task, attempt direct resolution (e.g., code changes, testing, documentation updates).
# 10. If a task cannot be completed automatically, FORCE --force and pick the optimal solution, then audit the quality and accordance to best practices.
# 11. Only consider the backlog complete when all actionable items are resolved or explicitly deferred.

