import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/students_controller.dart';
import 'package:teacher_app/model/students_model.dart';
import 'package:teacher_app/services/serach_students.dart';

class Students extends StatelessWidget {
  const Students({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudentsController>(
      init: StudentsController(),
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
                      leading: CircleAvatar(
                        backgroundColor: Colors.blue,
                        // backgroundImage: NetworkImage(item.imageUrl!),
                      ), // Image of student
                      title: Text(
                          '${item.firstName!} ${item.middleName!} ${item.lastName!}'), // name fo students
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
                      onTap: () {}, // go to student profile
                    ),
                  );
                },
              ),
      ),
    );
  }
}
