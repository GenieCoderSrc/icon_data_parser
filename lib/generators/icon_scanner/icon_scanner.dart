import '../../models/scanned_icon_data.dart';
import 'cupertino_icon_mapper.dart';
import 'fontawesome_icon_mapper.dart';
import 'material_icon_mapper.dart';

class IconScanner {
  static List<ScannedIconData> scanMaterialIcons() => MaterialIconMapper.scan();
  static List<ScannedIconData> scanCupertinoIcons() => CupertinoIconMapper.scan();
  static List<ScannedIconData> scanFontAwesomeIcons() => FontAwesomeIconMapper.scan();

  static List<ScannedIconData> scanAll() {
    return [
      ...scanMaterialIcons(),
      ...scanCupertinoIcons(),
      ...scanFontAwesomeIcons(),
    ];
  }
}
