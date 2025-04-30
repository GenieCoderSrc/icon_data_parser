import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import '../model/icon_entry.dart';
import '../../../lib/previes/src/parser/icon_parser.dart';

class MaterialIconsGenerator extends Generator {
  @override
  Future<String> generate(LibraryReader library, BuildStep buildStep) async {
    final parser = IconParser(filePath: 'path/to/your/icons.dart'); // <- You provide path here.
    final icons = await parser.parse();
    final buffer = StringBuffer();

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('// ignore_for_file: constant_identifier_names, non_constant_identifier_names');
    buffer.writeln('');

    // 1. Enum class
    buffer.writeln('enum MaterialIcon {');
    for (var icon in icons) {
      buffer.writeln('  ${_formatEnumName(icon.name)},');
    }
    buffer.writeln('}');
    buffer.writeln('');

    // 2. Extension on MaterialIcon
    buffer.writeln('extension MaterialIconExtension on MaterialIcon {');
    buffer.writeln('  IconData get iconData {');
    buffer.writeln('    switch (this) {');
    for (var icon in icons) {
      buffer.writeln('      case MaterialIcon.${_formatEnumName(icon.name)}:');
      buffer.writeln('        return IconData(${icon.codePoint}, fontFamily: \'${icon.fontFamily}\');');
    }
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln('');
    buffer.writeln('  String get name {');
    buffer.writeln('    switch (this) {');
    for (var icon in icons) {
      buffer.writeln('      case MaterialIcon.${_formatEnumName(icon.name)}:');
      buffer.writeln('        return \'${icon.name}\';');
    }
    buffer.writeln('    }');
    buffer.writeln('  }');
    buffer.writeln('}');
    return buffer.toString();
  }

  String _formatEnumName(String input) {
    // Flutter enums cannot start with numbers or contain underscores
    final formatted = input.replaceAllMapped(RegExp(r'([A-Z])'), (match) => '_${match.group(0)}').toLowerCase();
    return formatted.startsWith('_') ? formatted.substring(1) : formatted;
  }
}
