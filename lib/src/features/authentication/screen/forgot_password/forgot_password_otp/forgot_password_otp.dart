import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
   const OTPScreen(
      {
        super.key,
        required this.details,

      });

  final String? details;

  @override
  Widget build(BuildContext context) {

    var otp;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Text(tOtpTile, style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold,
                  fontSize: 80.0,
                ),),
                Text(tOtpSubTitle.toUpperCase(), style: Theme.of(context).textTheme.displayMedium,),

                const SizedBox(height: tDefaultSize + 10.0,),

                 Text("$tOtpMessage $details", textAlign: TextAlign.center,),
                const SizedBox(height: tDefaultSize - 10.0,),

                OtpTextField(
                  numberOfFields: 6,
                  fillColor: Colors.black.withOpacity(0.1),
                  filled: true,
                  onSubmit: (code){
                    print("OTP is => $code");

                    otp = code;
                    OTPController.instance.verifyOTP(otp);

                  },
                ),
                const SizedBox(height: tDefaultSize ),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: (){

                      OTPController.instance.verifyOTP(otp);

                    },
                    child: const Text(tNext),

                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
