### CSS Consolidation (2025-09-11)
Unified all active styling into `assets/css/main.css`. Deprecated `red-theme.css` and `hellfire-design.css` (left in repo temporarily with headers). Removed theme switching logic from `default.html`. Goal: single blue retro theme as baseline. Next step: delete deprecated files after confirming no references remain in content.

Pending manual deletion (recorded due to tooling limitation):
`assets/css/blue-theme.css` `assets/css/red-theme.css` `assets/css/hellfire-design.css` `assets/css/modern-framework.css` `assets/css/theme-hellish.css` `assets/css/theme-professional.css`
Manifest: `.delete-manifest`
# Retro LinkedNetwork Style Compliance Improvements

## RCA: Why Modern Styles Persisted
- Legacy CSS files (e.g., index-pages.css) and includes were still loaded, overriding retro markup.
- Modern classes, red accents, shadows, and border-radius were present in markup and CSS.
- Inline styles and layout changes were not enough; global styles and includes must be audited and removed.
- Browser and build cache can mask changes.

## Steps to Avoid in Future
- Audit all CSS, includes, and layout fragments for modern classes, colors, and effects.
- Remove or rename any legacy CSS files and ensure only retro styles are loaded.
- Use only blue, gray, and classic box structure; avoid red, shadows, and rounded corners.
- Refactor markup to use early internet HTML structure (tables, boxes, minimal divs).
- Clear build and browser cache after every major change.
- Add a checklist for "retro style compliance" to the backlog and automate style audits with grep/scripts.
- Test visually after every change and compare to reference screenshots.

## New Rule: Always use curl to inspect rendered HTML
- When debugging persistent style or resource issues, always use `curl http://localhost:4000/PATH` to inspect the final HTML output.
- This helps identify lingering references to unwanted CSS, JS, or other resources that may not be visible in source files.
- Add this step to compliance checklist and all future debugging workflows.
