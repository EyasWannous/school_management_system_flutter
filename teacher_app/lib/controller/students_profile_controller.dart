import 'package:get/get.dart';
import 'package:teacher_app/services/rest_api_get.dart';

import '../model/student_profile_model.dart';

class StudentProfileController extends GetxController {
  bool isLoading = false;
  StudentProfile studentProfile = StudentProfile();

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  fetchData() async {
    isLoading = true;
    update();

    studentProfile = await RestAPIGet.getstudentprofile('${Get.arguments[0]}');

    isLoading = false;
    update();
  }
}
