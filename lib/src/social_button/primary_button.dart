import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/social_button/button_loading_widget.dart';
import 'package:flutter/material.dart';

class TPrimaryButton extends StatelessWidget {
  const TPrimaryButton({
    Key? key,
    required this.text,

    required this.onPressed,
    required this.isLoading,
    required this.buttonText,
  }) : super(key: key);

  final String text, buttonText;


  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: isLoading ? const ButtonLoadingWidget()
            :

        Text(buttonText.toUpperCase()),

       // Text(text, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
