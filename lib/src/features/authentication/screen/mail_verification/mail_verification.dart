import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:line_icons/line_icons.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
              top: tDefaultSpace * 5,
              left: tDefaultSpace,
              right: tDefaultSpace,
              bottom: tDefaultSpace * 2),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
               Icon(
                LineIcons.envelopeOpen,
                size: Helper.screenHeight() * 0.13,
              ),
              const SizedBox(
                height: tDefaultSpace * 2,
              ),
              Text(
                tVerifyEmail.tr,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: tDefaultSize,
              ),
              Text(
                tVerifyEmailText.tr,
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: tDefaultSpace * 2,
              ),
              SizedBox(
                width: Helper.screenWidth() * 0.5,
                child: OutlinedButton(

                  child: Text(tContinueEmail.tr),
                  onPressed: () {
                    controller.manuallyCheckEmailVerificationStatus();
                  },
                ),
              ),
              const SizedBox(
                height: tDefaultSpace * 2,
              ),
              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: Text(tResendLink.tr),
              ),

              TextButton(
                  onPressed: () => AuthenticationRepository.instance.logOut(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const  Icon(LineAwesomeIcons.alternate_long_arrow_left),
                      const SizedBox(width: 5,),
                      Text(tBackLogin.tr.toLowerCase()),

                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
