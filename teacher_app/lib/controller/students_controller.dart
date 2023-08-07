import 'package:get/get.dart';

import '../model/serach_model.dart';
import '../model/students_model.dart';
import '../services/rest_api_get.dart';

class StudentsController extends GetxController {
  List<Student> students = [];
  List<SearchModel> searchList = [];

  bool isLoading = false;

  @override
  void onInit() async {
    fetchStudentsData();
    super.onInit();
  }

  void fetchStudentsData() async {
    isLoading = true;
    update();

    students.clear();
    students = await RestAPIGet.getstudents('1');

    fillSerachList();
    isLoading = false;
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
}
