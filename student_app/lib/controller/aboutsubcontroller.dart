import 'package:get/get.dart';
import 'package:student_app/data/remote/aboutsubdata.dart';
import 'package:student_app/data/remote/profiledata.dart';
import 'package:student_app/model/AboutsubModel.dart';
import 'package:student_app/model/studentmodel.dart';

import 'package:get/get.dart';

class AboutSubController extends GetxController {
  var aboutsubList = <AboutSubModel>[];
  late bool isLoading = true;

  final Rx<AboutSubModel?> aboutsub = Rx<AboutSubModel?>(null);
  AboutsubData aboutsubData = AboutsubData(Get.find());
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      isLoading = true;
      update();
      print("cccccccccccccccccccccccccccccccccccccccc");
      var response = await aboutsubData.getData();
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
         aboutsub.value = AboutSubModel.fromJson(response['info']);

        print("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        update();
      }
    } catch (e) {
      print(e);
    }
  }
}