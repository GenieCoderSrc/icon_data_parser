import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final IconData iconData;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final BoxConstraints? constraints;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Decoration? decoration;

  const AppIcon({
    required this.iconData,
    this.size,
    this.color,
    this.weight,
    this.constraints,
    this.margin,
    this.padding,
    this.decoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      constraints: constraints,
      decoration: decoration,
      child: Icon(
        iconData,
        size: size,
        color: color,
        weight: weight ?? FontWeight.w400,
      ),
    );
  }
}
