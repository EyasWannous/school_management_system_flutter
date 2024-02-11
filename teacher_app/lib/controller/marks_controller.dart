import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/model/serach_model.dart';
import 'package:teacher_app/services/leading_zeros.dart';

import '../model/courses_model.dart';
import '../model/grade_model.dart';
import '../model/sections_model.dart';
import '../model/students_model.dart';
import '../services/rest_api_get.dart';
import '../services/rest_api_post.dart';

class MarksController extends GetxController {
  int? gradeId;
  int? sectionId;
  MarksController({
    this.gradeId,
    this.sectionId,
  });

  String gradeSelectedValue = 'grade';
  List<String> gradeDropdownItems = ['grade'];

  String sectionSelectedValue = 'section';
  List<String> sectionDropdownItems = ['section'];

  String markTypeSelectedValue = 'practical';
  List<String> markTypeDropdownItems = ['practical', 'exam', 'test'];

  String coursesSelectedValue = 'something';
  List<String> coursesDropdownItems = ['something'];

  final formKey = GlobalKey<FormState>();
  TextEditingController markController = TextEditingController();

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
    await fetchStudentsData();
    await fetchCoursesData();
    await fetchMarksTypesData();
    super.onInit();
  }

  fetchAllGradesData() async {
    gradesList = await RestAPIGet.getgrades();

    // log('gradesList');
    // log(gradesList);
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

    if (gradeId != null) {
      Grade grade = gradesList.firstWhere(
        (element) => element.id == gradeId!,
        orElse: () => Grade(),
      );

      gradeSelectedValue = grade.name!;
      update();
      return;
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
    // log('grade.id');
    // log(grade.id);

    sectionsList = await RestAPIGet.getsections('${grade.id}');

    // log('sectionsList');
    // log(sectionsList);
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

    if (sectionId != null) {
      Section section = sectionsList.firstWhere(
        (element) => element.id == sectionId!,
        orElse: () => Section(),
      );

      sectionSelectedValue = section.name!;

      isLoading = false;
      update();
      return;
    }

    sectionSelectedValue = sectionDropdownItems[0];

    isLoading = false;
    update();
  }

  fetchStudentsData() async {
    isLoading = true;
    update();

    students.clear();
    Section section = sectionsList.firstWhere(
      (element) => element.name == sectionSelectedValue,
      orElse: () => Section(),
    );
    // log('section.id');
    // log(section.id);

    var res = await RestAPIGet.getstudents('${section.id}');
    if (res.data != null) {
      students.addAll(res.data!);
    }

    fillSerachList();
    isLoading = false;
    update();
  }

  fetchCoursesData() async {
    Section section = sectionsList.firstWhere(
      (element) => element.name == sectionSelectedValue,
      orElse: () => Section(),
    );
    // log('section.id');
    // log(section.id);

    coursesList = await RestAPIGet.getcourses('${section.id}');
    log('${coursesList[0].name}');

    if (coursesList.isEmpty) {
      coursesDropdownItems = ["it's Empty"];
      coursesSelectedValue = coursesDropdownItems[0];
      update();
      return;
    }

    coursesDropdownItems.clear();
    for (var element in coursesList) {
      coursesDropdownItems.add(element.name!);
    }

    coursesSelectedValue = coursesDropdownItems[0];

    update();
  }

  fetchMarksTypesData() async {
    List<String> ls = await RestAPIGet.getmarkstypes();

    if (ls.isEmpty) {
      markTypeDropdownItems = ["it's Empty"];
      markTypeSelectedValue = markTypeDropdownItems[0];
      update();
      return;
    }

    markTypeDropdownItems.clear();
    markTypeDropdownItems.addAll(ls);
    markTypeSelectedValue = markTypeDropdownItems[0];

    update();
  }

  fillSerachList() {
    searchList.clear();
    for (var element in students) {
      searchList.add(
        SearchModel(
          id: element.id!,
          name:
              '${element.firstName!} ${element.middleName!} ${element.lastName!}',
        ),
      );
    }
  }

  fetchMarkOfStudent(String id) async {
    Courses course = coursesList.firstWhere(
      (element) => element.name == coursesSelectedValue,
      orElse: () => Courses(),
    );

    int? temp = await RestAPIGet.getmarkofstudent(
        id, markTypeSelectedValue, '${course.id}');

    markController.text = temp != null ? '$temp' : '';
  }

  /// Screen Funtions
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

  void onMarkTypeDropdownChanged(String value, String id) async {
    if (markTypeSelectedValue == value) return;
    markTypeSelectedValue = value;
    await fetchMarkOfStudent(id);
    update();
  }

  void onCoursesDropdownChanged(String value, String id) async {
    if (coursesSelectedValue == value) return;
    coursesSelectedValue = value;
    fetchMarkOfStudent(id);
    update();
  }

  sendData(String studentId) {
    Courses courses = coursesList.firstWhere(
      (element) => element.name == coursesSelectedValue,
      orElse: () => Courses(),
    );

    String score = LeadingZeros.remove(markController.text);
    if (score.isEmpty) score = '0';

    RestAPIPost.postMarks(
      studentId,
      score,
      '${courses.id!}',
      markTypeSelectedValue,
    );
  }
}
