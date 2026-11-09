import { test, expect } from '@playwright/test';

test.describe('E2E Flow', () => {
  const email = 'e2e_tester@example.com';
  const password = 'Password123!';
  const appUrl = 'http://localhost:8080';

  test('User can login and interact with all components perfectly', async ({ page }) => {
    // 1. Login (wait for hydration so the form submits through the app, not natively)
    console.log('Navigating to auth page...');
    await page.goto(`${appUrl}/auth`);
    await expect(page.locator('h1', { hasText: 'Welcome back' })).toBeVisible();
    await page.waitForTimeout(1500);
    await page.fill('input#email', email);
    await page.fill('input#password', password);
    await page.click('button:has-text("Sign in")');

    console.log('Waiting for home...');
    await page.waitForURL(`${appUrl}/`, { timeout: 15000 });
    await expect(page.locator('[aria-label="Your numbers"]')).toBeVisible({ timeout: 15000 });

    const tab = (label: string) => page.locator('nav[aria-label="Main"]').getByText(label, { exact: true });

    // 2. Profile tab
    console.log('Checking Profile tab...');
    await tab('Profile').click();
    await expect(page.locator('text=Sign out').first()).toBeVisible();

    // 3. Progress tab (Body segment replaces the old /body page)
    console.log('Checking Progress › Body...');
    await tab('Progress').click();
    await page.getByRole('tab', { name: 'Body' }).click();
    await expect(page.locator('text=Measurements').first()).toBeVisible();

    // 4. Plan tab
    console.log('Checking Plan tab...');
    await tab('Plan').click();
    await expect(page.locator('text=Training days').first()).toBeVisible();

    // 5. Workout Logging Flow — one swipe card per set
    console.log('Starting workout flow...');
    await page.goto(`${appUrl}/workout/thursday?start=true`);
    const topCard = page.locator('.wk-card:not(.is-exiting)');
    const progress = page.locator('text=/\\d+ \\/ \\d+ sets/');
    await expect(topCard).toBeVisible();
    const before = Number((await progress.innerText()).split(' / ')[0]);

    console.log('Logging a set by swiping right...');
    const box = (await topCard.boundingBox())!;
    const x = box.x + box.width / 2;
    const y = box.y + 60; // drag from the card's top, away from the sliders
    await page.mouse.move(x, y);
    await page.mouse.down();
    for (let i = 1; i <= 12; i++) await page.mouse.move(x + i * 20, y + i);
    await page.mouse.up();
    await expect(progress).toContainText(`${before + 1} / `);

    console.log('Skipping rest, then skipping a set and undoing it...');
    const skipRest = page.getByRole('button', { name: 'Skip rest' });
    if (await skipRest.isVisible()) await skipRest.click();
    await page.getByRole('button', { name: 'Skip this set' }).click();
    await expect(progress).toContainText(`${before + 2} / `);
    await page.getByRole('button', { name: 'Undo last set' }).click();
    await expect(progress).toContainText(`${before + 1} / `);

    console.log('Finishing workout early...');
    await page.getByRole('button', { name: 'End workout' }).click();
    await page.getByRole('button', { name: 'Finish and review' }).click();

    console.log('Verifying completion screen layout...');
    await expect(page.locator('text=Session complete').first()).toBeVisible({ timeout: 15000 });
  });
});
