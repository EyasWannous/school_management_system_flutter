import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:student_app/colors.dart';
GlobalKey<FormState> formstate = GlobalKey<FormState>();

  send() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      formdata.save();
      print(" done");
    } else {
      print(" notdone");
    }
  }
class Report extends StatelessWidget {
  const Report({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
appBar: AppBar(title: Text(" Report")),

body:Padding(
  padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 20),
  child:   Column(
    children: [
      Container(
      
                      height:350.h,
      
                      width: 500.w,
      
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
      
                      child:
      
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                          child: Column(
                            children: [
                              Padding(
      
                                padding: const EdgeInsets.symmetric(horizontal: 15),
      
                                child: Row(
      
                                  children: [
      
                                    Text(
                                              "From : ",
                                              style: Theme.of(context).textTheme.headline6,
                                            ),
     /*  Form(
        key: formstate,
         child: TextFormField(
         /*  onSaved: (text) {
             email = text;
           },*/
           keyboardType: TextInputType.emailAddress,
           validator: (text) {
             return (text != null && text.contains('@'))
                 ? null
                 : "you dont use the @ char";
           },
           cursorColor: darkblue,
           decoration: InputDecoration(
             counterStyle: TextStyle(color: darkblue),
             hintText: "Email",
             hintStyle: TextStyle(color: darkblue),
             filled: true,
             fillColor: lightblue,
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(30),
               borderSide: BorderSide.none,
             ),
            
           ),
         ),
       ),*/
                                    Text(
      
                                      "Soso   ",
      
                                      style: Theme.of(context).textTheme.bodyText1,
      
                                    ),
      
                                  ],
      
                                ),
      
                              ),

                             Padding(
      
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      
                              child: Row(
      
                                children: [
      
                                  Text(
      
                                            "To: ",
      
                                            style: Theme.of(context).textTheme.headline6,
      
                                          ),
      
                                  Text(
      
                                    "  ",
      
                                    style: Theme.of(context).textTheme.bodyText1,
      
                                  ),
      
                                ],
      
                              ),
      
                            ),
                              Padding(
      
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
      
                              child: Row(
      
                                children: [
      
                                  Text(
      
                                            "On : ",
      
                                            style: Theme.of(context).textTheme.headline6,
      
                                          ),
      
                                  Text(
      
                                    " ",
      
                                    style: Theme.of(context).textTheme.bodyText1,
      
                                  ),
      
                                ],
      
                              ),
      
                            ),
Padding(
      
                              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      
                              child: Row(
      
                                children: [
      
                                  Text(
      
                                            "Subject: ",
      
                                            style: Theme.of(context).textTheme.headline6,
      
                                          ),
      
                                  Text(
      
                                    "   ",
      
                                    style: Theme.of(context).textTheme.bodyText1,
      
                                  ),
      
                                ],
      
                              ),
      
                            ),


                            ],
                          ),
                        ),
                     ),

               Padding(
  padding: const EdgeInsets.symmetric(vertical: 30),
  child:   Row(
  
    mainAxisAlignment: MainAxisAlignment.center,
  
    children: [
  
  Container(
  
    
  
                          height: 35.h,
  
    
  
                          width: 100.w,
  
    
  
                          decoration: BoxDecoration(
  
     gradient: LinearGradient(
      colors: [Color.fromARGB(255, 149, 177, 219),darkblue ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  
                            color:darkblue,
  
    
  
                            borderRadius: BorderRadius.circular(5),
  
    
  
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
  
    
  
                          child: Center(
  
    
  
                              child: Text("Send",
  
    
  
                                  style: TextStyle(color:white,fontSize: 20.sp,fontWeight: FontWeight.w800))),
  
    
  
                        ),
  
    
  
  
  
  
  
  ],),
)      
    ],
  ),
  
                ),

    );
  }
}
