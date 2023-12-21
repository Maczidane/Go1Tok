import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/flight_result_controller.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheapestCards extends StatelessWidget {


  const CheapestCards({super.key});

  @override
  Widget build(BuildContext context) {
    final FlightResultController flightResultController = Get.put(FlightResultController());

    return Column(
      children: [
        Container(

          width: Helper.screenWidth() * 0.95,
          //height: 200,
          padding: const EdgeInsets.symmetric( horizontal: tDefaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(tSmallRadius),
              color: tWhiteColor
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: tSmallPadding - 2,horizontal: tSmallPadding +5 ),
                decoration: BoxDecoration(
                  color: tPrimaryColor,
                  borderRadius: BorderRadius.circular(tDefaultRadius),
                ),
                child: Text(
                  tCheapest,
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                    color: tWhiteColor,
                  ),
                ),

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text(
                    flightResultController.cheapestPrice.value,
                    style: Theme.of(context).textTheme.displayMedium?.apply(
                      color: tPrimaryColor,
                    ),
                  ),

                  SizedBox(
                      width: 50,
                      height: 50,
                      child:  Image(image: AssetImage(flightResultController.cheapestLogo.value,) , )),

                ],
              ),

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Row(
                    children: [

                      Text(
                        "${flightResultController.cheapestFlightTime}",
                        style: Theme.of(context).textTheme.headlineMedium?.apply(

                        ),
                      ),

                      const SizedBox(width: tDefaultWidth,),

                      Text(
                        "${flightResultController.cheapestType}",
                        style: Theme.of(context).textTheme.headlineMedium?.apply(

                        ),
                      ),


                    ],
                  ),

                  Text(
                    "$tTravelTime ${flightResultController.cheapestTravelTime}",
                    style: Theme.of(context).textTheme.headlineMedium?.apply(

                    ),
                  ),
                ],
              ),

              const  SizedBox(height: tDefaultHeight - 10,),

              Row(
                children: [
                  Text(
                    "${flightResultController.cheapestFrom}",
                    style: Theme.of(context).textTheme.bodyMedium?.apply(

                        color: tDarkColor.withOpacity(0.8)
                    ),
                  ),
                  const SizedBox(width: tDefaultWidth + 20,),

                  Text(
                    "${flightResultController.cheapestTo}",
                    style: Theme.of(context).textTheme.bodyLarge?.apply(
                        color: tDarkColor.withOpacity(0.8)

                    ),
                  ),
                ],
              ),

              const  SizedBox(height: tDefaultHeight,),

            ],
          ),
        ),
      ],
    );
  }
}
