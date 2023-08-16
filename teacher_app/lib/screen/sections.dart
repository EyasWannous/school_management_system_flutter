import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/my_colors.dart';
import 'package:teacher_app/controller/sections_controller.dart';
import '../components/my_drawer.dart';
import '../components/part_of_grid.dart';

class Sections extends StatelessWidget {
  const Sections({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sections'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: MyColors.milkyWhite, // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
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
                      color: MyColors.milkyWhite,
                      // backgroundBlendMode: BlendMode.colorDodge,
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
                            style: Theme.of(context).textTheme.headline6,
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
                      color: MyColors.milkyWhite,
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
                          var item = controller.numberOfClassesInGrade[index];
                          return PartOfGrid(
                            gradeId: item.gradeId!,
                            sectionId: item.id!,
                            sectionNumber: item.number!,
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
