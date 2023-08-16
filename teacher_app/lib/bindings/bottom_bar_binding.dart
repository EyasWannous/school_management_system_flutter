import 'package:get/get.dart';

import '../controller/marks_controller.dart';
import '../controller/schedule_controller.dart';
import '../controller/sections_controller.dart';

class BottomBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(() => ScheduleController());
    Get.put(() => MarksController());
    Get.put(() => SectionsController());
  }
}
