// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:teacher_app/controller/part_of_grid_controller.dart';

import '../common/my_text_button.dart';

class PartOfGrid extends StatelessWidget {
  final int sectionId;
  final int sectionNumber;
  final Icon sectionIcon;

  const PartOfGrid({
    Key? key,
    required this.sectionId,
    required this.sectionNumber,
    required this.sectionIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      // overlayColor: MaterialStateProperty.all<Color>(Colors.black),
      // hoverColor: Colors.blue,
      splashColor: Colors.red,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.teal,
                        Colors.teal.withOpacity(0.3),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
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
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.blue.withOpacity(0.3),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
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
                  SizedBox(
                    width: double.infinity,
                    child: MyTextButton(
                      childWidget: const Text('Students'),
                      onP: () => {},
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyTextButton(
                      childWidget: const Text('Marks'),
                      onP: () => {},
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyTextButton(
                      childWidget: const Text('HomeWork'),
                      onP: () => {},
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: MyTextButton(
                      childWidget: const Text('Posts'),
                      onP: () => {},
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

// content: AnimatedContainer(
//       duration: Duration(seconds: 1),
//       width: 200,
//       height: 200,
//       color: Colors.blue,
//     ),



// Get.dialog(
// AlertDialog(
//   title: const Text("Title"),
//   content: const Text("Content"),
//   actions: [
//     TextButton(
//       onPressed: () => Get.back(),
//       child: const Text("Close"),
//     ),
//   ],
// ),
// );



// Get.dialog(
//       GetBuilder<PartOfGridController>(
//         init: PartOfGridController(),
//         builder: (controller) {
//           return AnimatedOpacity(
//             opacity: controller.isDialogOpen ? 1.0 : 0.0,
//             duration: const Duration(milliseconds: 300),
//             child: AlertDialog(
//               title: const Text("Title"),
//               content: const Text("Content"),
//               actions: [
//                 TextButton(
//                   onPressed: () => Get.back(),
//                   child: const Text("Close"),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );