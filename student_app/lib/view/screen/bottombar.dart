import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:student_app/controller/bottombarcontroller.dart';
import 'package:student_app/view/screen/courses.dart';
import 'package:student_app/view/screen/homepage.dart';
import 'package:student_app/view/screen/marks.dart';
import 'package:student_app/view/screen/posts.dart';
import 'package:student_app/view/screen/profile.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);
BottomBarController controller = Get.find();

class BottomBar extends StatelessWidget {
  final List<Widget> _pages = [
    const Posts(),
    const Courses(),
    const HomePage(),
    const Marks(),
    const Profile(),
  ];

  BottomBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      extendBody: true,
      body: GetX<BottomBarController>(
        builder: (controller) => _pages[controller.currentIndex.value],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //  index: index,

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
            "assets/icons/profile.png",
            height: 45,
            width: 50,
          )
        ],
        backgroundColor: const Color.fromRGBO(244, 241, 241, 1),
        height: 70,
        color: const Color.fromRGBO(65, 105, 225, 1),
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          controller.currentIndex.value = index;
          //  Get.find<BottomBarController>().updateIndex(index);
        },
      ),
    );
  }
}
