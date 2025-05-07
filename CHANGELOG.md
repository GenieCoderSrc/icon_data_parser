# Changelog

All notable changes to this project will be documented in this file.

## 0.0.1 
### Added

- Initial Release

- Extension on `IconData` to get the corresponding Material icon name.
- Extension on `int` (code point) to get the Material icon name.
- Manual script to parse `icons.dart` and generate a code point to name mapping.
- Builder-based solution for code generation using `build_runner`.
- Interface for custom icon name resolvers (`IIconNameResolver`).
- `MaterialIconNameResolver` for resolving Material icon names.
- Generated mapping support: `material_icons_mapping.dart`.

