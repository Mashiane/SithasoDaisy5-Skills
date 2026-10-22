---
name: prompt-contracts
description: 10 design prompt contracts (from the Sleek "10 AI Mobile App Design Examples" corpus) translated into SithasoDaisy5 Stage-0 screen contracts. Each maps the 6 prompt elements — screen, UI elements, style, palette, typography, mood — to ARCH-N, THEME_*, components, and documented color channels.
---

# SithasoDaisy5 — Prompt Contracts (10 design exemplars)

## Prompt Intake Formula (6 layers)

Use this to decompose any design prompt before writing a contract:

1. **Product and audience** — what you are building and who needs it.
2. **Page goal** — primary task, conversion, or decision.
3. **Required structure** — sections, states, and content the screen must include.
4. **Named visual style** — one visual language + traits to carry over.
5. **Interaction constraints** — responsive behavior, accessibility, density, motion.
6. **Implementation context** — daisyUI/SithasoDaisy5 framework + Blueprint MCP if available.

Reusable prompt structure:
`Build a [page type] for [product and audience]. The page must help users [primary goal] and include [required sections and states]. Use [named UI design style] for the visual direction, especially its [typography, color, shape, imagery, and layout traits]. Keep the interface responsive and accessible. Build it with daisyUI/SithasoDaisy5.`

Use these as templates when a user hands you a design prompt (or points at a mockup). Translate it through the same 6-element shape, then run the 6-stage workflow. All components cited are registered; check each component's color property contract before choosing a channel (`design-tokens.md` §1.1). Style tier per §14.

---

## 1. Sleep Dashboard — Ethereal Glassmorphism

- **Screen / ARCH**: Dashboard (ARCH-03), single screen, dark.
- **UI elements**: score display (`SDUI5RadialProgress`), sleep-stages wave chart (`SDUI5TrendChart` `ChartType="line"` + `AreaColor`), smart-alarm widget (`SDUI5Card` + `SDUI5Toggle`), stat strip (`SDUI5Stat`), glow/aurora accents (`SDUI5Aura` — `TypeOf` = `glow`/`rainbow`/`holo`/`dual`/`gold`/`silver`; one per page).
- **Style / tier**: ✅ Sanctioned — `.Classes = "glass"` frosted cards (glass is a utility, not a card class), `THEME_NIGHT` or `THEME_DRACULA`, `SDUI5LottiePlayer` for ambience.
- **Palette**: dark surface via theme; accents as tokens; specific tints (lavender/mint/gold) via `.Classes` arbitrary values on decorative elements.
- **Typography**: light weights, generous tracking — `.Classes = "font-light tracking-wide"`.
- **Mood**: theme carries it; no gradient backgrounds on `body` — approximate with theme + Lottie.

## 2. Finance Dashboard — Light Fintech

- **Screen / ARCH**: ARCH-03.
- **UI elements**: balance card (`SDUI5Card`), donut spending chart (`SDUI5TrendChart` `ChartType="pie"` + `Donut`), savings progress (`SDUI5Progress`), category list (`SDUI5List` + `SDUI5ListItem` with icons).
- **Style / tier**: ✅ Sanctioned — `THEME_CORPORATE`.
- **Palette**: cream base via theme; teal/coral accents via tokens (`primary`, `info`); exact brand hex via theme CSS vars if brand identity.
- **Typography**: default sans, `font-medium` numerics.
- **Mood**: professional/trustworthy — matches doctrine (one primary CTA, 4-state).

## 3. Social Profile — Three Styles

- **Screen / ARCH**: Profile page — no dedicated ARCH; compose: hero row + grid (ARCH-03 KPI-grid shape for stats).
- **UI elements**: `SDUI5Avatar` (with `OnlineStatus`), counts (`SDUI5Stat`/`SDUI5StatItem`), `SDUI5Button` (Follow `primary` block, Message `secondary`), posts grid (`SDUI5Row` `GridColsMd="3"` + `SDUI5Image`), tabs (`SDUI5Tabs`), bottom nav (`SDUI5Dock`).
- **Style / tier (×3)**:
  - Pastel friendly → `THEME_PASTEL`, rounded, soft. ✅
  - Clean minimal → light theme + `SDUI5Dock` with `.Classes = "glass"` (liquid-glass nav). ✅
  - Dark sleek → `THEME_DARK` (#1a1a1a-class surface from theme, not hex). ✅
- **Palette**: theme-driven; hex only for accent chips.
- **Typography**: per style — `font-semibold` usernames, `text-sm` bio.
- **Mood**: per theme.

## 4. Music Player — Three Styles

- **Screen / ARCH**: Media player — compose: image + controls + list (ARCH-05 detail shape).
- **UI elements**: album art (`SDUI5Image` in `SDUI5Card`), seek (`SDUI5Progress` or `SDUI5Range`), transport controls (`SDUI5Button .Shape="circle"` ×5), volume (`SDUI5Range`), playlist (`SDUI5List`), queue (`SDUI5Swiper`/`SDUI5Carousel`), waveform (`SDUI5TrendChart` `ChartType="bar"` `TooltipDisabled=True`).
- **Style / tier (×3)**:
  - Soft Neo-Brutalism → 🧪 Experimental: dark theme + pastel token accents + `border-2 border-black`-style `.Classes`; declare trade-off.
  - Modern Memphis → ⛔ Unsupported (scattered geometric collage). Approx: light theme + bold token-colored badges/shapes via styled `SDUI5Card`s; document deviation.
  - Retro 90s → ✅ Sanctioned via `THEME_RETRO`.
- **Palette**: token accents; brand hex only in gradient props if needed.
- **Typography**: `font-extrabold uppercase` for neo-brutalism; `font-mono` accents for retro.
- **Mood**: per theme/tier; state the tier in the trace.

## 5. Fitness Dashboard — Motivational Light

- **Screen / ARCH**: ARCH-03. **Closest 1:1 fit of the corpus.**
- **UI elements**: weekly summary (`SDUI5Stat`), calories ring (`SDUI5RadialProgress`), streak (`SDUI5Progress` or `SDUI5Badge`), weekly bar chart (`SDUI5TrendChart` `ChartType="bar"`).
- **Style / tier**: ✅ Sanctioned — `THEME_CORPORATE` or `THEME_LEMONADE` (warm energy).
- **Palette**: coral/electric-blue → tokens (`warning`/`info` or theme primary); exact hex via theme vars.
- **Typography**: default sans; `text-3xl font-bold` numbers.
- **Mood**: uplifting — clean cards, one primary CTA (Start Workout).

## 6. Banking App — Y2K

- **Screen / ARCH**: ARCH-03 + card carousel.
- **UI elements**: balance (`SDUI5Text` hero), card carousel (`SDUI5Carousel`/`SDUI5Swiper` + `SDUI5BankCard` — component has native gradient, silver/pink hex via `GradientColor1/2`), quick actions (`SDUI5Button` row), transactions (`SDUI5List`), bottom nav (`SDUI5Dock`).
- **Style / tier**: ⛔ Unsupported as specified (glossy bevel/skeuomorphic chrome). Approx: `THEME_CYBERPUNK` + gradients on cards/nav + bold bubbly typography; declare the approximation as a deviation.
- **Palette**: hot pink/electric blue/chrome → `GradientColor1/2` props (native hex channel) + token accents.
- **Typography**: `font-extrabold`, `rounded-box`.
- **Mood**: playful nostalgia via theme; state tier ⛔→approximated.

## 7. Stopwatch — Swiss International

- **Screen / ARCH**: Utility — compose: hero text + table + controls (ARCH-10 minimal shape).
- **UI elements**: elapsed time (`SDUI5Text` `text-9xl font-bold font-mono`), laps (`SDUI5Table`, borderless styling via classes), Start/Stop (`SDUI5Button .Shape="square"`, `primary`/`neutral`), timer state (`SDUI5CountDown` for countdown mode).
- **Style / tier**: ✅ Sanctioned — `THEME_LOFI` (flat, high whitespace).
- **Palette**: off-white base + single red accent → theme base + `primary` configured red via theme vars; never `#F5F5F5` per-component.
- **Typography**: massive bold — `text-9xl font-extrabold`; no custom font needed (system sans suffices; Swiss-grade Helvetica approximated by `font-sans`).
- **Mood**: precision via extreme whitespace + mono numerals.

## 8. Flight Tracker — Travel-Ready

- **Screen / ARCH**: ARCH-05 (master-detail) or single tracking screen.
- **UI elements**: route timeline (`SDUI5Timeline` + `SDUI5TimelineItem`), status badges (`SDUI5Badge` pill, token colors), airline (`SDUI5Avatar`), flight header (`SDUI5Card`, rounded), info rows (`SDUI5ListItem`).
- **Style / tier**: ✅ Sanctioned — `THEME_CORPORATE` (light, #007aff-class primary from theme).
- **Palette**: blue primary via theme; status colors via tokens (`success` landed, `warning` delayed, `info` en route).
- **Typography**: `text-5xl font-bold` airport codes; `text-xs` metadata.
- **Mood**: confident/organized — matches doctrine exactly (status = semantic tokens).

## 9. Sneaker Marketplace — Gen-Z Hype

- **Screen / ARCH**: ARCH-03 grid variant (product feed) + detail.
- **UI elements**: product grid (`SDUI5Row` `GridColsMd="2"` + `SDUI5Card .ImageFull`), price/size badges (`SDUI5Badge`), ratings (`SDUI5Rating`), bottom nav (`SDUI5Dock`), buy CTA (`SDUI5Button primary block`).
- **Style / tier**: ✅ Sanctioned — `THEME_ACID` (electric lime energy) or `THEME_DARK` + `primary` lime via theme vars.
- **Palette**: lime/dark via theme; hype accents via `.Classes` arbitrary hex on chips.
- **Typography**: `font-black uppercase tracking-tight` headlines.
- **Mood**: streetwear energy via theme + typography weight.

## 10. Calendar — Brutalist Chaos

- **Screen / ARCH**: ARCH-05-ish; month grid + event list.
- **UI elements**: month grid (`SDUI5FullCalendar` `HeaderToolbarRight="dayGridMonth"`, events as colored blocks, today highlight native), event list below (`SDUI5List`), mini nav (`SDUI5Button` prev/next).
- **Style / tier**: ⛔ Unsupported as specified (intentional broken hierarchy, overlaps). Build the **functional calendar** sanctioned (dark or light theme, token-colored events), then offer 🧪 Experimental layer: `border-2 border-black` cards, `shadow-xl`, mono/sans mix, limited rotation via `.Classes` — with WCAG contrast still passing. Declare tier + trade-offs in trace.
- **Palette**: 2-3 bold colors — theme base + one accent token; event colors via `TrendChart`-style CSS-string props or `.Classes`.
- **Typography**: mixed `font-mono`/`font-bold` via `.Classes`.
- **Mood**: rebellious — but contrast and keyboard access stay (doctrine floor).

---

## Design Decision Contract (AI UI prompting guide)

Every Stage-0 contract should also record these explicit decisions (from "How to make AI UI feel less generic"):

- **Visual language**: named direction (glassmorphism, brutalism, editorial, etc.)
- **Spacing & rhythm**: base unit, section gaps (desktop/mobile), card padding, density.
- **Shapes & edges**: surface rounding, where shape language changes.
- **Color roles**: base/elevated surfaces, primary action, muted text, border, success/warning/error; contrast rules; accent rarity.
- **Typography & hierarchy**: font categories, weight range, scale, line length, casing; display vs labels/body/metadata/numerals.
- **Design tokens & states**: semantic tokens for color/radius/shadow/spacing/motion; hover/focus/active/selected/disabled/loading/empty/success/error.
- **Reasoned creativity**: tie expressive choices to product/content/interaction; remove unsupported choices.

---

## How to Use a Contract

1. Treat each bullet as the Stage-0 screen contract fill (intent, ARCH match, density, theme, 4-state plan).
2. Cite the style tier (§14) and channels used (§1.1) in the reasoning trace.
3. Every component cited must still be checked against `component-manifest.md` status before Stage 4.
4. ⛔/🧪 tiers do NOT mean refusal — they mean: build the sanctioned functional core, approximate the style, document the deviation.
