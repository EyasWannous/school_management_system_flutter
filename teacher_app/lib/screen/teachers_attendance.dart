import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/teachers_attendance_controller.dart';
import 'package:teacher_app/model/student_attendance_model.dart';

class TeachersAttendance extends StatelessWidget {
  const TeachersAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeachersAttendanceController>(
      init: TeachersAttendanceController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Attendance'),
          // actions: const [
          //   Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Icon(Icons.search_outlined),
          //   ),
          // ],
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(233, 238, 252, 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: DropdownButton(
                            iconSize: 24,
                            elevation: 16,
                            isExpanded: true,
                            style: Theme.of(context).textTheme.headline6,
                            underline: const Text(''),
                            dropdownColor:
                                const Color.fromRGBO(233, 238, 252, 1),
                            borderRadius: BorderRadius.circular(15),
                            items: controller.courseDropdownItems
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Text(value),
                              );
                            }).toList(),
                            value: controller.courseSelectedValue,
                            onChanged: (value) =>
                                controller.onCourseDropdownChanged(value!),
                          ),
                        ),
                        Flexible(
                          child: TextButton(
                            child: const Text('Send'),
                            onPressed: () => controller.sendData(),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.teachersAttendance.length,
                      itemBuilder: (context, index) {
                        AttendanceModel item =
                            controller.teachersAttendance[index];
                        return Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: (item.isAttendanceToday)
                                  ? controller.colorsForSelectedItem
                                  : controller.colorsForUnselectedItem,
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor:
                                    Color.fromRGBO(233, 238, 252, 1),
                                child: ClipOval(
                                  child: Image.network(
                                    item.imageUrl,
                                    errorBuilder: (BuildContext context,
                                        Object object, StackTrace? stackTrace) {
                                      return Image.asset(
                                          'assets/images/photo_2023-08-08_16-46-20.jpg');
                                    },
                                  ),
                                ),
                              ), // Image of student
                              title: Text(item.name), // name fo students
                              subtitle: Text('${item.numberOfDays}'),
                              selected: item.isAttendanceToday,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              onTap: () => controller.selectAnItem(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
        floatingActionButton: SizedBox(
          height: 45.h,
          width: 60.w,
          child: FloatingActionButton(
            child: const Text('Send'),
            onPressed: () {
              controller.sendData();
            },
          ),
        ),
      ),
    );
  }
}
