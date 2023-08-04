import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:student_app/colors.dart';

class Select extends StatelessWidget {
  const Select({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 270),
        child: Column(children: [
          Text(
            "Login as : ",
            style: TextStyle(color: darkblue,fontFamily: 'Montserrat',
        fontWeight: FontWeight.w800,
        fontSize: 30.sp,)
          ),
Padding(
  padding: const EdgeInsets.symmetric(vertical: 30),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
  Container(
  
    
  
                            height: 35.h,
  
    
  
                            width: 200.w,
  
    
  
                            decoration: BoxDecoration(
  
     gradient: LinearGradient(
        colors: [Color.fromARGB(255, 149, 177, 219),darkblue ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
    ),
  
                              color:darkblue,
  
    
  
                              borderRadius: BorderRadius.circular(50),
  
    
  
                             // color: Color.fromRGBO(169, 33, 33, 1),
  
    
  
                     
  
    
  
                        boxShadow: [
  
    
  
                          BoxShadow(
  
    
  
                            color: Colors.grey,
  
    
  
                            spreadRadius: 2,
  
    
  
                            blurRadius: 4,
  
    
  
                           // offset: Offset(0, 3),
  
    
  
                          ),
  
    
  
                        ],
  
    
  
                      
  
    
  
                            ),
  
    
  
                            child: InkWell(
                              onTap: () =>  Get.toNamed('/login'),
                            
                              child: Center(
                              
                                
                              
                                  child: Text("Student",
                              
                                
                              
                                      style: TextStyle( fontFamily: 'Montserrat',color:white,fontSize: 20.sp,fontWeight: FontWeight.w800))),
                            ),
  
    
  
                          ),
  
    
  
  
  
  
  
  ],),
),

Padding(
  padding: const EdgeInsets.symmetric(vertical: 25),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
  Container(
  
    
  
                            height: 35.h,
  
    
  
                            width: 200.w,
  
    
  
                            decoration: BoxDecoration(
  
     gradient: LinearGradient(
        colors: [Color.fromARGB(255, 149, 177, 219),darkblue ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
    ),
  
                              color:darkblue,
  
    
  
                              borderRadius: BorderRadius.circular(50),
  
    
  
                             // color: Color.fromRGBO(169, 33, 33, 1),
  
    
  
                     
  
    
  
                        boxShadow: [
  
    
  
                          BoxShadow(
  
    
  
                            color: Colors.grey,
  
    
  
                            spreadRadius: 2,
  
    
  
                            blurRadius: 4,
  
    
  
                           // offset: Offset(0, 3),
  
    
  
                          ),
  
    
  
                        ],
  
    
  
                      
  
    
  
                            ),
  
    
  
                            child: InkWell(
                              onTap: () =>  Get.toNamed('/login'),
                              child: Center(
                              
                                
                              
                                  child: Text("Parent",
                              
                                
                              
                                      style: TextStyle( fontFamily: 'Montserrat',color:white,fontSize: 20.sp,fontWeight: FontWeight.w800))),
                            ),
  
    
  
                          ),
  
    
  
  
  
  
  
  ],),
)
        ]),
      ),
    );
  }
}
