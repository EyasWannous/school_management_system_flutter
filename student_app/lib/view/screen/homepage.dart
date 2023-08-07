import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:student_app/colors.dart';
import 'package:student_app/controller/schedulecontroller.dart';

int index = 2;
Color darkblue = Color.fromRGBO(65, 105, 225, 1);
Color white = Color.fromRGBO(244, 241, 241, 1);
Color lightblue = Color.fromRGBO(233, 238, 252, 1);

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     HomePageController homecontroller = Get.put(HomePageController());
    return Scaffold(
        //drawer: ,
         extendBody: true,
        appBar: AppBar(
          title: Text("1".tr),
  actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell( 
                onTap: () =>Get.toNamed('/notify'),
                child: Container(height: 35,width: 35,
              child: Image.asset("assets/icons/bell (1).png"),),),
            )
          ],


        ),
       drawer: Drawer(
        backgroundColor: white,
child: Column(children: [
UserAccountsDrawerHeader(accountName: Text("Sara Al Dalati" ,style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.sp,
                                color: lightblue,
                                fontWeight: FontWeight.bold,
                              )), accountEmail: Text("@sarada",style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 10.sp,
                                color: lightblue,
                                fontWeight: FontWeight.bold,
                              )),currentAccountPicture: CircleAvatar(backgroundColor: lightblue,),decoration: BoxDecoration(color: darkblue),),

ListTile(title:  Text("Home page" ,style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 19.sp,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              )),onTap: ()=>print(""),
                                leading:  Image.asset(
              "assets/icons/homepage.png",
              height: 35.h,
              width: 40.w,
            ),
                              ),


ListTile(title:  Text("Exams " ,style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 19.sp,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              )),onTap: ()=>print(""),
                              leading:  Image.asset(
              "assets/icons/homepage.png",
              height: 35.h,
              width: 40.w,
            ),
                              ),

                              ListTile(title:  Text("Calender " ,style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 19.sp,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              )),onTap: ()=>print(""),
                                leading:  Image.asset(
              "assets/icons/homepage.png",
              height: 35.h,
              width: 40.w,
            ),
                              ),
                              ListTile(title:  Text("Settings " ,style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 19.sp,
                                color: blue,
                                fontWeight: FontWeight.bold,
                              )),onTap: ()=>print(""),
                                leading:  Image.asset(
              "assets/icons/homepage.png",
              height: 35.h,
              width: 40.w,
            ),
                              )
]),



       ),
        body: GetBuilder<HomePageController>(builder:(homecontroller) 
          => Container(
            color: Color.fromRGBO(244, 241, 241, 1),
            child: Column(children: [
              Container(
                  height: 150.h,
                  width: 500.w,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text(
                            "  Assignments :                                           "
                                .tr,
                            style: Theme.of(context).textTheme.headline1),
                      ),
                      Container(
        width: 400.w,
        height: 96.h,
                        child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:600,
                              childAspectRatio: 1/2,
                              crossAxisSpacing: 1,
                              mainAxisSpacing: 2,
                            ),
                            itemCount: 8,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 7),
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text(
                                              " ",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w400,
                                                  color: darkblue),
                                            ),
                                            // titlePadding: ,
                                            backgroundColor: white,
                                            scrollable: true,
                                            content: Text(
                                              "cgkdgjgkgdrkghkghigrhkgrhhghghhigtyyymyiu3ri3",
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          );
                                        });
                                  },
                                  child: Container(
                                    height: 80.h,
                                    width: 130.w,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(244, 241, 241, 1),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color:
                                              Color.fromRGBO(65, 105, 225, 1)
                                                  .withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          //  offset: Offset(3, 3),
                                        ),
                                      ],
                                    ),
                                    child: Column(children: [
                                      Image.asset(
                                        "assets/icons/push-pin (1).png",
                                        height: 30,
                                        width: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                            " "),
                                      )
                                    ]),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  height: 360.h,
                  width: 500.w,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(233, 238, 252, 1),
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 95, 109, 154).withOpacity(0.5),
                        spreadRadius: 6,
                        blurRadius: 7,
                        // offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(children: [
                    Padding(
                      padding: const EdgeInsets.all(7),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(11),
                            child: Container(
                              height: 50.h,
                              width: 46.w,
                              child: Image.asset(
                                "assets/icons/schedule (2).png",
                                height: 60,
                                width: 60,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 25.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                "3".tr,
                                style: Theme.of(context).textTheme.headline2,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 25.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                "4".tr,
                                style: Theme.of(context).textTheme.headline2,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 25.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                "5".tr,
                                style: Theme.of(context).textTheme.headline2,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 25.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                "6".tr,
                                style: Theme.of(context).textTheme.headline2,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 25.h,
                              width: 53.w,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                  child: Text(
                                "7".tr,
                                style: Theme.of(context).textTheme.headline2,
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: darkblue,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "7:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(65, 105, 225, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "8:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(65, 105, 225, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "9:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(65, 105, 225, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "10:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(65, 105, 225, 1)
                                        .withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(65, 105, 225, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "11:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(65, 105, 225, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "12:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              height: 23.h,
                              width: 61.w,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(65, 105, 225, 1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                  child: Text(
                                "1:00",
                                style: Theme.of(context).textTheme.headline3,
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(3),
                            child: Container(
                              height: 22.h,
                              width: 50.w,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 248, 248, 248),
                                borderRadius: BorderRadius.circular(3),
                                boxShadow: [
                                  BoxShadow(
                                    color: darkblue.withOpacity(0.5),
        
                                    spreadRadius: 2,
        
                                    // blurRadius: 5,
        
                                    // offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Text(" Math",
                                  style: Theme.of(context).textTheme.headline4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              )
            ]),
          ),
        ));
  }
}
