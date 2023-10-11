import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/sign_up_controller.dart';
import 'package:Go1Tok/src/features/authentication/models/user_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_otp/forgot_password_otp.dart';
import 'package:Go1Tok/src/social_button/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    AutovalidateMode _autoValidate = AutovalidateMode.onUserInteraction;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Obx(
        () => Form(
          key: controller.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                autovalidateMode: _autoValidate,
                controller: controller.firstName,
                keyboardType: TextInputType.text,
                maxLength: 10,
                decoration: const InputDecoration(
                  labelText: tFirstName,
                  hintText: tFirstNameSelected,
                  prefixIcon: Icon(Icons.person_outline_rounded),
                ),
                validator: (value) {
                  if (GetUtils.isLengthLessOrEqual(value, 2)) {
                    return "Invalid First name. First name too short.";
                  } else if (value.toString().contains(" ")) {
                    return "Invalid First name. Remove all spaces from the first name";
                  } else if (!GetUtils.isAlphabetOnly(
                      value.toString().trim())) {
                    return "Invalid First name.";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.lastName,
                keyboardType: TextInputType.text,
                autovalidateMode: _autoValidate,
                //maxLength: 10,
                decoration: const InputDecoration(
                  labelText: tLastName,
                  hintText: tLastNameSelected,
                  prefixIcon: Icon(Icons.person_outline_sharp),
                ),
                validator: (value) {
                  if (GetUtils.isLengthLessOrEqual(value, 2)) {
                    return "Invalid Last name. Last name too short.";
                  } else if (value.toString().contains(" ")) {
                    return "Invalid First name. Remove all spaces from the first name";
                  } else if (!GetUtils.isAlphabetOnly(
                      value.toString().trim())) {
                    return "Invalid Last name.";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: tFormHeight - 20,
              ),
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
              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.phoneNumber,
                keyboardType: TextInputType.phone,
                autovalidateMode: _autoValidate,
                maxLength: 13,
                decoration: const InputDecoration(
                  labelText: tPhoneNumber,
                  hintText: tPhoneNumberSelected,
                  prefixIcon: Icon(Icons.phone_android_outlined),
                ),
                validator: (value) {
                  if (!GetUtils.isPhoneNumber(value!)) {
                    return "Invalid Phone Number. Please enter phone number with country code";
                  } else if (!value.contains("+")) {
                    return "Phone number must start with country code. +358....";
                  } else {
                    return null;
                  }
                },
              ),

              const SizedBox(
                height: tFormHeight - 20,
              ),
              TextFormField(
                controller: controller.password,
                autovalidateMode: _autoValidate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter your password';
                  } else if (GetUtils.isLengthLessOrEqual(value, 7)) {
                    return "Password too short.";
                  } else if (!validateStructure(value)) {
                    return "Password too weak. Password must contain a lowercase, uppercase and special character";
                  } else {
                    return null;
                  }
                  //return null;
                },
                obscureText: controller.showPassword.value ? false : true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline_rounded),
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

              const SizedBox(
                height: tFormHeight - 10,
              ),
              TextFormField(
                controller: controller.cPassword,
                autovalidateMode: _autoValidate,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Confirm your password';
                  } else if (GetUtils.isLengthLessOrEqual(value, 7)) {
                    return "Password too short.";
                  } else if (!validateStructure(value)) {
                    return "Password too weak. Password must contain a lowercase, uppercase and special character";
                  } else if (value != controller.password.text.toString()) {
                    return "Two passwords do not match";
                  } else {
                    return null;
                  }
                  //return null;
                },
                obscureText: controller.showPassword2.value ? false : true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock_outline),
                  labelText: tConfirmPassword,
                  hintText: tConfirmPasswordSelected,
                  suffixIcon: IconButton(
                    icon: controller.showPassword2.value
                        ? const Icon(LineAwesomeIcons.eye)
                        : const Icon(LineAwesomeIcons.eye_slash),
                    onPressed: () => controller.showPassword2.value =
                        !controller.showPassword2.value,
                  ),
                ),
              ),

              const SizedBox(
                height: tFormHeight,
              ),

              /// Sign Up Button

              TPrimaryButton(
                  buttonText: tSignUp.tr,
                  isLoading: controller.isLoading.value ? true : false,
                  text: tSignUp.tr,
                  onPressed: () {
                    if (controller.signUpFormKey.currentState!.validate()) {

                      if (controller.isFacebookLoading.value ||
                          controller.isGoogleLoading.value) {
                      } else if (controller.isLoading.value) {
                        //Do nothing
                      } else {



                        controller.createUser();
                      }
                    } else {}
                  }

                  // : () {} ,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
}
