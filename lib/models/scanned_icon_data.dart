// lib/models/scanned_icon_data.dart

class ScannedIconData {
  final String name;
  final int codePoint;
  final String fontFamily;
  final String? fontPackage;
  final String? category; // <-- New!

  ScannedIconData({
    required this.name,
    required this.codePoint,
    required this.fontFamily,
    this.fontPackage,
    this.category,
  });

 static String detectCategory(String iconName) {
    if (iconName.contains('home') || iconName.contains('dashboard')) {
      return 'Navigation';
    } else if (iconName.contains('chat') || iconName.contains('message') || iconName.contains('email')) {
      return 'Communication';
    } else if (iconName.contains('facebook') || iconName.contains('instagram') || iconName.contains('twitter')) {
      return 'Social';
    } else if (iconName.contains('settings') || iconName.contains('tune')) {
      return 'Settings';
    }
    return 'Other';
  }

}
