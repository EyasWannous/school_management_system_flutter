import 'package:flutter/material.dart';
import 'dart:math';

import 'package:teacher_app/constant/my_colors.dart';

class PartOfSchedule extends StatelessWidget {
  final String startTime;
  final String endTime;
  final String day;
  final String className;
  final String sectionNumber;

  const PartOfSchedule({
    super.key,
    required this.startTime,
    required this.endTime,
    required this.day,
    required this.className,
    required this.sectionNumber,
  });

  // Color _generateRandomColor() {
  //   final random = Random();
  //   return Color.fromRGBO(
  //     random.nextInt(256),
  //     random.nextInt(256),
  //     random.nextInt(256),
  //     1,
  //   );
  // }

  List<Color> _randomlyChooseColor() {
    final random = Random();
    int randomIndex = random.nextInt(MyColors.randomColorsInSchedule.length);
    Color choosenColor = MyColors.randomColorsInSchedule[randomIndex];
    return [
      choosenColor,
      choosenColor.withOpacity(0.3),
    ];
  }

  @override
  Widget build(BuildContext context) {
    // Generate random colors for the LinearGradient
    // final Color color1 = _generateRandomColor();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(startTime),
                const SizedBox(height: 15),
                Text(endTime),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    ..._randomlyChooseColor(),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Text(className),
                        const Spacer(),
                        Text(day),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: Icon(Icons.add_a_photo),
                        ),
                        // Expanded(
                        //   child: Align(
                        //     alignment: Alignment.center,
                        //     child: Text(sectionNumber),
                        //   ),
                        // ),
                        Text(sectionNumber),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
