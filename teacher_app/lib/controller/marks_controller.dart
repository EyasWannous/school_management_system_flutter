import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:teacher_app/model/serach_model.dart';
import 'package:teacher_app/services/remove_leading_zeros.dart';

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
    fetchStudentsData();
    fetchCoursesData();
    fetchMarksTypesData();
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
    // for (var element in studentsList) {
    //   var temp = Student(
    //     id: element.id!,
    //     firstName: element.firstName,
    //     middleName: element.middleName,
    //     lastName: element.lastName,
    //     absence: element.absence,
    //     address: element.address,
    //     bio: element.bio,
    //     dateOfBirth: element.dateOfBirth,
    //     gender: element.gender,
    //     imageUrl: element.imageUrl,
    //     phoneNumber:
    //   );
    //   students.add(temp);
    // }

    fillSerachList();
    isLoading = false;
    update();
  }

  void fetchCoursesData() async {
    Section section = sectionsList.firstWhere(
      (element) => element.name == sectionSelectedValue,
      orElse: () => Section(),
    );
    // print('section.id');
    // print(section.id);

    coursesList = await RestAPIGet.getcourses('${section.id}');

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

  void fetchMarksTypesData() async {
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

  void onMarkTypeDropdownChanged(String value) {
    if (markTypeSelectedValue == value) return;
    markTypeSelectedValue = value;
    update();
  }

  void onCoursesDropdownChanged(String value) {
    if (coursesSelectedValue == value) return;
    coursesSelectedValue = value;
    update();
  }

  sendData(String studentId) {
    Courses courses = coursesList.firstWhere(
      (element) => element.name == coursesSelectedValue,
      orElse: () => Courses(),
    );
    String score = RemoveLeadingZeros.removeLeadingZeros(markController.text);
    if (score.isEmpty) score = '0';
    RestAPIPost.postMarks(
      studentId,
      score,
      '${courses.id!}',
      markTypeSelectedValue,
    );
  }
}
