import 'material_icon_parser.dart';

class MaterialIconParser implements IIconParser {
  @override
  Map<String, int> parse(String content) {
    final Map<String, int> icons = {};
    final regex = RegExp(
      r'static const IconData (\w+) = IconData\((0x[0-9a-fA-F]+),',
    );

    for (final match in regex.allMatches(content)) {
      final name = match.group(1)!;
      final hex = match.group(2)!;
      final codePoint = int.parse(hex.replaceFirst('0x', ''), radix: 16);
      icons[name] = codePoint;
    }

    return icons;
  }
}
