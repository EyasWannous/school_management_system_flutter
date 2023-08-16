import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/my_colors.dart';
import 'package:teacher_app/controller/Drawer_controller.dart';
import 'package:teacher_app/screen/calendar.dart';

import '../screen/students_attendance.dart';

class PrincipleDrawer extends StatelessWidget {
  const PrincipleDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      init: MyDrawerController(),
      builder: (controller) => Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                "Eyas Wannous",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 18.sp,
                  color: MyColors.soLightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: Text(
                "eyas@itsschool.sy",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 10.sp,
                  color: MyColors.soLightBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundColor: MyColors.soLightBlue,
              ),
              decoration: const BoxDecoration(color: MyColors.royalBlue),
            ),
            ListTile(
              title: Text(
                "Home page",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19.sp,
                  color: MyColors.littleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
              leading: Image.asset(
                "assets/icons/homepage.png",
                height: 35.h,
                width: 35.w,
              ),
            ),
            ListTile(
              title: Text(
                "Students Attendance",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19.sp,
                  color: MyColors.littleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.to(const StudentsAttendance());
              },
              leading: Image.asset(
                "assets/icons/absent.png",
                height: 35.h,
                width: 35.w,
              ),
            ),
            ListTile(
              title: Text(
                "Students Attendance",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19.sp,
                  color: MyColors.littleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Get.to(const StudentsAttendance());
              },
              leading: Image.asset(
                "assets/icons/training.png",
                height: 35.h,
                width: 35.w,
              ),
            ),
            ListTile(
              title: Text(
                "Calender",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19.sp,
                  color: MyColors.littleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Image.asset(
                "assets/icons/schedule (1).png",
                height: 35.h,
                width: 35.w,
              ),
              onTap: () {
                Get.to(const Calendar());
              },
            ),
            ListTile(
              title: Text(
                "Settings",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 19.sp,
                  color: MyColors.littleBlue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {},
              leading: Image.asset(
                "assets/icons/gear.png",
                height: 35.h,
                width: 35.w,
              ),
            )
          ],
        ),
      ),
    );
  }
}
