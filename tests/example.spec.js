// @ts-check
const { test, expect } = require('@playwright/test');

test('has title', async ({ page }) => {
  await page.goto('localhost:3000/transeasy');

  // Expect a title "to contain" a substring.
  await expect(page).toHaveTitle(/TransEasy/);
});

test('Setup link', async ({ page }) => {
  await page.goto('localhost:3000/transeasy');

  // Click the get started link.
  await page.getByRole('link', { name: 'Setup' }).click();

  // Expects page to have a heading with the name of Installation.
  await expect(page.getByRole('heading', { name: 'Transeasy Configuration' })).toBeVisible();
});
