import 'package:flutter/material.dart';
import 'package:student_app/view/screen/aboutsub.dart';
import 'package:student_app/view/screen/assignsub.dart';
import 'package:student_app/view/screen/marksub.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
Color darkblue= Color.fromRGBO(65, 105, 225,1);
Color white= Color.fromRGBO(244, 241, 241,1);
Color  lightblue= Color.fromRGBO(233, 238, 252,1);
class Subject extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: white,
      appBar: AppBar(
      title: Text("Physics"),
      bottom: 
       TabBar(
       isScrollable:true,
       indicatorSize: TabBarIndicatorSize.label,
       indicatorColor: lightblue,
       labelColor: lightblue,
       labelStyle: TextStyle( fontSize: 20.sp,fontWeight: FontWeight.w300),
       labelPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
              tabs: [
                Tab(


               // text: "About",
                 child: Row(
                   children: [
                    Text("About",style:TextStyle( fontFamily: 'Montserrat',fontSize: 18.sp),),

 
                             
                   ],
                 ),
                
                ),
               Tab(
               // text: "Assignments"
              
                          child: Row(
                   children: [
                    Text( "Assignments",style:TextStyle( fontFamily: 'Montserrat',fontSize: 18.sp),),

 
                             
                   ],
                 ),    
                  
                
                ),
                Tab(
                //  text: "Marks",
                                          child: Row(
                   children: [
                    Text( "Marks",style:TextStyle( fontFamily: 'Montserrat',fontSize: 18.sp),),

 
                             
                   ],
                 ),   
                ),
              ],
            ),
      
          
      
      ),
      
      body: TabBarView(
              children: [
                AboutSub(),
                AssignSub(),
                MarkSub()
              ],
      
      )
      ),
    );




  }
}
