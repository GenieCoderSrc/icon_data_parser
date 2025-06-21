# icon_data_parser

A Dart utility package to parse and resolve Flutter Material `IconData` information, providing bidirectional lookups between icon names and code points. Useful for Flutter applications that require dynamic icon rendering, inspection, or metadata utilities.

---

## ✨ Features

* 🔍 Map `IconData` to its corresponding Material icon name
* 🔢 Convert code points to icon names and vice versa
* 📄 Utility extensions for easier runtime access to icon names
* 📚 Custom icon name resolvers for advanced use cases

---

## 🚀 Getting Started

### 📦 Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  icon_data_parser: ^latest_version
```

Then run:

```bash
flutter pub get
```

---

## ⚙️ Usage

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

## 🔄 Extensions

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

## 🎓 Use Cases

* Icon name display or debugging tools
* Dynamic rendering of icon buttons or lists
* Icon search features in design tools or editors

---

## 📜 License

MIT License

---

## 👨‍👷 Maintainer

This package is maintained by [Shohidul Islam](https://github.com/ShohidulProgrammer).

---

## 🤝 Contributions

Issues and PRs are welcome! Please format code and ensure tests pass before submitting.
