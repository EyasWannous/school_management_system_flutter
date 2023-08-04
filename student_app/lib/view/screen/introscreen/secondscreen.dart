import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/colors.dart';


class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: white,
body: Column(children: [
Padding(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child:   Image.asset("assets/icons/Post-cuate.png",height:500.h,width: 500.w,),
),
Text("Support your knowledge by posts",style: Theme.of(context).textTheme.headline1,)

]),
    );
  }
}