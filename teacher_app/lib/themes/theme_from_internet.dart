import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Light [Theme]
ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: const Color(0xffEDD5B3),
  primaryColorLight: const Color(0x1aF5E0C3),
  primaryColorDark: const Color(0xff936F3E),
  canvasColor: const Color(0xffE09E45),
  scaffoldBackgroundColor: const Color(0xffB5BFD3),
  cardColor: const Color(0xaaF5E0C3),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1aF5E0C3),
  hoverColor: const Color(0xffDEC29B),
  highlightColor: const Color(0xff936F3E),
  splashColor: const Color(0xff457BE0),
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  secondaryHeaderColor: Colors.grey,
  dialogBackgroundColor: Colors.white,
  indicatorColor: const Color(0xff457BE0),
  hintColor: Colors.grey,
  platform: TargetPlatform.android,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  applyElevationOverlayColor: true,
  typography: Typography.material2021(),
  splashFactory: InkSplash.splashFactory,
  fontFamily: 'ROBOTO',
  buttonTheme: const ButtonThemeData(
      //button themes
      ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
      //toggle button theme
      ),
  textTheme: const TextTheme(
      //text themes that contrast with card and canvas
      ),
  primaryTextTheme: const TextTheme(
      //text theme that contrast with primary color
      ),
  inputDecorationTheme: const InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: const IconThemeData(
      //icon themes that contrast with card and canvas
      ),
  primaryIconTheme: const IconThemeData(
      //icon themes that contrast primary color
      ),
  sliderTheme: const SliderThemeData(
      // slider themes
      ),
  tabBarTheme: const TabBarTheme(
      // tab bat theme
      ),
  tooltipTheme: const TooltipThemeData(
      // tool tip theme
      ),
  cardTheme: const CardTheme(
      // card theme
      ),
  chipTheme: const ChipThemeData(
      backgroundColor: Color(0xff936F3E),
      disabledColor: Color(0xaaF5E0C3),
      shape: StadiumBorder(),
      brightness: Brightness.light,
      labelPadding: EdgeInsets.all(8),
      labelStyle: TextStyle(),
      padding: EdgeInsets.all(8),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.white38,
      selectedColor: Colors.white
      // chip theme
      ),
  pageTransitionsTheme: const PageTransitionsTheme(
      //page transition theme
      ),
  appBarTheme: const AppBarTheme(
      //app bar theme
      ),
  bottomAppBarTheme: const BottomAppBarTheme(
      // bottom app bar theme
      ),
  snackBarTheme: const SnackBarThemeData(
      // snack bar theme
      ),
  dialogTheme: const DialogTheme(
      // dialog theme
      ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // floating action button theme
      ),
  navigationRailTheme: const NavigationRailThemeData(
      // navigation rail theme
      ),
  cupertinoOverrideTheme: const CupertinoThemeData(
      //cupertino theme
      ),
  bottomSheetTheme: const BottomSheetThemeData(
      //bottom sheet theme
      ),
  popupMenuTheme: const PopupMenuThemeData(
      //pop menu theme
      ),
  bannerTheme: const MaterialBannerThemeData(
      // material banner theme
      ),
  dividerTheme: const DividerThemeData(
      //divider, vertical divider theme
      ),
  buttonBarTheme: const ButtonBarThemeData(
      // button bar theme
      ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff936F3E),
    selectionColor: Color(0xffB5BFD3),
    selectionHandleColor: Color(0xff936F3E),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
    trackColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
  ),
  colorScheme: const ColorScheme.light(
    brightness: Brightness.light,
    primary: Color(0xffEDD5B3),
    secondary: Color(0xffC9A87C),
    background: Color(0xffB5BFD3),
    error: Colors.red,
    onBackground: Color(0xffB5BFD3),
    onError: Colors.red,
    onPrimary: Color(0xffEDD5B3),
    onSecondary: Color(0xffC9A87C),
    onSurface: Color(0xff457BE0),
    surface: Color(0xff457BE0),
  ).copyWith(background: const Color(0xff457BE0)).copyWith(error: Colors.red),
);

/// Dark [Theme]
ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  visualDensity: const VisualDensity(vertical: 0.5, horizontal: 0.5),
  primaryColor: const Color(0xff5D4524),
  primaryColorLight: const Color(0x1a311F06),
  primaryColorDark: const Color(0xff936F3E),
  canvasColor: const Color(0xffE09E45),
  scaffoldBackgroundColor: const Color(0xffB5BFD3),
  cardColor: const Color(0xaa311F06),
  dividerColor: const Color(0x1f6D42CE),
  focusColor: const Color(0x1a311F06),
  hoverColor: const Color(0xa15D4524),
  highlightColor: const Color(0xaf2F1E06),
  splashColor: const Color(0xff457BE0),
  unselectedWidgetColor: Colors.grey.shade400,
  disabledColor: Colors.grey.shade200,
  secondaryHeaderColor: Colors.grey,
  dialogBackgroundColor: Colors.white,
  indicatorColor: const Color(0xff457BE0),
  hintColor: Colors.grey,
  fontFamily: 'ROBOTO',
  splashFactory: InkSplash.splashFactory,
  typography: Typography.material2018(),
  platform: TargetPlatform.android,
  materialTapTargetSize: MaterialTapTargetSize.padded,
  applyElevationOverlayColor: true,
  buttonTheme: const ButtonThemeData(
      //button themes
      ),
  toggleButtonsTheme: const ToggleButtonsThemeData(
      //toggle button theme
      ),
  textTheme: const TextTheme(
      //text themes that contrast with card and canvas
      ),
  primaryTextTheme: const TextTheme(
      //text theme that contrast with primary color
      ),
  inputDecorationTheme: const InputDecorationTheme(
      // default values for InputDecorator, TextField, and TextFormField
      ),
  iconTheme: const IconThemeData(
      //icon themes that contrast with card and canvas
      ),
  primaryIconTheme: const IconThemeData(
      //icon themes that contrast primary color
      ),
  sliderTheme: const SliderThemeData(
      // slider themes
      ),
  tabBarTheme: const TabBarTheme(
      // tab bat theme
      ),
  tooltipTheme: const TooltipThemeData(
      // tool tip theme
      ),
  cardTheme: const CardTheme(
      // card theme
      ),
  chipTheme: const ChipThemeData(
      backgroundColor: Color(0xff2F1E06),
      disabledColor: Color(0xa15D4524),
      shape: StadiumBorder(),
      brightness: Brightness.dark,
      labelPadding: EdgeInsets.all(8),
      labelStyle: TextStyle(),
      padding: EdgeInsets.all(8),
      secondaryLabelStyle: TextStyle(),
      secondarySelectedColor: Colors.white38,
      selectedColor: Colors.white
      // chip theme
      ),
  pageTransitionsTheme: const PageTransitionsTheme(
      //page transition theme
      ),
  appBarTheme: const AppBarTheme(
      //app bar theme
      ),
  bottomAppBarTheme: const BottomAppBarTheme(
      // bottom app bar theme
      ),
  snackBarTheme: const SnackBarThemeData(
      // snack bar theme
      ),
  dialogTheme: const DialogTheme(
      // dialog theme
      ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // floating action button theme
      ),
  navigationRailTheme: const NavigationRailThemeData(
      // navigation rail theme
      ),
  cupertinoOverrideTheme: const CupertinoThemeData(
      //cupertino theme
      ),
  bottomSheetTheme: const BottomSheetThemeData(
      //bottom sheet theme
      ),
  popupMenuTheme: const PopupMenuThemeData(
      //pop menu theme
      ),
  bannerTheme: const MaterialBannerThemeData(
      // material banner theme
      ),
  dividerTheme: const DividerThemeData(
      //divider, vertical divider theme
      ),
  buttonBarTheme: const ButtonBarThemeData(
      // button bar theme
      ),
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: Color(0xff483112),
    selectionColor: Color(0x1a483112),
    selectionHandleColor: Color(0xff483112),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
    trackColor:
        MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return const Color(0xff6D42CE);
      }
      return null;
    }),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xff5D4524),
    secondary: Color(0xff457BE0),
    brightness: Brightness.dark,
    background: Color(0xffB5BFD3),
    error: Colors.red,
    onBackground: Color(0xffB5BFD3),
    onError: Colors.red,
    onPrimary: Color(0xff5D4524),
    onSecondary: Color(0xff457BE0),
    onSurface: Color(0xff457BE0),
    surface: Color(0xff457BE0),
  ).copyWith(background: const Color(0xff457BE0)).copyWith(error: Colors.red),
);
