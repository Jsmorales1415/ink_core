import 'package:flutter/material.dart';
import 'package:ink_core/ink_core.dart';

class InkPrimaryButton extends StatelessWidget {
  const InkPrimaryButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.textStyle,
    this.icon,
    this.textColor = Palette.white,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = EdgeInsets.zero,
  });
  final VoidCallback onPressed;
  final String text;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color textColor;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // if (icon != null) ...[
              // TODO(jsmorales): create custom icons
              // ],
              Text(
                text,
                style: (textStyle ?? const TextStyle()).copyWith(
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
