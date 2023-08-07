import 'package:student_app/applink.dart';
import 'package:student_app/view/screen/profile.dart';

import '../../core/crud.dart';

class ProfileData {
  Crud crud;

  ProfileData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.profile, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
