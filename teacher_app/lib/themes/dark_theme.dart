import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_app/constant/my_colors.dart';

/// Dark [Theme]
class DarkTheme {
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,

    primaryColor: MyColors.royalBlue,
    scaffoldBackgroundColor: MyColors.milkyWhite,
    dialogBackgroundColor: MyColors.milkyWhite,
    fontFamily: 'Montserrat',

    appBarTheme: const AppBarTheme(
      backgroundColor: MyColors.royalBlue,
      foregroundColor: MyColors.milkyWhite,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'PermanentMarker',
        fontWeight: FontWeight.w700,
        fontSize: 32,
      ),
      // elevation: 10,
      // foregroundColor: Colors.yellow,
      // actionsIconTheme: IconThemeData(),
      // titleSpacing: 130,
    ),
    // buttonTheme: ButtonThemeData(
    //   buttonColor: MyColors.royalBlue,
    //   padding: const EdgeInsets.symmetric(
    //     vertical: 12.0,
    //     horizontal: 24.0,
    //   ),
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(8.0),
    //   ),
    //   // alignedDropdown: true,
    //   // colorScheme: ,
    // ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: MyColors.milkyWhite,
      scrimColor: MyColors.milkyWhite,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        elevation: MaterialStateProperty.all(10),
        shadowColor: MaterialStateProperty.all(Colors.black),
        backgroundColor: MaterialStateProperty.all(MyColors.royalBlue),
        foregroundColor: MaterialStateProperty.all(MyColors.soLightBlue),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(MyColors.soLightBlue),
        backgroundColor: MaterialStateProperty.all<Color>(MyColors.royalBlue),
        overlayColor: MaterialStateProperty.all<Color>(
          MyColors.milkyWhite.withOpacity(0.3),
        ),
        padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 24.0,
          ),
        ),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 16.sp,
            color: MyColors.milkyWhite,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    ),
    dialogTheme: DialogTheme(
      backgroundColor: MyColors.milkyWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      // alignment: Alignment.center,
      // titleTextStyle: ,
      // contentTextStyle: ,
      // iconColor: Colors.black,
      // dialog theme
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      //bottom sheet theme
    ),

    // listTileTheme: ListTileThemeData(

    // ),

    textTheme: TextTheme(
      // The default text style for the app.

      displayLarge: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 21.sp,
      ),

      displayMedium: TextStyle(
        color: MyColors.soLightBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 19.sp,
      ),

      displaySmall: TextStyle(
        color: MyColors.soLightBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),

      headlineMedium: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        fontSize: 19.sp,
      ),

      headlineSmall: TextStyle(
        color: MyColors.littleBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 17.sp,
      ),

      titleLarge: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),

      bodyLarge: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        fontSize: 16.sp,
      ),

      bodyMedium: TextStyle(
        color: MyColors.textColor,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),
      // The text style for captions.
      // caption: TextStyle(
      //   fontSize: 12.sp,
      //   fontWeight: FontWeight.w400,
      //   color: Colors.black54,
      // ),
      //text themes that contrast with card and canvas
    ),

    dividerTheme: const DividerThemeData(
      thickness: 1,
      // color: ,
      //divider, vertical divider theme
    ),

    // iconTheme: const IconThemeData(
    //   color: Colors.yellow,
    //   // size: 20,
    //   //icon themes that contrast with card and canvas
    // ),
    // primaryIconTheme: const IconThemeData(
    //   color: Colors.yellow,
    //   //icon themes that contrast primary color
    // ),
    // primaryTextTheme: const TextTheme(
    //     //text theme that contrast with primary color
    //     ),
    // inputDecorationTheme: const InputDecorationTheme(
    //     // default values for InputDecorator, TextField, and TextFormField
    //     ),
    // tabBarTheme: const TabBarTheme(
    //     // tab bat theme
    //     ),
    // cardTheme: CardTheme(
    //   shape: Border.all(color: MyColors.testColor, width: 3),
    //   // clipBehavior: Clip.antiAlias
    //   // card theme
    // ),
    // pageTransitionsTheme: const PageTransitionsTheme(
    //     //page transition theme
    //     ),
    // snackBarTheme: const SnackBarThemeData(
    //     // snack bar theme
    //     ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: MyColors.royalBlue,
      selectionColor: MyColors.royalBlue,
      selectionHandleColor: MyColors.royalBlue,
    ),
  );
}
