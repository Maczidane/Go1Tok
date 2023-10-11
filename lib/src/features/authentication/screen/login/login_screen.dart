import 'package:Go1Tok/src/common_widgets/form/form_header_widget.dart';
import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_footer_widget.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_form_widget.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
              child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeaderWidget(
                    imageName: tOnBoardingImage2,
                    title: tLoginTitle,
                    subTitle: tLoginSubTitle,
                ),
                 LoginForm(),
                SizedBox(height: tDefaultSize),

                LoginFooterWidget()
              ],
            ),
          )),
        ),
      ),
    );
  }
}

