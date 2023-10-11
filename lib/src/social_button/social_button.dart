import 'package:Go1Tok/src/social_button/button_loading_widget.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({
    Key? key,
    required this.text,
    required this.image,
    required this.foreground,
    required this.background,
    required this.onPressed,
    required this.isLoading,
  }) : super(key: key);

  final String text;

  final String image;
  final Color foreground, background;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(

        width: Helper.screenWidth() * 0.2,
       height: Helper.screenHeight() * 0.1,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(100),
        ),
        child: IconButton(

            onPressed: onPressed,

            icon: isLoading ? const SizedBox() : Image(image: AssetImage(image), width: Helper.screenWidth() * 0.4, height: Helper.screenHeight() * 0.4,),
        ),
      ),
    );
  }
}
