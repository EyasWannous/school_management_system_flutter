import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../controller/principle_bottom_bar_controller.dart';

PrincipleBottomBarController principleBottomBarController = Get.find();

class PrincipleBottomBar extends StatelessWidget {
  const PrincipleBottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GetX<PrincipleBottomBarController>(
        // init: BottomBarController(),
        builder: (controller) =>
            controller.pages[controller.currentIndex.value],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        items: [
          Image.asset(
            "assets/icons/post.png",
            height: 45,
            width: 50,
          ),
          Image.asset(
            "assets/icons/courses.png",
            height: 45,
            width: 50,
          ),
          Image.asset(
            "assets/icons/homepage.png",
            height: 45,
            width: 50,
          ),
          Image.asset(
            "assets/icons/marks.png",
            height: 45,
            width: 50,
          ),
        ],
        backgroundColor: MyColors.milkyWhite,
        height: 70,
        color: MyColors.royalBlue,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) =>
            principleBottomBarController.currentIndex.value = index,
      ),
    );
  }
}
