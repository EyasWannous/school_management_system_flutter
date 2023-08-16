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
    super.onInit();
  }

  fetchAllCourses() async {
    coursesList = await RestAPIGet.getgrades();

    if (coursesList.isEmpty) {
      courseDropdownItems = ["it's Empty"];
      courseSelectedValue = courseDropdownItems[0];
      update();
      return;
    }

    courseDropdownItems.clear();
    for (var element in coursesList) {
      courseDropdownItems.add(element.name!);
    }
    courseSelectedValue = courseDropdownItems[0];

    update();
  }

  fetchTeachersData() async {
    isLoading = true;
    update();

    teachersList = await RestAPIGet.getteachers();

    for (var element in teachersList) {
      var temp = AttendanceModel(
        id: element.id!,
        isAttendanceToday: true,
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
}
