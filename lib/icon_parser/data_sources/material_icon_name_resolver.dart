import 'package:flutter/material.dart';
import 'package:icon_data_parser/generated/material_icons_mapping.dart';
import 'package:icon_data_parser/icon_parser/i_data_sources/icon_name_resolver.dart';

class MaterialIconNameResolver implements IIconNameResolver {
  @override
  String? resolveIconName(IconData iconData) {
    return MaterialIconsMapping.iconCodePointToName[iconData.codePoint];
  }
}
