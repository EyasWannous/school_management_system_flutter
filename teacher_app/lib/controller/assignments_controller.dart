import 'package:get/get.dart';
import 'package:teacher_app/model/assignments_model.dart';
import 'package:teacher_app/services/rest_api_get.dart';

class AssignmentsController extends GetxController {
  bool isLoading = true;

  List<AssignmentsToShow> assignments = [];

  @override
  void onInit() async {
    await fetchData();
    super.onInit();
  }

  fetchData() async {
    isLoading = true;
    update();

    assignments = await RestAPIGet.getassignments('${Get.arguments[0]}');

    isLoading = false;
    update();
  }
}
