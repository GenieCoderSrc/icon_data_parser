
import 'package:icon_data_parser/generators/icon_scanner/icon_scanner.dart';
import 'package:jinja/jinja.dart';
import 'dart:io';

class IconMapperGenerator {
  final Environment _env = Environment();

  Future<void> generateAllMappers() async {
    await generateMaterialMapper();
    await generateCupertinoMapper();
    await generateFontAwesomeMapper();
  }

  Future<void> generateMaterialMapper() async {
    final icons = IconScanner.scanMaterialIcons();
    final template = await File('lib/generators/icon_mapper_generator/templates/material_icon_mapper.jinja').readAsString();
    final rendered = _env.fromString(template).render({'icons': icons});
    await File('lib/generators/icon_scanner/material_icon_mapper.dart').writeAsString(rendered);
  }

  Future<void> generateCupertinoMapper() async {
    final icons = IconScanner.scanCupertinoIcons();
    final template = await File('lib/generators/icon_mapper_generator/templates/cupertino_icon_mapper.jinja').readAsString();
    final rendered = _env.fromString(template).render({'icons': icons});
    await File('lib/generators/icon_scanner/cupertino_icon_mapper.dart').writeAsString(rendered);
  }

  Future<void> generateFontAwesomeMapper() async {
    final icons = IconScanner.scanFontAwesomeIcons();
    final template = await File('lib/generators/icon_mapper_generator/templates/fontawesome_icon_mapper.jinja').readAsString();
    final rendered = _env.fromString(template).render({'icons': icons});
    await File('lib/generators/icon_scanner/fontawesome_icon_mapper.dart').writeAsString(rendered);
  }
}
