import 'package:get/get.dart';
import 'package:teacher_app/controller/principle_bottom_bar_controller.dart';

import '../controller/bottom_bar_controller.dart';

class InitBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomBarController());
    Get.put(PrincipleBottomBarController());
  }
}
