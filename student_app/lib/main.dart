import 'dart:ffi';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_app/ar.dart';
import 'package:student_app/locale/locale.dart';
import 'package:student_app/controller/localecontroller.dart';
import 'package:student_app/mybinding.dart';
import 'package:student_app/themes.dart';
import 'package:student_app/view/screen/aboutsub.dart';
import 'package:student_app/view/screen/assignsub.dart';
import 'package:student_app/view/screen/bottombar.dart';
import 'package:student_app/view/screen/courses.dart';
import 'package:student_app/view/screen/exams.dart';
import 'package:student_app/view/screen/homepage.dart';
import 'package:student_app/view/screen/intro.dart';
import 'package:student_app/view/screen/loginst.dart';
import 'package:student_app/view/screen/marks.dart';
import 'package:student_app/view/screen/marksub.dart';
import 'package:student_app/view/screen/marksub.dart';
import 'package:student_app/view/screen/notify.dart';
import 'package:student_app/view/screen/posts.dart';
import 'package:student_app/view/screen/profile.dart';
import 'package:student_app/parent/screen/report.dart';
import 'package:student_app/view/screen/select.dart';
import 'package:student_app/view/screen/subject.dart';
import 'package:student_app/view/screen/test22.dart';
import 'package:student_app/view/screen/tests.dart';
import 'package:student_app/view/widget/schedule.dart';
import 'package:get/get_navigation/get_navigation.dart';
//import 'package:shared_preferences/shared_preferences.dart';

//SharedPreferences? sharedpref;

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // designSize: Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialBinding: MyBinding(),
          // initialRoute: "/select",
          theme: themes.light,
          locale: Get.deviceLocale,
          translations: Mylocal(),
          getPages: [
            GetPage(name: "/", page: () => HomePage()),
            GetPage(name: "/b", page: () => BottomBar()),
            GetPage(name: "/select", page: () => const Select()),
            GetPage(name: "/login", page: () => Loginst()),
            GetPage(name: "/subject", page: () => Subject()),
            GetPage(name: "/marks", page: () => Marks()),
            GetPage(name: "/notify", page: () => Notify()),
          ],
          home: BottomBar(),
        );
      },
    );
  }
}
