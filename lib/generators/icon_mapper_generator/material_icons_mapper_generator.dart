import 'dart:io';



void main() async {
  // final flutterSdkPath = await _findFlutterSdkPath();
  // final materialIconsFile = File('$flutterSdkPath/packages/flutter/lib/src/material/icons.dart');
  final materialIconsFile = File('D:/program file/flutter/packages/flutter/lib/src/material/icons.dart');


  print('MaterialIconsMapperGenerator | main materialIconsFile: $materialIconsFile');

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
  print('MaterialIconsMapperGenerator | _findFlutterSdkPath | flutterHome: $flutterHome');
  // if (flutterHome == null) {
  //   throw Exception('FLUTTER_ROOT environment variable not set.');
  // }
  return flutterHome ?? 'D:/program file/flutter/bin/flutter.bat';

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
