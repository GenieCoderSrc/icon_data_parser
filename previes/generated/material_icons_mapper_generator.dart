import 'dart:io';

void main() async {
  final flutterSdkPath = await _findFlutterSdkPath();
  final materialIconsFile = File('$flutterSdkPath/packages/flutter/lib/src/material/icons.dart');

  if (!await materialIconsFile.exists()) {
    print('Error: Material icons file not found.');
    return;
  }

  final iconsContent = await materialIconsFile.readAsLines();
  final iconMappings = <String, int>{};

  for (final line in iconsContent) {
    final trimmed = line.trim();

    if (trimmed.startsWith('static const IconData')) {
      final match = RegExp(r'static const IconData (\w+) = IconData\((0x[a-fA-F0-9]+),').firstMatch(trimmed);
      if (match != null) {
        final iconName = match.group(1)!;
        final codePoint = int.parse(match.group(2)!);
        iconMappings[iconName] = codePoint;
      }
    }
  }

  await _generateMaterialIconsMapping(iconMappings);
  print('✅ material_icons_mapping.dart generated successfully.');
}

/// Find Flutter SDK Path from environment
Future<String> _findFlutterSdkPath() async {
  final flutterPathResult = await Process.run('flutter', ['--version', '--machine']);
  if (flutterPathResult.exitCode != 0) {
    throw Exception('Flutter not installed or not available in PATH.');
  }
  final flutterHome = Platform.environment['FLUTTER_ROOT'];
  if (flutterHome == null) {
    throw Exception('FLUTTER_ROOT environment variable not set.');
  }
  return flutterHome;
}

/// Generate the material_icons_mapping.dart file
Future<void> _generateMaterialIconsMapping(Map<String, int> iconMappings) async {
  final buffer = StringBuffer();

  buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  buffer.writeln('// ignore_for_file: constant_identifier_names');
  buffer.writeln('');
  buffer.writeln('class MaterialIconsMapping {');
  buffer.writeln('  static const Map<int, String> iconCodePointToName = {');

  for (final entry in iconMappings.entries) {
    buffer.writeln('    ${entry.value}: \'${entry.key}\',');
  }

  buffer.writeln('  };');
  buffer.writeln('}');

  final output = File('lib/generated/material_icons_mapping.dart');
  await output.create(recursive: true);
  await output.writeAsString(buffer.toString());
}



//material_icons_mapper_generator_advanced
//import 'dart:io';
//
// void main() async {
//   final flutterSdkPath = await _findFlutterSdkPath();
//   final materialIconsFile = File('$flutterSdkPath/packages/flutter/lib/src/material/icons.dart');
//
//   if (!await materialIconsFile.exists()) {
//     print('Error: Material icons file not found.');
//     return;
//   }
//
//   final iconEntries = await _parseMaterialIcons(materialIconsFile);
//   await _generateMappingFile(iconEntries);
//
//   print('✅ Advanced material_icons_mapping.dart generated successfully.');
// }
//
// /// Represents an icon entry with name and codePoint
// class IconEntry {
//   final String name;
//   final int codePoint;
//
//   IconEntry({required this.name, required this.codePoint});
// }
//
// /// Find Flutter SDK path
// Future<String> _findFlutterSdkPath() async {
//   final flutterRoot = Platform.environment['FLUTTER_ROOT'];
//   if (flutterRoot != null) return flutterRoot;
//
//   final result = await Process.run('flutter', ['--version', '--machine']);
//   if (result.exitCode != 0) {
//     throw Exception('Flutter not found in PATH.');
//   }
//   throw Exception('FLUTTER_ROOT not set. Please set FLUTTER_ROOT environment variable.');
// }
//
// /// Parse the material icons file
// Future<List<IconEntry>> _parseMaterialIcons(File file) async {
//   final lines = await file.readAsLines();
//   final entries = <IconEntry>[];
//
//   for (final line in lines) {
//     final trimmed = line.trim();
//     final match = RegExp(r'static const IconData (\w+) = IconData\((0x[a-fA-F0-9]+),').firstMatch(trimmed);
//     if (match != null) {
//       final name = match.group(1)!;
//       final codePoint = int.parse(match.group(2)!);
//       entries.add(IconEntry(name: name, codePoint: codePoint));
//     }
//   }
//
//   return entries;
// }
//
// /// Generate the mapping Dart file
// Future<void> _generateMappingFile(List<IconEntry> icons) async {
//   final buffer = StringBuffer();
//
//   buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
//   buffer.writeln('// ignore_for_file: constant_identifier_names');
//   buffer.writeln('');
//   buffer.writeln('class MaterialIconsMapping {');
//   buffer.writeln('  MaterialIconsMapping._();');
//   buffer.writeln('');
//   buffer.writeln('  static const Map<int, String> codePointToName = {');
//
//   for (final icon in icons) {
//     buffer.writeln('    ${icon.codePoint}: \'${icon.name}\',');
//   }
//
//   buffer.writeln('  };');
//   buffer.writeln('');
//   buffer.writeln('  static const Map<String, int> nameToCodePoint = {');
//
//   for (final icon in icons) {
//     buffer.writeln('    \'${icon.name}\': ${icon.codePoint},');
//   }
//
//   buffer.writeln('  };');
//   buffer.writeln('}');
//
//   final outputDir = Directory('lib/generated');
//   if (!await outputDir.exists()) {
//     await outputDir.create(recursive: true);
//   }
//
//   final outputFile = File('${outputDir.path}/material_icons_mapping.dart');
//   await outputFile.writeAsString(buffer.toString());
// }