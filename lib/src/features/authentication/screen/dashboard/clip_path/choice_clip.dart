import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/size.dart';

class ChoiceChips extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool isSelected;

  const ChoiceChips(
      {super.key,
        required this.icon,
        required this.text,
        required this.isSelected});

  @override
  State<ChoiceChips> createState() => _ChoiceChipsState();
}

class _ChoiceChipsState extends State<ChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: tDefaultPadding, vertical: tSmallPadding),
      decoration: widget.isSelected
          ? BoxDecoration(
        color: tWhiteColor.withOpacity(0.15),
        borderRadius:
        const BorderRadius.all(Radius.circular(tDefaultRadius)),
      )
          : null,
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            widget.icon,
           // size: tMediumIconSize,
            color: tWhiteColor,
          ),

       const   SizedBox(width: tSmallWidth,),

          Text(
            widget.text,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
              color: tWhiteColor,
            )
          )
        ],
      ),
    );
  }
}