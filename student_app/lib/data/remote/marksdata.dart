import 'package:student_app/applink.dart';
import '../../core/crud.dart';

class MarksData {
  Crud crud;

  MarksData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.marks, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
