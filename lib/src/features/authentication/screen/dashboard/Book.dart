import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/cards/flight_cards.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';

class Book extends StatelessWidget {
  const Book({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor.withOpacity(0.2),
      body: Column(
        children: [
          SizedBox(
              height: Helper.screenHeight() * 0.3,
              child: FlightCards(
                cardColor: tWhiteColor,
                destinationCity: 'London',
                arrivalCity: 'Aachen',
                arrivalCityShortName: 'AOC',
                destinationCityShortName: 'LND',
                departureTime: '7:45 AM',
                flightDuration: '9h 30m',
                arrivalTime: '21:45 PM',
                searchDate: '21 October, 2023',
                airlineLogo: tSplashImage,
                price: 1300,
              )),
        ],
      ),
    );
  }
}
