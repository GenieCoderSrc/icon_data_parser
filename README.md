# icon\_data\_parser

A Dart package to parse and map Flutter Material Icons, providing bidirectional lookups between `IconData`, icon names, and code points. Ideal for Flutter projects that require custom icon tooling, code generation, or runtime icon inspection.

---

## Features

* 🔍 Map `IconData` to its corresponding Material icon name
* 🔢 Convert icon code points to icon names
* 📦 Automatically generate icon mappings from the Flutter SDK source
* 🛠️ Builder-based generation for integration in `build_runner` workflows

---

## Getting Started

### Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  icon_data_parser: latest_version
```

Then run:

```bash
flutter pub get
```

---

## Usage

### 1. Get Icon Name from IconData

```dart
import 'package:flutter/material.dart';
import 'package:icon_data_parser/icon_parser/data_sources/material_icon_name_resolver.dart';

IconData icon = Icons.ac_unit;
String? name = icon.materialIconName; // "ac_unit"
```

### 2. Get Icon Name from Code Point

```dart
int codePoint = 0xe000;
String? name = codePoint.iconName; // "ten_k"
```

### 3. Get Icon Name with Custom Resolver

```dart
import 'package:icon_data_parser/icon_parser/i_data_sources/icon_name_resolver.dart';

final resolver = MaterialIconNameResolver();
String? name = resolver.resolveIconName(Icons.abc);
```

---

## Code Generation

You can generate mappings from Flutter's `icons.dart` using the provided script or via `build_runner`.

### Manual Script (example)

```dart
void main() async {
  final materialIconsFile = File('path/to/flutter/packages/flutter/lib/src/material/icons.dart');

  final iconsContent = await materialIconsFile.readAsLines();
  final iconMappings = <String, int>{};

  for (final line in iconsContent) {
    final trimmed = line.trim();
    final match = RegExp(r'static const IconData (\w+) = IconData\((0x[a-fA-F0-9]+),').firstMatch(trimmed);
    if (match != null) {
      final iconName = match.group(1)!;
      final codePoint = int.parse(match.group(2)!);
      iconMappings[iconName] = codePoint;
    }
  }

  await _generateMaterialIconsMapping(iconMappings);
}
```

### Generated Output

```dart
class MaterialIconsMapping {
  static const Map<int, String> iconCodePointToName = {
    57344: 'ten_k',
    59136: 'ten_k_sharp',
    62687: 'ten_k_rounded',
    60914: 'ten_k_outlined',
    // more icons...
  };
}
```

---

## Extensions

### IconData Extension

```dart
extension IconDataExtension on IconData {
  String? get materialIconName => MaterialIconNameResolver().resolveIconName(this);
}
```

### CodePoint Extension

```dart
extension CodePointToIconName on int {
  String? get iconName => materialIcons.entries
    .firstWhere((entry) => entry.value == this, orElse: () => const MapEntry('', 0)).key
    .takeIf((key) => key.isNotEmpty);
}
```

---

## Build System Integration

A build system-based implementation is also available using `build_runner`. It automatically scans and generates:

* `icon_maps/material_icons_mapper.g.dart`
* `icon_maps/material_icon_data_map.g.dart`

```bash
flutter pub run build_runner build
```

---

## License

MIT License

---

## Contributions

Issues and PRs are welcome! Please ensure code formatting and tests pass before submitting.

---

## Maintainers

This package is maintained by Shohidul Islam.
