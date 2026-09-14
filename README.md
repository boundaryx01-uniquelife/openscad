# OpenSCAD Programs

Reusable OpenSCAD programs live in `projects/`. Each program owns its source,
README, and any small assets needed to edit it locally.

## Programs

- `projects/keycap-local/` — local OpenSCAD keycap generator and bundled fonts.
- `projects/makerworld-practice/` — MakerWorld-ready keycap and clicker generators.

## Release policy

- Commit current editable sources in `projects/`.
- Keep shareable releases in `deliverables/`; they are intentionally not tracked.
- Keep previews, temporary meshes, and old releases in `archive/`; they are intentionally not tracked.

For a new program, create `projects/<program-name>/` with a `README.md` and one
or more `.scad` source files.
