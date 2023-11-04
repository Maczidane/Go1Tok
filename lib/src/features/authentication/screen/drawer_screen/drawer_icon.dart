import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';

class DrawerIcon extends StatelessWidget {
  const DrawerIcon({super.key, required this.text, required this.icon});

  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: tWhiteColor,),
        const SizedBox(width: tDefaultSpace,),
        Expanded(
          child: Text( text,
            style: const TextStyle(
              color: tWhiteColor,
              fontSize: tDefaultFontSize ,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        )
      ],
    );
  }
}
