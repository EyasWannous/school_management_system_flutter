import 'package:student_app/applink.dart';
import '../../core/crud.dart';

class CoursesData {
  Crud crud;

  CoursesData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.courses, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
