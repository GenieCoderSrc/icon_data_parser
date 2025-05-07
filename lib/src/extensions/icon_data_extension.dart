import 'package:flutter/material.dart';
import 'package:icon_data_parser/icon_maps/material_icon_data_map.g.dart';
import 'package:icon_data_parser/icon_maps/material_icons_mapper.g.dart';

/// Extension to get the icon name from a [codePoint].
extension CodePointToIconName on int {
  String? get iconName {
    return materialIcons.entries
        .firstWhere(
          (entry) => entry.value == this,
          orElse: () => const MapEntry('', 0),
        )
        .key
        .takeIf((key) => key.isNotEmpty);
  }
}

/// Extension to get the icon name from an [IconData] instance.
extension IconDataToIconName on IconData {
  String? get name {
    return materialIconMap.entries
        .firstWhere(
          (entry) => _isSameIconData(entry.value, this),
          orElse: () => const MapEntry('', Icons.add),
        )
        .key
        .takeIf((key) => key.isNotEmpty);
  }
}

/// Helper to compare two IconData instances
bool _isSameIconData(IconData a, IconData b) {
  return a.codePoint == b.codePoint &&
      a.fontFamily == b.fontFamily &&
      a.fontPackage == b.fontPackage &&
      a.matchTextDirection == b.matchTextDirection;
}

/// Utility extension for safe condition
extension NullableTakeIf<T> on T? {
  T? takeIf(bool Function(T value) predicate) {
    final self = this;
    return self != null && predicate(self) ? self : null;
  }
}
