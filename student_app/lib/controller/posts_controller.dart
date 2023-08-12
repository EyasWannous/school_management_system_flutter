import 'package:get/get.dart';

import '../models/show_post_model.dart';
import '../services/rest_api_get.dart';

class PostsController extends GetxController {
  bool isLoading = true;

  List<PostsToShow> posts = [];

  @override
  void onInit() async {
    await fetchDaysData();

    super.onInit();
  }

  fetchDaysData() async {
    isLoading = true;
    update();

    posts.clear();
    posts = await RestAPIGet.getpoststoshow();

    if (posts.isEmpty) {
      posts = [];
      update();
      return;
    }

    isLoading = false;
    update();
  }
}
