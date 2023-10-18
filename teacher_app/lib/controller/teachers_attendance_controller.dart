import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/model/teachers_model.dart';
import 'package:teacher_app/services/rest_api_get.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../model/grade_model.dart';
import '../model/student_attendance_model.dart';
import '../services/rest_api_post.dart';

class TeachersAttendanceController extends GetxController {
  bool isLoading = false;
  bool isChecked = false;

  List<AttendanceModel> teachersAttendance = [];
  List<Teacher> teachersList = [];

  List<Color> colorsForUnselectedItem = MyColors.colorsForUnselectedItem;
  List<Color> colorsForSelectedItem = MyColors.colorsForSelectedItem;

  String courseSelectedValue = 'course';
  List<String> courseDropdownItems = ['course'];
  List<Grade> coursesList = [];

  @override
  void onInit() async {
    await fetchTeachersData();
    if (isChecked) showMyDialog();
    super.onInit();
  }

  // fetchAllCourses() async {
  //   coursesList = await RestAPIGet.getgrades();

  //   if (coursesList.isEmpty) {
  //     courseDropdownItems = ["it's Empty"];
  //     courseSelectedValue = courseDropdownItems[0];
  //     update();
  //     return;
  //   }

  //   courseDropdownItems.clear();
  //   for (var element in coursesList) {
  //     courseDropdownItems.add(element.name!);
  //   }
  //   courseSelectedValue = courseDropdownItems[0];

  //   update();
  // }

  fetchTeachersData() async {
    isLoading = true;
    update();

    var res = TeachersModel.fromJson(await RestAPIGet.getteachers());
    isChecked = res.isChecked!;
    teachersList.addAll(res.data!);

    for (var element in teachersList) {
      var temp = AttendanceModel(
        id: element.id!,
        isAttendanceToday: isChecked ? element.todayAttendance! : true,
        name: '${element.firstName} ${element.lastName}',
        numberOfDays: 0,
        imageUrl: element.imageUrl!,
      );
      teachersAttendance.add(temp);
    }

    isLoading = false;
    update();
  }

  selectAnItem(int index) {
    teachersAttendance[index].isAttendanceToday =
        !teachersAttendance[index].isAttendanceToday;
    update();
  }

  void onCourseDropdownChanged(String value) async {
    if (courseSelectedValue == value) return;
    courseSelectedValue = value;
    fetchTeachersData();
    update();
  }

  sendData() {
    RestAPIPost.postattendanceteachers(teachersAttendance);
  }

  void showMyDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('Warning'),
        content: const Text('This is the content of the dialog.'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}
