import 'package:student_app/applink.dart';
import 'package:student_app/view/screen/profile.dart';

import '../../core/crud.dart';

class MarkSubFData {
  Crud crud;

  MarkSubFData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.marksub, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}


class MarkSubSData {
  Crud crud;

  MarkSubSData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.marksub, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}