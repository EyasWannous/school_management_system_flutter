import 'package:get/get.dart';
import 'package:teacher_app/bindings/bottom_bar_binding.dart';
import 'package:teacher_app/components/bottom_bar.dart';
import 'package:teacher_app/screen/assignments.dart';
import 'package:teacher_app/screen/calendar.dart';
import 'package:teacher_app/screen/homework.dart';
import 'package:teacher_app/screen/login.dart';
import 'package:teacher_app/screen/marks.dart';
import 'package:teacher_app/screen/post.dart';
import 'package:teacher_app/screen/show_posts.dart';
import 'package:teacher_app/screen/splash_screen.dart';
import 'package:teacher_app/screen/student_profile.dart';
import 'package:teacher_app/screen/teacher_profile.dart';
import 'package:teacher_app/screen/sections.dart';
import 'package:teacher_app/screen/students.dart';
import 'package:teacher_app/screen/students_attendance.dart';
import 'package:teacher_app/screen/teacher_report.dart';
import 'package:teacher_app/screen/teachers_attendance.dart';
import '../components/principle_bottom_bar.dart';
import '../screen/homepage.dart';

class MyRoutes {
  static const String splashScreen = '/';
  static const String login = '/login';
  static const String teacherBottomBar = '/teacherbottombar';
  static const String principleBottomBar = '/principlebottombar';
  static const String homepage = '/homepage';
  static const String calendar = '/calendar';
  static const String marks = '/marks';
  static const String homework = '/homework';
  static const String assignments = '/assignments';
  static const String post = '/post';
  static const String showposts = '/showposts';
  static const String teacherProfile = '/teacherprofile';
  static const String studentProfile = '/studentprofile';
  static const String sections = '/sections';
  static const String students = '/students';
  static const String studentsAttendance = '/studentsattendance';
  static const String teachersAttendance = '/teachersAttendance';
  static const String teachersAlert = '/teachersAlert';

  static final pages = [
    GetPage(
      name: MyRoutes.splashScreen,
      page: () => const SplashScreen(),
      // middlewares: [MyMiddleware()],
    ),
    GetPage(
      name: MyRoutes.login,
      page: () => const Login(),
      // middlewares: [MyMiddleware()],
    ),
    GetPage(
      name: MyRoutes.teacherBottomBar,
      page: () => const BottomBar(),
      binding: BottomBarBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.principleBottomBar,
      page: () => const PrincipleBottomBar(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.homepage,
      page: () => const Homepage(),
    ),
    GetPage(
      name: MyRoutes.calendar,
      page: () => const Calendar(),
      transition: Transition.native,
      transitionDuration: const Duration(milliseconds: 300),
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
      name: MyRoutes.assignments,
      page: () => const Assignments(),
    ),
    GetPage(
      name: MyRoutes.post,
      page: () => const Post(),
    ),
    GetPage(
      name: MyRoutes.showposts,
      page: () => const ShowPosts(),
    ),
    GetPage(
      name: MyRoutes.teacherProfile,
      page: () => const TeacherProfile(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.studentProfile,
      page: () => const StudentProfile(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.sections,
      page: () => const Sections(),
    ),
    GetPage(
      name: MyRoutes.students,
      page: () => const Students(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.studentsAttendance,
      page: () => const StudentsAttendance(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.teachersAttendance,
      page: () => const TeachersAttendance(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: MyRoutes.teachersAlert,
      page: () => const TeacherAlert(),
      transition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
