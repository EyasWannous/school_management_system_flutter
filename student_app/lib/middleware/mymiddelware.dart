
/*
class MyMiddleware extends GetMiddleware {
  int? get priorty => 1;
  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.setString("onLastPage", "1")) {
      return RouteSettings(name: "/login");
    }
  }
}
*/