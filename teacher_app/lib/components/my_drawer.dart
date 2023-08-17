import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:teacher_app/constant/my_colors.dart';
import 'package:teacher_app/screen/calendar.dart';
import 'package:teacher_app/screen/students_attendance.dart';
import 'package:teacher_app/screen/teacher_report.dart';
import 'package:teacher_app/screen/teachers_attendance.dart';
import 'package:teacher_app/services/rest_api_post.dart';

import '../controller/Drawer_controller.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyDrawerController>(
      init: MyDrawerController(),
      builder: (controller) => controller.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Drawer(
              child: SafeArea(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: MyColors.soLightBlue,
                        child: ClipOval(
                          child: Image.network(
                            controller.teacher.imageUrl!,
                            errorBuilder: (BuildContext context, Object object,
                                StackTrace? stackTrace) {
                              return Image.asset(
                                  'assets/images/photo_2023-08-08_16-46-20.jpg');
                            },
                          ),
                        ),
                      ),
                      accountName: Text(
                        '${controller.teacher.firstName} ${controller.teacher.lastName}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 18.sp,
                          color: MyColors.soLightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      accountEmail: Text(
                        '${controller.teacher.username}',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 10.sp,
                          color: MyColors.soLightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration:
                          const BoxDecoration(color: MyColors.royalBlue),
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
                        Get.to(() => const StudentsAttendance());
                      },
                      leading: Image.asset(
                        "assets/icons/absent.png",
                        height: 35.h,
                        width: 35.w,
                      ),
                    ),
                    if (GetStorage().read('is_principle'))
                      ListTile(
                        title: Text(
                          "Teachers Attendance",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 19.sp,
                            color: MyColors.littleBlue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          Get.to(() => const TeachersAttendance());
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
                        Get.to(() => const Calendar());
                      },
                    ),
                    ListTile(
                      title: Text(
                        "Add Alert",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 19.sp,
                          color: MyColors.littleBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      leading: Image.asset(
                        "assets/icons/report.png",
                        height: 35.h,
                        width: 35.w,
                      ),
                      onTap: () {
                        Get.to(() => const TeacherReport());
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
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    ListTile(
                      title: Text(
                        "Logout",
                        // style: TextStyle(
                        //   fontFamily: 'Montserrat',
                        //   fontSize: 19.sp,
                        //   color: MyColors.littleBlue,
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                      onTap: () async {
                        await RestAPIPost.postlogout();
                      },
                      leading: Image.asset(
                        "assets/icons/gear.png",
                        height: 35.h,
                        width: 35.w,
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
