import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SplashScreenController>(
        init: SplashScreenController(),
        builder: (controller) => Center(
          child: FlutterLogo(
            size: MediaQuery.of(context).size.height / 2,
          ),
        ),
      ),
    );
  }
}
