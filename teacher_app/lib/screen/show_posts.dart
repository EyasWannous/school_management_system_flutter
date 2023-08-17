import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/my_colors.dart';
import 'package:teacher_app/model/posts_by_section_model.dart';

import '../constant/my_url.dart';
import '../controller/posts_controller.dart';

class ShowPosts extends StatelessWidget {
  const ShowPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Posts"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset("assets/icons/bell (1).png"),
              ),
            ),
          ),
        ],
      ),
      // extendBody: true,

      backgroundColor: MyColors.milkyWhite,
      body: GetBuilder<ShowPostsController>(
        init: ShowPostsController(),
        builder: (controller) => controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: controller.posts.length,
                itemBuilder: (BuildContext context, int index) {
                  PostsTS item = controller.posts[index];
                  return Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                      child: Container(
                        // height: 4.h,
                        // width: 200.w,
                        decoration: BoxDecoration(
                          color: MyColors.milkyWhite,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: MyColors.royalBlue.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              // offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    // backgroundImage:
                                    //     NetworkImage(item.teacher!.imageUrl!),
                                    backgroundColor: MyColors.soLightBlue,
                                    // backgroundImage: NetworkImage(),
                                    child: ClipOval(
                                      child: Image.network(
                                        item.teacher!.imageUrl!,
                                        errorBuilder: (BuildContext context,
                                            Object error,
                                            StackTrace? stackTrace) {
                                          return Image.asset(
                                              'assets/images/photo_2023-08-08_16-46-20.jpg');
                                        },
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    child: Column(
                                      children: [
                                        Text(
                                          // "Mr. Ahmed Mohsen",
                                          "${item.teacher!.firstName!} ${item.teacher!.lastName!} ",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            // "Physics Teacher",
                                            item.teacher!.course!.name!,
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              color: Colors.grey,
                                              fontSize: 11.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    onTap: () {
                                      print("go to his profile");
                                    },
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete_rounded,
                                      color: MyColors.warning,
                                    ),
                                    onPressed: () {
                                      Get.dialog(
                                        AlertDialog(
                                          title: const Text('Warning'),
                                          content: const Text('Are you sure?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                controller.deletePost(
                                                    item, '${item.id}');
                                                Get.back();
                                              },
                                              child: const Text('Ok'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: const Text('Close'),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Title : ",
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  Text(
                                    item.title!,
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Text(
                                      item.content!,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                  if (item.attachments != null ||
                                      item.attachments!.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: Container(
                                        height: 260.h,
                                        width: 330.w,
                                        // color: MyColors.soLightBlue,
                                        child: ListView.builder(
                                          scrollDirection: Axis
                                              .horizontal, // Scroll horizontally
                                          itemCount: item.attachments!.length,
                                          itemBuilder: (context, index) {
                                            return SizedBox(
                                              width: 330
                                                  .w, // Adjust the width as needed
                                              child: Image.network(
                                                '${MyURL.url.replaceAll('/api/', '')}${item.attachments![index].fileUrl!}',
                                                fit: BoxFit.contain,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 210, bottom: 15),
                              child: Text(
                                // "7 hours ago",
                                item.elapsedTime!,
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
