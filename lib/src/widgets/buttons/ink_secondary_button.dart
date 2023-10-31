import 'package:flutter/material.dart';
import 'package:ink_core/ink_core.dart';

class InkSecondaryButton extends StatelessWidget {
  const InkSecondaryButton({
    super.key,
    required this.icon,
    this.onTap,
    this.padding = edgeInsets15,
    this.color = Palette.black,
    this.iconColor = Palette.white,
    this.borderRadius = borderRadius10,
  });

  final IconData icon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final Color color;
  final Color iconColor;
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Padding(
          padding: padding,
          child: Icon(
            icon,
            color: iconColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
