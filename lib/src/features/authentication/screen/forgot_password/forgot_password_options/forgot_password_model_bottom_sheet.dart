import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_mail/forgot_password_mail.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_options/forget_password_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ForgotPasswordScreen{

  static Future <dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(tDefaultSize- 10.0),

        ),
        builder: (context) => Container(
          padding: const EdgeInsets.all(tDefaultSize),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tForgotPasswordTitle,style: Theme.of(context).textTheme.displayMedium,),
              Text(tForgotPasswordSubTitle,style: Theme.of(context).textTheme.labelLarge,),
              const SizedBox(height: tDefaultSize,),
              ForgetPasswordButton(

                btnIcon:  Icons.mail_outline_rounded ,
                subTitle: tResetViaEmail,
                title: tEmailText,

                onTap: (){


                  Navigator.pop(context);
                  Get.to(() => const ForgotPasswordMailScreen());

                },
              ),

              const  SizedBox(
                height: tDefaultSize - 10.0,
              ),
              ForgetPasswordButton(
                onTap: (){

                },
                btnIcon: Icons.mobile_friendly_rounded ,
                subTitle: tResetViaPhone,
                title: tPhoneText,
              ),
            ],
          ),
        )
    );
  }

}