import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_app/components/bottom_bar.dart';
import 'package:teacher_app/components/principle_bottom_bar.dart';
import 'package:teacher_app/screen/login.dart';

class SplashScreenController extends GetxController {
  @override
  // onInit() async {
  //   // await RestAPIPost.postsplashscreen();
  //   super.onInit();
  // }

  @override
  onReady() async {
    // await RestAPIPost.postsplashscreen();
    if (GetStorage().read('token') == null) {
      Get.off(const Login());
      return;
    }

    if (GetStorage().read('is_principle')) {
      Get.off(const PrincipleBottomBar());
      return;
    }

    Get.off(const BottomBar());

    super.onReady();
  }
}
