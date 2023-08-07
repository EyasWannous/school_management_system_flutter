import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color darkblue = Color.fromRGBO(65, 105, 225, 1);
Color white = Color.fromRGBO(244, 241, 241, 1);
Color lightblue = Color.fromRGBO(233, 238, 252, 1);
Color blue = Color.fromARGB(255, 141, 168, 209);

class Exams extends StatelessWidget {
  const Exams({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exams"),
      ),
      backgroundColor: white,
      body: Column(
        children: [
Container(color: blue,
height: 40.h,
alignment: Alignment.center,
  child: Row(children: [
  
  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 30),
  
                                  child: Text(
  
                                    "Date",
  
                                    style: Theme.of(context).textTheme.headline1,
  
                                  ),
  
                                ),
  
  Padding(
  
                                  padding: const EdgeInsets.only(left: 48),
  
                                  child: Text(
  
                                    "Times",
  
                                    style: Theme.of(context).textTheme.headline1,
  
                                  ),
  
                                ),
  Padding(
  
                                  padding: const EdgeInsets.only(left: 60),
  
                                  child: Text(
  
                                    "Subject",
  
                                    style: Theme.of(context).textTheme.headline1,
  
                                  ),
  
                                ),
  ],),
),

          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 400,
                  childAspectRatio: 7,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 2,
                ),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100.h,
                    width: 200.w,
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 141, 168, 209).withOpacity(0.5),
                          spreadRadius: 5,
                          // blurRadius: 7,
                          // offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                        child: Padding(
                          padding:
                              const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Row(
                            children: [
                              Text(
                                "Sun",
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  " 12/12/2022",
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 35),
                                child: Text(
                                  "9:00 ",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 75),
                                child: Text(
                                  "Math ",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      
                    ]),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
