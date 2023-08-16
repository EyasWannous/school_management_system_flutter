import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/services/rest_api_get.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../model/grade_model.dart';
import '../model/sections_model.dart';
import '../model/student_attendance_model.dart';
import '../model/students_model.dart';
import '../services/rest_api_post.dart';

class StudentsAttendanceController extends GetxController {
  bool isLoading = false;
  bool isChecked = false;

  List<AttendanceModel> studentsAttendance = [];
  List<Grade> gradesList = [];
  List<Section> sectionsList = [];
  List<Student> studentsList = [];

  List<Color> colorsForUnselectedItem = MyColors.colorsForUnselectedItem;
  List<Color> colorsForSelectedItem = MyColors.colorsForSelectedItem;

  String gradeSelectedValue = 'grade';
  List<String> gradeDropdownItems = ['grade'];

  String sectionSelectedValue = 'section';
  List<String> sectionDropdownItems = ['section'];

  @override
  void onInit() async {
    await fetchAllGradesData();
    await fetchSectionsData();
    await fetchStudentsData();
    if (isChecked) showMyDialog();
    super.onInit();
  }

  fetchAllGradesData() async {
    gradesList = await RestAPIGet.getgrades();

    if (gradesList.isEmpty) {
      gradeDropdownItems = ["it's Empty"];
      gradeSelectedValue = gradeDropdownItems[0];
      update();
      return;
    }
    gradeDropdownItems.clear();
    for (var element in gradesList) {
      gradeDropdownItems.add(element.name!);
    }
    gradeSelectedValue = gradeDropdownItems[0];
    update();
  }

  fetchSectionsData() async {
    isLoading = true;
    update();

    sectionsList.clear();
    Grade grade = gradesList.firstWhere(
      (element) => element.name == gradeSelectedValue,
      orElse: () => Grade(),
    );

    sectionsList = await RestAPIGet.getsections('${grade.id}');

    if (sectionsList.isEmpty) {
      sectionDropdownItems = ["it's Empty"];
      sectionSelectedValue = sectionDropdownItems[0];
      update();
      return;
    }
    sectionDropdownItems.clear();
    for (var element in sectionsList) {
      sectionDropdownItems.add(element.name!);
    }
    sectionSelectedValue = sectionDropdownItems[0];

    isLoading = false;
    update();
  }

  fetchStudentsData() async {
    isLoading = true;
    update();

    studentsAttendance.clear();
    Section section = sectionsList.firstWhere(
      (element) => element.name == sectionSelectedValue,
      orElse: () => Section(),
    );
    // print('---------');
    // print(section.id);

    var res = await RestAPIGet.getstudents('${section.id}');
    if (res.checked != null) isChecked = res.checked!;
    if (res.data != null) {
      studentsList.clear();
      studentsList.addAll(res.data!);
    }

    for (var element in studentsList) {
      var temp = AttendanceModel(
        id: element.id!,
        isAttendanceToday: isChecked ? element.todayAttendance! : true,
        name: '${element.firstName} ${element.middleName} ${element.lastName}',
        numberOfDays: element.absence!,
        imageUrl: element.imageUrl!,
      );
      studentsAttendance.add(temp);
    }

    isLoading = false;
    update();
  }

  void onGradeDropdownChanged(String value) async {
    if (gradeSelectedValue == value) return;
    gradeSelectedValue = value;
    await fetchSectionsData();
    await fetchStudentsData();
    if (isChecked) showMyDialog();
    update();
  }

  void onSectionDropdownChanged(String value) async {
    if (sectionSelectedValue == value) return;
    sectionSelectedValue = value;
    await fetchStudentsData();
    if (isChecked) showMyDialog();
    update();
  }

  selectAnItem(int index) {
    studentsAttendance[index].isAttendanceToday =
        !studentsAttendance[index].isAttendanceToday;
    update();
  }

  sendData() {
    RestAPIPost.postAttendanceStudents(studentsAttendance);
  }

  void showMyDialog() {
    Get.dialog(
      AlertDialog(
        title: const Text('My Dialog'),
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
