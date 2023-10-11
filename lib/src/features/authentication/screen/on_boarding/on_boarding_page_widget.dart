import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/features/authentication/models/on_boarding_model.dart';
import 'package:flutter/material.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final brightness = MediaQuery.of(context).platformBrightness;

    final  isDark= brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.all(tDefaultSize),
      //if dark mode is one Change, set page to black only for first page)
      color: (isDark && model.bgColor == tOnBoardColor1) ? tSecondaryColor :  model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(
            image: AssetImage(model.image),
            height: size.height * 0.35,
          ),
          Column(
            children: [
              Text(
                model.title,
                textAlign: TextAlign.center,
                style: model.textColor == "1"
                    ? const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )
                    : Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model.subTitle,
                textAlign: TextAlign.center,
                style:  model.textColor == "1"
                    ? const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                )
                    : Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          Text(
            model.counterText,
            style:model.textColor == "1"
                ? const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,

            )
                : Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(
            height: 60.0,
          ),
        ],
      ),
    );
  }
}
