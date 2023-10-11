import 'dart:ui';

import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/models/on_boarding_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/on_boarding/on_boarding_page_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:liquid_swipe/PageHelpers/LiquidController.dart';

class OnBoardingController extends GetxController{

  final  controller = LiquidController();

  RxInt currentPage = 0.obs;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tOnboardingTitle1,
          subTitle: tOnboardingSubTitle1,
          counterText: tOnboardingCounter1,

          textColor: "0",
          bgColor:  tOnBoardColor1),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage2,
          title: tOnboardingTitle2,
          subTitle: tOnboardingSubTitle2,
          counterText: tOnboardingCounter2,
          textColor: "1",

          bgColor: tOnBoardColor2),
    ),
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage3,
          title: tOnboardingTitle3,
          subTitle: tOnboardingSubTitle3,
          counterText: tOnboardingCounter3,
          textColor: "0",

          bgColor: tOnBoardColor3),
    ),
  ];

  onPageChangeCallback(int activePageIndex) {


    currentPage.value =  activePageIndex;


  }

  skip () =>  controller.jumpToPage(page: 2);


  animateToNextSlide(){
    int nextPage =  controller.currentPage + 1;
    controller.animateToPage(page: nextPage);
    if (kDebugMode) {
      print("Current Page : ${controller.currentPage}" );
    }
  }

}
