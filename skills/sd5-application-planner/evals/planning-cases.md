# Planning evaluation cases

## Case: finance dashboard from a one-shot visual prompt

Input: `AIExamples/09-finance-dashboard/prompt.txt`.

Expected planner behavior:

- One dashboard feature and one page; don't add sign-in, banking connections, or extra routes.
- Treat mobile/single-screen and cream/teal/coral styling as requirements.
- Mark any balances, category totals, savings target, and transaction data as illustrative static sample data unless supplied by the user.
- Trace balance, monthly breakdown, savings progress, and category list requirements to observable checks.
- Identify the chart capability gap accurately: registered `SDUI5ToastChart` demonstrates `pie`, not an explicitly named `donut` chart type. Select a source-backed implementation/approximation and document it; do not invent `doughnut`/`donut` API values.
- Keep form behavior and financial data integration out of scope.
