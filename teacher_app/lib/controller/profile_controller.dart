import 'package:get/get.dart';

import '../model/teacher_profile_model.dart';
import '../services/rest_api_get.dart';

class ProfileController extends GetxController {
  bool isLoading = true;
  Profile teacher = Profile();

  @override
  void onInit() async {
    await fetchStudentsData();
    super.onInit();
  }

  fetchStudentsData() async {
    isLoading = true;
    update();

    teacher = await RestAPIGet.getprofile();
    print(teacher.address);

    isLoading = false;
    update();
  }
}
