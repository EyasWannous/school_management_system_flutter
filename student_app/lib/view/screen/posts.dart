import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/colors.dart';

Color darkblue = Color.fromRGBO(65, 105, 225, 1);
Color white = Color.fromRGBO(244, 241, 241, 1);
Color lightblue = Color.fromRGBO(233, 238, 252, 1);

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
         
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell( 
                onTap: () =>Get.toNamed('/notify'),
                child: Container(height: 35,width: 35,
              child: Image.asset("assets/icons/bell (1).png"),),),
            )
          ],
      ),
     // extendBody: true,
     
      backgroundColor: white,
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 400,
            childAspectRatio: 1/1.5,
            crossAxisSpacing: 30,
            mainAxisSpacing: 1,
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                height: 200.h,
                width: 200.w,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: darkblue.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      // offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: Row(
                      children: [
                        CircleAvatar(
                            radius: 30,
                            // backgroundImage: AssetImage('assets/images/pro.png'),
                            backgroundColor: lightblue
                            //   backgroundImage: ,
                            ),
                        TextButton(
                          child: Column(
                            children: [
                              Text(
                                "Mr. Ahmed Mohsen",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                               Padding(
                           padding: const EdgeInsets.only(right: 50,top: 2),
                           child: Text(
                              "Physics Teacher",
                               
                              style: TextStyle(
                                 fontFamily: 'Montserrat',
                                color: Colors.grey,fontSize: 11.sp,fontWeight: FontWeight.w300),
                            ),
                         ),
                            ],
                          ),
                          onPressed: () {
                            print(" go to his profile");
                          },
                        ),

                        
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      children: [
                        Text(
                                  "Title : ",
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                        Text(
                          "beo beo ahmad mohsen   ",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                  ),

                 
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Text(
                            "beo beo ahmad mohsen beo beo ahmad mohsenbeo beo ahmad mohsenbeo beo ahmad mohsenbeo beo ahmad ",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 10),
  child:   Container(height: 270.h,width: 330.w,color: lightblue,),
)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:230, ),
                    child: Text(
                      "7 hours ago",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  )
                ]),
              ),
            );
          }),
    );
  }
}
