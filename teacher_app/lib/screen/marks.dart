import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/marks_controller.dart';
import 'package:teacher_app/services/search_marks.dart';

import '../constant/my_colors.dart';
import '../model/students_model.dart';

class Marks extends StatelessWidget {
  const Marks({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MarksController>(
      init: MarksController(
        gradeId: Get.arguments != null ? Get.arguments[0] : null,
        sectionId: Get.arguments != null ? Get.arguments[1] : null,
      ),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Marks'),
          // leading: Builder(
          //   builder: (BuildContext context) {
          //     return IconButton(
          //       icon: const Icon(
          //         Icons.menu,
          //         color: MyColors.milkyWhite, // Change Custom Drawer Icon Color
          //       ),
          //       onPressed: () {
          //         Scaffold.of(context).openDrawer();
          //       },
          //       tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          //     );
          //   },
          // ),
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
                      style: Theme.of(context).textTheme.headline6,
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
                      style: Theme.of(context).textTheme.headline6,
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
                          GetBuilder<MarksController>(
                            builder: (sceondController) => AlertDialog(
                              title: const Text(
                                "Title",
                                textAlign: TextAlign.start,
                              ),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  DropdownButton(
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    underline: const Text(''),
                                    dropdownColor:
                                        const Color.fromRGBO(233, 238, 252, 1),
                                    borderRadius: BorderRadius.circular(15),
                                    items: sceondController
                                        .markTypeDropdownItems
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        alignment: Alignment.center,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    value:
                                        sceondController.markTypeSelectedValue,
                                    onChanged: (value) => sceondController
                                        .onMarkTypeDropdownChanged(value!),
                                  ),
                                  DropdownButton(
                                    iconSize: 24,
                                    elevation: 16,
                                    isExpanded: true,
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    underline: const Text(''),
                                    dropdownColor:
                                        const Color.fromRGBO(233, 238, 252, 1),
                                    borderRadius: BorderRadius.circular(15),
                                    items: sceondController.coursesDropdownItems
                                        .map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        alignment: Alignment.center,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    value:
                                        sceondController.coursesSelectedValue,
                                    onChanged: (value) => sceondController
                                        .onCoursesDropdownChanged(value!),
                                  ),
                                  Form(
                                    key: sceondController.formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Row(
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text('Mark'),
                                          ),
                                          Flexible(
                                            child: TextFormField(
                                              controller: sceondController
                                                  .markController,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.trim().isEmpty) {
                                                  return 'Mark is required';
                                                } else if (int.tryParse(
                                                            value) !=
                                                        null &&
                                                    int.tryParse(value)! <=
                                                        100 &&
                                                    int.tryParse(value)! >= 0) {
                                                  return null;
                                                } else {
                                                  return 'between 0 and 100';
                                                }
                                              },
                                              decoration: InputDecoration(
                                                filled: true,
                                                fillColor: Colors.grey[200],
                                                hintText:
                                                    'Enter your text here',
                                                border: UnderlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TextButton(
                                      onPressed: () => {
                                        if (sceondController
                                            .formKey.currentState!
                                            .validate())
                                          {
                                            sceondController
                                                .sendData('${item.id}')
                                          }
                                      },
                                      child: const Text('Add'),
                                    ),
                                  ),
                                ],
                              ),
                              // actions: [
                              //   MyTextButton(
                              //     onP: () {
                              //       Get.back();
                              //     },
                              //     childWidget: const Text('Close'),
                              //   ),
                              // ],
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
