import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyMiddleware extends GetMiddleware {
  // I should have the role here
  final box = GetStorage();
  // String role = box.read('role');
  @override
  RouteSettings? redirect(String? route) {
    if (box.read('is_principle')) {
      log(box.read('is_principle'));
      return const RouteSettings(name: '/calendar');
    } else {
      log(box.read('is_principle'));
      return const RouteSettings(name: '/homepage');
    }
    // Continue with the original navigation
  }
}
