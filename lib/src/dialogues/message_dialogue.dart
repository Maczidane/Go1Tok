import 'package:dialogs/dialogs/message_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../features/authentication/screen/login/login_screen.dart';

class MessageDialogue extends GetxController {
  static MessageDialogue get instance => Get.find();

  late MessageDialog messageDialog ;

   showMessageDialogue(String title , String message, String action, Icon icon, BuildContext context ){
   messageDialog = MessageDialog(
      dialogBackgroundColor: Colors.white,
      buttonOkColor: tPrimaryColor,
      title: title,
      titleColor: Colors.black,
      message: message,
      messageColor: Colors.black,
      buttonOkText: 'Goto Login',

      buttonOkOnPressed: () {

        if(action.contains("Login")){

          Get.offAll(()=> const LoginScreen());

        }
      },

      dialogRadius: 15.0,
      buttonRadius: 18.0,
      iconButtonOk: icon,

      // buttonCancelOnPressed
    );

    messageDialog.show(context);
  }


}