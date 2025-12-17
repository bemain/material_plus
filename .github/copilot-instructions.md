# Material Plus – AI contributor guide
- Purpose: Flutter package bundling Material-style widgets and utility notifiers; public surface re-exported via [lib/material_plus.dart](lib/material_plus.dart).
- Layout: utils in [lib/src/utils](lib/src/utils); widgets in [lib/src/widgets](lib/src/widgets) with subfolders for complex components (circular_slider, segmented_tab_control, speed_dial, loading).
- Build/test flow: `flutter pub get` → `dart analyze --fatal-infos --fatal-warnings` → `flutter test` (mirrors CI in [.github/workflows/dart-analyze.yml](.github/workflows/dart-analyze.yml) and [.github/workflows/test.yml](.github/workflows/test.yml)).
- Docs: generate API docs with `dart doc . --output doc/api` (see [.github/workflows/dart-doc.yml](.github/workflows/dart-doc.yml)); published HTML lives in [doc/api](doc/api).
- External deps: Flutter SDK; `shared_preferences` for on-device persistence.
- Public API rule: new exports must be added in [lib/material_plus.dart](lib/material_plus.dart); keep utils/widgets private unless intentionally exposed.
- Testing expectations: widget and utility behaviors are covered in [test/utils](test/utils) and [test/widgets](test/widgets); keep new features testable under `flutter test` (no custom runners). Use `SharedPreferences.setMockInitialValues` when adding persistence tests. 
- Styling/theming: widgets typically draw from `Theme.of(context)` and component themes (e.g., `SliderThemeData`); prefer theme-driven colors over hard-coded values. Widgets must follow the Material 3 guidelines as closely as possible.
- Contributions: follow Flutter lints (see [analysis_options.yaml](analysis_options.yaml)); prefer ValueNotifier-based state for lightweight components; keep overlays cleaned up in `dispose`.
- Release checks: ensure analyzer passes, tests green, docs regenerate if public API changes; CI mirrors these steps.

If any section is unclear or misses an important workflow, tell me and I’ll refine it.
