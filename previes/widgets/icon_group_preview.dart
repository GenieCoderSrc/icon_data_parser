class IconGroupPreview {
  final String groupName;
  final List<_IconPreviewItem> icons;

  IconGroupPreview({
    required this.groupName,
    required this.icons,
  });
}

class _IconPreviewItem {
  final String name;
  final IconData iconData;

  _IconPreviewItem({
    required this.name,
    required this.iconData,
  });
}

final List<IconGroupPreview> allIconPreviews = [
  IconGroupPreview(
    groupName: 'Communication',
    icons: [
      _IconPreviewItem(name: 'phone', iconData: CommunicationIcons.phone.iconData),
      _IconPreviewItem(name: 'email', iconData: CommunicationIcons.email.iconData),
    ],
  ),
  IconGroupPreview(
    groupName: 'Media',
    icons: [
      _IconPreviewItem(name: 'play_arrow', iconData: MediaIcons.play_arrow.iconData),
      _IconPreviewItem(name: 'pause', iconData: MediaIcons.pause.iconData),
    ],
  ),
];








//ListView.builder(
//   itemCount: allIconPreviews.length,
//   itemBuilder: (context, groupIndex) {
//     final group = allIconPreviews[groupIndex];
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(group.groupName, style: Theme.of(context).textTheme.titleLarge),
//         Wrap(
//           children: group.icons.map((icon) => AppIcon(iconData: icon.iconData, size: 32)).toList(),
//         ),
//       ],
//     );
//   },
// );