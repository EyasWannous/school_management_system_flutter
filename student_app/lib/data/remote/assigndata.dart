import 'package:student_app/applink.dart';
import '../../core/crud.dart';

class AssignData {
  Crud crud;

  AssignData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.assign, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}