import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/components/part_of_schedule.dart';
import 'package:teacher_app/controller/schedule_controller.dart';
import 'package:teacher_app/model/schedule_model.dart';

import '../custom/vertical_line_painter.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Home Page',
        ),
        actions: const [
          Icon(Icons.notifications),
        ],
      ),
      drawer: null,
      body: GetBuilder<ScheduleController>(
        init: ScheduleController(),
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Flexible(
                          child: Text('Select day :'),
                        ),
                        Flexible(
                          fit: FlexFit.tight,
                          child: DropdownButton(
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                            underline: const Text(''),
                            dropdownColor:
                                const Color.fromRGBO(233, 238, 252, 1),
                            borderRadius: BorderRadius.circular(15),
                            items: controller.dropdownItems.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Text(value),
                              );
                            }).toList(),
                            value: controller.selectedValue,
                            onChanged: (value) =>
                                controller.onDropdownChanged(value!),
                          ),
                        ),
                      ],
                    ),

                    const Divider(),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Time'),
                          ),
                          SizedBox(width: 40),
                          Expanded(
                            child: Text('Class'),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text('Day'),
                          ),
                        ],
                      ),
                    ),

                    // CustomPaint(
                    //   painter: VerticalLinePainter(),
                    // child:
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.scheduleItem.length,
                      itemBuilder: (context, index) {
                        ScheduleModel item = controller.scheduleItem[index];
                        return PartOfSchedule(
                          startTime: item.startAt!,
                          endTime: item.endAt!,
                          day: item.day!,
                          className: item.grade!,
                          sectionNumber: item.courseName!,
                        );
                      },
                    ),
                    // ),

                    /// [Delete] this
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Row(
                    //     children: [
                    //       Padding(
                    //         padding: const EdgeInsets.all(8.0),
                    //         child: Column(
                    //           children: const [
                    //             Text('Start'),
                    //             SizedBox(height: 15),
                    //             Text('End'),
                    //           ],
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: Container(
                    //           width: 200,
                    //           height: 80,
                    //           decoration: BoxDecoration(
                    //             gradient: LinearGradient(
                    //               colors: [
                    //                 Colors.deepPurpleAccent,
                    //                 Colors.deepPurpleAccent.withOpacity(0.3),
                    //               ],
                    //               begin: Alignment.bottomRight,
                    //               end: Alignment.topLeft,
                    //             ),
                    //             borderRadius: BorderRadius.circular(10.0),
                    //           ),
                    //           child: Column(
                    //             children: [
                    //               Padding(
                    //                 padding: const EdgeInsets.all(10.0),
                    //                 child: Row(
                    //                   children: const [
                    //                     Text('data'),
                    //                     Expanded(child: SizedBox(width: 1)),
                    //                     Text('data'),
                    //                   ],
                    //                 ),
                    //               ),
                    //               Padding(
                    //                 padding: const EdgeInsets.only(left: 8.0),
                    //                 child: Row(
                    //                   children: const [
                    //                     Padding(
                    //                       padding:
                    //                           EdgeInsets.symmetric(horizontal: 8.0),
                    //                       child: Icon(Icons.add_a_photo),
                    //                     ),
                    //                     Text('data'),
                    //                   ],
                    //                 ),
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),

                    if (controller.scheduleItem.isEmpty)
                      const Text("You don't hava anything today"),
                    const Text('Some text below the Row'),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: null,
    );
  }
}
