# MakerWorld Korean Font Notes

Date: 2026-09-15

The MakerWorld Parametric Model Maker accepted the split font controls:

- `font_family`: font family name only
- `font_style`: style name only
- internal OpenSCAD value: `str(font_family, ":style=", font_style)`, except `Regular`, which can use the family name directly

The user confirmed that the listed Korean fonts worked well in MakerWorld.

Confirmed font families:

- Noto Sans KR
- Noto Serif KR
- NanumGothic
- Black Han Sans
- Gothic A1
- Gowun Batang
- Gowun Dodum
- Hahmlet
- IBM Plex Sans KR
- Dongle
- Gamja Flower
- Hi Melody
- Moirai One
- Nanum Brush Script

Rejected or removed:

- Malgun Gothic: Korean glyphs rendered as boxes in MakerWorld.
- Liberation Sans: Korean glyphs rendered as boxes in MakerWorld.

Notes:

- MakerWorld does not reliably support bundling local TTF files with a single SCAD upload for `text()`.
- The text input must be used by actual geometry. If a variable is declared but not used in `text()` or another generated shape, MakerWorld may hide the input.
- MakerWorld does not appear to support conditional dropdown values, so invalid family/style combinations must be caught by testing.
