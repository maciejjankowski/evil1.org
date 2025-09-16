# Visual Testing with Playwright

## Setup Complete
- Playwright installed with Chrome, Firefox, Safari support
- Visual regression tests configured
- Jekyll dev server integration

## Usage

### Generate baseline screenshots (first time):
```bash
npm run visual-baseline
```


### Run visual tests (one-off):
```bash
npm test
```
This will run all tests and start a local HTML report server. Press **Ctrl+C** to quit the report server when finished.

### Run tests with browser UI (interactive):
```bash
npm run test:ui
```

### Update baseline screenshots after intentional layout changes:
```bash
npm run visual-baseline
```

### View last test results:
```bash
npx playwright show-report
```

## What it tests:
- Homepage layout
- Membership page styling
- Company profile pages
- Navigation header
- Mobile responsive design

## CI Integration
Add to your GitHub Actions workflow:
```yaml
- name: Run Playwright tests
  run: npm test
```

This will catch styling/layout regressions automatically during development.
