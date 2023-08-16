import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screen/homework.dart';
import '../screen/marks.dart';
import '../screen/post.dart';
import '../screen/sections.dart';

class PrincipleBottomBarController extends GetxController {
  RxInt currentIndex = 2.obs;
  final List<Widget> pages = [
    const Post(),
    const Homework(),
    const Sections(),
    const Marks(),
  ];
}
