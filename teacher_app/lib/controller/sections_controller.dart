import 'package:get/get.dart';
import 'package:teacher_app/model/grade_model.dart';

import '../model/sections_model.dart';
import '../services/rest_api_get.dart';

class SectionsController extends GetxController {
  String selectedValue = '9th grade';
  List<String> dropdownItems = ['9th grade', 'two', 'Three', 'Four'];
  List<Grade> lg = [];
  List<Section> numberOfClassesInGrade = [];
  bool isLoading = false;

  @override
  void onInit() async {
    await fetchGradesData();
    fetchSectionsData();
    super.onInit();
  }

  fetchGradesData() async {
    lg = await RestAPIGet.getgrades();
    // print('lg');
    // print(lg);
    if (lg.isEmpty) {
      dropdownItems = ["it's Empty"];
      selectedValue = dropdownItems[0];
      update();
      return;
    }
    dropdownItems.clear();
    for (var element in lg) {
      dropdownItems.add(element.name!);
    }
    selectedValue = dropdownItems[0];
    update();
  }

  void fetchSectionsData() async {
    isLoading = true;
    update();

    numberOfClassesInGrade.clear();
    Grade grade = lg.firstWhere(
      (element) => element.name == selectedValue,
      orElse: () => Grade(),
    );
    print('grade.id');
    print(grade.id);
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
