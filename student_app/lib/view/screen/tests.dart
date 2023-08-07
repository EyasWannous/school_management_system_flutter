
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_app/core/handlingdataview.dart';

import '../../controller/testcontroller.dart'; 
/*
class Tests extends StatelessWidget {
  const Tests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(TestController());
    return Scaffold(

      appBar: AppBar(title: Text("Title") , 
     
      ),
      body: GetBuilder<TestController>(builder: (controller) {
        return HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) {
                  return Text("${controller.data}");
                }));
      }),
    );
  }
}
*/