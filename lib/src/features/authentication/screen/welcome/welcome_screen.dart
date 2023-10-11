import 'package:Go1Tok/src/common_widgets/fade_in_animation/animation_design.dart';
import 'package:Go1Tok/src/common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import 'package:Go1Tok/src/common_widgets/fade_in_animation/fade_in_animation_model.dart';
import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:Go1Tok/src/features/authentication/screen/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var brightness = MediaQuery.of(context).platformBrightness;

    final isDarkMode = brightness == Brightness.dark;

    final controller =  Get.put(FadeInAnimationController());
    controller.startAnimation();

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tWhiteColor ,
      body: Stack(
        children: [
          TFadedAnimation(
            durationInMs: 2000,
            animatedPosition: TAnimatedPosition(
              bottomBefore: -100,
              bottomAfter: 0,
              topBefore: 0,
              topAfter: 0,
              rightAfter: 0,
              rightBefore: 0,
              leftAfter: 0,
              leftBefore: 0,
            ),

            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: const  AssetImage(tWelcomeScreenImage),
                      height: height * 0.60,
                    ),
                    Column(
                      children: [
                        Text(
                          tWelcomeTitle,
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: tDefaultSize -10,
                        ),
                        Text(
                          tWelcomeSubTitle,
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                   const  SizedBox(height: tDefaultSize,),

                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.to(() => LoginScreen());
                            },

                            child: Text(tLogin.toUpperCase()),
                          ),

                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => SignUpScreen());
                            },
                            child: Text(tSignUp.toUpperCase()),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
