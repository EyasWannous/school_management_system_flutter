import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:student_app/locale/locale.dart';
import 'package:student_app/mybinding.dart';
import 'package:student_app/themes.dart';
import 'package:student_app/view/screen/bottombar.dart';
import 'package:student_app/view/screen/homepage.dart';
import 'package:student_app/view/screen/loginst.dart';
import 'package:student_app/view/screen/marks.dart';
import 'package:student_app/view/screen/notify.dart';
import 'package:student_app/view/screen/select.dart';
import 'package:student_app/view/screen/subject.dart';

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
            GetPage(name: "/", page: () => const HomePage()),
            GetPage(name: "/b", page: () => BottomBar()),
            GetPage(name: "/select", page: () => const Select()),
            GetPage(name: "/login", page: () => const Loginst()),
            GetPage(name: "/subject", page: () => const Subject()),
            GetPage(name: "/marks", page: () => const Marks()),
            GetPage(name: "/notify", page: () => const Notify()),
          ],
          home: BottomBar(),
        );
      },
    );
  }
}
