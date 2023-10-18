import 'dart:developer';

import 'package:student_app/applink.dart';
import '../../core/crud.dart';

class AboutsubData {
  Crud crud;

  AboutsubData(this.crud);

  getData() async {
    log("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.aboutsub, "");
    log('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
