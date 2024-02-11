import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_app/services/rest_api_post.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  changeVisible() {
    passwordVisible = !passwordVisible;
    update();
  }

  loginButton() async {
    // String tokenForFirebase = await NtificationConfig().notificationconfig();
    // log(tokenForFirebase);
    RestAPIPost.postlogin(
      usernameController.text,
      passwordController.text,
      GetStorage().read('fire_token'),
    );
  }
}
