import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/my_colors.dart';

class MySnackBar {
  static void showSnackBar({required String message}) {
    Get.rawSnackbar(
      // title: title,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: const Color(0xFF303030),
      backgroundGradient: LinearGradient(colors: MyColors.popupColors),

      margin: const EdgeInsets.all(0),
      // padding: const EdgeInsets.all(0),
      borderRadius: 0,
      // maxWidth: double.infinity,
      // titleText: Text(''),
      // messageText: Text(''),
      // overlayBlur: 1,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(seconds: 1),
    );
  }
}
