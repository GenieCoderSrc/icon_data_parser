class IconEntry {
  final String name;
  final int codePoint;
  final String fontFamily;
  final String? category;

  IconEntry({
    required this.name,
    required this.codePoint,
    this.fontFamily = 'MaterialIcons',
    this.category,
  });
}
