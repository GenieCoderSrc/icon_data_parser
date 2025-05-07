import 'package:icon_data_parser/icon_data_parser.dart';
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