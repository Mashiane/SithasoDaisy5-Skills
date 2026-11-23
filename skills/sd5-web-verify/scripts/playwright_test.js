/**
 * SithasoDaisy5 Playwright UX/UI Browser Verification Runner
 * 
 * Executes headless browser verification on running SithasoDaisy5 / BANano web apps:
 * 1. Multi-viewport responsive visual capture (Desktop: 1440x900, Tablet: 768x1024, Mobile: 390x844)
 * 2. Console error and uncaught JavaScript exception interception
 * 3. 404/500 asset failure monitoring
 * 4. Horizontal overflow (w-screen defect) detection
 * 5. Theme verification (html[data-theme])
 * 6. Automated WCAG 2.2 accessibility fast-audit (labels, alt attributes, button roles)
 * 7. Structured JSON report generation (ux-report.json)
 */

const fs = require('fs');
const path = require('path');

// Resolve Playwright from local node_modules or global npm cache
let playwright;
try {
    playwright = require('playwright');
} catch (e) {
    try {
        const globalPath = path.join(process.env.APPDATA || '', 'npm', 'node_modules', 'playwright');
        playwright = require(globalPath);
    } catch (e2) {
        console.error('ERROR: Playwright is not installed. Run `npm install -g playwright` or `npm install playwright`.');
        process.exit(1);
    }
}

const { chromium } = playwright;

// Parse command line arguments
function parseArgs() {
    const args = process.argv.slice(2);
    const options = {
        url: 'http://localhost/app',
        out: './ux-review/screens',
        label: 'screen',
        pages: [''],
        timeoutMs: 15000,
        settleMs: 2500,
        fullPage: true,
        viewports: ['desktop', 'tablet', 'mobile']
    };

    for (let i = 0; i < args.length; i++) {
        const arg = args[i];
        if (arg === '--url' && args[i + 1]) options.url = args[++i];
        else if (arg === '--out' && args[i + 1]) options.out = args[++i];
        else if (arg === '--label' && args[i + 1]) options.label = args[++i];
        else if (arg === '--pages' && args[i + 1]) options.pages = args[++i].split(',').map(s => s.trim()).filter(Boolean);
        else if (arg === '--timeout' && args[i + 1]) options.timeoutMs = parseInt(args[++i], 10);
        else if (arg === '--settle' && args[i + 1]) options.settleMs = parseInt(args[++i], 10);
        else if (arg === '--no-full-page') options.fullPage = false;
        else if (arg === '--viewports' && args[i + 1]) options.viewports = args[++i].split(',').map(s => s.trim().toLowerCase()).filter(Boolean);
    }

    return options;
}

const VIEWPORT_PRESETS = {
    desktop: { width: 1440, height: 900, label: 'desktop' },
    tablet:  { width: 768,  height: 1024, label: 'tablet' },
    mobile:  { width: 390,  height: 844,  label: 'mobile', isMobile: true, hasTouch: true }
};

async function auditAccessibility(page) {
    return await page.evaluate(() => {
        const issues = [];

        // Check images missing alt
        const images = document.querySelectorAll('img:not([alt])');
        images.forEach(img => {
            issues.push({
                type: 'WCAG 1.1.1 Non-text Content',
                severity: 'WARN',
                element: img.outerHTML.substring(0, 100),
                message: 'Image is missing an alt attribute.'
            });
        });

        // Check inputs missing labels
        const inputs = document.querySelectorAll('input:not([type="hidden"]):not([type="button"]):not([type="submit"]):not([type="reset"]), select, textarea');
        inputs.forEach(input => {
            const id = input.id;
            const hasAriaLabel = input.hasAttribute('aria-label') || input.hasAttribute('aria-labelledby');
            const hasAssociatedLabel = id && document.querySelector(`label[for="${id}"]`);
            const isWrappedInLabel = input.closest('label');
            if (!hasAriaLabel && !hasAssociatedLabel && !isWrappedInLabel) {
                issues.push({
                    type: 'WCAG 4.1.2 Name, Role, Value',
                    severity: 'WARN',
                    element: input.outerHTML.substring(0, 100),
                    message: `Form field id='${id || 'unnamed'}' lacks an accessible name or associated <label>.`
                });
            }
        });

        // Check buttons without accessible name
        const buttons = document.querySelectorAll('button');
        buttons.forEach(btn => {
            const text = (btn.innerText || '').trim();
            const ariaLabel = btn.getAttribute('aria-label') || btn.getAttribute('aria-labelledby');
            const hasImgAlt = btn.querySelector('img[alt]');
            const hasSvg = btn.querySelector('svg');
            if (!text && !ariaLabel && !hasImgAlt) {
                issues.push({
                    type: 'WCAG 4.1.2 Name, Role, Value',
                    severity: 'WARN',
                    element: btn.outerHTML.substring(0, 100),
                    message: 'Button has no accessible text or aria-label.'
                });
            }
        });

        return issues;
    });
}

async function auditLayoutAndPlaceholders(page) {
    return await page.evaluate(() => {
        const defects = [];

        // Check horizontal overflow (RULE-ANTI-002 Anti-Scrollbar)
        const scrollWidth = document.documentElement.scrollWidth;
        const clientWidth = document.documentElement.clientWidth;
        if (scrollWidth > clientWidth) {
            defects.push({
                type: 'Horizontal Overflow',
                severity: 'FAIL',
                message: `Horizontal scrollbar detected: scrollWidth (${scrollWidth}px) exceeds viewport clientWidth (${clientWidth}px). Check for w-screen or unconstrained flex containers.`
            });
        }

        // Check active theme
        const theme = document.documentElement.getAttribute('data-theme') || 'default';

        // Check default framework placeholders that weren't cleared
        const textContent = document.body ? document.body.innerText : '';
        if (textContent.includes('Card Title') || textContent.includes('Card Content')) {
            defects.push({
                type: 'Default Placeholder Leak',
                severity: 'FAIL',
                message: 'Framework default placeholder text ("Card Title" or "Card Content") rendered in visible DOM.'
            });
        }

        return { defects, theme, scrollWidth, clientWidth };
    });
}

async function run() {
    const opts = parseArgs();
    if (!fs.existsSync(opts.out)) {
        fs.mkdirSync(opts.out, { recursive: true });
    }

    console.log('='.repeat(70));
    console.log('  SithasoDaisy5 Playwright UX & Visual Verification Runner');
    console.log('='.repeat(70));
    console.log(`Base URL:     ${opts.url}`);
    console.log(`Output Dir:   ${path.resolve(opts.out)}`);
    console.log(`Viewports:    ${opts.viewports.join(', ')}`);
    console.log(`Pages:        ${opts.pages.join(', ') || '(root)'}`);

    const browser = await chromium.launch({ headless: true });
    const report = {
        timestamp: new Date().toISOString(),
        url: opts.url,
        summary: { totalTests: 0, passed: 0, failed: 0, warnings: 0 },
        results: []
    };

    let overallFailed = false;

    try {
        for (const pageId of opts.pages) {
            const targetUrl = pageId ? `${opts.url.replace(/\/$/, '')}/${pageId}` : opts.url;
            const pageLabel = opts.label ? (pageId ? `${opts.label}-${pageId}` : opts.label) : (pageId || 'screen');

            console.log(`\nTesting page: ${targetUrl}`);

            for (const vpKey of opts.viewports) {
                const vp = VIEWPORT_PRESETS[vpKey] || VIEWPORT_PRESETS.desktop;
                const context = await browser.newContext({
                    viewport: { width: vp.width, height: vp.height },
                    isMobile: !!vp.isMobile,
                    hasTouch: !!vp.hasTouch,
                    deviceScaleFactor: 1
                });

                const page = await context.newPage();

                const consoleLogs = [];
                const uncaughtErrors = [];
                const failedRequests = [];

                page.on('console', msg => {
                    if (msg.type() === 'error') {
                        consoleLogs.push({ type: 'error', text: msg.text() });
                    }
                });

                page.on('pageerror', err => {
                    uncaughtErrors.push(err.toString());
                });

                page.on('requestfailed', req => {
                    failedRequests.push({ url: req.url(), errorText: req.failure()?.errorText || 'Failed' });
                });

                console.log(`  [${vp.label.toUpperCase()} ${vp.width}x${vp.height}] Navigating...`);

                try {
                    await page.goto(targetUrl, { waitUntil: 'networkidle', timeout: opts.timeoutMs });
                } catch (navErr) {
                    console.log(`  [${vp.label.toUpperCase()}] networkidle timeout, settling for DOMContentLoaded...`);
                    try {
                        await page.waitForLoadState('domcontentloaded', { timeout: 5000 });
                    } catch (e) {}
                }

                // Settle time for animations/BANano async renders
                await page.waitForTimeout(opts.settleMs);

                // Run layout and placeholder audit
                const layoutAudit = await auditLayoutAndPlaceholders(page);

                // Run accessibility audit
                const a11yIssues = await auditAccessibility(page);

                // Capture screenshot
                const screenshotFile = `${pageLabel}-${vp.label}.png`;
                const screenshotPath = path.join(opts.out, screenshotFile);
                await page.screenshot({ path: screenshotPath, fullPage: opts.fullPage });
                console.log(`  [${vp.label.toUpperCase()}] Screenshot saved: ${screenshotFile}`);

                // Evaluate status
                const isFail = uncaughtErrors.length > 0 || layoutAudit.defects.some(d => d.severity === 'FAIL');
                const isWarn = consoleLogs.length > 0 || failedRequests.length > 0 || a11yIssues.length > 0;

                report.summary.totalTests++;
                if (isFail) {
                    report.summary.failed++;
                    overallFailed = true;
                } else if (isWarn) {
                    report.summary.warnings++;
                } else {
                    report.summary.passed++;
                }

                report.results.push({
                    page: pageId,
                    viewport: vp.label,
                    url: targetUrl,
                    screenshot: screenshotFile,
                    theme: layoutAudit.theme,
                    status: isFail ? 'FAIL' : (isWarn ? 'WARN' : 'PASS'),
                    layoutDefects: layoutAudit.defects,
                    consoleErrors: consoleLogs,
                    uncaughtErrors: uncaughtErrors,
                    failedRequests: failedRequests,
                    accessibilityIssues: a11yIssues
                });

                await context.close();
            }
        }
    } finally {
        await browser.close();
    }

    const reportPath = path.join(opts.out, 'ux-report.json');
    fs.writeFileSync(reportPath, JSON.stringify(report, null, 2), 'utf8');
    console.log(`\nUX Report written: ${reportPath}`);
    console.log('='.repeat(70));
    console.log(`Summary: Passed: ${report.summary.passed}, Warnings: ${report.summary.warnings}, Failed: ${report.summary.failed}`);
    console.log('='.repeat(70));

    if (overallFailed) {
        process.exitCode = 1;
    }
}

run().catch(err => {
    console.error('Fatal runner error:', err);
    process.exit(1);
});
