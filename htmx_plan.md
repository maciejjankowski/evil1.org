# Evil1.org HTMX Integration Plan

## Objective
Optimize site layouts and maximize reusability by integrating the [htmx](https://htmx.org/) mini-framework. Extract common components (header, footer, leaderboard, forms) into separate HTML files and use htmx attributes to load them dynamically.

## Steps

1. **Install HTMX**
   - Add `<script src="https://unpkg.com/htmx.org@1.9.10"></script>` to all HTML files (e.g., `index_red.html`, `halloffame.html`, etc.).

2. **Extract Common Components**
   - Create reusable HTML fragments:
     - `components/header.html`
     - `components/footer.html`
     - `components/leaderboard.html`
     - `components/login_form.html`
     - `components/register_form.html`
     - `components/submit_form.html`

3. **Refactor Main HTML Files**
   - Replace static sections with htmx includes:
     ```html
     <div hx-get="components/header.html" hx-trigger="load" hx-swap="outerHTML"></div>
     <div hx-get="components/footer.html" hx-trigger="load" hx-swap="outerHTML"></div>
     ```
   - Use similar includes for forms and leaderboard.

4. **Benefits**
   - Centralized updates for shared UI elements.
   - Faster prototyping and layout changes.
   - Reduced code duplication.
   - Easier future expansion (add new components, update styles site-wide).

## Next Actions
- Extract and create the above component files.
- Refactor main HTML files to use htmx includes.
- Test for layout consistency and dynamic loading.

---
*This plan enables devilish reusability and rapid evil expansion across the site.*
