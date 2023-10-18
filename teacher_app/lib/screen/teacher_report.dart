import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/teacher_report_controller.dart';
import 'package:teacher_app/services/search_marks.dart';

import '../constant/my_colors.dart';
import '../model/students_model.dart';

class TeacherAlert extends StatelessWidget {
  const TeacherAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TeacherAlertController>(
      init: TeacherAlertController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Alert'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate: SearchMarks(searchTerms: controller.searchList),
                  );
                },
                icon: const Icon(
                  Icons.search_outlined,
                  color: MyColors.milkyWhite,
                ),
              ),
            )
          ],
        ),
        // drawer: const MyDrawer(),
        body: Column(
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
                      style: Theme.of(context).textTheme.titleLarge,
                      underline: const Text(''),
                      dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                      borderRadius: BorderRadius.circular(15),
                      items: controller.gradeDropdownItems.map((String value) {
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
                      style: Theme.of(context).textTheme.titleLarge,
                      underline: const Text(''),
                      dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                      borderRadius: BorderRadius.circular(15),
                      items:
                          controller.sectionDropdownItems.map((String value) {
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
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.students.length,
                itemBuilder: (context, index) {
                  Student item = controller.students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      tileColor: MyColors.soLightBlue,
                      leading: CircleAvatar(
                        backgroundColor: Colors.deepPurple.shade900,
                        child: ClipOval(
                          child: Image.network(
                            item.imageUrl!,
                            errorBuilder: (BuildContext context, Object object,
                                StackTrace? stackTrace) {
                              return Image.asset(
                                  'assets/images/photo_2023-08-08_16-46-20.jpg');
                            },
                          ),
                        ),
                      ), // Image of student
                      title: Text(
                          '${item.firstName!} ${item.middleName!} ${item.lastName!}'), // name fo students
                      // subtitle: Text('item'), // grade of student
                      selected: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      onTap: () => {
                        Get.dialog(
                          GetBuilder<TeacherAlertController>(
                            builder: (sceondController) => AlertDialog(
                              title: const Text(
                                "Alert",
                                textAlign: TextAlign.start,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Form(
                                    key: sceondController.formKey,
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Row(
                                            children: [
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text('Title'),
                                              ),
                                              Flexible(
                                                child: TextFormField(
                                                  controller: sceondController
                                                      .titleController,
                                                  validator: (value) {
                                                    if (value == null ||
                                                        value.trim().isEmpty) {
                                                      return 'Title is required';
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    fillColor: Colors.grey[200],
                                                    hintText:
                                                        'Enter your text here',
                                                    border:
                                                        UnderlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8.0),
                                          child: Flexible(
                                            child: TextFormField(
                                              controller: sceondController
                                                  .contentController,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Content is required';
                                                } else {
                                                  return null;
                                                }
                                              },
                                              decoration: const InputDecoration(
                                                filled: true,
                                                enabledBorder: InputBorder.none,
                                                focusedBorder: InputBorder.none,
                                                fillColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                hintText:
                                                    'Enter your text here',
                                              ),
                                              maxLines: 3,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => {
                                    if (sceondController.formKey.currentState!
                                        .validate())
                                      {
                                        sceondController.sendData('${item.id}'),
                                        Get.back(),
                                      }
                                  },
                                  child: const Text('Send'),
                                ),
                              ],
                            ),
                          ),
                          transitionCurve: Curves.easeInOut,
                          transitionDuration: const Duration(milliseconds: 450),
                        )
                      },
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
