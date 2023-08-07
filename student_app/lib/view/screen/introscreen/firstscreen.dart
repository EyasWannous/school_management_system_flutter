import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/colors.dart';

class firstScreen extends StatelessWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: white,
body: Column(children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical: 70,horizontal: 10),
  child:   Image.asset("assets/icons/college project-cuate.png",height: 400.h,width: 600.w,),
),
Text("Welcome to It's School !",style: Theme.of(context).textTheme.headline1,)

]),
    );
  }
}
