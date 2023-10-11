import 'package:Go1Tok/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {

  TTextTheme._(); //To avoid creating instances


  /*-- Light Text Theme --*/

  static TextTheme lightTextTheme = TextTheme(
    displayLarge:  GoogleFonts.montserrat(fontSize: 28.0,fontWeight: FontWeight.bold, color: tDarkColor),
    displayMedium:  GoogleFonts.montserrat(fontSize: 24.0,fontWeight: FontWeight.w700, color: tDarkColor),
    displaySmall:  GoogleFonts.montserrat(fontSize: 24.0,fontWeight: FontWeight.w700, color: tDarkColor),
    headlineMedium:  GoogleFonts.montserrat(fontSize: 16.0,fontWeight: FontWeight.w600, color: tDarkColor),
    headlineSmall:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.w600, color: tDarkColor),
    titleLarge:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.w600, color: tDarkColor),
    bodyLarge:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.normal, color: tDarkColor),
    bodyMedium:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.normal, color: tDarkColor),


  );

  /*-- Dark Text Theme --*/

  static TextTheme darkTextTheme = TextTheme(
    displayLarge:  GoogleFonts.montserrat(fontSize: 28.0,fontWeight: FontWeight.bold, color: tWhiteColor),
    displayMedium:  GoogleFonts.montserrat(fontSize: 24.0,fontWeight: FontWeight.w700, color: tWhiteColor),
    displaySmall:  GoogleFonts.montserrat(fontSize: 24.0,fontWeight: FontWeight.w700, color: tWhiteColor),
    headlineMedium:  GoogleFonts.montserrat(fontSize: 16.0,fontWeight: FontWeight.w600, color: tWhiteColor),
    headlineSmall:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.w600, color: tWhiteColor),
    titleLarge:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.w600, color: tWhiteColor),
    bodyLarge:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.normal, color: tWhiteColor),
    bodyMedium:  GoogleFonts.montserrat(fontSize: 14.0,fontWeight: FontWeight.normal, color: tWhiteColor),

  );
}
