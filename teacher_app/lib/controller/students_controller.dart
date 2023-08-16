import 'package:get/get.dart';

import '../model/serach_model.dart';
import '../model/students_model.dart';
import '../services/rest_api_get.dart';

class StudentsController extends GetxController {
  int sectionId;

  StudentsController({required this.sectionId});

  List<Student> students = [];
  List<SearchModel> searchList = [];

  bool isLoading = false;

  @override
  void onInit() async {
    fetchStudentsData();
    // print(Get.arguments);
    super.onInit();
  }

  void fetchStudentsData() async {
    isLoading = true;
    update();

    students.clear();
    var res = await RestAPIGet.getstudents('$sectionId');
    students.addAll(res.data!);

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
