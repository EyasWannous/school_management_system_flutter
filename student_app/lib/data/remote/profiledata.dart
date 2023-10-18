import 'dart:developer';

import 'package:student_app/applink.dart';

import '../../core/crud.dart';

class ProfileData {
  Crud crud;

  ProfileData(this.crud);

  getData() async {
    log("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.profile, "");
    log('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
