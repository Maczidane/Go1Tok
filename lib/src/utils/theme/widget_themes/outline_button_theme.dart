import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';


/*-- Light and Dark Outlined Button Themes --*/

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); // To avoid creating instances

/*-- Light Theme --*/

static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(

    shape: const RoundedRectangleBorder(),
    foregroundColor: tSecondaryColor,
    side: BorderSide(color: tSecondaryColor),
    padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
  ),
);

/*-- Dart Theme --*/

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(

      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
    ),
  );

}