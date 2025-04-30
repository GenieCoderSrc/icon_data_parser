import 'package:flutter/material.dart';
import 'package:icon_data_parser/enums/media_icons.dart';

extension MediaIconsExtension on MediaIcons {
  IconData get iconData {
    switch (this) {
      case MediaIcons.play_arrow: return IconData(0xe037, fontFamily: 'CustomIcons');
      case MediaIcons.pause: return IconData(0xe034, fontFamily: 'CustomIcons');
    }
  }

  String get name {
    switch (this) {
      case MediaIcons.play_arrow: return 'play_arrow';
      case MediaIcons.pause: return 'pause';
    }
  }
}