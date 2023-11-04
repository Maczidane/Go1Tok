import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/sign_up_controller.dart';
import 'package:Go1Tok/src/features/authentication/models/user_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_otp/forgot_password_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_fontellico_progress_dialog/simple_fontico_loading.dart';

class UselessSignUpFormWidget extends StatefulWidget {
  const UselessSignUpFormWidget({
    super.key,
  });

  @override
  State<UselessSignUpFormWidget> createState() => _UselessSignUpFormWidgetState();
}

class _UselessSignUpFormWidgetState extends State<UselessSignUpFormWidget> {
  bool visibility = false;
  bool visibility2 = false;

  @override
  Widget build(BuildContext context) {
    SimpleFontelicoProgressDialog _dialog =
    SimpleFontelicoProgressDialog(context: context);

    final controller = Get.put(SignUpController());
    final formKey = GlobalKey<FormState>();
    AutovalidateMode _autoValidate = AutovalidateMode.onUserInteraction;



    int x = 0;


    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey,
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
                } else if (!GetUtils.isAlphabetOnly(value!)) {
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
              maxLength: 10,
              decoration: const InputDecoration(
                labelText: tLastName,
                hintText: tLastNameSelected,
                prefixIcon: Icon(Icons.person_outline_sharp),
              ),
              validator: (value) {
                if (GetUtils.isLengthLessOrEqual(value, 2)) {
                  return "Invalid Last name. Last name too short.";
                } else if (!GetUtils.isAlphabetOnly(value!)) {
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
              controller: controller.email,
              keyboardType: TextInputType.emailAddress,
              autovalidateMode: _autoValidate,
              decoration: const InputDecoration(
                labelText: tEmailSignUp,
                hintText: tEmailSelected,
                prefixIcon: Icon(Icons.person_outline_rounded),
              ),
              validator: (value) {
                if (!GetUtils.isEmail(value!)) {
                  return "Invalid Email.";
                } else {
                  return null;
                }
              },
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
              keyboardType: TextInputType.visiblePassword,
              autovalidateMode: _autoValidate,
              obscureText: visibility == true ? false : true,
              decoration: InputDecoration(
                  labelText: tSignUpPassword,
                  hintText: tSignUpPasswordSelected,
                  prefixIcon: const Icon(Icons.password_outlined),
                  suffixIcon: IconButton(
                    onPressed: () {

                      if (visibility == false) {


                        setState(() {
                          visibility = true ;
                        });
                      } else {
                        setState(() {
                          visibility = false;
                        });
                      }
                    },
                    icon: Icon(
                      visibility == false
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  )),
              validator: (value) {
                if (GetUtils.isLengthLessOrEqual(value, 7)) {
                  return "Password too short.";
                } else if (!GetUtils.isPassport(value!)) {
                  return "Invalid Password. Password must contain atleast an uppercase, lowercase and special character.";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: tFormHeight - 20,
            ),
            TextFormField(
              controller: controller.cPassword,
              keyboardType: TextInputType.visiblePassword,
              obscureText: visibility2 == true ? false : true,
              autovalidateMode: _autoValidate,
              decoration: InputDecoration(
                labelText: tConfirmPassword,
                hintText: tConfirmPasswordSelected,
                prefixIcon: const Icon(Icons.password_rounded),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (visibility2 == false) {
                      setState(() {
                        visibility2 = true;
                      });
                    } else {
                      setState(() {
                        visibility2 = false;
                      });
                    }
                  },
                  icon: Icon(
                    visibility2 == false
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                ),
              ),
              validator: (value) {
                if (GetUtils.isLengthLessOrEqual(value, 7)) {
                  return "Password too short.";
                } else if (!GetUtils.isPassport(value!)) {
                  return "Invalid Password. Password must contain atleast an uppercase, lowercase and special character.";
                } else if (value != controller.password.text.toString()) {
                  return "Two passwords do not match";
                } else {
                  return null;
                }
              },
            ),
            const SizedBox(
              height: tFormHeight,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // _validateInputs();
                  /*  if (formKey.currentState!.validate()) {
                      /*SignUpController.instance.registerUser(
                          controller.email.text.trim(),
                          controller.password.text.trim(),
                          controller.firstName.text.trim(),
                          controller.lastName.text.trim(),
                          controller.phoneNumber.text.trim());
                          */

                      //SignUpController.instance.phoneAuthentication(controller.phoneNumber.text.trim());

                      //Get.to(() => const OTPScreen());

                      final user = UserModel(
                        email: controller.email.text.trim(),
                        password: controller.password.text.trim(),
                        firstName: controller.firstName.text.trim(),
                        lastName: controller.lastName.text.trim(),
                        phoneNumber: controller.phoneNumber.text.trim(),
                      );

                      SignUpController.instance.createUser(user);
                      //Get.to(() => const OTPScreen());
                    }*/

                  controller.createUser();
                },
                child: Text(tSignUp.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
