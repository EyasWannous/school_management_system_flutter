import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/colors.dart';

class fourthScreen extends StatelessWidget {
  const fourthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: white,
body: Column(children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical:1,),
  child:   Image.asset("assets/icons/Events-cuate.png",height: 500.h,width: 500.w,),
),
Text("View your Schedule!",style: Theme.of(context).textTheme.headline1,)

]),
    );
  }
}