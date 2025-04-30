import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../model/icon_entry.dart';
import '../../../lib/previes/src/parser/icon_parser.dart';

class GroupedIconsGenerator extends Generator {
  final String iconFilePath;
  final String fontFamily;

  GroupedIconsGenerator({
    required this.iconFilePath,
    required this.fontFamily,
  });

  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final parser = IconParser(filePath: iconFilePath, fontFamily: fontFamily);
    final icons = await parser.parse();

    // Group icons by their category
    final Map<String, List<IconEntry>> groupedIcons = {};
    for (var icon in icons) {
      final groupName = _formatGroupName(icon.category ?? 'General');
      groupedIcons.putIfAbsent(groupName, () => []).add(icon);
    }

    final buffer = StringBuffer();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('// ignore_for_file: constant_identifier_names, non_constant_identifier_names');
    buffer.writeln('');

    for (var entry in groupedIcons.entries) {
      final enumName = '${entry.key}Icons';
      buffer.writeln('enum $enumName {');

      for (var icon in entry.value) {
        buffer.writeln('  ${_formatEnumName(icon.name)},');
      }
      buffer.writeln('}');
      buffer.writeln('');

      // Extension for iconData and name
      buffer.writeln('extension ${enumName}Extension on $enumName {');
      buffer.writeln('  IconData get iconData {');
      buffer.writeln('    switch (this) {');

      for (var icon in entry.value) {
        buffer.writeln(
          '      case $enumName.${_formatEnumName(icon.name)}:'
              ' return IconData(${icon.codePoint}, fontFamily: \'${icon.fontFamily}\');',
        );
      }
      buffer.writeln('    }');
      buffer.writeln('  }');

      buffer.writeln('');

      buffer.writeln('  String get name {');
      buffer.writeln('    switch (this) {');
      for (var icon in entry.value) {
        buffer.writeln(
          '      case $enumName.${_formatEnumName(icon.name)}:'
              ' return \'${icon.name}\';',
        );
      }
      buffer.writeln('    }');
      buffer.writeln('  }');

      buffer.writeln('}');
      buffer.writeln('');
    }

    return buffer.toString();
  }

  String _formatGroupName(String input) {
    // Remove spaces, capitalize each word
    final parts = input.split(' ');
    return parts.map((e) => e[0].toUpperCase() + e.substring(1)).join();
  }

  String _formatEnumName(String input) {
    final formatted = input.replaceAllMapped(RegExp(r'([A-Z])'), (match) => '_${match.group(0)}').toLowerCase();
    return formatted.startsWith('_') ? formatted.substring(1) : formatted;
  }
}
