import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:student_app/view/screen/homepage.dart';

int index = 2;

class mainscreen extends StatelessWidget {
  const mainscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        onTap: (index) {
          print(index);
        },
        items: [
          Image.asset(
            "assets/icons/post.png",
            height: 45,
            width: 40,
          ),
          Image.asset(
            "assets/icons/courses.png",
            height: 45,
            width: 40,
          ),
          Image.asset(
            "assets/icons/homepage.png",
            height: 45,
            width: 40,
          ),
          Image.asset(
            "assets/icons/marks.png",
            height: 45,
            width: 40,
          ),
          Image.asset(
            "assets/icons/profile.png",
            height: 45,
            width: 40,
          )
        ],
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 54, 50, 138),
        animationDuration: const Duration(milliseconds: 500),
      ),
      body: Container(
        child: getSelectedWidget(index:index),
      ),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = const HomePage();
      break;
    case 1:
      widget = const HomePage();
      break;
    case 2:
      widget = const HomePage();
      break;
    case 3:
      widget = const HomePage();
      break;
    case 4:
      widget = const HomePage();
      break;
      default:
       widget = const HomePage();
      break;
  }
  return widget;
}
