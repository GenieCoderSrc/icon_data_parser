import 'package:build/build.dart';
import 'icon_mapper_generator.dart';

class IconMapperGeneratorBuilder implements Builder {
  @override
  final buildExtensions = const {
    r'$package$': [
      'lib/generators/icon_scanner/material_icon_mapper.dart',
      'lib/generators/icon_scanner/cupertino_icon_mapper.dart',
      'lib/generators/icon_scanner/fontawesome_icon_mapper.dart',
    ],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final generator = IconMapperGenerator();
    await generator.generateAllMappers();
  }
}

Builder iconMapperGeneratorBuilder(BuilderOptions options) =>
    IconMapperGeneratorBuilder();
