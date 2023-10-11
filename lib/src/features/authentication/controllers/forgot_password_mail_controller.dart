

import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_otp/forgot_password_otp.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordMailController extends GetxController{
  static ForgotPasswordMailController get instance => Get.find();

  //TextField Controller to get data from TextFields
  final email = TextEditingController();
  final isLoading = false.obs;


  Future <void> goToOTPScreen(String tEmail) async{


    Get.to(() => OTPScreen(  details: tEmail));
  }


  ///Send Reset link from Authentication Repository

  Future<void> sendResetLink(String email) async {

    isLoading.value = true;

    final auth = AuthenticationRepository.instance;
    await auth.resetUserPassword(email);
    isLoading.value = false;
    Get.snackbar("Link sent", "Password reset link sent successfully.",duration: const Duration(seconds: 5),backgroundColor: Colors.greenAccent, colorText: tWhiteColor, snackPosition: SnackPosition.BOTTOM);




  }



}