import 'package:get/get.dart';
import 'package:teacher_app/screen/calendar.dart';
import 'package:teacher_app/screen/homework.dart';
import 'package:teacher_app/screen/login.dart';
import 'package:teacher_app/screen/marks.dart';
import 'package:teacher_app/screen/post.dart';
import 'package:teacher_app/screen/profile.dart';
import 'package:teacher_app/screen/sections.dart';
import 'package:teacher_app/screen/students.dart';
import 'package:teacher_app/screen/students_attendance.dart';
import '../screen/homepage.dart';

class MyRoutes {
  static const String homepage = '/homepage';
  static const String login = '/login';
  static const String calendar = '/calendar';
  static const String marks = '/marks';
  static const String homework = '/homework';
  static const String post = '/post';
  static const String profile = '/profile';
  static const String sections = '/sections';
  static const String students = '/students';
  static const String studentsAttendance = '/studentsAttendance';

  static final pages = [
    GetPage(
      name: MyRoutes.homepage,
      page: () => const Homepage(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: MyRoutes.login,
      page: () => const Login(),
      // middlewares: [MyMiddelware()],
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    GetPage(
      name: MyRoutes.calendar,
      page: () => const Calendar(),
    ),
    GetPage(
      name: MyRoutes.marks,
      page: () => const Marks(),
    ),
    GetPage(
      name: MyRoutes.homework,
      page: () => const Homework(),
    ),
    GetPage(
      name: MyRoutes.post,
      page: () => const Post(),
    ),
    GetPage(
      name: MyRoutes.profile,
      page: () => const Profile(),
    ),
    GetPage(
      name: MyRoutes.sections,
      page: () => const Sections(),
    ),
    GetPage(
      name: MyRoutes.students,
      page: () => const Students(),
    ),
    GetPage(
      name: MyRoutes.studentsAttendance,
      page: () => const StudentsAttendance(),
    ),
  ];
}
