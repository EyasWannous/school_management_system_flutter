import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:student_app/view/screen/introscreen/firstscreen.dart';
import 'package:student_app/view/screen/introscreen/fourthscreen.dart';
import 'package:student_app/view/screen/introscreen/secondscreen.dart';
import 'package:student_app/view/screen/introscreen/thirdscreen.dart';

bool onLastPage = false;
//MyServices myServices = Get.find();

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  IntroState createState() => IntroState();
}

class IntroState extends State<Intro> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          onPageChanged: (index) {
            setState(() {
              onLastPage = (index == 3);
            });
          },
          controller: controller,
          children: const [
            firstScreen(),
            SecondScreen(),
            ThirdScreen(),
            fourthScreen()
          ],
        ),
        Container(
          alignment: const Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Text(
                  "skip",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                onTap: () {
                  controller.jumpToPage(3);
                },
              ),
              SmoothPageIndicator(
                controller: controller,
                count: 4,
              ),
              onLastPage
                  ? GestureDetector(
                      child: Text(
                        "done",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      onTap: () {
                        //  myServices.sharedPreferences.setString("onLastPage", "1");
                        Get.offNamed('/select');
                      },
                    )
                  : GestureDetector(
                      child: Text(
                        "next",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      onTap: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                    )
            ],
          ),
        )
      ],
    ));
  }
}
