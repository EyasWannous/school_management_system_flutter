import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:student_app/controller/bottombarcontroller.dart';
import 'package:student_app/parent/screen/report.dart';
import 'package:student_app/view/screen/assignsub.dart';
import 'package:student_app/view/screen/courses.dart';
import 'package:student_app/view/screen/homepage.dart';
import 'package:student_app/view/screen/marks.dart';
import 'package:student_app/view/screen/posts.dart';
import 'package:student_app/view/screen/profile.dart';

Color darkblue= Color.fromRGBO(65, 105, 225,1);
Color white= Color.fromRGBO(244, 241, 241,1);
Color  lightblue= Color.fromRGBO(233, 238, 252,1);
BottomBarController controller = Get.find();
class BottomBarPerent extends StatelessWidget {
  
final List<Widget> _pages = [
  const HomePage(),
 Courses(),
 Marks(),
const Report(),
 

    
  ];
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
              "assets/icons/homepage.png",
              height: 45,
              width: 50,
            ),
            Image.asset(
              "assets/icons/courses.png",
              height: 45,
              width: 50,
            ),
            
            Image.asset(
              "assets/icons/marks.png",
              height: 45,
              width: 50,
            ),
            Image.asset(
              "assets/icons/report.png",
              height: 45,
              width: 50,
            )
          ],
          backgroundColor: Color.fromRGBO(244, 241, 241, 1),
          height: 70,
          color: Color.fromRGBO(65, 105, 225, 1),
          animationDuration: Duration(milliseconds: 200),
           onTap: (index) {
            controller.currentIndex.value = index;
       //  Get.find<BottomBarController>().updateIndex(index);
},
        ),
      
      
    );
  }
}