import 'dart:developer';

import 'package:student_app/applink.dart';

import '../../core/crud.dart';

class ScheduleData {
  Crud crud;

  ScheduleData(this.crud);
  getData() async {
    log("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.schedule, "");
    log('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
