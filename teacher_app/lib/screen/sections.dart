import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/controller/sections_controller.dart';
import '../components/part_of_grid.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sections'),
      ),
      body: GetBuilder<SectionsController>(
        init: SectionsController(),
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      backgroundBlendMode: BlendMode.colorDodge,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Flexible(
                          flex: 99,
                          child: Text('Choose Class :'),
                        ),
                        Flexible(
                          flex: 100,
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
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 190,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 30,
                        ),
                        itemCount: controller.numberOfClassesInGrade.length,
                        itemBuilder: (BuildContext context, int index) {
                          return PartOfGrid(
                            sectionId:
                                controller.numberOfClassesInGrade[index].id!,
                            sectionNumber: controller
                                .numberOfClassesInGrade[index].number!,
                            sectionIcon: const Icon(Icons.add),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
