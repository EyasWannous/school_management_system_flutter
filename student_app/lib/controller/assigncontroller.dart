import 'package:get/get.dart';

import '../models/assignments_model.dart';
import '../services/rest_api_get.dart';

class AssignController extends GetxController {
  var isChecked = false.obs;
  // var assignList = <AssignModel>[];
  bool isLoading = true;

  // final Rx<AssignModel?> courses = Rx<AssignModel?>(null);
  // AssignData assignData = AssignData(Get.find());
  @override
  void onInit() async {
    // getData();
    await fetchDaysData();
    super.onInit();
  }

  List<AssignmentsToShow> assignments = [];

  fetchDaysData() async {
    isLoading = true;
    update();

    assignments.clear();
    assignments = await RestAPIGet.getassignments('4');
    // print('assignments' '$assignments');

    if (assignments.isEmpty) {
      assignments = [];
      update();
      return;
    }

    isLoading = false;
    update();
  }

  // void getData() async {
  //   print('assignList');
  //   try {
  //     // aboutsubList.clear();
  //     print('object');
  //     isLoading = true;
  //     update();
  //     var response = await assignData.getData();
  //     isLoading = false;
  //     if (response["status"]) {
  //       for (var data in response["assign"]) {
  //         assignList.add(AssignModel.fromJson(data));
  //         // print(data);
  //       }
  //     }
  //     print(assignList);
  //   } catch (e) {
  //     print(e);
  //   }
  // }
}
