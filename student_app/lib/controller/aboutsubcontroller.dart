import 'dart:developer';

import 'package:get/get.dart';
import 'package:student_app/data/remote/aboutsubdata.dart';
import 'package:student_app/model/AboutsubModel.dart';

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
      log("cccccccccccccccccccccccccccccccccccccccc");
      var response = await aboutsubData.getData();
      log("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        aboutsub.value = AboutSubModel.fromJson(response['info']);

        log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
        update();
      }
    } catch (e) {
      log(e as String);
    }
  }
}
