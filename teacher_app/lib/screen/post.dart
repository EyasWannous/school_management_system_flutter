import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/components/my_drawer.dart';
import 'package:teacher_app/controller/post_controller.dart';

import '../constant/my_colors.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Post'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: MyColors.milkyWhite, // Change Custom Drawer Icon Color
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const MyDrawer(),
      body: GetBuilder<PostController>(
        init: PostController(),
        builder: (controller) => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: DropdownButton(
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      style: Theme.of(context).textTheme.headline6,
                      // hint: const Text('Type'),
                      underline: const Text(''),
                      dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                      borderRadius: BorderRadius.circular(15),
                      items: controller.typeDropdownItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.center,
                          child: Text(value),
                        );
                      }).toList(),
                      value: controller.typeSelectedValue,
                      onChanged: (value) =>
                          controller.onTypeDropdownChanged(value!),
                    ),
                  ),
                  Expanded(
                    child: DropdownButton(
                      iconSize: 24,
                      elevation: 16,
                      isExpanded: true,
                      style: Theme.of(context).textTheme.headline6,
                      underline: const Text(''),
                      dropdownColor: const Color.fromRGBO(233, 238, 252, 1),
                      borderRadius: BorderRadius.circular(15),
                      items: controller.gradeDropdownItems.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          alignment: Alignment.center,
                          child: Text(value),
                        );
                      }).toList(),
                      value: controller.gradeSelectedValue,
                      onChanged: (value) =>
                          controller.onGradeDropdownChanged(value!),
                    ),
                  ),
                ],
              ),

              Form(
                key: controller.formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Title :'),
                      ),
                      Flexible(
                        child: TextFormField(
                          controller: controller.titleController,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Title is required';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey[200],
                            hintText: 'Enter your text here',
                            border: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Flexible(
                fit: FlexFit.loose,
                child: TextField(
                  controller: controller.bodyController,
                  decoration: const InputDecoration(
                    filled: true,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    fillColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    hintText: 'Enter your text here',
                  ),
                  maxLines: 7,
                ),
              ),
              // Here will be an image
              if (controller.images!.isNotEmpty)
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 3,
                  child: ListView.builder(
                    itemCount: controller.images!.length,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Stack(
                        children: [
                          Center(
                            child: Image.file(
                              File(controller.images![index].path),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              iconSize: MediaQuery.of(context).size.width / 12,
                              icon: const Icon(Icons.clear),
                              color: Colors.white,
                              onPressed: () {
                                controller.images!.removeAt(index);
                                controller.update();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              if (controller.images!.isEmpty)
                SizedBox(height: MediaQuery.of(context).size.height / 3.3),

              // const SizedBox(height: 50),
              // SizedBox(height: MediaQuery.of(context).size.height / 12),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () => {
                        controller.pickImages(),
                      },
                      // style: Theme.of(context).textButtonTheme.style,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.add),
                          // SizedBox(width: 15),
                          Text('Image'),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () => {
                        if (controller.formKey.currentState!.validate())
                          {
                            controller.sendData(),
                            // Get.bottomSheet(
                            //   backgroundColor: Colors.white,
                            //   shape: const RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.only(
                            //       topLeft: Radius.circular(25.0),
                            //       topRight: Radius.circular(25.0),
                            //     ),
                            //   ),
                            //   isScrollControlled: true,
                            //   // enableDrag: false,
                            //   GetBuilder<PostController>(
                            //     builder: (sceondController) => Container(
                            //       height:
                            //           MediaQuery.of(context).size.height / 1.5,
                            //       decoration: const BoxDecoration(
                            //         borderRadius: BorderRadius.only(
                            //           topLeft: Radius.circular(25.0),
                            //           topRight: Radius.circular(25.0),
                            //         ),
                            //       ),
                            //       // color: Colors.white,
                            //       child: Column(
                            //         children: [
                            //           Stack(
                            //             children: [
                            //               Column(
                            //                 mainAxisAlignment:
                            //                     MainAxisAlignment.center,
                            //                 children: [
                            //                   Row(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Container(
                            //                         margin:
                            //                             const EdgeInsets.all(8),
                            //                         width: 100,
                            //                         height: 10,
                            //                         decoration: BoxDecoration(
                            //                           borderRadius:
                            //                               BorderRadius.circular(
                            //                                   50),
                            //                           color: sceondController
                            //                               .barColor,
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                   const Text('Choose the class'),
                            //                 ],
                            //               ),
                            //               Padding(
                            //                 padding: const EdgeInsets.all(8.0),
                            //                 child: Align(
                            //                   alignment: Alignment.centerRight,
                            //                   child: IconButton(
                            //                     onPressed: () {
                            //                       sceondController.sendData();
                            //                     },
                            //                     icon: const Icon(
                            //                         Icons.arrow_forward_outlined),
                            //                   ),
                            //                 ),
                            //               ),
                            //             ],
                            //           ),
                            //           const Divider(height: 5),
                            //           // TextButton(
                            //           //   onPressed: () {},
                            //           //   child: const Text('Send'),
                            //           // ),
                            //           Expanded(
                            //             child: ListView.builder(
                            //               itemCount:
                            //                   sceondController.fromTo.length,
                            //               itemBuilder: (context, index) {
                            //                 bool item =
                            //                     sceondController.fromTo[index];
                            //                 return Container(
                            //                   decoration: BoxDecoration(
                            //                     gradient: LinearGradient(
                            //                       colors: (item)
                            //                           ? sceondController
                            //                               .colorsForSelectedItem
                            //                           : sceondController
                            //                               .colorsForUnselectedItem,
                            //                       begin: Alignment.topRight,
                            //                       end: Alignment.bottomLeft,
                            //                     ),
                            //                   ),
                            //                   child: Padding(
                            //                     padding:
                            //                         const EdgeInsets.symmetric(
                            //                             vertical: 4),
                            //                     child: ListTile(
                            //                       title: const Text('grade'),
                            //                       subtitle:
                            //                           const Text('numberOfGrade'),
                            //                       selected: item,
                            //                       shape: RoundedRectangleBorder(
                            //                         borderRadius:
                            //                             BorderRadius.circular(0),
                            //                       ),
                            //                       onTap: () => sceondController
                            //                           .selectanitem(index),
                            //                     ),
                            //                   ),
                            //                 );
                            //               },
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          },
                      },
                      // style: Theme.of(context).textButtonTheme.style,
                      child: const Text('Send'),
                    ),
                    // TextButton(
                    //   onPressed: () {},
                    //   child: const Text('Send to ALL'),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
