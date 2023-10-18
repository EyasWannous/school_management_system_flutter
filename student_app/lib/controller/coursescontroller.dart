import 'dart:developer';

import 'package:get/get.dart';
import 'package:student_app/data/remote/coursesdata.dart';
import 'package:student_app/model/coursesmodel.dart';

class CoursesController extends GetxController {
  List coursesList = <CoursesModel>[];
  late bool isLoading = true;

  final Rx<CoursesModel?> courses = Rx<CoursesModel?>(null);
  CoursesData coursesData = CoursesData(Get.find());
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      //aboutsubList.clear();
      isLoading = true;
      update();
      log("cccccccccccccccccccccccccccccccccccccccc");
      var response = await coursesData.getData();
      log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        for (var data in response["courses"]) {
          coursesList.add(CoursesModel.fromJson(data));
          log(data);
        }

        log("//////////////////////////////////////${coursesList[0].name}");
      }
    } catch (e) {
      log(e as String);
    }
  }
}
