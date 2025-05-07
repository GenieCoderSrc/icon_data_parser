import 'package:flutter/material.dart';
import 'package:icon_data_parser/icon_parser/extensions/icon_data_extension.dart';
import 'package:icon_data_parser/icon_parser/extensions/code_point_extension.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    IconData icon = Icons.access_alarm;
    String? iconName = icon.materialIconName;
    int codePoint = icon.codePoint;
    String? iconNameFromCode = codePoint.iconName;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Icon Parser Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48),
              Text('IconData name: \$iconName'),
              Text('From code point (\$codePoint): \$iconNameFromCode'),
            ],
          ),
        ),
      ),
    );
  }
}
