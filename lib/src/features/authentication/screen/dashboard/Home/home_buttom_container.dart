import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/home_controller.dart';
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
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: tDefaultPadding, vertical: tDefaultPadding),
      child: Column(
        children: [
          Obx(
                () => Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  homeController.isFlightSelected.value
                      ? tRecentFlight
                      : homeController.isHotelSelected.value
                      ? tRecentHotel
                      : tRecentTaxi,
                  style:  Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Text(
                  "VIEW ALL(${homeController.numberOfSearches.value})",
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                    color: tPrimaryColor,
                  )
                )
              ],
            ),
          ),
          authController.getUserID.toString().isEmpty
              ? Obx(
                () => Container(
              height: defaultContainerHeight,
              padding: const EdgeInsets.symmetric(horizontal: defaultHorizontalPadding,vertical: defaultVerticalPadding),
              child: Column(
                children: [
                  Text(
                    "$tLoginToSee ${homeController.isFlightSelected.value ? tRecentFlight : homeController.isHotelSelected.value ? tRecentHotel : tRecentTaxi}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: tDefaultSize,),

                  SizedBox(
                    width: defaultContainerHeight,
                    child: OutlinedButton(
                        onPressed:(){

                          Get.offAll(() => const LoginScreen());
                        },



                        style: OutlinedButton.styleFrom(

                          backgroundColor: tPrimaryColor,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(tLargeWidth)),


                        ),

                        child:  Text(
                            tLogin,
                            style: Theme.of(context).textTheme.bodyMedium,
                        )
                    ),
                  ),

                ],
              ),
            ),
          )
              : SizedBox(
            height: defaultContainerHeight,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  height: 210,
                  width: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 210,
                  width: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 210,
                  width: 100,
                  color: Colors.green,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

