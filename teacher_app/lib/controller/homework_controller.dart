import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teacher_app/constant/days.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../model/grade_model.dart';
import '../model/homework_section_model.dart';
import '../model/sections_model.dart';
import '../model/student_attendance_model.dart';
import '../model/students_model.dart';
import '../services/rest_api_get.dart';
import '../services/rest_api_post.dart';

class HomeworkController extends GetxController {
  bool isLoading = false;

  String typeSelectedValue = 'homework';
  List<String> typeDropdownItems = ['homework', 'project'];

  String gradeSelectedValue = 'grade';
  List<String> gradeDropdownItems = ['grade'];

  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // List<bool> fromTo = [false, false, true, true, true];

  // BottomSheet Valuables
  List<Color> colorsForUnselectedItem = MyColors.colorsForUnselectedItem;

  List<Color> colorsForSelectedItem = MyColors.colorsForSelectedItem;

  Color barColor = Colors.grey;
  // End BottomSheet Valuables

  List<StudentAttendanceModel> studentsAttendance = [];
  List<Grade> gradesList = [];
  List<Sections> homeworkSectionsList = [];

  @override
  void onInit() async {
    await fetchAllGradesData();
    await fetchSectionsData();
    super.onInit();
  }

  fetchAllGradesData() async {
    gradesList = await RestAPIGet.getgrades();

    // print('gradesList');
    // print(gradesList);
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

    List<Section> sectionsList = [];

    Grade grade = gradesList.firstWhere(
      (element) => element.name == gradeSelectedValue,
      orElse: () => Grade(),
    );
    print('grade.id');
    print(grade.id);

    sectionsList = await RestAPIGet.getsections('${grade.id}');

    print('sectionsList');
    print(sectionsList);
    if (sectionsList.isEmpty) {
      homeworkSectionsList = [];
      return;
    }
    homeworkSectionsList.clear();
    for (var element in sectionsList) {
      var temp = Sections(id: element.id, isSelected: false);
      homeworkSectionsList.add(temp);
    }

    isLoading = false;
    update();
  }

  void onTypeDropdownChanged(String value) {
    if (typeSelectedValue == value) return;
    typeSelectedValue = value;
    update();
  }

  void onGradeDropdownChanged(String value) {
    if (gradeSelectedValue == value) return;
    fetchSectionsData();
    gradeSelectedValue = value;
    update();
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: Days.today,
      firstDate: Days.firstDay,
      lastDate: Days.lastDay,
    );
    if (pickedDate != null) {
      // print(pickedDate);
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      // print(formattedDate);

      dateController.text = formattedDate;
    } else {
      print("Date is not selected");
    }
  }

  selectanitem(int index) {
    homeworkSectionsList[index].isSelected =
        !homeworkSectionsList[index].isSelected!;
    update();
  }

  sendData() {
    RestAPIPost.postHomework(
      homeworkSectionsList,
      titleController.text,
      bodyController.text,
      typeSelectedValue,
      dateController.text,
    );
  }
}
