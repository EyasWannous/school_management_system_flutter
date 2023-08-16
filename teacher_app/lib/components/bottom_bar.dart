import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../controller/bottom_bar_controller.dart';

BottomBarController bottomBarController = Get.find();

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: GetX<BottomBarController>(
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
          Image.asset(
            "assets/icons/classroom.png",
            height: 45,
            width: 50,
          ),
        ],
        backgroundColor: MyColors.milkyWhite,
        height: 70,
        color: MyColors.royalBlue,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) => bottomBarController.currentIndex.value = index,
      ),
    );
  }
}
