---
name: banano-essentials
description: Distilled BANano facts that govern SithasoDaisy5 app entry, build, and asset loading. Source: BANanoEssentialsV1.09.pdf (root). Page citations per fact; the PDF is authoritative on BANano, framework source on SDUI5 APIs.
---

# BANano Essentials (for SithasoDaisy5 agents)

Source: `BANanoEssentialsV1.09.pdf` (262 pp, Alain Bailleul / BANano v9.x).
Page numbers below are PDF-reader pages of that file. Framework behavior
(SDUI5* APIs, `UsesX` loaders) still comes from framework source — this file
covers the BANano substrate only.

## 1. AppStart is the ONLY non-transpiled method (p22, p59)

`Sub AppStart` runs as normal B4J in the IDE; everything else transpiles to
JavaScript. It sets directives for the Transpiler, then calls `BANano.Build`:

```b4x
Sub AppStart (Form1 As Form, Args() As String)
    BANano.Initialize("BANano", "BANanoSkeleton", 7)
    BANano.Header.Title = "BANano Skeleton"
    BANano.JAVASCRIPT_NAME = "app" & DateTime.Now & ".js"
    BANano.TranspilerOptions.MergeAllCSSFiles = True
    BANano.TranspilerOptions.MergeAllJavascriptFiles = True
    BANano.TranspilerOptions.RemoveDeadCode = True
    BANano.TranspilerOptions.ShowWarningDeadCode = True
    BANano.Build(File.DirApp)
    #if release
    ExitApplication
    #end if
End Sub
```

Our `.b4j` embedded entry module follows this shape with app-specific
`AppName`/`Publish` globals (see `app-scaffolds.md` §1a). `build-banano-app.ps1`
requires those two globals for output discovery.

## 2. Debug log-jump line (p59)

```b4x
#if Debug
Log("BANanoLOGS")   ' MUST be literally this line for B4J log-jump to work
#end if
```

Every generated `.b4j` entry module must contain it verbatim.

## 3. BANano_Ready is the browser entry point (p23)

Runs when all assets are loaded. Our `pgIndex.Initialize` →
`app.ClearPageView` → page `Show` lifecycle lives here. Never put Transpiler
directives here; never expect AppStart state to transfer (different runtimes).

## 4. ForLater asset pattern = upstream of UsesX (p65)

```b4x
' AppStart:
BANano.Header.AddCSSFileForLater("mini-nord.min.css")
' BANano_Ready (or later, on demand):
BANano.AssetsLoadWait("Loader", Array("./assets/1.jpg", "./styles/mini-nord.min.css"))
```

`AddJavascriptFileForLater` / `AddCSSFileForLater` register; `AssetsIsDefined`
+ `AssetsLoadWait` (returns unloaded paths, Null when complete) fetch on
demand. Framework `SDUI5App.UsesX` methods are this pattern wrapped
(`UI.LoadAssetsOnDemand`) — see `uses-assets-map.md` for the per-component
loader table.

## 5. Cache-busting (p22, p59)

`BANano.JAVASCRIPT_NAME = "app" & DateTime.Now & ".js"` forces reload on
rebuild. Keep it in every app entry module.

## 6. Subfolder serving — PWA start URL (p59)

Apps served below docroot (our Laragon `http://localhost/<app>/` convention)
are the "WebApp is not in the root" case:

```b4x
BANano.TranspilerOptions.SetPWAStartUrl("myPWA/index.html")
```

Set the start URL to the app's subfolder path when building a PWA for
Laragon. See `../../sd5-web-verify/references/laragon-serve.md`.

## 7. What this file does NOT cover

B4JBuilder CLI flags, JavaFX runtime paths, and jar execution (see
`build-banano-app.ps1` header — derived from the checked-in demo workflow,
not this book). jMQTT/WebSocket/PWA push chapters of the book are out of the
current skill scope; do not generate that code unless the user asks.
