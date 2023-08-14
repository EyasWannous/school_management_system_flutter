import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teacher_app/constant/my_colors.dart';

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
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
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
                    onFormatChanged: (format) =>
                        controller.onFormatChanged(format),
                    onPageChanged: (focusedDay) =>
                        controller.onPageChanged(focusedDay),
                    holidayPredicate: (dateTime) =>
                        controller.holidayPredicate(dateTime),
                    selectedDayPredicate: (day) =>
                        controller.selectedDayPredicate(day),
                    eventLoader: (day) => controller.getEventsForDay(day),
                    calendarBuilders: CalendarBuilders(
                      dowBuilder: (context, day) {
                        final text = DateFormat.E().format(day);
                        return Center(
                          child: Text(
                            text,
                            style: const TextStyle(color: MyColors.textColor),
                          ),
                        );
                      },
                    ),
                    headerStyle: HeaderStyle(
                      titleCentered: false,
                      titleTextFormatter: (date, locale) =>
                          DateFormat.yMMMd(locale).format(date),
                      formatButtonVisible: true,
                      formatButtonShowsNext: false,
                      formatButtonPadding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 4.0),
                      formatButtonDecoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        gradient: LinearGradient(
                          colors: [
                            MyColors.royalBlue,
                            MyColors.royalBlue.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                    calendarStyle: const CalendarStyle(
                      holidayTextStyle: TextStyle(color: MyColors.textColor),
                      holidayDecoration: BoxDecoration(
                        color: MyColors.claendarWeekendColor,
                        shape: BoxShape.circle,
                      ),
                      markersAlignment: Alignment.bottomCenter,
                      markersAutoAligned: true,
                      markerDecoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        shape: BoxShape.circle,
                      ),
                      weekendTextStyle: TextStyle(color: MyColors.textColor),
                      weekendDecoration: BoxDecoration(
                        color: MyColors.claendarWeekendColor,
                        shape: BoxShape.circle,
                      ),
                      selectedDecoration: BoxDecoration(
                        color: MyColors.royalBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  if (controller
                      .getEventsForDay(controller.selectedDay)
                      .isEmpty)
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'assets/icons/Events-cuate.png',
                          height: MediaQuery.of(context).size.height / 3.5,
                        ),
                        const Text('Nothing special yet'),
                      ],
                    ),
                  if (controller
                      .getEventsForDay(controller.selectedDay)
                      .isNotEmpty)
                    SizedBox(height: MediaQuery.of(context).size.height / 18),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller
                          .getEventsForDay(controller.selectedDay)
                          .length,
                      itemBuilder: (context, index) {
                        Event event = controller
                            .getEventsForDay(controller.selectedDay)[index];
                        return Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                MyColors.royalBlue,
                                MyColors.royalBlue.withOpacity(0.6),
                              ],
                            ),
                          ),
                          child: ListTile(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            dense: true,
                            contentPadding: const EdgeInsets.all(8),
                            leading: Text(
                              event.time,
                              style: const TextStyle(
                                color: MyColors.milkyWhite,
                              ),
                            ),
                            title: Center(
                              child: Text(
                                event.title,
                                style: const TextStyle(
                                  color: MyColors.milkyWhite,
                                ),
                              ),
                            ),
                            subtitle: Center(
                              child: Text(
                                event.content,
                                style: const TextStyle(color: Colors.white),
                              ),
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
