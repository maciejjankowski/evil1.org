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

### Run visual tests:
```bash
npm test
```

### Run tests with browser UI:
```bash
npm run test:ui
```

### View test results:
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
