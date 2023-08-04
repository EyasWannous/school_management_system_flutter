import 'package:get/get.dart';
import 'package:student_app/data/remote/aboutsubdata.dart';
import 'package:student_app/data/remote/marksdata.dart';
import 'package:student_app/data/remote/profiledata.dart';
import 'package:student_app/model/marksmodel.dart';
import 'package:student_app/model/studentmodel.dart';

import 'package:get/get.dart';

import '../model/AboutsubModel.dart';

class MarksController extends GetxController {
  var marksList = <MarksModel>[];
 String schoolyear = 'School year';
  List<String> schoolyearItems = [
    'School year',
    '2022-2023',
    '2022-2021',
    '2021-2020'
  ];
  String term = 'Term';
  List<String> termItems = ['Term', 'First', 'Second'];

  late bool isLoading = true;

  final Rx<MarksModel?> marks = Rx<MarksModel?>(null);
  MarksData marksData = MarksData(Get.find());
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  void getData() async {
    try {
      //aboutsubList.clear();
      isLoading = true;
      update();
      print("cccccccccccccccccccccccccccccccccccccccc");
      var response = await marksData.getData();
      print(
          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
      isLoading = false;
      if (response["status"]) {
        for (var data in response["marks"]) {
          marksList.add(MarksModel.fromJson(data));
          // print(data);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  void onDropdownChangedSchoolyear(String value) {
    if (schoolyear == value) return;
    schoolyear = value;
    update();
  }


  void onDropdownChangedTerm(String value) {
    if (term == value) return;
    term = value;
    update();
  }
}
