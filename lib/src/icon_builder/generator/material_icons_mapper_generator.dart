import 'dart:developer' as developer;

import 'package:build/build.dart';
import 'package:icon_data_parser/src/icon_builder/utils/material_icon_parser_impl.dart';
import 'package:icon_data_parser/src/icon_builder/utils/writer/icon_data_reference_writer.dart';
import 'package:icon_data_parser/src/icon_builder/utils/writer/icon_mapper_writer_impl.dart';

class MaterialIconsMapperGenerator implements Builder {
  @override
  final Map<String, List<String>> buildExtensions = const {
    r'$lib$': [
      'icon_maps/material_icons_mapper.g.dart',
      'icon_maps/material_icon_data_map.g.dart',
    ],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    final inputAsset = AssetId('flutter', 'lib/src/material/icons.dart');

    final canReadInput = await buildStep.canRead(inputAsset);
    if (!canReadInput) {
      developer.log(
        '❌ Unable to find Material icons source file: $inputAsset',
        name: 'MaterialIconsMapperGenerator',
        level: 900,
      );
      return;
    }

    final content = await buildStep.readAsString(inputAsset);
    final icons = MaterialIconParser().parse(content);

    // Generate file: icon name -> code point (int)
    final codePointMapSource = IconMapperWriter().write(icons);
    final codePointOutputAsset = AssetId(
      buildStep.inputId.package,
      'lib/icon_maps/material_icons_mapper.g.dart',
    );
    await buildStep.writeAsString(codePointOutputAsset, codePointMapSource);

    // Generate file: icon name -> IconData reference (Icons.<name>)
    final iconDataMapSource = IconDataReferenceWriter().write(icons);
    final iconDataOutputAsset = AssetId(
      buildStep.inputId.package,
      'lib/icon_maps/material_icon_data_map.g.dart',
    );
    await buildStep.writeAsString(iconDataOutputAsset, iconDataMapSource);

    developer.log(
      '✅ Material icon maps generated successfully.',
      name: 'MaterialIconsMapperGenerator',
    );
  }
}
