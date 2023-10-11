import 'package:Go1Tok/src/common_widgets/form/form_header_widget.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/forgot_password_mail_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_otp/forgot_password_otp.dart';
import 'package:Go1Tok/src/social_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordMailScreen extends StatelessWidget {
  const ForgotPasswordMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    final controller = Get.put(ForgotPasswordMailController());

    return SafeArea(
      child: Scaffold(
        body: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(tDefaultSize),
              child: Column(
                children: [
                  const SizedBox(
                    height: tDefaultSize * 4,
                  ),
                  const FormHeaderWidget(
                    imageName: tForgotPasswordImage,
                    title: tEmailForgotPasswordTitle,
                    subTitle: tEmailForgotPasswordSubTitle,
                    heightBetween: tDefaultSize,
                    textAlign: TextAlign.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  const SizedBox(
                    height: tFormHeight,
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(
                            labelText: tEmail,
                            hintText: tEmailSelected,
                            prefixIcon: Icon(Icons.mail_outline_rounded),
                          ),
                          controller: controller.email,
                        ),
                        const SizedBox(
                          height: tDefaultSize - 10.0,
                        ),
                        TPrimaryButton(
                          buttonText: tLogin,
                          isLoading: controller.isLoading.value ? true : false,
                          text: tNext.tr,
                          onPressed: (){
                            if (formKey.currentState!.validate()) {
                              String tEmail = controller.email.text.toString().trim();

                              controller.sendResetLink(tEmail);

                            }

                          },
                          // : () {} ,
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
