import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/homepage.dart';
import '../screen/homework.dart';
import '../screen/marks.dart';
import '../screen/post.dart';
import '../screen/sections.dart';

class BottomBarController extends GetxController {
  RxInt currentIndex = 2.obs;
  final List<Widget> pages = [
    const Post(),
    const Homework(),
    const Homepage(),
    const Marks(),
    const Sections(),
  ];
}
