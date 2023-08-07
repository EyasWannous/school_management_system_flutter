import 'package:flutter/material.dart';

class MyColors {
  static const Color soLightBlue = Color.fromRGBO(233, 238, 252, 1);
  static const Color royalBlue = Color.fromRGBO(65, 105, 225, 1);
  static const Color milkyWhite = Color.fromRGBO(244, 241, 241, 1);
  static const Color littleBlue = Color.fromRGBO(141, 168, 209, 1);
  static const Color warning = Color(0xFFFBCBCB);

  // Light
  static const Color color1 = Color(0xFFBBC9F2);
  static const Color color2 = Color(0xFFCEF3F3);
  static const Color color3 = Color(0xFFE8B5B5);
  static const Color color4 = Color(0xFFD4BDDB);
  static const Color color5 = Color(0xFFE0EBEB);
  static const Color color6 = Color(0xFFC5D2FC);
  static const Color color7 = Color(0xFFC9D1C7);
  static const Color color8 = Color(0xFFD8DBE4);
  static const Color color9 = Color(0xFFB6C6F6);
  static const Color color10 = Color(0xFFD2D8E9);
  static const Color color100 = Color(0xFF4A2556);

  // Dark
  static const Color color11 = Color(0xFFBAD9B0);
  static const Color color12 = Color(0xFF0D43D9);
  static const Color color13 = Color(0xFF717EA2);
  static const Color color14 = Color(0xFF75809F);
  static const Color color15 = Color(0xFFA15BB9);
  static const Color color16 = Color(0xFF0E1425);

  static List<Color> colorsForUnselectedItem = [
    MyColors.warning.withOpacity(0.8),
    MyColors.warning.withOpacity(0.4)
  ];
  static List<Color> colorsForSelectedItem = [
    MyColors.milkyWhite.withOpacity(0.6),
    MyColors.milkyWhite.withOpacity(0.2)
  ];
  static List<Color> popupColors = [
    MyColors.royalBlue.withOpacity(0.6),
    MyColors.royalBlue.withOpacity(0.2)
  ];
}
