import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/model/serach_model.dart';

import '../model/courses_model.dart';
import '../model/grade_model.dart';
import '../model/sections_model.dart';
import '../model/students_model.dart';
import '../services/rest_api_get.dart';
import '../services/rest_api_post.dart';

class TeacherReportController extends GetxController {
  String gradeSelectedValue = 'grade';
  List<String> gradeDropdownItems = ['grade'];

  String sectionSelectedValue = 'section';
  List<String> sectionDropdownItems = ['section'];

  final formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  List<Grade> gradesList = [];
  List<Section> sectionsList = [];
  List<Student> students = [];
  List<Courses> coursesList = [];
  List<SearchModel> searchList = [];

  bool isLoading = false;

  @override
  void onInit() async {
    await fetchAllGradesData();
    await fetchSectionsData();
    fetchStudentsData();
    super.onInit();
  }

  fetchAllGradesData() async {
    gradesList = await RestAPIGet.getgrades();

    // print('gradesList');
    // print(gradesList);
    if (gradesList.isEmpty) {
      gradeDropdownItems = ["it's Empty"];
      gradeSelectedValue = gradeDropdownItems[0];

      isLoading = false;
      update();
      return;
    }

    gradeDropdownItems.clear();
    for (var element in gradesList) {
      gradeDropdownItems.add(element.name!);
    }

    // if (gradeId != null) {
    //   Grade grade = gradesList.firstWhere(
    //     (element) => element.id == gradeId!,
    //     orElse: () => Grade(),
    //   );

    //   gradeSelectedValue = grade.name!;
    //   update();
    //   return;
    // }
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
    // print('grade.id');
    // print(grade.id);

    sectionsList = await RestAPIGet.getsections('${grade.id}');

    // print('sectionsList');
    // print(sectionsList);
    if (sectionsList.isEmpty) {
      sectionDropdownItems = ["it's Empty"];
      sectionSelectedValue = sectionDropdownItems[0];

      isLoading = false;
      update();
      return;
    }

    sectionDropdownItems.clear();
    for (var element in sectionsList) {
      sectionDropdownItems.add(element.name!);
    }

    // if (sectionId != null) {
    //   Section section = sectionsList.firstWhere(
    //     (element) => element.id == sectionId!,
    //     orElse: () => Section(),
    //   );

    //   sectionSelectedValue = section.name!;

    //   isLoading = false;
    //   update();
    //   return;
    // }

    sectionSelectedValue = sectionDropdownItems[0];

    isLoading = false;
    update();
  }

  void fetchStudentsData() async {
    isLoading = true;
    update();

    students.clear();
    Section section = sectionsList.firstWhere(
      (element) => element.name == sectionSelectedValue,
      orElse: () => Section(),
    );
    // print('section.id');
    // print(section.id);

    var res = await RestAPIGet.getstudents('${section.id}');
    if (res.data != null) {
      students.addAll(res.data!);
    }

    isLoading = false;
    update();
  }

  /// Funtions
  void onGradeDropdownChanged(String value) async {
    if (gradeSelectedValue == value) return;
    gradeSelectedValue = value;
    await fetchSectionsData();
    fetchStudentsData();
    update();
  }

  void onSectionDropdownChanged(String value) {
    if (sectionSelectedValue == value) return;
    sectionSelectedValue = value;
    fetchStudentsData();
    update();
  }

  sendData(String studentId) async {
    await RestAPIPost.postteacherreport(
        studentId, titleController.text, contentController.text);
  }
}
