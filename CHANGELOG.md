# Changelog

All notable changes to this project will be documented in this file.

## 0.0.3

### Changed

* Separated `icon_data_parser` from the builder-based `icon_data_generator` package.
* Focused solely on runtime parsing and resolver utilities.

### Added

* Improved resolver logic for `MaterialIconNameResolver`.
* More robust error handling and fallback for missing icon names.
* Additional documentation and cleanup of unused code.

## 0.0.2

* Initial Release

### Added

* Extension on `IconData` to get the corresponding Material icon name.

## 0.0.1

### Added

* Extension on `int` (code point) to get the Material icon name.
* Manual script to parse `icons.dart` and generate a code point to name mapping.
* Builder-based solution for code generation using `build_runner`.
* Interface for custom icon name resolvers (`IIconNameResolver`).
* `MaterialIconNameResolver` for resolving Material icon names.
* Generated mapping support: `material_icons_mapping.dart`.
