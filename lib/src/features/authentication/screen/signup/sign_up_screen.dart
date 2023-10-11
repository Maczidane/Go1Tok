import 'package:Go1Tok/src/common_widgets/form/form_header_widget.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/signup/sign_up_footer_widget.dart';
import 'package:Go1Tok/src/features/authentication/screen/signup/sign_up_form_widget.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: const  Column(
                children:  [
                 FormHeaderWidget(
                    imageName: tOnBoardingImage3,
                    title: tSignUpTitle,
                    subTitle: tSignUpSubTitle,
                  ),
                 SignUpFormWidget(),

                 SizedBox(height: tDefaultSize),

                 SignUpFooterWidget()

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}

