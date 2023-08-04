import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/colors.dart';
class themes {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
   //fontFamily: 'Amiri',
    primaryColor: Colors.blue,
    //Appbar 
    appBarTheme: const AppBarTheme(
      centerTitle: true,
     
      color:Color.fromRGBO(65, 105, 225,1),
       titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 32,
        
       )
    ),
textTheme: TextTheme(
  headline1:
 TextStyle(
        color:Color.fromRGBO(65, 105, 225,1),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 21.sp,
       ),
 headline2:
 TextStyle(
       color:Color.fromRGBO(233, 238, 252,1),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w700,
        fontSize: 19.sp,
       ),
   headline3:
 TextStyle(
       color:Color.fromRGBO(233, 238, 252,1),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 18.sp,
       )    ,
       headline4:
 TextStyle(
      color:Color.fromRGBO(65, 105, 225,1),
        fontFamily: 'Montserrat',
       // fontWeight: FontWeight,
        fontSize: 19.sp,
       ),
headline5:
 TextStyle(
       color:Color.fromARGB(255, 141, 168, 209),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        fontSize: 17.sp,
       ),
headline6:
 TextStyle(
              color:darkblue,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
       ),
       bodyText1:
 TextStyle(
             color:Color.fromARGB(255, 141, 168, 209),
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
        fontSize: 15.sp,
       ),

),


// Buttons themes
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.blue,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.red),
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
      primaryVariant: Colors.black,
      surface: Colors.grey.shade900,
    ),
// End of colors

    appBarTheme: const AppBarTheme(
      color: Colors.blue,
      toolbarTextStyle: TextStyle(
      //  fontFamily: 
      ),
    ),

    textTheme: const TextTheme(
      //headline1: headline1,
    ),

// Buttons themes
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.black,
      textTheme: ButtonTextTheme.primary,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(primary: Colors.red),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.green,
    ),
// End of buttons themes
  );
// End of dark theme
 //Static TextStyles
  
// End Of Static TextStyle

}