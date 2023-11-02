import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/animation/fadeanimation.dart';

import '../constant/my_colors.dart';
import '../controller/login_controller.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeAnimation(
                delay: 1,
                widgetChild: SizedBox(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Image.asset("assets/icons/Teaching-login.png"),
                ),
              ),
              SizedBox(height: 40.h),
              FadeAnimation(
                delay: 1.2,
                widgetChild: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Welcome to",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      " It's School !",
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60.h),
              FadeAnimation(
                delay: 1.4,
                widgetChild: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: StreamBuilder<Object>(
                    stream: null,
                    builder: (context, snapshot) {
                      return FadeAnimation(
                        delay: 1.4,
                        widgetChild: Form(
                          key: controller.formstate,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  controller: controller.usernameController,
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (text) {
                                    return (text != null &&
                                            text.trim().isNotEmpty)
                                        ? null
                                        : "please enter your username";
                                  },
                                  cursorColor:
                                      const Color.fromARGB(255, 141, 168, 209),
                                  cursorHeight: 20,
                                  decoration: InputDecoration(
                                    counterStyle: const TextStyle(
                                        color: MyColors.royalBlue),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      child: Text(
                                        "Username",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.royalBlue,
                                        ),
                                      ),
                                    ),
                                    hintText: "Enter your username",
                                    hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 141, 168, 209),
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                        color: MyColors.soLightBlue,
                                      ),
                                    ),
                                    suffixIcon: const Icon(
                                      Icons.person,
                                      color: MyColors.royalBlue,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: TextFormField(
                                  controller: controller.passwordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: controller.passwordVisible,
                                  cursorColor:
                                      const Color.fromARGB(255, 141, 168, 209),
                                  cursorHeight: 20,
                                  validator: (text) {
                                    if (text!.length < 8) {
                                      return "you have to enter 8 char";
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    counterStyle: const TextStyle(
                                        color: MyColors.royalBlue),
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    label: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 14),
                                      child: Text(
                                        "Password",
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.bold,
                                          color: MyColors.royalBlue,
                                        ),
                                      ),
                                    ),
                                    hintText: "Enter your password",
                                    hintStyle: TextStyle(
                                      color: const Color.fromARGB(
                                          255, 141, 168, 209),
                                      fontFamily: 'Montserrat',
                                      fontSize: 12.sp,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: MyColors.royalBlue),
                                    ),
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        controller.passwordVisible
                                            ? Icons.visibility_off
                                            : Icons.visibility,
                                        color: MyColors.royalBlue,
                                      ),
                                      onPressed: () =>
                                          controller.changeVisible(),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: SizedBox(
                                  height: 35.h,
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.loginButton();
                                    },
                                    child: Text(
                                      "login",
                                      style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
