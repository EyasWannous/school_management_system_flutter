import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Color darkblue= Color.fromRGBO(65, 105, 225,1);
Color white= Color.fromRGBO(244, 241, 241,1);
Color  lightblue= Color.fromRGBO(233, 238, 252,1);
class schedule extends StatelessWidget {
  const schedule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//appBar: AppBar(),
      body:
      Padding(
  padding: const EdgeInsets.symmetric(vertical: 15),
  child:   Container(
  
   height: 360.h,
  
            width: 500.w,
     
               decoration: BoxDecoration(
color:Color.fromRGBO(233, 238, 252,1),
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 95, 109, 154).withOpacity(0.5),
                      spreadRadius: 6,
                      blurRadius: 7,
                     // offset: Offset(0, 3),
                    ),
                  ],
                ),
  child:Column(children: [
Padding(
  padding: const EdgeInsets.all(7),
  child:   Row(children: [
  Padding(
    padding: const EdgeInsets.all(11),
    child: Container(
    height: 50.h,
    width: 46.w,
    child: Image.asset(
              "assets/icons/schedule (2).png",
              height: 60,
              width: 60,
            ),
    
    ),
  ),
 
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    height: 25.h,
    width: 50.w,
     decoration: BoxDecoration(
              color:darkblue,
                        borderRadius: BorderRadius.circular(5),
                      ),
    
    child: Center(child: Text("SUN",style: Theme.of(context).textTheme.headline2,)),
    
    ),
  ),

  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 25.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
                   color:darkblue,
                        borderRadius: BorderRadius.circular(5),
                      ),
    
    child: Center(child: Text("MON",style: Theme.of(context).textTheme.headline2,)),
    
    ),
  ),
Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 25.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                   color:darkblue,
    
                        borderRadius: BorderRadius.circular(5),
    
    
                      ),
    
    child: Center(child: Text("TUE",style: Theme.of(context).textTheme.headline2,)),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 25.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                   color:darkblue,
                        borderRadius: BorderRadius.circular(5),
    
                     
                      ),
    
    child: Center(child: Text("WED",style: Theme.of(context).textTheme.headline2,)),
    
    ),
  ),

  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 25.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    color:darkblue,
                  
                        borderRadius: BorderRadius.circular(5),
    
                      ),
    
    child: Center(child: Text("THU",style: Theme.of(context).textTheme.headline2,)),
    
    ),
  ),



  ],),
),
Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
                     color:darkblue,
                          borderRadius: BorderRadius.circular(20),

                        ),
  
      
  
      child: Center(child: Text("7:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                         color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
 
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                      color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                     
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                             color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),
Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
      
  
                    color:Color.fromRGBO(65, 105, 225,1),
  
      
  
                          borderRadius: BorderRadius.circular(20),
  
      
  
                        
  
      
  
                        ),
  
      
  
      child: Center(child: Text("8:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                         color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                    
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                      boxShadow: [
    
                          BoxShadow(
    
                            color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),
Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
      
  
                    color:Color.fromRGBO(65, 105, 225,1),
  
      
  
                          borderRadius: BorderRadius.circular(20),
  
      
  
                        
  
      
  
                        ),
  
      
  
      child: Center(child: Text("9:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                     boxShadow: [
    
                          BoxShadow(
    
                      color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
  
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                     boxShadow: [
    
                          BoxShadow(
    
                            color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                             color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),
Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
      
  
                    color:Color.fromRGBO(65, 105, 225,1),
  
      
  
                          borderRadius: BorderRadius.circular(20),
  
      
  
                        
  
      
  
                        ),
  
      
  
      child: Center(child: Text("10:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                           color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                   
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                         color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                    
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                             color:Color.fromRGBO(65, 105, 225,1).withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),
Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
      
  
                    color:Color.fromRGBO(65, 105, 225,1),
  
      
  
                          borderRadius: BorderRadius.circular(20),
  
      
  
                        
  
      
  
                        ),
  
      
  
      child: Center(child: Text("11:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                     color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                            color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                       color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),

Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
      
  
                    color:Color.fromRGBO(65, 105, 225,1),
  
      
  
                          borderRadius: BorderRadius.circular(20),
  
      
  
                        
  
      
  
                        ),
  
      
  
      child: Center(child: Text("12:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                              color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                  
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                      color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
  
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                              color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),
Padding(
  padding: const EdgeInsets.all(6),
  child:   Row(children: [
  
  Padding(
  
      padding: const EdgeInsets.all(4),
  
      child: Container(
  
      
  
      height: 23.h,
  
      
  
      width: 61.w,
  
      
  
       decoration: BoxDecoration(
  
      
  
                    color:Color.fromRGBO(65, 105, 225,1),
  
      
  
                          borderRadius: BorderRadius.circular(20),
  
      
  
                        
  
      
  
                        ),
  
      
  
      child: Center(child: Text("1:00",style: Theme.of(context).textTheme.headline3,)),
  
      
  
      ),
  
    ),
   Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                        boxShadow: [
    
                          BoxShadow(
    
                      color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                    
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                           color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  Padding(
    padding: const EdgeInsets.all(3),
    child: Container(
    
    height: 22.h,
    
    width: 50.w,
    
     decoration: BoxDecoration(
    
                    color: Color.fromARGB(255, 248, 248, 248),
    
                        borderRadius: BorderRadius.circular(3),
    
                       boxShadow: [
    
                          BoxShadow(
    
                          color:darkblue.withOpacity(0.5),
    
                            spreadRadius: 2,
    
                           // blurRadius: 5,
    
                          // offset: Offset(0, 3),
    
                           
    
                          ),
    
                        ],
    
                      ),
    
    child: Text(" Math",style: Theme.of(context).textTheme.headline4),
    
    ),
  ),
  ],),
),
  ]) ,
  
  
   ),
)
      
       
    );
  }
}