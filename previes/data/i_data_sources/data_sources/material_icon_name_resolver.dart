import 'package:flutter/material.dart';
import '../../../../lib/data/data_sources/i_data_sources/data_sources/icon_name_resolver.dart';
import '../../../../lib/data/data_sources/i_data_sources/data_sources/material_icons_mapping.dart';

class MaterialIconNameResolver implements IIconNameResolver {
  @override
  String? resolveIconName(IconData iconData) {
    return MaterialIconsMapping.iconCodePointToName[iconData.codePoint];
  }
}
