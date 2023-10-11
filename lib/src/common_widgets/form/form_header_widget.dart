import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({super.key,
    required this.imageName,
    required this.title,
    required this.subTitle,
    this.imageColor,
    this.imageHeight = 0.2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    this.heightBetween,
    this.textAlign
  });

  final String imageName, title, subTitle;
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;
  final TextAlign? textAlign;
  final CrossAxisAlignment crossAxisAlignment;



  @override
  Widget build(BuildContext context) {

    final size =  MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        Image(image: AssetImage(imageName), color: imageColor, height: size.height * imageHeight ),
        SizedBox(height: heightBetween,),
        Text(title, style: Theme.of(context).textTheme.displayMedium,),
        Text(subTitle,textAlign: textAlign, style: Theme.of(context).textTheme.labelLarge,),
      ],
    );
  }
}
