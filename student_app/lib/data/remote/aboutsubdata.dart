import 'package:student_app/applink.dart';
import '../../core/crud.dart';

class AboutsubData {
  Crud crud;

  AboutsubData(this.crud);

  getData() async {
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    var response = await crud.GetData(AppLink.aboutsub, "");
    print('afterllllllllllllllllllllllllllllllllllllllllllllllllllllll');
    return response;
  }
}
