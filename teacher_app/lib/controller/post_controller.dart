import 'dart:io';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:teacher_app/services/rest_api_post.dart';
import 'package:teacher_app/constant/my_colors.dart';

import '../model/grade_model.dart';
import '../services/rest_api_get.dart';

class PostController extends GetxController {
  String typeSelectedValue = 'educational';
  List<String> typeDropdownItems = ['educational', 'news'];

  String gradeSelectedValue = 'grade';
  List<String> gradeDropdownItems = ['grade'];

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();
  final titleFormKey = GlobalKey<FormState>();
  final contentFormKey = GlobalKey<FormState>();

  List<bool> fromTo = [false, false, true, true, true];

  List<Grade> gradesList = [];

  // BottomSheet Valuables
  List<Color> colorsForUnselectedItem = MyColors.colorsForUnselectedItem;

  List<Color> colorsForSelectedItem = MyColors.colorsForSelectedItem;

  Color barColor = Colors.grey;
  // End BottomSheet Valuables
  final ImagePicker _picker = ImagePicker();
  List<XFile>? images = <XFile>[];

  pickImages() async {
    images!.addAll(await _picker.pickMultiImage());
    update();
    // log(images);
  }

  @override
  void onInit() {
    fetchAllGradesData();
    super.onInit();
  }

  fetchAllGradesData() async {
    gradesList = await RestAPIGet.getgrades();

    log('gradesList');
    log('$gradesList');

    if (gradesList.isEmpty) {
      gradeDropdownItems = ["it's Empty"];
      gradeSelectedValue = gradeDropdownItems[0];
      update();
      return;
    }

    gradeDropdownItems.clear();
    for (var element in gradesList) {
      gradeDropdownItems.add(element.name!);
    }
    gradeSelectedValue = gradeDropdownItems[0];

    update();
  }

  void onTypeDropdownChanged(String value) {
    if (typeSelectedValue == value) return;
    typeSelectedValue = value;
    update();
  }

  void onGradeDropdownChanged(String value) {
    if (gradeSelectedValue == value) return;
    gradeSelectedValue = value;
    update();
  }

  void selectanitem(int index) {
    fromTo[index] = !fromTo[index];
    update();
  }

  sendData() async {
    List<File> fileImages = [];
    if (images!.isNotEmpty) {
      for (var image in images!) {
        fileImages.add(File(image.path));
      }
    }

    Grade grade = gradesList.firstWhere(
      (element) => element.name == gradeSelectedValue,
      orElse: () => Grade(),
    );

    if (bodyController.text.trim() == '') {
      bodyController.text = 'itsEmpty';
    }

    await RestAPIPost.postImagesInPost(
      titleController.text,
      bodyController.text.trim(),
      typeSelectedValue,
      '${grade.id}',
      fileImages,
    );
    // await RestAPIPost.postImagesInPost(
    //   'titleController.text',
    //   "bodyController.text.trim()",
    //   typeSelectedValue,
    //   'grade.id',
    //   fileImages,
    // );
  }
}
