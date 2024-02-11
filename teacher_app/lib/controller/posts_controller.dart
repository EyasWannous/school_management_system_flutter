import 'package:get/get.dart';
import 'package:teacher_app/model/posts_by_section_model.dart';
import 'package:teacher_app/services/rest_api_post.dart';
import '../services/rest_api_get.dart';

class ShowPostsController extends GetxController {
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
    // log(posts[0].attachments![0].fileUrl);

    if (posts.isEmpty) {
      posts = [];
      update();
      return;
    }

    isLoading = false;
    update();
  }

  deletePost(PostsTS deletedPost, String id) async {
    bool isDeleted = await RestAPIPost.postDelete(id);
    // log('$isDeleted');
    if (isDeleted) {
      // int ind = posts.indexOf(deletedPost);
      // log(posts[ind].id);
      posts.remove(deletedPost);
      // log(posts[ind].id);

      update();
    }
  }
}
