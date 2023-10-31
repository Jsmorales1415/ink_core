import 'package:flutter/material.dart';

class AppColors {
  //Material design palette generator: http://mcg.mbitson.com/#!?mcgpalette0=%233f51b5
  //Transparency colors: https://stackoverflow.com/questions/50081213/how-do-i-use-hexadecimal-color-strings-in-flutter

// 100% — FF
// 95% — F2
// 90% — E6
// 85% — D9
// 80% — CC
// 75% — BF
// 70% — B3
// 65% — A6
// 60% — 99
// 55% — 8C
// 50% — 80
// 45% — 73
// 40% — 66
// 35% — 59
// 30% — 4D
// 25% — 40
// 20% — 33
// 15% — 26
// 10% — 1A
// 5% — 0D
// 0% — 00

  static const int primary = 0xFFD81319;
  static const primarySwatch = MaterialColor(primary, {
    50: Color(0xFFE1E1E3),
    100: Color(0xFFB5B4B9),
    200: Color(0xFF83828B),
    300: Color(0xFF514F5D),
    400: Color(0xFF2C2A3A),
    500: Color(0xFF070417),
    600: Color(0xFF060314),
    700: Color(0xFF050311),
    800: Color(0xFF04020D),
    900: Color(0xFF020107),
  });

  static const Color secondaryColor = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color orange = Color(0xFFFF4D00);
  static const Color red = Color(0xFFFF453A);

  static const Color greyLight = Color(0xFFF0F0F0);
  static const Color greyDark = Color(0xFF48484A);
  static const Color greyDark2 = Color(0xFF1c1b1b);
  static const Color greyDark3 = Color(0xFF292626);
  static const Color greyDarkStrong = Color(0x99EBEBF5);
  static const Color grey = Color(0xFF16141F);
  static const Color mediumGrey = Color(0xFFEEEEEE);
  static const Color disabledGrey = Color(0xFFAAAAAA);
  static const Color blueGrey = Color(0xFF597393);

  /*Interes Icons background*/
  static const Color blueLight = Color(0xFF074EE8);
  static const Color purple = Color(0xFF5856D6);
  static const Color purpleLight = Color(0xFFAF52DE);
  static const Color redLight = Color(0xFFFF3B30);
  static const Color yellowLight = Color(0xFFFF9500);

  //--------------------------------

  static const int primaryLight = 0xFFA5CFF1;
  static const int primaryDark = 0xFF0D3656;

  /*Screens*/
  static const int screenBackground1 = 0xFFFFFFFF;

  /*Buttons*/
  static const int buttonPrimaryText = 0xFF276384;
  static const int buttonAccentText = 0xFFffffff;

  /*Input text*/
  static const int inputTextLabel = 0x4D000000;
  static const int inputTextTopLabel = 0xB3354263;
  static const int inputTextEnabledBorder = 0x26354263;
  static const int inputTextError = 0xFFB52B36;
  static const int inputText = 0xFF000000;

  /*Text*/
  static const int textHeadline1 = 0xFF1E1E1E;
  static const int textHeadline2 = 0xFF000000;
  static const int textBodyText1 = 0xFF000000;

  /*Other elements*/
  static const int separatorLine = 0x1A000000;
  static const int success = 0xFF6B9541;
}
