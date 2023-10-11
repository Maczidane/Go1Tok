import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/log_in_controller.dart';
import 'package:Go1Tok/src/social_button/social_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SocialFooter extends StatelessWidget {
  const SocialFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Container(

      padding: const EdgeInsets.only(
          top: tDefaultSpace * 1.5, bottom: tDefaultSpace),
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,



      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Obx(
            () => TSocialButton(
              text: '${tConnectWith.tr} ${tGoogle.tr}',
              image: tGoogleLogo1,
              foreground: tGoogleForegroundColor,
              background: tGoogleBgColor,
              onPressed: controller.isFacebookLoading.value ||
                      controller.isLoading.value
                  ? () {}
                  : controller.isGoogleLoading.value
                      ? () {}
                      : () => controller.googleSignIn(),
              isLoading: controller.isGoogleLoading.value ? true : false,
            ),
          ),
          const SizedBox(
            width: tDefaultSize ,
          ),
          Obx(
            () => TSocialButton(
              text: '${tConnectWith.tr} ${tFacebook.tr}',
              image: tFacebookLogo2,
              foreground: tGoogleForegroundColor,
              background: tGoogleBgColor,
              onPressed:
                  controller.isGoogleLoading.value || controller.isLoading.value
                      ? () {}
                      : controller.isFacebookLoading.value
                          ? () {}
                          : () => controller.facebookSignIn(),
              isLoading: controller.isFacebookLoading.value ? true : false,
            ),
          ),
          const SizedBox(
            height: tDefaultSpace * 2,
          ),
        ],
      ),
    );
  }
}
