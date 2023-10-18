// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color darkblue = const Color.fromRGBO(65, 105, 225, 1);
Color white = const Color.fromRGBO(244, 241, 241, 1);
Color lightblue = const Color.fromRGBO(233, 238, 252, 1);

class CellDay extends StatelessWidget {
  final String dayInCell;
  const CellDay({
    Key? key,
    required this.dayInCell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 25.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: darkblue,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
            child: Text(
          dayInCell,
          style: Theme.of(context).textTheme.displayMedium,
        )),
      ),
    );
  }
}
