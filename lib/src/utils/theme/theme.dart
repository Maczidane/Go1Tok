import 'package:Go1Tok/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:Go1Tok/src/utils/theme/widget_themes/outline_button_theme.dart';
import 'package:Go1Tok/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:Go1Tok/src/utils/theme/widget_themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  //making class private

  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.white,
    primaryColorDark: Colors.black,
    canvasColor: Colors.white,
    // next line is important!
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
/*
      primarySwatch: const MaterialColor(0xFF641DDB, <int, Color>{
        50: Color(0xFFEDE7F6),
        100: Color(0xFFD1C4E9),
        200: Color(0xFFB39DDB),
        300: Color(0xFF9575CD),
        400: Color(0xFF7E57C2),
        500: Color(0xFF641DDB),
        600: Color(0xFF5E35B1),
        700: Color(0xFF512DA8),
        800: Color(0xFF4527A0),
        900: Color(0xFF311B92),
      }),
*/
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    primaryColor: Colors.black,
    primaryColorLight: Colors.black,
    primaryColorDark: Colors.black,
    indicatorColor: Colors.white,
    canvasColor: Colors.black,
    inputDecorationTheme: TTextFormTheme.darkInputDecorationTheme,
    // next line is important!
    appBarTheme:
        const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
  );
}
