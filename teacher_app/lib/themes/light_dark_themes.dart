import 'package:flutter/material.dart';

class LightDarkTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    fontFamily: 'Roboto',
    useMaterial3: true,
    // Add more attributes as needed
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.orange),
    fontFamily: 'Roboto',
    useMaterial3: true,
    // Add more attributes as needed
  );
}
