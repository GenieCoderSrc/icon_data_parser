import 'dart:io';
import '../../../lib/previes/model/icon_entry.dart';

class IconParser {
  final String filePath;
  final String fontFamily;

  IconParser({required this.filePath, this.fontFamily = 'MaterialIcons'});

  Future<List<IconEntry>> parse() async {
    final file = File(filePath);

    if (!await file.exists()) {
      throw Exception('Icon file not found at $filePath');
    }

    final lines = await file.readAsLines();
    final icons = <IconEntry>[];
    String? currentCategory;

    for (final line in lines) {
      final trimmed = line.trim();

      // Parse category from documentation comment
      if (trimmed.startsWith('///')) {
        currentCategory = trimmed.replaceAll('///', '').trim();
        continue;
      }

      // Parse icon declaration
      final match = RegExp(r'static const IconData (\w+) = IconData\((0x[a-fA-F0-9]+),').firstMatch(trimmed);
      if (match != null) {
        final name = match.group(1)!;
        final codePoint = int.parse(match.group(2)!);
        icons.add(IconEntry(
          name: name,
          codePoint: codePoint,
          fontFamily: fontFamily,
          category: currentCategory,
        ));
      }
    }

    return icons;
  }
}
