import 'icon_mapper_writer.dart';

class IconMapperWriter implements IIconWriter {
  @override
  String write(Map<String, int> icons) {
    final buffer = StringBuffer();

    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln('const materialIcons = <String, int>{');

    icons.forEach((name, codePoint) {
      buffer.writeln("  '$name': 0x${codePoint.toRadixString(16)},");
    });

    buffer.writeln('};');

    return buffer.toString();
  }
}
