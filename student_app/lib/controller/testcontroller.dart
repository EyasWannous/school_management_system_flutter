 
import 'package:get/get.dart';
import 'package:student_app/core/handingdatacontroller.dart';
import 'package:student_app/core/statusrequest.dart';
import 'package:student_app/data/remote/testdata.dart';
/*
class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure ; 
      }
    }
    update(); 
  } 

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
*/