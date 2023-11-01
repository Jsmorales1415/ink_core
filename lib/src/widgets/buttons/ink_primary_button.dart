import 'package:flutter/material.dart';
import 'package:ink_core/ink_core.dart';
import 'package:ink_core/src/layout/spaces.dart';

class InkPrimaryButton extends StatelessWidget {
  const InkPrimaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.textStyle,
    this.icon,
    this.textColor = Palette.black,
    this.backgroundColor = Palette.red,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.padding = EdgeInsets.zero,
    this.borderRadius = 10,
    this.borderColor = Palette.black,
  });
  final String text;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final IconData? icon;
  final Color textColor;
  final Color backgroundColor;
  final MainAxisAlignment mainAxisAlignment;
  final EdgeInsets padding;
  final double? borderRadius;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final secondaryColor =
        borderColor ?? Theme.of(context).colorScheme.secondary;
    return Opacity(
      opacity: onPressed != null ? 1 : 0.3,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              borderRadius ?? AppSizes.buttonBorderRadius,
            ),
            side: BorderSide(color: secondaryColor),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding: padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                space10,
                Icon(icon),
                space10,
              ],
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
