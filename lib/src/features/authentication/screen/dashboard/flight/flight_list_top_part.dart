import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/features/authentication/models/country_list.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_results/flight_search_result.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/passenger_class.dart';
import 'package:flutter/material.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/flight_search_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/clip_path/CustomShapeClipper.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';


class FlightListTopPart extends StatelessWidget {
final flightController = Get.put(FlightSearchController());
   FlightListTopPart({super.key});

static const List<StateModel> usStates = <StateModel>[
  StateModel('Alabama', 'AL'),
  StateModel('Alaska', 'AK'),
  StateModel('Arizona', 'AZ'),
  StateModel('Arkansas', 'AR'),
  StateModel('California', 'CA'),
  StateModel('Colorado', 'CO'),
  StateModel('Connecticut', 'CT'),

];


  @override
  Widget build(BuildContext context) {
    final flightSearchController = Get.put(FlightSearchController());

    StateModel selectedUsState = usStates[0];

    return Stack(
      children: [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: Helper.screenHeight() * 0.5,
            decoration:  const BoxDecoration(
                gradient: LinearGradient(colors: [
                  tPrimaryColor,
                  secondPrimaryColor,
                ])),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: tDefaultPadding, vertical: tDefaultPadding + 4.0),
              child: Obx(
                    () => Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => flightSearchController.switchTabs(1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: tDefaultBorder,
                              vertical: tDefaultBorder),
                          //color: Colors.green,
                          // height: 30,
                          //width: Helper.screenWidth() * 0.3,
                          decoration: BoxDecoration(

                            //color: tWhiteColor,

                              borderRadius:
                              BorderRadius.circular(tDefaultBorder),
                              border: Border.all(
                                color: flightSearchController
                                    .oneWaySelected.value
                                    ? tWhiteColor
                                    : Colors.transparent,
                              )),
                          child: Center(
                            child: Text(
                              tOneWay,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(color: tWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => flightSearchController.switchTabs(2),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: tDefaultBorder,
                              vertical: tDefaultBorder),
                          //color: Colors.green,
                          // height: 30,
                          //width: Helper.screenWidth() * 0.3,
                          decoration: BoxDecoration(

                            //color: tWhiteColor,

                              borderRadius:
                              BorderRadius.circular(tDefaultBorder),
                              border: Border.all(
                                color: flightSearchController
                                    .roundTripSelected.value
                                    ? tWhiteColor
                                    : Colors.transparent,
                              )),
                          child: Center(
                            child: Text(
                              tRoundTrip,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(color: tWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => flightSearchController.switchTabs(3),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: tDefaultBorder,
                              vertical: tDefaultBorder),
                          //color: Colors.green,
                          // height: 30,
                          //width: Helper.screenWidth() * 0.3,
                          decoration: BoxDecoration(

                            //color: tWhiteColor,

                              borderRadius:
                              BorderRadius.circular(tDefaultBorder),
                              border: Border.all(
                                color: flightSearchController
                                    .multiCitySelected.value
                                    ? tWhiteColor
                                    : Colors.transparent,
                              )),
                          child: Center(
                            child: Text(
                              tMultiCity,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.apply(color: tWhiteColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: tDefaultSize - 10.0,
            ),
           Obx(() => SizedBox(
             width: Helper.screenWidth() * 0.9,
             height: Helper.screenHeight() * 0.5,

             child:  flightSearchController.oneWaySelected.value
                 ? oneWayCard(context)
                 : flightSearchController.roundTripSelected.value
                 ? roundTripCard(context)
                 : multiCityCard(context),
           ))
          ],
        )
      ],
    );
  }


  Widget oneWayCard(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: flightController.from.value.isEmpty ? Text(
                  tFrom,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tFrom,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      flightController.from.value,
                      style:
                      Theme.of(context).textTheme.headlineMedium?.apply(
                        //color: greyColor.withOpacity(0.9),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: tSmallPadding - 3.0,
                      vertical: tSmallPadding - 3.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(tSmallRadius)),
                      color: tAccentColor),
                  child: InkWell(
                      onTap: () {

                      },
                      child: const Icon(
                        Icons.import_export_outlined,
                        color: tWhiteColor,
                        size: tLargeIconSize,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: flightController.to.value.isEmpty ?  Text(
            tTo,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
              color: greyColor.withOpacity(0.9),
            ),
          ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tTo,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: greyColor.withOpacity(0.9),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  flightController.to.value,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                    //color: greyColor.withOpacity(0.9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap:() => flightController.showWithoutRange(context),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: flightController.departureDate.value.isEmpty ?  Text(
              tDeparture,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: greyColor.withOpacity(0.9),
              ),
            ) :  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tDeparture,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    flightController.departureDate.value,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                      //color: greyColor.withOpacity(0.9),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Get.to(() =>  PassengerAndClass()),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: flightController.passenger.value.isEmpty ?  Text(
              tClass,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: greyColor.withOpacity(0.9),
              ),
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tClass,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    flightController.passenger.value,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                      //color: greyColor.withOpacity(0.9),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: tDefaultHeight,),

      InkWell(
        onTap: () => Get.to(() =>  FlightSearchResult(from: flightController.from.value, destination: flightController.to.value,passengerNumber: "1",toDate: flightController.departureDate.value,)),

        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),

          decoration: BoxDecoration(
              color: tAccentColor,
              borderRadius: BorderRadius.circular(40)
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0 ),
          child:  Center(
            child: Text(
              tFindFlight,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tWhiteColor,
              ),
            ),
          ),
        ),
      ),

      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          const Icon(
            LineAwesomeIcons.check_circle_1,
            color: tAccentColor,
          ),
          const SizedBox(width: tSmallWidth,),
          Expanded(
            flex: 1,
            child: Text(
              tBestPriceGuarantee,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: tAccentColor
              ),

            ),
          )
        ],
      )


    ],
  );

  Widget roundTripCard(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: flightController.from.value.isEmpty ? Text(
                  tFrom,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tFrom,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      flightController.from.value,
                      style:
                      Theme.of(context).textTheme.headlineMedium?.apply(
                        //color: greyColor.withOpacity(0.9),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: tSmallPadding - 3.0,
                      vertical: tSmallPadding - 3.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(tSmallRadius)),
                      color: tAccentColor),
                  child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.import_export_outlined,
                        color: tWhiteColor,
                        size: tLargeIconSize,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: flightController.to.value.isEmpty ?  Text(
            tTo,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
              color: greyColor.withOpacity(0.9),
            ),
          ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tTo,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: greyColor.withOpacity(0.9),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  flightController.to.value,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                    //color: greyColor.withOpacity(0.9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => flightController.show(context),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: flightController.departureDate.value.isEmpty ?
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tDeparture,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_circle_right_rounded,
                      color: tPrimaryColor,
                    ),

                    Text(
                      tReturn,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                  ],
                )
              ],
            )  :
            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    Text(
                      tDeparture,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        flightController.departureDate.value,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium?.apply(
                          //color: greyColor.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
                const Icon(
                  Icons.arrow_circle_right_rounded,
                  color: tPrimaryColor,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      tReturn,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Text(
                        flightController.returnDate.value,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium?.apply(
                          //color: greyColor.withOpacity(0.9),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Get.to(() =>  PassengerAndClass()),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: flightController.passenger.value.isEmpty ?  Text(
              tClass,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: greyColor.withOpacity(0.9),
              ),
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tClass,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    flightController.passenger.value,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                      //color: greyColor.withOpacity(0.9),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: tDefaultHeight,),

      InkWell(
        onTap: () => Get.to(() =>  FlightSearchResult(from:flightController.from.value,destination: flightController.to.value,passengerNumber: flightController.passenger.value,toDate: flightController.departureDate.value,)),

        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),

          decoration: BoxDecoration(
              color: tAccentColor,
              borderRadius: BorderRadius.circular(40)
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0 ),
          child:  Center(
            child: Text(
              tFindFlight,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tWhiteColor,
              ),
            ),
          ),
        ),
      ),

      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          const Icon(
            LineAwesomeIcons.check_circle_1,
            color: tAccentColor,
          ),
          const SizedBox(width: tSmallWidth,),
          Expanded(
            flex: 1,
            child: Text(
              tBestPriceGuarantee,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: tAccentColor
              ),

            ),
          )
        ],
      )


    ],
  );

  Widget multiCityCard(BuildContext context) => Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: flightController.from.value.isEmpty ? Text(
                  tFrom,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ) : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tFrom,
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      flightController.from.value,
                      style:
                      Theme.of(context).textTheme.headlineMedium?.apply(
                        //color: greyColor.withOpacity(0.9),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: tSmallPadding - 3.0,
                      vertical: tSmallPadding - 3.0),
                  decoration: const BoxDecoration(
                      borderRadius:
                      BorderRadius.all(Radius.circular(tSmallRadius)),
                      color: tAccentColor),
                  child: InkWell(
                      onTap: () {},
                      child: const Icon(
                        Icons.import_export_outlined,
                        color: tWhiteColor,
                        size: tLargeIconSize,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: flightController.to.value.isEmpty ?  Text(
            tTo,
            style: Theme.of(context).textTheme.bodyMedium?.apply(
              color: greyColor.withOpacity(0.9),
            ),
          ): Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                tTo,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: greyColor.withOpacity(0.9),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  flightController.to.value,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headlineMedium?.apply(
                    //color: greyColor.withOpacity(0.9),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
        ),
        margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        elevation: 10.0,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding),
          child: flightController.departureDate.value.isEmpty ?
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tDeparture,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_circle_right_rounded,
                    color: tPrimaryColor,
                  ),

                  Text(
                    tReturn,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  ),
                ],
              )
            ],
          )  :  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    tDeparture,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      flightController.departureDate.value,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                        //color: greyColor.withOpacity(0.9),
                      ),
                    ),
                  ),
                ],
              ),
              const Icon(
                Icons.arrow_circle_right_rounded,
                color: tPrimaryColor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  Text(
                    tReturn,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Text(
                      flightController.returnDate.value,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                        //color: greyColor.withOpacity(0.9),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      GestureDetector(
        onTap: () => Get.to(() =>  PassengerAndClass()),
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(tMediumRadius)),
          ),
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
          elevation: 10.0,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: flightController.passenger.value.isEmpty ?  Text(
              tClass,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: greyColor.withOpacity(0.9),
              ),
            ) : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  tClass,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Text(
                    flightController.passenger.value,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                      //color: greyColor.withOpacity(0.9),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: tDefaultHeight,),

      InkWell(
         onTap: () => Get.to(() =>  FlightSearchResult(from:flightController.from.value,destination: flightController.to.value,passengerNumber: flightController.passenger.value,toDate: flightController.departureDate.value,)),
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),

          decoration: BoxDecoration(
              color: tAccentColor,
              borderRadius: BorderRadius.circular(40)
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0 ),
          child:  Center(
            child: Text(
              tFindFlight,
              style: Theme.of(context).textTheme.headlineMedium?.apply(
                color: tWhiteColor,
              ),
            ),
          ),
        ),
      ),

      Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          const Spacer(),
          const Icon(
            LineAwesomeIcons.check_circle_1,
            color: tAccentColor,
          ),
          const SizedBox(width: tSmallWidth,),
          Expanded(
            flex: 1,
            child: Text(
              tBestPriceGuarantee,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: tAccentColor
              ),

            ),
          )
        ],
      )


    ],
  );
}
