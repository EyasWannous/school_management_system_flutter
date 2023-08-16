import 'package:get/get.dart';
import 'package:teacher_app/model/posts_by_section_model.dart';
import '../model/posts_model.dart';
import '../services/rest_api_get.dart';

class PostsController extends GetxController {
  bool isLoading = true;

  List<PostsTS> posts = [];

  @override
  void onInit() async {
    await fetchDaysData();

    super.onInit();
  }

  fetchDaysData() async {
    isLoading = true;
    update();

    posts.clear();
    posts = await RestAPIGet.getpoststoshow('${Get.arguments[0]}');
    // print(posts[0].attachments![0].fileUrl);

    if (posts.isEmpty) {
      posts = [];
      update();
      return;
    }

    isLoading = false;
    update();
  }
}
