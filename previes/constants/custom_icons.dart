import 'package:flutter/material.dart';

class CustomIcons {
  ///Singleton factory
  static final CustomIcons _instance = CustomIcons._internal();

  factory CustomIcons() {
    return _instance;
  }

  CustomIcons._internal();

  /// Communication Icons
  static const IconData phone = IconData(0xe0cd, fontFamily: 'CustomIcons');
  static const IconData email = IconData(0xe158, fontFamily: 'CustomIcons');

  /// Media Icons
  static const IconData play_arrow = IconData(0xe037, fontFamily: 'CustomIcons');
  static const IconData pause = IconData(0xe034, fontFamily: 'CustomIcons');

}