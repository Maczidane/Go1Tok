import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/log_in_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_options/forgot_password_model_bottom_sheet.dart';
import 'package:Go1Tok/src/social_button/primary_button.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    AutovalidateMode _autoValidate = AutovalidateMode.onUserInteraction;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// -- Email Field
            TextFormField(
              //validator: Helper.validateEmail,
              validator: (value) {
                if (!GetUtils.isEmail(value!)) {
                  return "Invalid Email.";
                } else {
                  return null;
                }
              },
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: _autoValidate,

              decoration: const InputDecoration(
                  prefixIcon: Icon(LineAwesomeIcons.user),
                  labelText: tEmail,
                  hintText: tEmail),
            ),
            const SizedBox(height: tFormHeight - 20),

            /// -- Password Field
            Obx(
              () => TextFormField(
                controller: controller.password,
                autovalidateMode: _autoValidate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  } else if (GetUtils.isLengthLessOrEqual(value, 7)) {
                    return "Password too short.";
                  }  else {
                    return null;
                  }
                  //return null;
                },
                obscureText: controller.showPassword.value ? false : true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.fingerprint),
                  labelText: tPassword,
                  hintText: tPassword,
                  suffixIcon: IconButton(
                    icon: controller.showPassword.value
                        ? const Icon(LineAwesomeIcons.eye)
                        : const Icon(LineAwesomeIcons.eye_slash),
                    onPressed: () => controller.showPassword.value =
                        !controller.showPassword.value,
                  ),
                ),
              ),
            ),
            const SizedBox(height: tFormHeight - 20),

            /// -- FORGET PASSWORD BTN
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () =>
                    ForgotPasswordScreen.buildShowModalBottomSheet(context),
                child: const Text(tForgotPassword),
              ),
            ),

            /// -- LOGIN BTN
            Obx(
              () => TPrimaryButton(

                buttonText: tLogin,
                isLoading: controller.isLoading.value ? true : false,
                text: tLogin.tr,
                onPressed: controller.isFacebookLoading.value ||
                        controller.isGoogleLoading.value
                    ? () {}
                    : controller.isLoading.value
                        ? () {}
                        : () => controller.login(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
