import 'icon_mapper_writer.dart';

class IconDataReferenceWriter implements IIconWriter {
  @override
  String write(Map<String, int> icons) {
    final buffer = StringBuffer();

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('// ignore_for_file: constant_identifier_names');
    buffer.writeln();
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln();
    buffer.writeln('const materialIconMap = <String, IconData>{');

    final sortedKeys = icons.keys.toList()..sort();
    for (final name in sortedKeys) {
      buffer.writeln("  '$name': Icons.$name,");
    }

    buffer.writeln('};');

    return buffer.toString();
  }
}
