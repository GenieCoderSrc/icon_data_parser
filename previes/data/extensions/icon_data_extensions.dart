import 'package:flutter/material.dart';
import 'package:icon_data_parser/previes/data/i_data_sources/data_sources/material_icon_name_resolver.dart';

extension IconDataExtension on IconData {
  String? get materialIconName {
    final resolver = MaterialIconNameResolver();
    return resolver.resolveIconName(this);
  }
}
