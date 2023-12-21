import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/flight_result_controller.dart';
import 'package:Go1Tok/src/features/authentication/controllers/flight_search_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_results/cheapest_cards.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_results/direct_flight_cards.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_results/flight_filters.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_results/popular_cards.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_results/price_chart.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';

class FlightSearchResult extends StatelessWidget {
  final String destination,toDate, passengerNumber, from;
  FlightSearchResult({super.key, required this.destination, required this.toDate, required this.passengerNumber, required this.from});

  final FlightResultController flightResultController = Get.put(FlightResultController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  from,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.apply(color: tWhiteColor),
                ),
                Text(
                  "-",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.apply(color: tWhiteColor),
                ),
                Text(
                  destination,

                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.apply(color: tWhiteColor),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "$toDate, ",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.apply(color: tWhiteColor),
                ),
                Text(
                  "$passengerNumber  $tPassenger",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.apply(color: tWhiteColor),
                ),
              ],
            )
          ],
        ),
        centerTitle: false,
        backgroundColor: tPrimaryColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: tWhiteColor,
        ),
      ),
      backgroundColor: chromeGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: tSmallPadding + 2.0,vertical: tSmallPadding),
        width:  Helper.screenWidth() * 0.55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(tLargeRadius),
          color: tPrimaryColor,
        ),


        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [


              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => Get.to(() => const FlightFilters()),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(Icons.filter_list_sharp,color: tWhiteColor,),


                      const SizedBox(width: tSmallWidth,),

                      Flexible(
                        flex: 1,
                        child: Text(
                          tFilters,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: tWhiteColor,
                          ),

                        ),
                      )
                    ],
                  ),
                ),
              ),

              VerticalDivider(
                color: tWhiteColor.withOpacity(0.3),
                thickness: 1,
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: () => Get.to(() => const PriceChart()),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Icon(

                        LineAwesomeIcons.area_chart,color: tWhiteColor,),


                      const SizedBox(width: tSmallWidth,),

                      Flexible(
                        flex: 1,
                        child: Text(
                          tPriceChart,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: tWhiteColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: tDefaultHeight,),

              buildDirectFlight(context),
              const SizedBox(height: tDefaultHeight,),
              buildCheapest(context),
              const SizedBox(height: tDefaultHeight,),
              buildPopular(context),
              const SizedBox(height: tDefaultHeight * 3,),

            ],
          ),
        ),
      ),

    );
  }




  final List<DirectFlightCards> directFlightCards = [
    const DirectFlightCards(image: iEasyJet, price: "60", time: ["07:10","08:15","11:45","13:50","14:55"], isLastItem: false, flightName: tEasyJet),
   const DirectFlightCards(image: iAirFrance, price: "65", time: ["07:10","09:15","11:45","16:50","19:15"], isLastItem: false, flightName: tAirFrance),
    const DirectFlightCards(image: iBritishAirways, price: "70", time: ["07:10","08:15","11:45","13:50","14:55"], isLastItem: true, flightName: tBritishAirways),
  ];


  Widget buildDirectFlight( BuildContext context) =>  Container(
    width: Helper.screenWidth() * 0.95,
    padding: const EdgeInsets.symmetric(vertical: tSmallPadding, horizontal: tDefaultPadding),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(tSmallRadius),
      color: tWhiteColor
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          flex: 0,
          child: Text(
           tDirectFlightSchedule,
           overflow: TextOverflow.ellipsis,
           style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),

       const SizedBox(height: tDefaultHeight,),

        ListView(
          physics: const NeverScrollableScrollPhysics(),

          shrinkWrap: true,
          children: directFlightCards,
        ),

      ],

    ),
  );

  Widget buildCheapest(BuildContext context) => const CheapestCards();

  final List<PopularCards> popularCards = [
    const PopularCards(popularFlightTime: "12:34 - 13:10", popularPrice: "\$69", popularLogo: iEasyJet, popularType: tDirect, popularTravelTime: "45min", popularFrom: "SEN", popularTo: "DLA", isLastItem: false),
    const PopularCards(popularFlightTime: "11:34 - 13:10", popularPrice: "\$72", popularLogo: iAirFrance, popularType: tDirect, popularTravelTime: "1h 45min", popularFrom: "LUX", popularTo: "YDE", isLastItem: false),
    const PopularCards(popularFlightTime: "10:34 - 13:10", popularPrice: "\$70", popularLogo: iBritishAirways, popularType: tDirect, popularTravelTime: "2h 30min", popularFrom: "IST", popularTo: "DLA", isLastItem: true)
  ];

  Widget buildPopular(BuildContext context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: tSmallPadding - 2,horizontal: tSmallPadding +5 ),
        decoration: BoxDecoration(
          color: tAccentColor,
          borderRadius: BorderRadius.circular(tDefaultRadius),
        ),
        child: Text(
          tPopular,
          style: Theme.of(context).textTheme.headlineMedium?.apply(
            color: tWhiteColor,
          ),
        ),

      ),

      Container(

          width: Helper.screenWidth() * 0.95,
          //height: 200,
          padding: const EdgeInsets.symmetric( horizontal: tDefaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(tSmallRadius),
              color: tWhiteColor
          ),
          child: ListView(
            physics: const NeverScrollableScrollPhysics(),

            shrinkWrap: true,
            children:  popularCards,
          ),
      ),
    ],
  ) ;
}
