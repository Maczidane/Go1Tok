import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class Helper extends GetxController {
  ///Snack Bars

  static successSnackBar({required title, message}) {
    Get.snackbar(
        title,
        message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: tWhiteColor,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 6),
      margin: const EdgeInsets.all(tDefaultSize - 10),
      icon: const Icon(LineIcons.checkCircle, color: tWhiteColor,)

    );
  }
  static modernSnackBar({required title, message}) {
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: tWhiteColor,
        backgroundColor: Colors.green,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(tDefaultSize - 10),
        icon: const Icon(LineIcons.checkCircle, color: tWhiteColor,)

    );
  }
  static warningSnackBar({required title, message}) {
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: tWhiteColor,
        backgroundColor: Colors.deepOrangeAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(tDefaultSize - 10),
        icon: const Icon(LineIcons.checkCircle, color: tWhiteColor,)

    );
  }
  static errorSnackBar({required title, message}) {
    Get.snackbar(
        title,
        message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: tWhiteColor,
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 6),
        margin: const EdgeInsets.all(tDefaultSize - 10),
        icon: const Icon(LineIcons.checkCircle, color: tWhiteColor,)

    );
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }


  static bool isLightMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.light;
  }

  static Size screenSize(){

    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){

    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(){

    return MediaQuery.of(Get.context!).size.width;
  }
}
