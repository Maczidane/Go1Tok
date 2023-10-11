import 'package:Go1Tok/src/features/authentication/screen/welcome/welcome_screen.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FadeInAnimationController extends GetxController{

  static FadeInAnimationController get find => Get.find();

  RxBool animate = false.obs;
  //RxBool visibility = false.obs;

  Future startSplashAnimation() async {
    await Future.delayed(Duration(milliseconds: 1000));

      animate.value = true;

      await Future.delayed(Duration(milliseconds: 5000));


      //visibility.value = true;





    Get.put(AuthenticationRepository());
    animate.value = false;


    //OnReady is already called in Authentication repository
    // so putting a navigator here is useless

    //Get.offAll(() => WelcomeScreen());
    //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WelcomePage()));
  }

  Future startAnimation() async {
    await Future.delayed(Duration(milliseconds: 500));

    animate.value = true;

  }
} 