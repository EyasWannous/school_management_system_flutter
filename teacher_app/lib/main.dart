import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_app/firebase_options.dart';
import 'package:teacher_app/screen/login.dart';
import 'package:teacher_app/services/my_firebase_services.dart';

import '../constant/routes.dart';
import '../bindings/init_bindings.dart';
import '../themes/light_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    GetStorage.init(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  ]);

  await NtificationConfig().notificationconfig();

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
      builder: (context, child) =>
          GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Teacher App',
            themeMode: ThemeMode.light,
            theme: LigthTheme.light,
            // darkTheme: LightDarkTheme.darkTheme,
            // initialRoute: '/homepage',
            initialBinding: InitBinding(),
            getPages: MyRoutes.pages,
            home: const Login(),
          ),
    );
  }
}
