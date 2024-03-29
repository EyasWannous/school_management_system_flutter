import 'dart:developer';

import 'package:get/get.dart';
import 'package:student_app/data/remote/profiledata.dart';
import 'package:student_app/model/studentmodel.dart';

class ProfileController extends GetxController {
  var categoriesList = <StudentProfile>[];
  late bool isLoading = true;

  final Rx<StudentProfile?> studentprofile = Rx<StudentProfile?>(null);
  ProfileData profileData = ProfileData(Get.find());
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading = true;
      update();
      log("cccccccccccccccccccccccccccccccccccccccc");
      var response = await profileData.getData();
      log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        studentprofile.value = StudentProfile.fromJson(response['profile']);

        log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        update();
      }
    } catch (e) {
      log(e as String);
    }
  }
}
