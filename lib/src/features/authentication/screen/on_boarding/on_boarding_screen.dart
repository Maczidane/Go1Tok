import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:Go1Tok/src/features/authentication/models/on_boarding_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/dashboard.dart';
import 'package:Go1Tok/src/features/authentication/screen/on_boarding/on_boarding_page_widget.dart';
import 'package:Go1Tok/src/features/authentication/screen/welcome/welcome_screen.dart';
import 'package:Go1Tok/src/repository/user_repository/user_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnBoarding extends StatefulWidget {
   const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  late LiquidController controller ;




  int currentPage = 0;

  final pages = [
    OnBoardingPageWidget(
      model: OnBoardingModel(
          image: tOnBoardingImage1,
          title: tOnboardTitle,
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

  @override
  void initState() {
    controller = LiquidController();


    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final brightness = MediaQuery.of(context).platformBrightness;

    final  isDark= brightness == Brightness.dark;



    return Scaffold(
      body: Stack(
          alignment: Alignment.center,
          children: [
            LiquidSwipe(
              pages: pages,
              enableLoop: false,

              liquidController: controller,
              onPageChangeCallback: onPageChangeCallback,
              slideIconWidget: const Icon(Icons.arrow_back_ios),
              enableSideReveal: true,
            ),
            Positioned(
                bottom: 60.0,
                child: OutlinedButton(
                  onPressed: () {


                    animateToNextSlide();


                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side:  BorderSide(color: isDark ? tWhiteColor:  Colors.black26),
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration:  BoxDecoration(
                      color: isDark ? tWhiteColor:  tSecondaryColor,
                      shape: BoxShape.circle,
                    ),
                    child:  Icon(Icons.arrow_forward_ios,color: isDark ? tSecondaryColor : tWhiteColor,),
                  ),
                )),
            Positioned(
              top: 50.0,
              right: 20,
              child: TextButton(
                onPressed: () {



                  skip();


                },
                child: const Text(
                  "Skip",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),

            Positioned(
                bottom: 10,
                child: AnimatedSmoothIndicator(
                  activeIndex: currentPage,
                  count: 3,
                  effect:  WormEffect(
                    activeDotColor: isDark ? tWhiteColor : tDarkColor,
                    dotHeight: 5.0,
                  ),
                )  ,
              ),

          ],

      ),
    );
  }

  onPageChangeCallback(int activePageIndex) {


    setState(() {
      currentPage =  activePageIndex;
    });


  }

  skip () =>  controller.jumpToPage(page: 2);


  animateToNextSlide(){
    int nextPage =  controller.currentPage + 1;

    if(nextPage == 3){
      Get.offAll(() => const WelcomeScreen());
    }
    controller.animateToPage(page: nextPage);
    setState(() {

      currentPage = nextPage;
    });
    if (kDebugMode) {
      print("Current Page : ${controller.currentPage}" );
    }
  }
}
