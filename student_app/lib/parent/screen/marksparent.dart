import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/colors.dart';
import 'package:student_app/controller/markscontroller.dart';
import 'package:student_app/controller/marksubcontroller.dart';

class MarksParent extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    MarksController markscontroller = Get.put(MarksController());
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          " Marks",
        ),
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
      backgroundColor: white,
      body: GetBuilder<MarksController>(
        builder: (markscontroller) => Container(
          color: blue,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: DropdownButton(
                        iconSize: 35,
                        iconEnabledColor: darkblue,
                        elevation: 16,
                       
                    
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 19.sp,
                          color: darkblue,
                          fontWeight: FontWeight.bold,
                        ),
                        underline: const Text(''),
                        dropdownColor: lightblue,
                        borderRadius: BorderRadius.circular(15),
                        items:
                           markscontroller .schoolyearItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(value),
                          );
                        }).toList(),
                        value: markscontroller .schoolyear,
                        onChanged: (value) => 
                          markscontroller.onDropdownChangedSchoolyear('$value')
                      
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50),
                      child: DropdownButton(
                        iconSize: 35,
                        iconEnabledColor: darkblue,
                        elevation: 16,
                        // isExpanded: true,
                        hint: Align(
                          alignment: Alignment.center,
                          child: Text('Term',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18.sp,
                                color: darkblue,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 19.sp,
                          color: darkblue,
                          fontWeight: FontWeight.bold,
                        ),
                        underline: const Text(''),
                        dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                        borderRadius: BorderRadius.circular(15),
                        items:  markscontroller.termItems.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            alignment: Alignment.center,
                            child: Text(value),
                          );
                        }).toList(),

                        value: markscontroller.term,
                        onChanged: (value) => {
                   markscontroller.onDropdownChangedTerm('$value')

                        },
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 500,
                      childAspectRatio: 4,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 1,
                    ),
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(

                          // color: lightblue,
                          height: 60.h,
                          width: 500.w,
                          decoration: BoxDecoration(
                            color: lightblue,

                            //  borderRadius: BorderRadius.circular(30),

                            // color: Color.fromRGBO(169, 33, 33, 1),

                            boxShadow: [
                              BoxShadow(
                                color: Color.fromARGB(255, 141, 168, 209)
                                    .withOpacity(0.5),

                                spreadRadius: 4,

                                //   blurRadius: 5,

                                // offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 40),
                                child: Image.asset(
                                  "assets/icons/relativity.png",
                                  height: 40.h,
                                  width: 40.w,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: TextButton(
                                  child: Text(
                                    "Math",
                                    //  "${controllermarks.marks.value!.courseName}",
                                    style:
                                        Theme.of(context).textTheme.headline1,
                                  ),
                                  onPressed: () {
                                    Get.toNamed('/subject');
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 55),
                                child: Container(
                                  height: 35.h,
                                  width: 85.w,
                                  decoration: BoxDecoration(
                                    color: white,

                                    borderRadius: BorderRadius.circular(30),

                                    // color: Color.fromRGBO(169, 33, 33, 1),

                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 161, 177, 201)
                                                .withOpacity(0.5),

                                        // spreadRadius: 4,

                                        blurRadius: 7,

                                        // offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                      child: Text(
                                          "", //"${controllermarks.marks.value!.finalScore}",
                                          style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: darkblue,
                                              fontSize: 23.sp,
                                              fontWeight: FontWeight.w800))),
                                ),
                              ),
                            ],
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
