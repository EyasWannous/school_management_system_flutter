/*import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class LocaleController extends GetxController {
  Locale intialang =
      sharedpref!.getString("lang") == "en" ? Locale("en") : Locale("ar");
  void changeLang(String codelang) {
    Locale local = Locale(codelang);
    sharedpref!.setString("lang", codelang);
    Get.updateLocale(local);
  }
}*/