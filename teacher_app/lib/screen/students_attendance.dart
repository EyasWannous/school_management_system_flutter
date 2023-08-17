import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/model/student_attendance_model.dart';

import '../controller/students_attendance_controller.dart';

class StudentsAttendance extends StatelessWidget {
  const StudentsAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsAttendanceController>(
      init: StudentsAttendanceController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Attendance'),
          // actions: [],
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
                            items: controller.gradeDropdownItems
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Text(value),
                              );
                            }).toList(),
                            value: controller.gradeSelectedValue,
                            onChanged: (value) =>
                                controller.onGradeDropdownChanged(value!),
                          ),
                        ),
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
                            items: controller.sectionDropdownItems
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                alignment: Alignment.center,
                                child: Text(value),
                              );
                            }).toList(),
                            value: controller.sectionSelectedValue,
                            onChanged: (value) =>
                                controller.onSectionDropdownChanged(value!),
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
                      itemCount: controller.studentsAttendance.length,
                      itemBuilder: (context, index) {
                        AttendanceModel item =
                            controller.studentsAttendance[index];
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
                              // selectedTileColor: Color.fromRGBO(233, 238, 252, 1),
                              // tileColor: Color.fromRGBO(233, 238, 252, 1),
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
                              title: Text(item.name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2), // name fo students
                              subtitle: Text(
                                'absence: ${item.numberOfDays}',
                              ),
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
      ),
    );
  }
}
