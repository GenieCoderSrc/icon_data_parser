
import 'package:flutter/material.dart' as material;
import '../../models/scanned_icon_data.dart';

class MaterialIconMapper {
  static List<ScannedIconData> scan() {
    final List<ScannedIconData> icons = [];

    // Here you should have a map or reflection system.
    // For now, assuming manual mapping or code generation.

    final materialMapping = {
      'add': material.Icons.add,
      'home': material.Icons.home,
      'menu': material.Icons.menu,
      // TODO: Extend with full MaterialIcons map
    };

    materialMapping.forEach((name, iconData) {
      icons.add(
        ScannedIconData(
          name: name,
          codePoint: iconData.codePoint,
          fontFamily: iconData.fontFamily ?? 'MaterialIcons',
          fontPackage: iconData.fontPackage,
          category: ScannedIconData.detectCategory(name),
        ),
      );
    });

    return icons;
  }
}
