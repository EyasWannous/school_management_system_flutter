import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/assignments_controller.dart';
import 'package:teacher_app/model/assignments_model.dart';

import '../constant/my_colors.dart';

class Assignments extends StatelessWidget {
  const Assignments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Assignments'),
      ),
      body: GetBuilder<AssignmentsController>(
        init: AssignmentsController(),
        builder: (controller) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 1.9,
            crossAxisSpacing: 30,
            mainAxisSpacing: 1,
          ),
          itemCount: controller.assignments.length,
          itemBuilder: (BuildContext context, int index) {
            AssignmentsToShow item = controller.assignments[index];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                height: 150.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: MyColors.milkyWhite,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: MyColors.royalBlue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      // offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            "${item.title}",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "${item.content}",
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 175, top: 10),
                      child: Text(
                        "${item.dueDate}",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  )
                ]),
              ),
            );
          },
        ),
      ),
    );
  }
}
