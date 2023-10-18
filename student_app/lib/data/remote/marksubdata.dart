import 'dart:developer';

import 'package:student_app/applink.dart';

import '../../core/crud.dart';

class MarkSubFData {
  Crud crud;

  MarkSubFData(this.crud);

  getData() async {
    log("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.marksub, "");
    log('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}

class MarkSubSData {
  Crud crud;

  MarkSubSData(this.crud);

  getData() async {
    log("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.marksub, "");
    log('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
