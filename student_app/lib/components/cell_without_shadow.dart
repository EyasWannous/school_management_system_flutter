import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CellWithoutShadow extends StatelessWidget {
  final String textInCell;
  const CellWithoutShadow({
    Key? key,
    required this.textInCell,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Container(
        height: 22.h,
        width: 50.w,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 248, 248, 248),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Text(textInCell, style: Theme.of(context).textTheme.headline4),
      ),
    );
  }
}
