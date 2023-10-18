import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constant/my_colors.dart';

class PartOfProfile extends StatelessWidget {
  final String textInTitle;
  final String textInPart;

  const PartOfProfile({
    super.key,
    required this.textInPart,
    required this.textInTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Column(
        children: [
          Text(
            textInTitle,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: const Color.fromARGB(255, 141, 168, 209),
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              // height: 35.h,
              // width: 75.w,
              decoration: BoxDecoration(
                color: MyColors.milkyWhite,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(255, 141, 168, 209).withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    textInPart,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: MyColors.royalBlue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
