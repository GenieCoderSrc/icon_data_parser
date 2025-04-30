
import 'package:flutter/cupertino.dart';
import 'package:icon_data_parser/previes/enums/communication_icons.dart';

extension CommunicationIconsExtension on CommunicationIcons {
  IconData get iconData {
    switch (this) {
      case CommunicationIcons.phone: return IconData(0xe0cd, fontFamily: 'CustomIcons');
      case CommunicationIcons.email: return IconData(0xe158, fontFamily: 'CustomIcons');
    }
  }

  String get name {
    switch (this) {
      case CommunicationIcons.phone: return 'phone';
      case CommunicationIcons.email: return 'email';
    }
  }
}








// example
//CommunicationIcons.phone.iconData
// CommunicationIcons.phone.name
//
// MediaIcons.play_arrow.iconData
// MediaIcons.play_arrow.name