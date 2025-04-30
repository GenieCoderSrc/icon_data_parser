// lib/generators/icon_scanner/cupertino_icon_mapper.dart

import 'package:flutter/cupertino.dart' as cupertino;
import '../../models/scanned_icon_data.dart';

class CupertinoIconMapper {
  static List<ScannedIconData> scan() {
    final List<ScannedIconData> icons = [];

    final cupertinoMapping = {
      'left_chevron': cupertino.CupertinoIcons.left_chevron,
      'right_chevron': cupertino.CupertinoIcons.right_chevron,
      'home': cupertino.CupertinoIcons.home,
      'search': cupertino.CupertinoIcons.search,
      // TODO: Extend fully
    };

    cupertinoMapping.forEach((name, iconData) {
      icons.add(
        ScannedIconData(
          name: name,
          codePoint: iconData.codePoint,
          fontFamily: iconData.fontFamily ?? 'CupertinoIcons',
          fontPackage: iconData.fontPackage,
          category: ScannedIconData.detectCategory(name),
        ),
      );
    });

    return icons;
  }
}
