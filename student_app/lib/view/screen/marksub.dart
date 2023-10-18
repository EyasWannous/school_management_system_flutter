import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/controller/marksubcontroller.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);

class MarkSub extends StatelessWidget {
  const MarkSub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      backgroundColor: const Color.fromRGBO(244, 241, 241, 1),
      body: GetBuilder<MarkSubController>(
        builder: (marksubcontroller) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: SizedBox(
                height: 50.h,
                width: 150.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        "assets/icons/schedule (3).png",
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "First Term ",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 165.h,
                width: 500.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(233, 238, 252, 1),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 95, 109, 154)
                          .withOpacity(0.5),

                      spreadRadius: 6,

                      blurRadius: 9,

                      // offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 21),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        childAspectRatio: 2,
                        crossAxisSpacing: 100,
                        mainAxisSpacing: 35,
                      ),
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 3),
                              child: Text(
                                "${marksubcontroller.marksS.value!.type}",
                                style: Theme.of(context).textTheme.displayLarge,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 3),
                              child: Container(
                                height: 50.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 248, 248, 248),
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
                                child: Center(
                                    child: Text(
                                  "${marksubcontroller.marksS.value!.score}",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                )),
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
              child: SizedBox(
                height: 50.h,
                width: 165.w,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Image.asset(
                        "assets/icons/schedule (3).png",
                        height: 30.h,
                        width: 30.w,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2),
                      child: Text(
                        "Second Term",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 165.h,
                width: 500.w,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(233, 238, 252, 1),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 95, 109, 154)
                          .withOpacity(0.5),

                      spreadRadius: 6,

                      blurRadius: 9,

                      // offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 21),
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2,
                      crossAxisSpacing: 100,
                      mainAxisSpacing: 35,
                    ),
                    itemCount: 8,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 3),
                            child: Text(
                              "${marksubcontroller.marksS.value!.type}",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 3),
                            child: Container(
                              height: 50.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 248, 248, 248),
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
                              child: Center(
                                child: Text(
                                  "${marksubcontroller.marksS.value!.score}",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
