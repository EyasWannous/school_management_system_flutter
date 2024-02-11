import 'package:get/get.dart';
import 'package:teacher_app/model/grade_model.dart';

import '../model/sections_model.dart';
import '../services/rest_api_get.dart';

class SectionsController extends GetxController {
  String selectedValue = '9th grade';
  List<String> dropdownItems = ['9th grade'];
  List<Grade> grades = [];
  List<Section> numberOfClassesInGrade = [];
  bool isLoading = false;

  @override
  void onInit() async {
    await fetchGradesData();
    fetchSectionsData();
    super.onInit();
  }

  fetchGradesData() async {
    grades = await RestAPIGet.getgrades();
    // log('grades');
    // log(grades);
    if (grades.isEmpty) {
      dropdownItems = ["it's Empty"];
      selectedValue = dropdownItems[0];
      update();
      return;
    }
    dropdownItems.clear();
    for (var element in grades) {
      dropdownItems.add(element.name!);
    }
    selectedValue = dropdownItems[0];
    update();
  }

  void fetchSectionsData() async {
    isLoading = true;
    update();

    numberOfClassesInGrade.clear();
    Grade grade = grades.firstWhere(
      (element) => element.name == selectedValue,
      orElse: () => Grade(),
    );
    // log('grade.id');
    // log('${grade.id}');
    numberOfClassesInGrade = await RestAPIGet.getsections('${grade.id}');

    isLoading = false;
    update();
  }

  void onDropdownChanged(String value) {
    if (selectedValue == value) return;
    selectedValue = value;
    fetchSectionsData();
    update();
  }
}
