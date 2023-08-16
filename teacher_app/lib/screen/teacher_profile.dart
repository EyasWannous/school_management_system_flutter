import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:teacher_app/animation/fadeanimation.dart';
import 'package:teacher_app/components/part_of_profile.dart';

import '../constant/my_colors.dart';
import '../controller/teacher_profile_controller.dart';

class TeacherProfile extends StatelessWidget {
  const TeacherProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {},
              child: SizedBox(
                height: 35,
                width: 35,
                child: Image.asset("assets/icons/bell (1).png"),
              ),
            ),
          )
        ],
      ),
      body: GetBuilder<TeacherProfileController>(
        init: TeacherProfileController(),
        builder: (profileController) => profileController.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    color: MyColors.milkyWhite,
                    height: 150.h,
                    child: Stack(
                      fit: StackFit.loose,
                      children: <Widget>[
                        Container(
                          height: 110.h,
                          width: 500.w,
                          decoration: const BoxDecoration(
                            color: MyColors.royalBlue,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(200),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                spreadRadius: 2,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          // top: 30,
                          // left: 130,
                          child: CircleAvatar(
                            radius: 70,
                            // backgroundImage: AssetImage('assets/images/pro.png'),
                            backgroundColor: MyColors.soLightBlue,
                            child: ClipOval(
                              child: Image.network(
                                '', // profileController.teacher.imageUrl!,
                                errorBuilder: (BuildContext context,
                                    Object object, StackTrace? stackTrace) {
                                  return Image.asset(
                                      'assets/images/photo_2023-08-08_16-46-20.jpg');
                                },
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeAnimation(
                        delay: 1,
                        widgetChild: Text(
                          "${profileController.teacher.firstName} ${profileController.teacher.lastName}",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: MyColors.royalBlue,
                            fontSize: 26.sp,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        FadeAnimation(
                          delay: 1.2,
                          widgetChild: Flexible(
                            child: PartOfProfile(
                              textInPart: "${profileController.teacher.gender}",
                              textInTitle: " Section ",
                            ),
                          ),
                        ),
                        const FadeAnimation(
                          delay: 1.4,
                          widgetChild: Flexible(
                            child: PartOfProfile(
                              textInPart: "11",
                              textInTitle: "  Bus  ",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FadeAnimation(
                        delay: 1.3,
                        widgetChild: Flexible(
                          child: PartOfProfile(
                              textInPart:
                                  "${profileController.teacher.dateOfBirth}",
                              textInTitle: "  Birthday  "),
                        ),
                      ),
                      FadeAnimation(
                        delay: 1.5,
                        widgetChild: Flexible(
                          child: PartOfProfile(
                              textInPart:
                                  "${profileController.teacher.phoneNumber}",
                              textInTitle: " Phone  "),
                        ),
                      ),
                    ],
                  ),
                  FadeAnimation(
                    delay: 1.6,
                    widgetChild: Flexible(
                      flex: 2,
                      child: PartOfProfile(
                        textInPart: "${profileController.teacher.address}",
                        textInTitle: "  Address ",
                      ),
                    ),
                  ),
                  FadeAnimation(
                    delay: 1.8,
                    widgetChild: Flexible(
                      flex: 3,
                      child: PartOfProfile(
                        textInPart: "${profileController.teacher.bio}",
                        textInTitle: "  About me ",
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
