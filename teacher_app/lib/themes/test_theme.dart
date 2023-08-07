import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:teacher_app/constant/my_colors.dart';

/// Light [Theme]
class TestTheme {
  static ThemeData testLightTheme = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,

    primaryColor: MyColors.royalBlue,
    scaffoldBackgroundColor: MyColors.milkyWhite,
    // canvasColor: const Color(0xffE09E45),
    // bottomAppBarColor: const Color(0xff6D42CE),
    // cardColor: MyColors.royalBlue, // this effect the appBar
    // dividerColor: Colors.red,
    // highlightColor: const Color(0xff936F3E),
    // splashColor: const Color(0xff457BE0),
    // unselectedWidgetColor: Colors.grey.shade400,
    // disabledColor: Colors.grey.shade200,
    // backgroundColor: Color.fromARGB(255, 7, 23, 54),
    dialogBackgroundColor: MyColors.milkyWhite,
    // indicatorColor: Colors.yellow,
    // focusColor: Colors.red,
    // hintColor: Colors.grey,
    // errorColor: Colors.red,
    // toggleableActiveColor: const Color(0xff6D42CE),
    // materialTapTargetSize: MaterialTapTargetSize.padded,
    // applyElevationOverlayColor: true, // this usefull in dark Theme
    // typography: Typography.material2021(),
    // splashFactory: InkSplash.splashFactory,
    fontFamily: 'ROBOTO',

    // colorScheme: const ColorScheme.light(
    //   primary: MyColors.royalBlue,
    //   background: Colors.black,
    // ),

    appBarTheme: AppBarTheme(
      color: MyColors.royalBlue,
      centerTitle: true,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
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
        borderRadius: BorderRadius.circular(50),
      ),
      // alignment: Alignment.center,
      // titleTextStyle: ,
      // contentTextStyle: ,
      // iconColor: Colors.black,
      // dialog theme
    ),

    // listTileTheme: ListTileThemeData(

    // ),

    textTheme: TextTheme(
      // The default text style for the app.

      headline1: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 21.sp,
      ),

      headline2: TextStyle(
        color: MyColors.soLightBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 19.sp,
      ),

      headline3: TextStyle(
        color: MyColors.soLightBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
      ),

      headline4: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        // fontWeight: FontWeight,
        fontSize: 19.sp,
      ),

      headline5: TextStyle(
        color: MyColors.littleBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 17.sp,
      ),

      headline6: TextStyle(
        color: MyColors.royalBlue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
      ),

      bodyText1: TextStyle(
        color: MyColors.littleBlue,
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
    // toggleButtonsTheme: const ToggleButtonsThemeData(
    //     //toggle button theme
    //     ),
    // primaryTextTheme: const TextTheme(
    //     //text theme that contrast with primary color
    //     ),
    // inputDecorationTheme: const InputDecorationTheme(
    //     // default values for InputDecorator, TextField, and TextFormField
    //     ),
    // tabBarTheme: const TabBarTheme(
    //     // tab bat theme
    //     ),
    // tooltipTheme: const TooltipThemeData(
    //     // tool tip theme
    //     ),
    // cardTheme: const CardTheme(
    //     // card theme
    //     ),
    // pageTransitionsTheme: const PageTransitionsTheme(
    //     //page transition theme
    //     ),
    // bottomAppBarTheme: const BottomAppBarTheme(
    //     // bottom app bar theme
    //     ),
    // snackBarTheme: const SnackBarThemeData(
    //     // snack bar theme
    //     ),
    // bottomSheetTheme: const BottomSheetThemeData(
    //     //bottom sheet theme
    //     ),
    // popupMenuTheme: const PopupMenuThemeData(
    //     //pop menu theme
    //     ),
    // bannerTheme: const MaterialBannerThemeData(
    //     // material banner theme
    //     ),
    // buttonBarTheme: const ButtonBarThemeData(
    //     // button bar theme
    //     ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: Color(0xff936F3E),
      selectionColor: Color(0xff936F3E),
      // selectionHandleColor: Color(0xff936F3E),
    ),
  );
}
