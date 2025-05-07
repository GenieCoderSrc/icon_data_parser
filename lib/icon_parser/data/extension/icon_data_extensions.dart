import 'package:flutter/material.dart';
import 'package:icon_data_parser/icon_parser/data_sources/material_icon_name_resolver.dart';

extension IconDataExtension on IconData {
  String? get materialIconName {
    final resolver = MaterialIconNameResolver();
    return resolver.resolveIconName(this);
  }
}
