import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';

import '../../../../../../constants/colors.dart';

class DirectFlightCards extends StatelessWidget {
  final String image, price, flightName;
  final List<String> time;
  final bool isLastItem;
  const DirectFlightCards({super.key, required this.image, required this.price, required this.time, required this.isLastItem, required this.flightName});

  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                 SizedBox(
                    width: 50,
                    height: 50,
                    child:  Image(image: AssetImage(image,) , )),
                Text(
                  flightName,
                  style: Theme.of(context).textTheme.headlineMedium,
                )
              ],
            ),
            Row(
              children: [

                Text(
                  "\$$price",
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                    color: tPrimaryColor,
                  ),
                ),

                const Icon(
                  Icons.arrow_forward_ios_outlined,
                  color: tPrimaryColor,
                  size: 18,
                )
              ],
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: time.map((item) => text(item, context)).toList(),
        ),

        const SizedBox(height: tDefaultSize - 20 ,),
        !isLastItem ? const Divider(height: 3,color: chromeGrey,): const Text(""),
        const SizedBox(height: tDefaultSize - 25 ,)
      ],
    );
  }

  Widget text(text, BuildContext context) => Text(
    text,
    overflow: TextOverflow.ellipsis,
    style: Theme.of(context).textTheme.bodyMedium,
  );
}
