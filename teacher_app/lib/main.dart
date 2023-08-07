import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/routes.dart';
import 'package:teacher_app/screen/profile.dart';
import 'package:teacher_app/screen/test.dart';
import 'package:teacher_app/themes/test_theme.dart';

import './screen/login.dart';
import './screen/students_attendance.dart';
import './themes/light_dark_themes.dart';
import './screen/calendar.dart';
import './screen/homepage.dart';
import './screen/marks.dart';
import './screen/post.dart';
import './screen/sections.dart';
import './screen/students.dart';
import './screen/homework.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teacher App',
        themeMode: ThemeMode.light,
        theme: TestTheme.testLightTheme,
        // darkTheme: LightDarkTheme.darkTheme,
        // initialRoute: '/homepage',
        // getPages: MyRoutes.pages,
        home: const Homework(),
      ),
    );
  }
}
