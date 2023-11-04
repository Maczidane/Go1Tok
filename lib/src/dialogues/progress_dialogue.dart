import 'package:dialogs/dialogs/message_dialog.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

import '../constants/colors.dart';
import '../features/authentication/screen/login/login_screen.dart';

class ProgressDialogue extends GetxController {
  static ProgressDialogue get instance => Get.find();

  late MessageDialog messageDialog ;
  late ProgressDialog pd;

  showProgressDialogue(String message, BuildContext context ){
    pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: false,
      msg: message,
      hideValue: true,

    );

  }


}