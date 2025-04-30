// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/widgets.dart';
import 'data/extensions/communication_icons_extension.dart';
import 'package:icon_data_parser/data/extensions/media_icons_extension.dart';
import 'package:icon_data_parser/previes/enums/communication_icons.dart';
import 'package:icon_data_parser/enums/media_icons.dart';


class IconRegistry {
  static final Map<String, dynamic> _iconNameToEnum = {
    'phone': CommunicationIcons.phone,
    'email': CommunicationIcons.email,
    'play_arrow': MediaIcons.play_arrow,
    'pause': MediaIcons.pause,
  };

  static final Map<String, IconData> _iconNameToIconData = {
    'phone': CommunicationIcons.phone.iconData,
    'email': CommunicationIcons.email.iconData,
    'play_arrow': MediaIcons.play_arrow.iconData,
    'pause': MediaIcons.pause.iconData,
  };

  static IconData? findIcon(String name) {
    return _iconNameToIconData[name];
  }

  static dynamic findEnum(String name) {
    return _iconNameToEnum[name];
  }

  static List<String> get allIconNames => _iconNameToIconData.keys.toList();
}
