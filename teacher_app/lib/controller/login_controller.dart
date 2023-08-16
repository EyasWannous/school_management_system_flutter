import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/services/rest_api_post.dart';

class LoginController extends GetxController {
  // var email;
  // var password;
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisible = false;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  changeVisible() {
    passwordVisible = !passwordVisible;
    update();
  }

  loginButton() {
    RestAPIPost.postlogin(usernameController.text, passwordController.text);
  }
}
