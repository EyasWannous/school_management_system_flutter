import 'package:get/get.dart';
import 'package:student_app/controller/bottombarcontroller.dart';
import 'package:student_app/controller/checkboxassigncontroller.dart';
import 'package:student_app/core/crud.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(MyLocaleController());
    Get.put(CheckBoxController(), permanent: true);
    Get.put(BottomBarController(), permanent: true);
    Get.put(Crud());
  }
}
