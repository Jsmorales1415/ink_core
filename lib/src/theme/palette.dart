import 'package:flutter/material.dart';

class Palette {
  const Palette._();

  static const red = Color(0xFFD81319);
  static const redDark = Color.fromARGB(255, 137, 7, 11);
  static const paleRed = Color.fromARGB(255, 200, 86, 90);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF191919);

  static const colors = [
    red,
    paleRed,
    white,
  ];

  static LinearGradient get purpleGradient => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Palette.red, Palette.redDark],
      );
}
