import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:teacher_app/constant/my_colors.dart';

class MySnackBar {
  static void showSnackBar({required String title, required String message}) {
    Get.rawSnackbar(
      // title: title,
      message: message,
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: const Color(0xFF303030),
      backgroundGradient: LinearGradient(colors: MyColors.popupColors),

      margin: const EdgeInsets.all(0),
      // padding: const EdgeInsets.all(0),
      borderRadius: 0,
      // maxWidth: double.infinity,
      // titleText: Text(''),
      // messageText: Text(''),
      // overlayBlur: 1,
      duration: const Duration(seconds: 2),
      animationDuration: const Duration(seconds: 1),
    );
  }

  static void showBottomSheet() {
    Get.bottomSheet(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      isScrollControlled: true,
      // enableDrag: false,
      Container(
        // height:
        //     MediaQuery.of(context).size.height / 1.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        // color: Colors.white,
        child: Column(
          children: [
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(8),
                          width: 100,
                          height: 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            // color: sceondController
                            //     .barColor,
                          ),
                        ),
                      ],
                    ),
                    const Text('Choose the class'),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        // sceondController.sendData();
                      },
                      icon: const Icon(Icons.arrow_forward_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const Divider(height: 5),
            // TextButton(
            //   onPressed: () {},
            //   child: const Text('Send'),
            // ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount:
            //         sceondController.fromTo.length,
            //     itemBuilder: (context, index) {
            //       bool item =
            //           sceondController.fromTo[index];
            //       return Container(
            //         decoration: BoxDecoration(
            //           gradient: LinearGradient(
            //             colors: (item)
            //                 ? sceondController
            //                     .colorsForSelectedItem
            //                 : sceondController
            //                     .colorsForUnselectedItem,
            //             begin: Alignment.topRight,
            //             end: Alignment.bottomLeft,
            //           ),
            //         ),
            //         child: Padding(
            //           padding:
            //               const EdgeInsets.symmetric(
            //                   vertical: 4),
            //           child: ListTile(
            //             title: const Text('grade'),
            //             subtitle:
            //                 const Text('numberOfGrade'),
            //             selected: item,
            //             shape: RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.circular(0),
            //             ),
            //             onTap: () => sceondController
            //                 .selectanitem(index),
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
