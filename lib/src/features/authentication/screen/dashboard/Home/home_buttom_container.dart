import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/home_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/cards/flight_cards.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/home_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/utils/helper.dart';

import '../../../../../constants/size.dart';
import '../cards/hotel_cards.dart';

class HomeButtomContainer extends StatefulWidget {
  const HomeButtomContainer({super.key});

  @override
  State<HomeButtomContainer> createState() => _HomeButtomContainerState();
}

class _HomeButtomContainerState extends State<HomeButtomContainer> {
  final homeController = Get.put(HomeController());

  final authController = Get.put(AuthenticationRepository());

  get tDarkColor => null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  homeController.isFlightSelected.value
                      ? tRecentFlight
                      : homeController.isHotelSelected.value
                          ? tRecentHotel
                          : tRecentTaxi,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Text("VIEW ALL(${homeController.numberOfSearches.value})",
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          color: tPrimaryColor,
                        ))
              ],
            ),
          ),
        ),
        authController.getUserID.toString().isEmpty
            ? Obx(
                () => Container(
                  height: defaultContainerHeight,
                  padding: const EdgeInsets.symmetric(
                      horizontal: defaultHorizontalPadding,
                      vertical: defaultVerticalPadding),
                  child: Column(
                    children: [
                      Text(
                        "$tLoginToSee ${homeController.isFlightSelected.value ? tRecentFlight : homeController.isHotelSelected.value ? tRecentHotel : tRecentTaxi}",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: tDefaultSize,
                      ),
                      SizedBox(
                        width: defaultContainerHeight,
                        child: OutlinedButton(
                            onPressed: () {
                              Get.offAll(() => const LoginScreen());
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(tLargeWidth)),
                            ),
                            child: Text(
                              tLogin,
                              style: Theme.of(context).textTheme.bodyMedium?.apply(
                                color: tWhiteColor,
                              ),
                            )),
                      ),
                    ],
                  ),
                ),
              )
            :  Obx(() => Container(
          child:  homeController.isFlightSelected.value
              ? flightContainer()
              : homeController.isHotelSelected.value
              ? hotelContainer()
              : taxiContainer(),
        )),

      ],
    );
  }

  Widget flightContainer () =>   SizedBox(
      height: Helper.screenHeight() * 0.33,
      child: FlightCards(
        cardColor: greyColor.withOpacity(0.2),
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
      ));



  Widget hotelContainer () =>   SizedBox(
    height: Helper.screenHeight() * 0.33,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: hotelCard,
    ),
  );

  Widget taxiContainer () =>   SizedBox(
      height: Helper.screenHeight() * 0.33,
      child: FlightCards(
        cardColor: greyColor.withOpacity(0.2),
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
      ));



  List<HotelCard> hotelCard = [
    HotelCard(
      image: tLasVegas,
      discount: "48%",
      price: 200,
      date: "12 Jun",
      reviewNumber: "5",
      cityName: "Las vegas",
    ),
    HotelCard(
      image: tLasVegas2,
      discount: "24%",
      price: 200,
      date: "12 Jun",
      reviewNumber: "5",
      cityName: "New York",
    ),
    HotelCard(
      image: tLasVegas3,
      discount: "56%",
      price: 200,
      date: "12 Jun",
      reviewNumber: "5",
      cityName: "Florida",
    ),
  ];
}
