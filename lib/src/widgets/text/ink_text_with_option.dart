import 'package:flutter/material.dart';
import 'package:ink_core/ink_core.dart';

class OGTextWithOptional extends StatelessWidget {
  const OGTextWithOptional({
    super.key,
    required this.title,
    this.optionalText,
    this.onTooltip,
  });

  final String title;
  final String? optionalText;
  final VoidCallback? onTooltip;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: title,
              style: context.textTheme.body.copyWith(
                color: Palette.darkGrey,
              ),
              children: [
                if (optionalText != null)
                  TextSpan(
                    text: ' ($optionalText)',
                    style: context.textTheme.body.copyWith(
                      color: context.theme.primaryColor,
                    ),
                  ),
              ],
            ),
          ),
        ),
        if (onTooltip != null) ...[
          // TODO(jsmorals): implement tooltip if needed
        ]
      ],
    );
  }
}
