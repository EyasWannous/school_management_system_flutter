
import 'package:get/get.dart';
import 'package:student_app/data/remote/assigndata.dart';
import 'package:student_app/model/AssignModel.dart';

import '../model/AboutsubModel.dart';

class AssignController extends GetxController {
  var assignList = <AssignModel>[];
  late bool isLoading = true;

  final Rx<AssignModel?> courses = Rx<AssignModel?>(null);
  AssignData assignData = AssignData(Get.find());
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      //aboutsubList.clear();
      isLoading = true;
      update();
      print("cccccccccccccccccccccccccccccccccccccccc");
      var response = await assignData.getData();
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        for (var data in response["assign"]) {
          assignList.add(AssignModel.fromJson(data));
         // print(data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
