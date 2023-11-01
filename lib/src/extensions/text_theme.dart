import 'package:flutter/material.dart';
import 'package:ink_core/ink_core.dart';

extension TextStyleX on TextTheme {
  /// Heading 1 Text Style
  TextStyle get heading1 => headlineSmall!.copyWith(
        fontWeight: AppFontWeight.bold,
      );

  /// Heading 2 Text Style
  TextStyle get heading2 => bodyLarge!.copyWith(
        fontWeight: AppFontWeight.semiBold,
      );

  /// Title Text Style
  TextStyle get title => titleSmall!.copyWith(
        fontWeight: AppFontWeight.semiBold,
      );

  /// Subtitle Text Style
  TextStyle get body => bodyMedium!;

  /// Caption 1 Text Style
  TextStyle get caption1 => bodySmall!;

  /// Caption 2 Text Style
  TextStyle get caption2 => bodySmall!.copyWith(
        fontSize: 10,
      );
}
