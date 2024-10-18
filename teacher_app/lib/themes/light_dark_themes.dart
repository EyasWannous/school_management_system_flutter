import 'package:flutter/material.dart';
import 'package:teacher_app/constant/my_colors.dart';

class LightDarkTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    primaryColor: MyColors.royalBlue,
    scaffoldBackgroundColor: MyColors.milkyWhite,
    fontFamily: 'Amiri',
    appBarTheme: AppBarTheme(
      color: MyColors.royalBlue,
      titleTextStyle: headline1,
    ),
    textTheme: TextTheme(
      displayLarge: headline1,
      bodyLarge: bodyText1,
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(MyColors.soLightBlue),
        backgroundColor: WidgetStateProperty.all<Color>(MyColors.royalBlue),
        overlayColor: WidgetStateProperty.all<Color>(
            MyColors.milkyWhite.withOpacity(0.3)),
        padding: WidgetStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),
        ),
        textStyle: WidgetStateProperty.all<TextStyle>(
          const TextStyle(fontSize: 20),
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.deepPurple,
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(secondary: Colors.orange, brightness: Brightness.dark),
    fontFamily: 'Montserrat',
    textTheme: TextTheme(
      displayLarge: headline1,
      bodyLarge: bodyText1,
    ),
    useMaterial3: false,
    // Add more attributes as needed
  );

  static TextStyle headline1 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: Colors.black.withOpacity(0.8),
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: Colors.black87,
  );
}

class LDT {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    fontFamily: 'Roboto',

// Colors like primaryColor and colorScheme
    primaryColor: Colors.blue,
    colorScheme: const ColorScheme.light(
      primary: MyColors.royalBlue,
      secondary: Colors.red,
    ),
// End of colors

    appBarTheme: AppBarTheme(
      color: const Color(0x00fbe4d8),
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ).titleLarge,
    ),

    textTheme: const TextTheme(
      displayLarge: headline1,
      titleLarge: headline6,
      bodyMedium: bodyText2,
    ),

// Buttons themes
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
  );
// End of buttons themes

// Dark theme
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Roboto',

// Colors like primaryColor and colorScheme
    primaryColorDark: Colors.black,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
    ),
// End of colors

    appBarTheme: AppBarTheme(
      color: Colors.blue,
      toolbarTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ).bodyMedium,
      titleTextStyle: const TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ).titleLarge,
    ),

    textTheme: const TextTheme(
      displayLarge: headline1,
    ),

// Buttons themes
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
// End of buttons themes
  );
// End of dark theme

// Static TextStyles
  static const TextStyle headline1 = TextStyle(
    fontSize: 72.0,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headline6 = TextStyle(
    fontSize: 36.0,
    fontStyle: FontStyle.italic,
  );
  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14.0,
    fontFamily: 'Hind',
  );
// End Of Static TextStyle
}
