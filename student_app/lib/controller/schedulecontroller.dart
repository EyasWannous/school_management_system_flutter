import 'package:get/get.dart';
import 'package:student_app/data/remote/aboutsubdata.dart';
import 'package:student_app/data/remote/coursesdata.dart';
import 'package:student_app/data/remote/profiledata.dart';
import 'package:student_app/data/remote/scheduledata.dart';
import 'package:student_app/model/coursesmodel.dart';
import 'package:student_app/model/schedulemodel.dart';
import 'package:student_app/model/studentmodel.dart';

import 'package:get/get.dart';

import '../model/AboutsubModel.dart';

class HomePageController extends GetxController {
  List scheduleList = <ScheduleModel>[];
  late bool isLoading = true;

  final Rx<HomePageController?> schedule = Rx<HomePageController?>(null);
  ScheduleData scheduleData = ScheduleData(Get.find());
  @override
  void onInit() {
    getScheduleData();
    super.onInit();
  }

  void getScheduleData() async {
    try {
      //aboutsubList.clear();
      isLoading = true;
      update();
      print("cccccccccccccccccccccccccccccccccccccccc");
      var response = await scheduleData.getData();
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        for (var data in response["schedule"]) {
          scheduleList.add(ScheduleModel.fromJson(data));
          print(data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
