import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/components/my_drawer.dart';
import 'package:teacher_app/components/part_of_schedule.dart';
import 'package:teacher_app/constant/my_colors.dart';
import 'package:teacher_app/controller/schedule_controller.dart';
import 'package:teacher_app/model/schedule_model.dart';

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
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/icons/bell (1).png',
              height: 30,
              width: 30,
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
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
                    const Divider(),
                    if (controller.scheduleItem.isNotEmpty)
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

                    ///
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
                    if (controller.scheduleItem.isEmpty)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Image.asset(
                            'assets/icons/schedule (3).png',
                            height: MediaQuery.of(context).size.height / 3,
                          ),
                          SizedBox(height: 40.h),
                          const Text('Nothing special yet'),
                        ],
                      ),
                    // const Text('Some text below the Row'),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: null,
    );
  }
}
