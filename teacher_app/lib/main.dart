import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_app/components/bottom_bar.dart';
import 'package:teacher_app/components/principle_bottom_bar.dart';
import 'package:teacher_app/model/students_model.dart';
import 'package:teacher_app/screen/calendar.dart';
import 'package:teacher_app/screen/students_attendance.dart';

import '../constant/routes.dart';
import '../bindings/init_bindings.dart';
import '../screen/sections.dart';
import '../themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
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
        theme: LigthTheme.light,
        // darkTheme: LightDarkTheme.darkTheme,
        // initialRoute: '/homepage',
        initialBinding: InitBinding(),
        getPages: MyRoutes.pages,
        home: const BottomBar(),
      ),
    );
  }
}
