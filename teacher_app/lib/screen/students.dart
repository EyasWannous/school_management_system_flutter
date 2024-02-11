import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/students_controller.dart';
import 'package:teacher_app/model/students_model.dart';
import 'package:teacher_app/screen/student_profile.dart';
import 'package:teacher_app/services/serach_students.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      init: StudentsController(
        sectionId: Get.arguments[0],
      ),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Students'),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  showSearch(
                    context: context,
                    delegate:
                        SearchStudents(searchTerms: controller.searchList),
                  );
                },
                icon: const Icon(Icons.search_outlined),
              ),
            )
          ],
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.students.length,
                itemBuilder: (context, index) {
                  Student item = controller.students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListTile(
                      tileColor: const Color.fromRGBO(233, 238, 252, 1),
                      leading: ClipOval(
                        child: Image.network(
                          item.imageUrl!,
                          errorBuilder: (BuildContext context, Object object,
                              StackTrace? stackTrace) {
                            return Image.asset(
                                'assets/images/photo_2023-08-08_16-46-20.jpg');
                          },
                        ),
                      ),
                      title: Text(
                          '${item.firstName!} ${item.middleName!} ${item.lastName!}'),
                      trailing:
                          const Icon(Icons.arrow_forward), // may be arrow icon
                      // subtitle: Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //   children: [
                      //     Text(item.),
                      //     Text(item.),
                      //   ],
                      // ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      onTap: () {
                        Get.to(() => const StudentProfile(),
                            arguments: [item.id]);
                      }, // go to student profile
                    ),
                  );
                },
              ),
      ),
    );
  }
}
