import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:Go1Tok/src/features/authentication/screen/signup/sign_up_screen.dart';
import 'package:Go1Tok/src/social_button/social_footer.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatefulWidget {
  const SignUpFooterWidget({
    super.key,
  });

  @override
  State<SignUpFooterWidget> createState() => _SignUpFooterWidgetState();
}

class _SignUpFooterWidgetState extends State<SignUpFooterWidget> {
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
            Text(tOrSignUp,style: Theme.of(context).textTheme.headlineSmall,),

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
            Get.to(() => const LoginScreen());
          },
          child: Text.rich(
            TextSpan(
                text: tAlreadyHaveAnAccount,
                style: Theme.of(context).textTheme.titleMedium,
                children: const [
                  TextSpan(
                    text: tLogin,
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
