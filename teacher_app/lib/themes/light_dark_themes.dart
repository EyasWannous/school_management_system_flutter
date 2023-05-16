import 'package:flutter/material.dart';

class LightDarkTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headline1: headline1,
      bodyText1: bodyText1,
    ),
    useMaterial3: true,
    // Add more attributes as needed
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.orange, brightness: Brightness.dark),
    fontFamily: 'Roboto',
    textTheme: const TextTheme(
      headline1: headline1,
      bodyText1: bodyText1,
    ),
    useMaterial3: true,
    // Add more attributes as needed
  );

  static const TextStyle headline1 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );
}
