import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/colors.dart';
import 'package:student_app/controller/profilecontroller.dart';
import 'package:student_app/core/handlingdataview.dart';

Color mergedColor = lightblue.withOpacity(0.5).withGreen(white.green);



class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   ProfileController profilecontroller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Get.toNamed('/notify'),
              child: Container(
                height: 35,
                width: 35,
                child: Image.asset("assets/icons/bell (1).png"),
              ),
            ),
          )
        ],
      ),
//extendBody: true,

      backgroundColor: white,
      body: GetBuilder<ProfileController>(
        builder: (profilecontroller)
      =>
       Column(children: [
            Container(
              color: white,
              height: 150.h,
              child: Stack(
                fit: StackFit.loose,
                children: <Widget>[
                  Container(
                    height: 110.h,
        
                    width: 500.w,
        
                    // color: darkblue,
        
                    decoration: BoxDecoration(
                      color: darkblue,
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(200)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
        
                          spreadRadius: 2,
        
                          blurRadius: 5,
        
                          // offset: Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 130,
                    child: CircleAvatar(
                        radius: 70,
        
                        // backgroundImage: AssetImage('assets/images/pro.png'),
        
                        backgroundColor: lightblue
        
                        //   backgroundImage: ,
        
                        ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 110, bottom: 5),
              child: Row(
                children: [
                  Text("${profilecontroller.studentprofile.value!.firstName}",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: darkblue,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w800))
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
                      Text("  Class   ",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 35.h,
                          width: 75.w,
                          decoration: BoxDecoration(
                            color: white,
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
                              child: Text("{controller.employeeInfo.value!.gradeId}",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: darkblue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        Text(" Section ",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 141, 168, 209),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 35.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                              color: white,
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
                                child: Text("{controller.employeeInfo.value!.sectionId}",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: darkblue,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600))),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Text(" Type ",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 11),
                        child: Container(
                          height: 35.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: white,
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
                              child: Text("{controller.employeeInfo.value!.type}",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: darkblue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600))),
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
                    Text("  Birthday  ",
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Color.fromARGB(255, 141, 168, 209),
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        height: 35.h,
                        width: 145.w,
                        decoration: BoxDecoration(
                          color: white,
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
                            child: Text("{controller.employeeInfo.value!.dateOfBirth}",
                                style: TextStyle(
                                    fontFamily: 'Montserrat',
                                    color: darkblue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Text(" Phone  ",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Container(
                          height: 35.h,
                          width: 145.w,
                          decoration: BoxDecoration(
                            color: white,
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
                              child: Text("{controller.employeeInfo.value!.phoneNumber}",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: darkblue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600))),
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
                      Text("  Address ",
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Container(
                          height: 35.h,
                          width: 230.w,
                          decoration: BoxDecoration(
                            color: white,
        
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
                              child: Text("",
                                  style: TextStyle(
                                      fontFamily: 'Montserrat',
                                      color: darkblue,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w800))),
                        ),
                      ),
                    ],
                  ),
                 Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text("  Bus  ",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Color.fromARGB(255, 141, 168, 209),
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w400)),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Container(
                            height: 35.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              color: white,
        
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
                                child: Text("11",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: darkblue,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600))),
                          ),
                        ),
                      ],
                    ),
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
                      Text("  About me ",
                          style: TextStyle(
                              color: Color.fromARGB(255, 141, 168, 209),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 9),
                        child: Container(
                          height: 60.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            color: white,
        
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
                        
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 6),
                                child: Text( "{ controller.employeeInfo.value!.bio}",
                                    style: TextStyle(
                                        fontFamily: 'Montserrat',
                                        color: darkblue,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w800)),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color.fromARGB(255, 149, 177, 219), darkblue],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
        
                      color: darkblue,
        
                      borderRadius: BorderRadius.circular(50),
        
                      // color: Color.fromRGBO(169, 33, 33, 1),
        
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
        
                          spreadRadius: 2,
        
                          blurRadius: 4,
        
                          // offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: InkWell(
                      onTap: () => Get.toNamed('/marks'),
                      child: Center(
                          child: Text("Show my marks",
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800))),
                    ),
                  ),
                ],
              ),
            )
          ]),
        )
      ,
    );
  }
}
