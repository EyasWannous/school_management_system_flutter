import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/colors.dart';
import 'package:student_app/controller/coursescontroller.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("8".tr),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () => Get.toNamed('/notify'),
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset("assets/icons/bell (1).png"),
              ),
            ),
          )
        ],
      ),
      extendBody: true,
      body:
          //   coursescontroller.isLoading?Center(child: CircularProgressIndicator(),):
          GetBuilder<CoursesController>(
        builder: ((coursescontroller) => ListView.builder(
              scrollDirection: Axis.vertical,
              // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //   maxCrossAxisExtent: 400,
              //   childAspectRatio: 1.9,
              //   crossAxisSpacing: 30,
              //   mainAxisSpacing: 1,
              // ),
              itemCount: coursescontroller.coursesList.length,
              itemBuilder: (BuildContext context, int index) {
                log("+++++++++++++++++++++++++++++++++++++");
                return InkWell(
                  child: Container(
                    height: 140.h,
                    width: 145.w,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(233, 238, 252, 1),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 95, 109, 154)
                              .withOpacity(0.5),
                          spreadRadius: 6,
                          blurRadius: 7,

                          // offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          "assets/icons/relativity.png",
                          height: 90,
                          width: 90,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                            "{coursescontroller.coursesList[index].name}",
                            style: Theme.of(context).textTheme.displayLarge),
                      )
                    ]),
                  ),
                  onTap: () {
                    log("jfjf");
                  },
                );
              },
            )),
      ),
    );
  }
}
