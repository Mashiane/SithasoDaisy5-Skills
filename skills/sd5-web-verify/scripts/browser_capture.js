const http = require('http');
const cp = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

const chromePath = 'C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe';

async function testApp(url, screenshotPath, timeoutMs = 12000, viewport = { width: 1440, height: 900 }) {
    const port = 9222 + Math.floor(Math.random() * 500);
    const tmpDir = fs.mkdtempSync(path.join(os.tmpdir(), 'chrome-cdp-'));
    
    const chrome = cp.spawn(chromePath, [
        '--headless=new',
        `--window-size=${viewport.width},${viewport.height}`,
        `--remote-debugging-port=${port}`,
        `--user-data-dir=${tmpDir}`,
        '--disable-gpu',
        '--no-first-run',
        '--no-default-browser-check',
        'about:blank'
    ]);

    let closed = false;
    function cleanup() {
        if (!closed) {
            closed = true;
            try { chrome.kill(); } catch (e) {}
            try { fs.rmSync(tmpDir, { recursive: true, force: true }); } catch (e) {}
        }
    }

    try {
        // Wait for chrome to listen
        let targets = null;
        for (let i = 0; i < 20; i++) {
            await new Promise(r => setTimeout(r, 200));
            try {
                targets = await new Promise((resolve, reject) => {
                    const req = http.request({
                        hostname: '127.0.0.1',
                        port: port,
                        path: `/json/new?about:blank`,
                        method: 'PUT'
                    }, res => {
                        let d = '';
                        res.on('data', c => d += c);
                        res.on('end', () => {
                            try { resolve(JSON.parse(d)); } catch (err) { reject(new Error(d)); }
                        });
                    });
                    req.on('error', reject);
                    req.end();
                });
                break;
            } catch (e) {}
        }

        if (!targets || !targets.webSocketDebuggerUrl) {
            throw new Error(`Failed to connect to Chrome on port ${port}`);
        }

        const ws = new WebSocket(targets.webSocketDebuggerUrl);
        await new Promise((resolve, reject) => {
            ws.onopen = resolve;
            ws.onerror = reject;
        });

        let msgId = 1;
        const pending = new Map();
        const consoleMessages = [];
        const uncaughtExceptions = [];

        ws.onmessage = (event) => {
            const data = JSON.parse(event.data);
            if (data.id && pending.has(data.id)) {
                pending.get(data.id)(data);
                pending.delete(data.id);
            }
            if (data.method === 'Runtime.consoleAPICalled') {
                const text = data.params.args.map(a => a.value !== undefined ? a.value : JSON.stringify(a)).join(' ');
                consoleMessages.push({ type: data.params.type, text });
            }
            if (data.method === 'Runtime.exceptionThrown') {
                const ed = data.params.exceptionDetails;
                const desc = ed.exception?.description || (ed.exception?.value ? JSON.stringify(ed.exception.value) : "") || ed.text || JSON.stringify(ed);
                uncaughtExceptions.push(desc);
            }
        };

        function send(method, params = {}) {
            return new Promise((resolve) => {
                const id = msgId++;
                pending.set(id, resolve);
                ws.send(JSON.stringify({ id, method, params }));
            });
        }

        await send('Page.enable');
        await send('Runtime.enable');
        await send('Console.enable');
        await send('Emulation.setDeviceMetricsOverride', {
            width: viewport.width,
            height: viewport.height,
            deviceScaleFactor: 1,
            mobile: false
        });
        await send('Page.navigate', { url });

        const startTime = Date.now();
        let ready = false;
        let domSummary = null;

        while (Date.now() - startTime < timeoutMs) {
            await new Promise(r => setTimeout(r, 400));
            const evalRes = await send('Runtime.evaluate', {
                expression: `(() => {
                    const loader = document.getElementById('loader-1');
                    const loaderHidden = loader ? (window.getComputedStyle(loader).display === 'none') : true;
                    const bodyText = document.body ? document.body.innerText.trim() : '';
                    const elementsCount = document.querySelectorAll('*').length;
                    const mainContent = document.getElementById('app') || document.getElementById('main') || document.body;
                    const hasHtml = mainContent ? mainContent.innerHTML.length : 0;
                    return {
                        loaderHidden,
                        bodyLength: bodyText.length,
                        bodyText: bodyText.substring(0, 150),
                        elementsCount,
                        hasHtml
                    };
                })()`,
                returnByValue: true
            });

            const resVal = evalRes?.result?.result?.value || evalRes?.result?.value;
            if (resVal) {
                domSummary = resVal;
                if (domSummary.loaderHidden && (domSummary.bodyLength > 0 || domSummary.elementsCount > 20)) {
                    ready = true;
                    // give it an extra 500ms for images/fonts to paint
                    await new Promise(r => setTimeout(r, 500));
                    break;
                }
            }
        }

        // A fresh BANano page can report its DOM ready before remote CSS
        // background images have decoded. Wait for those assets before
        // capturing so visual reviews don't record gray placeholders.
        const assetRes = await send('Runtime.evaluate', {
            expression: `(async () => {
                const urls = new Set(Array.from(document.images).filter(image => image.getAttribute('src')).map(image => image.currentSrc || image.src).filter(Boolean));
                for (const el of document.querySelectorAll('body *')) {
                    const bg = getComputedStyle(el).backgroundImage || '';
                    for (const match of bg.matchAll(/url\\(["']?(.*?)["']?\\)/g)) if (!match[1].startsWith('data:')) urls.add(match[1]);
                }
                const failed = [];
                const loads = [...urls].map(url => new Promise(resolve => {
                    const image = new Image();
                    const timeout = setTimeout(resolve, 12000);
                    image.onload = () => { clearTimeout(timeout); resolve(); };
                    image.onerror = () => { failed.push(url); clearTimeout(timeout); resolve(); };
                    image.src = url;
                }));
                await Promise.all(loads);
                return { urls: [...urls], failed };
            })()`,
            awaitPromise: true,
            returnByValue: true
        });
        const assetMetrics = assetRes?.result?.result?.value || assetRes?.result?.value || { urls: [], failed: [] };

        if (viewport.width < 600) {
            await send('Emulation.setDeviceMetricsOverride', {
                width: viewport.width,
                height: viewport.height,
                deviceScaleFactor: 1,
                mobile: true
            });
            await new Promise(r => setTimeout(r, 500));
        }

        const childRes = await send('Runtime.evaluate', {
            expression: `(() => {
                const c = document.getElementById('SDUI5Container1');
                return c ? Array.from(c.children).map(x => ({ id: x.id, tag: x.tagName, top: Math.round(x.getBoundingClientRect().top) })) : [];
            })()`,
            returnByValue: true
        });
        if (childRes?.result?.result?.value) {
            console.log('CONTAINER_CHILDREN:', JSON.stringify(childRes.result.result.value));
        }

        const layoutRes = await send('Runtime.evaluate', {
            expression: `(() => {
                const width = document.documentElement.clientWidth;
                const candidates = Array.from(document.querySelectorAll('body *')).map(el => {
                    const r = el.getBoundingClientRect();
                    return { id: el.id || '', tag: el.tagName.toLowerCase(), className: String(el.className || '').slice(0, 100), left: Math.round(r.left), right: Math.round(r.right), width: Math.round(r.width), height: Math.round(r.height) };
                }).filter(x => x.width > 0 && (x.left < -1 || x.right > width + 1)).sort((a,b) => (b.right-width) - (a.right-width)).slice(0,20);
                const backgroundImages = [...new Set(Array.from(document.querySelectorAll('body *')).flatMap(el => {
                    const bg = getComputedStyle(el).backgroundImage || '';
                    return Array.from(bg.matchAll(/url\\(["']?(.*?)["']?\\)/g), m => m[1]);
                }))];
                return { viewport: width, innerWidth: window.innerWidth, document: document.documentElement.scrollWidth, body: document.body.scrollWidth, overflow: document.documentElement.scrollWidth > width, backgroundImages, candidates };
            })()`,
            returnByValue: true
        });
        const layoutMetrics = layoutRes?.result?.result?.value || layoutRes?.result?.value || null;

        const controlsRes = await send('Runtime.evaluate', {
            expression: `Array.from(document.querySelectorAll('button, input, [role="button"]')).map(el => ({
                tag: el.tagName.toLowerCase(), id: el.id || '', text: (el.innerText || el.value || el.getAttribute('aria-label') || '').trim(),
                className: String(el.className || '').slice(0, 180), color: getComputedStyle(el).color,
                backgroundColor: getComputedStyle(el).backgroundColor, rect: (() => { const r = el.getBoundingClientRect(); return {left: Math.round(r.left), top: Math.round(r.top), width: Math.round(r.width), height: Math.round(r.height)}; })(),
                html: el.outerHTML.slice(0, 1600)
            }))`,
            returnByValue: true
        });
        const controlMetrics = controlsRes?.result?.result?.value || controlsRes?.result?.value || [];

        // Capture screenshot
        if (screenshotPath) {
            const dir = path.dirname(screenshotPath);
            const shot = await send('Page.captureScreenshot', { format: 'png', captureBeyondViewport: true });
            if (shot && shot.result && shot.result.data) {
                fs.writeFileSync(screenshotPath, Buffer.from(shot.result.data, 'base64'));
            }
        }

        ws.close();
        cleanup();

        return {
            url,
            ready,
            domSummary,
            assetMetrics,
            layoutMetrics,
            controlMetrics,
            consoleMessages,
            uncaughtExceptions,
            screenshotPath: fs.existsSync(screenshotPath) ? screenshotPath : null
        };
    } catch (e) {
        cleanup();
        return {
            url,
            ready: false,
            error: e.message
        };
    }
}

if (require.main === module) {
    const url = process.argv[2] || 'http://localhost/sd5landing/index.html';
    const shot = process.argv[3] || 'screen_test.png';
    const width = Number(process.argv[4] || 1440);
    const height = Number(process.argv[5] || 900);
    testApp(url, shot, 20000, { width, height }).then(r => console.log(JSON.stringify(r, null, 2)));
}

module.exports = { testApp };
