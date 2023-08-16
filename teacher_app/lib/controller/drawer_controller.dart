import 'package:get/get.dart';

import '../model/teacher_profile_model.dart';
import '../services/rest_api_get.dart';

class MyDrawerController extends GetxController {
  bool isLoading = false;
  TeacherProfile teacher = TeacherProfile();

  @override
  void onInit() async {
    await fetchStudentsData();
    super.onInit();
  }

  fetchStudentsData() async {
    isLoading = true;
    update();

    teacher = await RestAPIGet.getteacherprofile();
    // print(teacher.address);

    isLoading = false;
    update();
  }
}
