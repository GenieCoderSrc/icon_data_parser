import 'package:flutter/material.dart';
import 'package:icon_data_parser/icon_data_parser.dart';
import 'package:icon_data_parser/icon_maps/material_icon_data_map.g.dart';



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