import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Go1Tok/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:Go1Tok/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:Go1Tok/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});




  @override
  Widget build(BuildContext context) {

    final controller = Get.put(FadeInAnimationController());

    controller.startSplashAnimation();

    final size =  MediaQuery.of(context).size;


    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          TFadedAnimation(
            durationInMs: 2000,
            animatedPosition: TAnimatedPosition(
              topAfter: size.height * 0.3,
              topBefore: size.height * 0.6,
              leftBefore: -80,
              leftAfter: size.height * 0.09,
            ),
            child:  Image(image: const AssetImage(tSplashImage ), height: size.height * 0.3,),
          ),
          TFadedAnimation(
            durationInMs: 2400,
            animatedPosition: TAnimatedPosition(
               bottomAfter: size.height * 0.25,
               bottomBefore: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  tAppName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),

        /*  TFadedAnimation(
            durationInMs: 1600,
            animatedPosition: TAnimatedPosition(
                topAfter: 0,
                topBefore: -30,
                leftBefore: -30,
                leftAfter: 0
            ),
            child: const Positioned(
              bottom: 50,
              child:  CircularProgressIndicator(),
            ),
          ),*/





        ],
      ),
    );
  }


}

