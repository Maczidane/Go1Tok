import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/signup/sign_up_screen.dart';
import 'package:Go1Tok/src/social_button/social_footer.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(child: Divider(
              color: Helper.isDarkMode(context) ? Colors.grey : Colors.blueGrey,
              thickness: 0.5,
              indent: 10,
              endIndent: 5,
            )),
            Text(tOrLogin,style: Theme.of(context).textTheme.headlineSmall,),

            Flexible(child: Divider(
              color: Helper.isDarkMode(context) ? Colors.grey : Colors.blueGrey,
              thickness: 0.5,
              indent: 5,
              endIndent: 10,
            )),
          ],
        ),
        const SizedBox(height: tFormHeight -20,),


       const SocialFooter(),

        const SizedBox(height: tFormHeight -20,),

        TextButton(
          onPressed: (){

            Get.to(() => const SignUpScreen() );

          },
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                    text: tSignUp,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold

                    ),
                  )
                ]
            ),
          ),
        ),

      ],
    );
  }
}
