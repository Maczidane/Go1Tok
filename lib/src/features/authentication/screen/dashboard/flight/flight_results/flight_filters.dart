import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';

import '../../../../../../constants/text_strings.dart';
import '../../../../controllers/flight_filter_controller.dart';
import '../../../../controllers/flight_result_controller.dart';
import 'package:flutter_switch/flutter_switch.dart';

class FlightFilters extends StatefulWidget {
  const FlightFilters({super.key});

  @override
  State<FlightFilters> createState() => _FlightFiltersState();
}

class _FlightFiltersState extends State<FlightFilters> {
  final flightFilterController = Get.put(FlightFiltersController());

  final flightResultController = Get.put(FlightResultController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          tFilters,
          style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tDarkColor,
              ),
        ),
        backgroundColor: tWhiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.cancel_outlined,
            color: tDarkColor,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              tReset,
              style: Theme.of(context).textTheme.headlineSmall?.apply(
                    color: tPrimaryColor,
                  ),
            ),
          )
        ],
      ),
      backgroundColor: chromeGrey,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(
            vertical: tDefaultPadding, horizontal: tDefaultPadding),
        child: Container(
          width: Helper.screenWidth() * 0.4,
          height: Helper.screenHeight() * 0.05,
          decoration: BoxDecoration(
            color: tPrimaryColor,
            borderRadius: BorderRadius.circular(tSmallRadius),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // mainAxisAlignment: ,
            children: [
              Text(
                tShow.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                      color: tWhiteColor,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                flightFilterController.flightNumberAfterFilter
                    .toString()
                    .toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                      color: tWhiteColor,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                tTickets.toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                      color: tWhiteColor,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: tDefaultSize - 15.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: tSmallPadding, horizontal: tDefaultPadding + 1.0),
              child: Text(
                tPopularFilters,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: tDefaultSize - 25.0,
            ),

            /// Popular Filters
            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: tDefaultPadding, horizontal: tDefaultPadding),
                child: Obx(
                  () => Row(
                    children: [
                      InkWell(
                        onTap: () =>
                            flightFilterController.baggageIncluded.value
                                ? flightFilterController.baggageIncluded.value =
                                    false
                                : flightFilterController.baggageIncluded.value =
                                    true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: tDefaultPadding - 5.0,
                              horizontal: tDefaultPadding),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(tDefaultRadius),
                              color:
                                  flightFilterController.baggageIncluded.value
                                      ? tPrimaryColor
                                      : null,
                              border: Border.all(
                                  color: flightFilterController
                                          .baggageIncluded.value
                                      ? tWhiteColor
                                      : chromeGrey,
                                  width: 2.0)),
                          child: Text(
                            tBaggageIncluded,
                            style:
                                Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: flightFilterController
                                              .baggageIncluded.value
                                          ? tWhiteColor
                                          : null,
                                    ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: tDefaultHeight - 10.0,
                      ),
                      InkWell(
                        onTap: () => flightFilterController.directFlight.value
                            ? flightFilterController.directFlight.value = false
                            : flightFilterController.directFlight.value = true,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: tDefaultPadding - 5.0,
                              horizontal: tDefaultPadding),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(tDefaultRadius),
                              color: flightFilterController.directFlight.value
                                  ? tPrimaryColor
                                  : null,
                              border: Border.all(
                                  color:
                                      flightFilterController.directFlight.value
                                          ? tWhiteColor
                                          : chromeGrey,
                                  width: 2.0)),
                          child: Text(
                            tDirectFlights,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(
                                  color:
                                      flightFilterController.directFlight.value
                                          ? tWhiteColor
                                          : null,
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: tDefaultSize - 10.0,
            ),

            /// Layovers
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: tSmallPadding, horizontal: tDefaultPadding + 1.0),
              child: Text(
                tLayOvers,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(
              height: tDefaultSize - 25.0,
            ),
            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: tDefaultPadding, horizontal: tDefaultPadding),
                child: Obx(
                      () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text(
                          tLayOvers,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Container(


                          decoration:  BoxDecoration(
                            color: chromeGrey,
                            borderRadius: BorderRadius.circular(tDefaultRadius),

                          ),
                          padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tSmallPadding),

                          child: Text(
                           "$tUpTo ${flightFilterController.numberOfLayOvers.value}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),

                        ),

                      ],
                    ),
                      RangeSliderFlutter(
                        // key: Key('3343'),
                        values: [0,1,2],
                        rangeSlider: false,
                        tooltip: RangeSliderFlutterTooltip(
                          alwaysShowTooltip: true,
                        ),
                        max: 5,
                        textPositionTop: -100,
                        handlerHeight: 20,
                        trackBar:RangeSliderFlutterTrackBar(
                          activeTrackBarHeight: 6,
                          inactiveTrackBarHeight: 6,
                          activeTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: tPrimaryColor,
                          ),
                          inactiveTrackBar: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: chromeGrey,
                          ),
                        ),

                        min: 0,
                        step: const RangeSliderFlutterStep(step: 1,isPercentRange: false),

                        fontSize: 15,
                        textBackgroundColor:tPrimaryColor,



                        onDragging: (handlerIndex, lowerValue, upperValue) {
                         // _lowerValue = lowerValue;
                          //_upperValue = upperValue;
                          int y = upperValue.round();
                          //int x = int.parse(y.toString());
                          //flightFilterController.numberOfLayOvers.value = x;
                          print(y.toInt());
                          setState(() {});
                        },

                      ),

                    ],
                  ),
                ),
              ),
            ),


            const SizedBox(
              height: tDefaultSize - 25.0,
            ),

            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: tDefaultPadding, horizontal: tDefaultPadding),
                child: Obx(
                  () => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tNoInterline,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          FlutterSwitch(

                              value: flightFilterController.noInterline.value,
                              borderRadius: tDefaultSize - 10,
                              padding: tSmallPadding,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  flightFilterController.noInterline.value =
                                      val;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(
                          height: tDefaultSize - 15.0,
                      ),
                     const Divider(height: 3,color: chromeGrey,),
                      const SizedBox(
                        height: tDefaultSize - 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tNoInterline,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          FlutterSwitch(

                              value: flightFilterController.noOvernight.value,
                              borderRadius: tDefaultSize - 10,
                              padding: tSmallPadding,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  flightFilterController.noOvernight.value =
                                      val;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: tDefaultSize - 15.0,
                      ),
                     const Divider(height: 3,color: chromeGrey,),
                      const SizedBox(
                        height: tDefaultSize - 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            tNoInterline,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          FlutterSwitch(

                              value: flightFilterController.noAirportChanges.value,
                              borderRadius: tDefaultSize - 10,
                              padding: tSmallPadding,
                              showOnOff: true,
                              onToggle: (val) {
                                setState(() {
                                  flightFilterController.noAirportChanges.value =
                                      val;
                                });
                              }),
                        ],
                      ),
                      const SizedBox(
                        height: tDefaultSize - 15.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
