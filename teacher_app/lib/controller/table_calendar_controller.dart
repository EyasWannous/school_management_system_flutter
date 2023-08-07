import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:teacher_app/services/rest_api_get.dart';

import '../model/event_model.dart';

class TableCalendarController extends GetxController {
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  CalendarFormat calendarFormat = CalendarFormat.month;

  late PageController pageController;
  TextEditingController eventController = TextEditingController();

  List<DateTime> holidays = [];
  Map<DateTime, List<Event>> selectedEvents = {};

  @override
  onInit() {
    fetchCalendarData();
    super.onInit();
  }

  fetchCalendarData() async {
    Map<DateTime, List<Event>> temporary = await RestAPIGet.getevents();
    print(temporary);

    temporary.forEach(
      (key, value) {
        if (value.isEmpty) {
          return;
        } else if (value[0].isHoliday) {
          holidays.add(key);
        } else {
          selectedEvents[key] ??= [];
          selectedEvents[key]!.addAll(value);
        }
      },
    );
  }

  /// Functions for [TableCalendar]
  onDaySelected(selectedD, focusedD) {
    if (!isSameDay(selectedDay, selectedD)) {
      selectedDay = selectedD;
      focusedDay = focusedD;

      if (!selectedEvents.containsKey(selectedDay)) {
        selectedEvents[selectedDay] = getEventsForDay(selectedDay);
      }

      update();
    }
  }

  onFormatChanged(format) {
    if (calendarFormat != format) {
      calendarFormat = format;
      update();
    }
  }

  onPageChanged(focusedD) {
    focusedDay = focusedD;
    update();
  }

  onCalendarCreated(tableController) {
    pageController = tableController;
    // update();
  }

  holidayPredicate(dateTime) {
    // final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
    final formattedDate =
        DateTime.utc(dateTime.year, dateTime.month, dateTime.day);
    return holidays.contains(formattedDate);
  }

  bool selectedDayPredicate(day) => isSameDay(selectedDay, day);

  List<Event> getEventsForDay(DateTime day) => selectedEvents[day] ?? [];

  /// Functions for [CalendarHeader]
  onTodayButtonTap() {
    focusedDay = DateTime.now();
    update();
  }

  onClearButtonTap() {
    // selectedDays.clear();
    // selectedEvents = [];
    selectedEvents = {};
    update();
  }

  onLeftArrowTap() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  onRightArrowTap() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
