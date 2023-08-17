// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/my_colors.dart';

import 'package:teacher_app/controller/part_of_grid_controller.dart';
import 'package:teacher_app/screen/assignments.dart';
import 'package:teacher_app/screen/marks.dart';
import 'package:teacher_app/screen/show_posts.dart';
import 'package:teacher_app/screen/students.dart';

import '../common/my_text_button.dart';

class PartOfGrid extends StatelessWidget {
  final int gradeId;
  final int sectionId;
  final int sectionNumber;
  final Icon sectionIcon;

  const PartOfGrid({
    Key? key,
    required this.gradeId,
    required this.sectionId,
    required this.sectionNumber,
    required this.sectionIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      splashColor: MyColors.color6,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // gradient: const LinearGradient(
          //   colors: [
          //     Colors.blueGrey,
          //     Colors.blue,
          //   ],
          //   begin: Alignment.bottomRight,
          //   end: Alignment.topLeft,
          // ),
        ),
        child: Card(
          // shape: Border.all(color: MyColors.testColor, width: 3),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: MyColors.claendarEventsColor, width: 3),
                    // top: BorderSide(color: MyColors.testColor, width: 3),
                    // left: BorderSide(color: MyColors.testColor, width: 3),
                    // right: BorderSide(color: MyColors.testColor, width: 3),
                    //   bottom: BorderSide.none,
                    // ),
                    gradient: const LinearGradient(
                      colors: [
                        MyColors.milkyWhite,
                        MyColors.milkyWhite,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),

                  /// Here maybe will be an [Icon]
                  child: const Center(
                    child: Text(
                      "Class Name",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      MyColors.claendarEventsColor,
                      MyColors.claendarEventsColor,
                      // MyColors.color11.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Text(
                    '$sectionNumber',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: const [
        //     Text(
        //       "Class Name",
        //       style: TextStyle(fontSize: 18),
        //     ),
        //     Text(
        //       "Section Number",
        //       style: TextStyle(fontSize: 14),
        //     ),
        //   ],
        // ),
      ),
      onTap: () {
        Get.dialog(
          /// maybe I will delete this [GetBuilder] and this [PartOfGridController]
          GetBuilder<PartOfGridController>(
            init: PartOfGridController(),
            builder: (controller) => AlertDialog(
              title: const Text(
                "Title",
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text('Students'),
                        onPressed: () => {
                          Get.to(() => const Students(),
                              arguments: [sectionId]),
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text('Marks'),
                        onPressed: () => {
                          Get.to(
                            () => const Marks(),
                            arguments: [gradeId, sectionId],
                          ),
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text('Assignments'),
                        onPressed: () => {
                          Get.to(() => const Assignments(),
                              arguments: [sectionId]),
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        child: const Text('Posts'),
                        onPressed: () => {
                          Get.to(() => const ShowPosts(),
                              arguments: [sectionId]),
                        },
                      ),
                    ),
                  ),
                ],
              ),
              // actions: [
              //   MyTextButton(
              //       text: 'Close',
              //       onP: () {
              //         close(context, null);
              //       },),
              // ],
            ),
          ),
          transitionCurve: Curves.easeInOut,
          transitionDuration: const Duration(milliseconds: 450),
        );
      },
    );
  }
}
