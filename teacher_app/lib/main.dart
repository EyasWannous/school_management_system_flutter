import 'package:flutter/material.dart';
import 'package:teacher_app/themes/light_dark_themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: LightDarkTheme.lightTheme,
      darkTheme: LightDarkTheme.darkTheme,
      initialRoute: null,
      routes: {},
      home: null,
    );
  }
}
