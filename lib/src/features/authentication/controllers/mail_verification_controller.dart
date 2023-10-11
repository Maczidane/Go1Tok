

import 'dart:async';

import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MailVerificationController extends GetxController{

late Timer _timer;
  @override
  void onInit() {
    super.onInit();
    sendVerificationEmail();
    setTimerForAutoRedirect();
  }


  ///Send or Resend Email Verification

  void sendVerificationEmail() async{

    try{

      await AuthenticationRepository.instance.sendEmailVerification();

    }catch(e){
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());
    }
  }

  ///Set timer to check if verification Completed then Redirect

  void setTimerForAutoRedirect(){

    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {

      FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if(user!.emailVerified){
        timer.cancel();
        Get.snackbar("Success", "Verification successful.");

        AuthenticationRepository.instance.setInitialScreen(user);

      }
    });
  }


  ///Manually Check if Verification Completed then Redirect

void manuallyCheckEmailVerificationStatus(){

  FirebaseAuth.instance.currentUser?.reload();

  final user = FirebaseAuth.instance.currentUser;
  if(user!.emailVerified){

    Get.snackbar("Success", "Verification successful.",duration: const Duration(seconds: 5),backgroundColor: Colors.greenAccent,colorText: tWhiteColor, snackPosition: SnackPosition.BOTTOM);


    AuthenticationRepository.instance.setInitialScreen(user);

  }
}
}