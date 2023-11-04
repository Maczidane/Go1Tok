import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';

class HotelCard extends StatelessWidget {
  final String image, hotelName, price, date, reviewNumber;

  const HotelCard(
      {super.key,
        required this.image,
        required this.hotelName,
        required this.price,
        required this.date,
        required this.reviewNumber});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Image.asset(tGoogleLogo1),
        )
      ],
    );
  }
}
