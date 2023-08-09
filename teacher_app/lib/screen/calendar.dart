import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../components/calendar_header.dart';
import '../constant/days.dart';
import '../controller/table_calendar_controller.dart';
import '../model/event_model.dart';

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Table Calendar'),
      ),
      body: GetBuilder<TableCalendarController>(
        init: TableCalendarController(),
        builder: (controller) => Column(
          children: [
            // CalendarHeader(
            //   focusedDay: controller.focusedDay,
            //   clearButtonVisible: true,
            //   onTodayButtonTap: () => controller.onTodayButtonTap(),
            //   onClearButtonTap: () => controller.onClearButtonTap(),
            //   onLeftArrowTap: () => controller.onLeftArrowTap(),
            //   onRightArrowTap: () => controller.onRightArrowTap(),
            // ),

            TableCalendar(
              weekendDays: const [DateTime.friday, DateTime.saturday],
              startingDayOfWeek: StartingDayOfWeek.sunday,
              firstDay: Days.firstDay,
              lastDay: Days.lastDay,
              focusedDay: controller.focusedDay,
              calendarFormat: controller.calendarFormat,
              headerVisible: true,

              onCalendarCreated: (tableController) =>
                  controller.onCalendarCreated(tableController),

              onDaySelected: (selectedDay, focusedDay) =>
                  controller.onDaySelected(selectedDay, focusedDay),

              onFormatChanged: (format) => controller.onFormatChanged(format),

              onPageChanged: (focusedDay) =>
                  controller.onPageChanged(focusedDay),

              holidayPredicate: (dateTime) =>
                  controller.holidayPredicate(dateTime),

              selectedDayPredicate: (day) =>
                  controller.selectedDayPredicate(day),

              eventLoader: (day) => controller.getEventsForDay(day),

              ///
              calendarBuilders: CalendarBuilders(
                // selectedBuilder: (context, day, focusedDay) => Center(
                //   child: Text(
                //     DateFormat.E().format(day),
                //     style: const TextStyle(color: Colors.red),
                //   ),
                // ),
                dowBuilder: (context, day) {
                  final text = DateFormat.E().format(day);
                  final isWeekend = day.weekday == DateTime.friday ||
                      day.weekday == DateTime.saturday;
                  return Center(
                    child: Text(
                      text,
                      style: isWeekend
                          ? const TextStyle(color: Colors.red)
                          : const TextStyle(),
                    ),
                  );
                },
                // markerBuilder: (context, day, events) {
                //   if (events.isNotEmpty) {
                //     return Container(
                //       width: 20,
                //       height: 20,
                //       alignment: Alignment.center,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(30),
                //         color: Colors.lightBlue,
                //       ),
                //       child: Text(
                //         '${events.length}',
                //         style: const TextStyle(color: Colors.white),
                //       ),
                //     );
                //   }
                //   return null;
                // },
              ),

              headerStyle: HeaderStyle(
                titleCentered: false,
                titleTextFormatter: (date, locale) =>
                    DateFormat.yMMMd(locale).format(date),

                formatButtonVisible: true,
                formatButtonShowsNext: false,
                formatButtonPadding:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                // titleTextFormatter: (date, locale) => ,

                formatButtonDecoration: BoxDecoration(
                  // border: Border.fromBorderSide(BorderSide(color: Colors.blue)),
                  borderRadius: const BorderRadius.all(Radius.circular(12.0)),
                  gradient: LinearGradient(
                    colors: [
                      MyColors.royalBlue,
                      MyColors.royalBlue.withOpacity(0.4),
                    ],
                  ),
                ),

                // decoration: BoxDecoration(
                //   gradient: LinearGradient(
                //     colors: [
                //       Colors.deepPurple,
                //       Colors.deepPurpleAccent.withOpacity(0.2),
                //     ],
                //     begin: Alignment.topRight,
                //     end: Alignment.bottomLeft,
                //   ),
                //   // shape:
                // ),
                // formatButtonTextStyle: ,
              ),

              calendarStyle: const CalendarStyle(
                // rowDecoration: BoxDecoration(
                //   color: Color.fromARGB(255, 236, 162, 255),
                //   shape: BoxShape.circle,
                // ),
                holidayDecoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Color.fromARGB(255, 236, 162, 255),
                      width: 1.4,
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
                markersAlignment: Alignment.bottomCenter,
                markersAutoAligned: true,
                markerDecoration: BoxDecoration(
                  color: Color.fromARGB(255, 1, 124, 22),
                  shape: BoxShape.circle,
                ),
                weekNumberTextStyle:
                    TextStyle(fontSize: 12, color: Colors.amber),
                weekendTextStyle: TextStyle(color: Colors.red),
                weekendDecoration: BoxDecoration(
                  border: Border.fromBorderSide(
                    BorderSide(
                      color: Color.fromARGB(255, 244, 3, 3),
                      width: 1.4,
                    ),
                  ),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF5C6BC0),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // ...controller.getEventsForDay(controller.selectedDay).map(
            //       (Event event) => ListTile(
            //         title: Text(
            //           event.title,
            //         ),
            //       ),
            //     ),

            Expanded(
              child: ListView.builder(
                itemCount:
                    controller.getEventsForDay(controller.selectedDay).length,
                itemBuilder: (context, index) {
                  Event event =
                      controller.getEventsForDay(controller.selectedDay)[index];
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              MyColors.royalBlue,
                              MyColors.royalBlue.withOpacity(0.4),
                            ],
                          ),
                        ),
                        child: ListTile(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          )),
                          dense: true,
                          // style: Theme.of(context).listTileTheme,

                          contentPadding: const EdgeInsets.all(8),
                          title: Center(child: Text(event.title)),
                          subtitle: Center(child: Text(event.content)),
                          onTap: () => print(event.title),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                },
              ),
            ),

            FloatingActionButton.extended(
              onPressed: () => Get.dialog(
                AlertDialog(
                  title: const Text("Add Event"),
                  content: TextFormField(
                    controller: controller.eventController,
                  ),
                  actions: [
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Get.back(),
                    ),
                    TextButton(
                      child: const Text("Ok"),
                      onPressed: () {
                        TextEditingController textInForm =
                            controller.eventController;
                        print(controller.holidays);
                        if (textInForm.text.isEmpty) {
                          return;
                        } else {
                          var listOfEvents =
                              controller.selectedEvents[controller.selectedDay];
                          if (listOfEvents != null) {
                            listOfEvents.add(
                              Event(
                                title: textInForm.text,
                                isHoliday: false,
                                content: '',
                              ),
                            );
                          } else {
                            listOfEvents = [
                              Event(
                                title: textInForm.text,
                                isHoliday: false,
                                content: '',
                              )
                            ];
                          }
                        }
                        Get.back();
                        controller.eventController.clear();
                        controller.update();
                      },
                    ),
                  ],
                ),
              ),
              label: const Text("Add Event"),
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
