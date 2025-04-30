import 'package:font_awesome_flutter/font_awesome_flutter.dart' as fa;
import '../../models/scanned_icon_data.dart';

class FontAwesomeIconMapper {
  static List<ScannedIconData> scan() {
    final List<ScannedIconData> icons = [];

    final fontAwesomeMapping = {
      'addressBook': fa.FontAwesomeIcons.addressBook,
      'ambulance': fa.FontAwesomeIcons.ambulance,
      'angry': fa.FontAwesomeIcons.angry,
      'atom': fa.FontAwesomeIcons.atom,
      // TODO: Extend fully
    };

    fontAwesomeMapping.forEach((name, iconData) {
      icons.add(
        ScannedIconData(
          name: name,
          codePoint: iconData.codePoint,
          fontFamily: iconData.fontFamily ?? 'FontAwesomeSolid',
          fontPackage: iconData.fontPackage,
          category: ScannedIconData.detectCategory(name),
        ),
      );
    });

    return icons;
  }
}
