import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../model/teacher_profile_model.dart';
import '../services/rest_api_get.dart';

class MyDrawerController extends GetxController {
  bool isLoading = false;
  // bool isPrinciple = GetStorage().read('is_principle') ?? false;
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
    GetStorage().write('my_id', teacher.id);
    // log(teacher.address);

    isLoading = false;
    update();
  }
}
