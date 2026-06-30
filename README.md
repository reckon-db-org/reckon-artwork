# ReckonDB Artwork

Official brand assets for [ReckonDB](https://reckon-db.org).

## Logo (`logo/`)

| File | Use |
|------|-----|
| `reckondb-logo.svg` | Default, light backgrounds (dark wordmark) |
| `reckondb-logo-light.svg` | Dark backgrounds / dark mode (white wordmark) |

Both are the sphere-and-eye mark plus the ReckonDB wordmark and tagline, on the
brand-purple sphere with a lime eye.

## Favicon (`favicon/`)

`reckondb-favicon.svg` is the source; the PNGs and `.ico` are generated from it.

| File | Use |
|------|-----|
| `reckondb-favicon.svg` | Source (sphere-and-eye mark, no wordmark) |
| `favicon-16x16.png` | Browser tab (small) |
| `favicon-32x32.png` | Browser tab (retina) |
| `favicon.ico` | Legacy browsers (16/32/48) |
| `apple-touch-icon.png` | iOS home screen (180×180) |

Regenerate the raster icons from the source:

```bash
cd favicon
rsvg-convert -w 16  -h 16  reckondb-favicon.svg -o favicon-16x16.png
rsvg-convert -w 32  -h 32  reckondb-favicon.svg -o favicon-32x32.png
rsvg-convert -w 180 -h 180 reckondb-favicon.svg -o apple-touch-icon.png
rsvg-convert -w 48  -h 48  reckondb-favicon.svg -o /tmp/fav48.png
magick favicon-16x16.png favicon-32x32.png /tmp/fav48.png favicon.ico
```

## Colour Palette

| Name | Hex | Usage |
|------|-----|-------|
| Purple | `#7C3AED` | Primary brand, buttons, accents |
| Purple Dark | `#6D28D9` | Hover state |
| Purple Light | `#A78BFA` | Sphere highlight, dark-mode tagline |
| Lime | `#B8E234` | Eye accent on the mark |
