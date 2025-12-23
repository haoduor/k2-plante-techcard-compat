This repository is a Factorio mod (a compat module built from a template). Keep instructions short and concrete so an AI agent can be productive immediately.

- Project snapshot: `info.json` holds mod metadata and dependencies. This repo is a small compatibility mod (see `compat/`), with localization under `locale/en/locale.cfg` and graphics in `graphics/`.
- Release and packaging: The project uses `semantic-release` with a custom Factorio plugin (see `README.md`). Releases are automated by GitHub Actions; don’t change `version` manually in `info.json` (the CI updates it).

Key patterns and examples
- Compatibility scripts live in `compat/`. Pattern: early return when the target mod is absent. Example from `compat/nuclear-science.lua`:
  - if not mods["Krastorio2-spaced-out"] then return end
  - then mutate prototypes via `table.insert(data.raw["technology"]["..."]... )` or `data:extend({...})`.
- Prototype changes should use the existing Factorio prototype shapes found in the repo (items/recipes/technology). When adding recipes or items, follow the structure in `compat/nuclear-science.lua` (use `type`, `name`, `category`, `ingredients`, `results`, `allow_productivity`).

Developer workflows (explicit)
- Local packaging: to test packaging locally use the documented archive command from `README.md`:
  - git archive --format zip --prefix [YOUR-MOD-NAME]/ --worktree-attributes --output [YOUR-MOD-NAME]_[VERSION].zip HEAD
- Releases: GitHub Action (see `.github/workflows/release.yml`) runs `semantic-release`. A `FACTORIO_TOKEN` secret is required to publish to the Factorio Mod Portal.
- Commit convention: follow the conventional-commit presets described in `README.md`; commit types map to changelog sections (e.g. `feat` -> Features, `compat` -> Compatibility).

Project-specific conventions for agents
- Do not bump `info.json` version manually — let CI handle it.
- When making compatibility changes, always guard with a `mods[...]` check and limit changes to `compat/` unless modifying core mod features.
- Update localization keys in `locale/en/locale.cfg` when adding new item/technology names. Localization files are plain key=value lines; ensure keys match the prototype `localised_name` fields.
- Use `.gitattributes` to control packaging exclusions; rely on `git archive` behavior described in `README.md`.

Files to inspect when making changes
- `info.json` — metadata and dependencies (useful to see required host mods).
- `compat/*.lua` — compatibility code examples and required patterns.
- `locale/en/locale.cfg` — localization keys.
- `README.md` — release/packaging and commit conventions.
- `.gitattributes` and `.github/workflows/release.yml` — packaging and CI behavior.

If unsure, follow these safe edits
- Add new compat prototype: create `compat/<mod>-<feature>.lua`, guard with `if not mods["<mod>"] then return end`, then `data:extend({...})`.
- Add localization: append new key/value to `locale/en/locale.cfg` matching your prototype key.

Ask me to expand any section (release steps, localization examples, or prototype templates) if you want more scaffolding.
