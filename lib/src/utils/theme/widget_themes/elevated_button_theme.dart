import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';


/*-- Light and Dark Elevated Button Themes --*/

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); // To avoid creating instances

/*-- Light Theme --*/

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      backgroundColor: tPrimaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
    ),

  );

/*-- Dart Theme --*/

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      backgroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeightSize),
    ),

  );

}