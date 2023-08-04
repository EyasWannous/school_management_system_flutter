import 'package:student_app/applink.dart';
import 'package:student_app/view/screen/profile.dart';

import '../../core/crud.dart';

class ScheduleData {
  Crud crud;

  ScheduleData(this.crud);
  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.schedule, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
