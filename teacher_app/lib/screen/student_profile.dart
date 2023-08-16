import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/my_colors.dart';
import '../controller/students_profile_controller.dart';

class StudentProfile extends StatelessWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 35,
                width: 35,
                child: Image.asset("assets/icons/bell (1).png"),
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      backgroundColor: MyColors.milkyWhite,
      body: GetBuilder<StudentProfileController>(
        init: StudentProfileController(),
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(children: [
                Container(
                  color: MyColors.milkyWhite,
                  height: 150.h,
                  child: Stack(
                    fit: StackFit.loose,
                    children: <Widget>[
                      Container(
                        height: 110.h,
                        width: 500.w,
                        decoration: BoxDecoration(
                          color: MyColors.royalBlue,
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(
                              200,
                            ),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              spreadRadius: 2,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 30,
                        left: 130,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundColor: MyColors.soLightBlue,
                          child: ClipOval(
                            child: Image.network(
                              controller.studentProfile.imageUrl!,
                              errorBuilder: (BuildContext context,
                                  Object object, StackTrace? stackTrace) {
                                return Image.asset(
                                    'assets/images/photo_2023-08-08_16-46-20.jpg');
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 115, bottom: 5),
                  child: Row(
                    children: [
                      RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: "${controller.studentProfile.firstName}",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: MyColors.royalBlue,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          TextSpan(
                            text: " ${controller.studentProfile.lastName}",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: MyColors.royalBlue,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          )
                        ]),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "  Class   ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 35.h,
                              width: 75.w,
                              decoration: BoxDecoration(
                                color: MyColors.milkyWhite,
                                borderRadius: BorderRadius.circular(20),
                                // color: Color.fromRGBO(169, 33, 33, 1),

                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 141, 168, 209)
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "${controller.studentProfile.gradeId}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: MyColors.royalBlue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            Text(
                              " Section ",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 141, 168, 209),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 35.h,
                                width: 75.w,
                                decoration: BoxDecoration(
                                  color: MyColors.milkyWhite,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(255, 141, 168, 209)
                                          .withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "${controller.studentProfile.sectionId}",
                                    style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: MyColors.royalBlue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            " Type ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11),
                            child: Container(
                              height: 35.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                color: MyColors.milkyWhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 141, 168, 209)
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "${controller.studentProfile.type}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: MyColors.royalBlue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "  Birthday  ",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 141, 168, 209),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 35.h,
                            width: 145.w,
                            decoration: BoxDecoration(
                              color: MyColors.milkyWhite,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 141, 168, 209)
                                      .withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  // offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "${controller.studentProfile.dateOfBirth}",
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: MyColors.royalBlue,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Column(
                        children: [
                          Text(
                            " Phone  ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Container(
                              height: 35.h,
                              width: 145.w,
                              decoration: BoxDecoration(
                                color: MyColors.milkyWhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 141, 168, 209)
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "${controller.studentProfile.phoneNumber}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: MyColors.royalBlue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "  Address ",
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Container(
                              alignment: Alignment.center,
                              height: 40.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                color: MyColors.milkyWhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 141, 168, 209)
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "${controller.studentProfile.address}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: MyColors.royalBlue,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "  About me ",
                            style: TextStyle(
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 9),
                            child: Container(
                              alignment: Alignment.center,
                              height: 60.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                color: MyColors.milkyWhite,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 141, 168, 209)
                                        .withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 6),
                                child: Text(
                                  "${controller.studentProfile.bio}",
                                  style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: MyColors.royalBlue,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
      ),
    );
  }
}
