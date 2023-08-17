import 'package:get/get.dart';
import 'package:student_app/data/remote/marksubdata.dart';
import 'package:student_app/data/remote/profiledata.dart';
import 'package:student_app/model/marksubmodel.dart';
import 'package:student_app/model/studentmodel.dart';

import 'package:get/get.dart';

class MarkSubController extends GetxController {
  late bool isLoading = true;
  var marksubfList = <MarkSubFModel>[];
  var marksubsList = <MarkSubSModel>[];
  final Rx<MarkSubFModel?> marksF = Rx<MarkSubFModel?>(null);
  MarkSubFData marksubfData = MarkSubFData(Get.find());
  final Rx<MarkSubSModel?> marksS = Rx<MarkSubSModel?>(null);
  MarkSubSData marksubsData = MarkSubSData(Get.find());
  @override
  void onInit() {
    getfirstData();
    getSecondData();
    super.onInit();
  }

  void getfirstData() async {
    try {
      isLoading = true;
      update();
      print("cccccccccccccccccccccccccccccccccccccccc");
      var response = await marksubfData.getData();
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        for (var data in response["marks"]) {
          marksubfList.add(MarkSubFModel.fromJson(data));
          // print(data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void getSecondData() async {
    try {
      isLoading = true;
      update();
      print("cccccccccccccccccccccccccccccccccccccccc");
      var response = await marksubsData.getData();
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        for (var data in response["marks"]) {
          marksubsList.add(MarkSubSModel.fromJson(data));
          // print(data);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
