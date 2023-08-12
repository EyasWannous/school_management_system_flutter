import 'package:get/get.dart';
import 'package:student_app/data/remote/aboutsubdata.dart';
import 'package:student_app/data/remote/coursesdata.dart';
import 'package:student_app/data/remote/profiledata.dart';
import 'package:student_app/data/remote/scheduledata.dart';
import 'package:student_app/model/coursesmodel.dart';
import 'package:student_app/model/schedulemodel.dart';
import 'package:student_app/model/studentmodel.dart';

import 'package:get/get.dart';
import 'package:student_app/models/program_model.dart';
import 'package:student_app/parent/screen/report.dart';

import '../model/AboutsubModel.dart';
import '../services/rest_api_get.dart';

class HomePageController extends GetxController {
  // List scheduleList = <ScheduleModel>[];
  bool isLoading = true;
  ProgramModel schedule = ProgramModel();

  // final Rx<HomePageController?> schedule = Rx<HomePageController?>(null);
  // ScheduleData scheduleData = ScheduleData(Get.find());
  @override
  void onInit() async {
    await fetchDaysData();
    super.onInit();
  }

  fetchDaysData() async {
    isLoading = true;
    update();

    schedule = await RestAPIGet.getprogram();
    // print('----------------------');
    // print(schedule.sunday!.length);
    // print(schedule.monday!.length);
    // print(schedule.tuesday!.length);
    // print(schedule.wednesday!.length);
    // print(schedule.thursday!.length);

    isLoading = false;
    update();
  }

  // void getScheduleData() async {
  //   try {
  //     //aboutsubList.clear();
  //     isLoading = true;
  //     update();
  //     print("cccccccccccccccccccccccccccccccccccccccc");
  //     var response = await scheduleData.getData();
  //     print(
  //         "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
  //     isLoading = false;
  //     if (response["status"]) {
  //       for (var data in response["schedule"]) {
  //         scheduleList.add(ScheduleModel.fromJson(data));
  //         print(data);
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
