const { test, expect } = require('@playwright/test');

test.describe('Visual regression tests', () => {
  test('homepage looks correct', async ({ page }) => {
    await page.goto('/');
    await expect(page).toHaveScreenshot('homepage.png');
  });

  test('membership page layout', async ({ page }) => {
    await page.goto('/membership/');
    await expect(page).toHaveScreenshot('membership.png');
  });

  test('company profile page', async ({ page }) => {
    await page.goto('/company/nestle/');
    await expect(page).toHaveScreenshot('company-nestle.png');
  });

  test('navigation header', async ({ page }) => {
    await page.goto('/');
    const header = page.locator('.early-header');
    await expect(header).toHaveScreenshot('header.png');
  });

  test('responsive mobile layout', async ({ page }) => {
    await page.setViewportSize({ width: 375, height: 667 });
    await page.goto('/');
    await expect(page).toHaveScreenshot('homepage-mobile.png');
  });
});
