import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/hotel_results.dart';
import 'package:flutter/material.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/clip_path/CustomShapeClipper.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:dotted_border/dotted_border.dart';

import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../controllers/hotel_controller.dart';

class HotelListTopPart extends StatelessWidget {
  final hotelController = Get.put(HotelController());

  HotelListTopPart({super.key});

  @override
  Widget build(BuildContext context) {
    final hotelController = Get.put(HotelController());

    return Stack(
      children: [
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            height: Helper.screenHeight() * 0.8,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              tPrimaryColor,
              secondPrimaryColor,
            ])),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: tDefaultPadding, vertical: tDefaultPadding + 4.0),
          child: SingleChildScrollView(

            child: Column(
              children: [
                const SizedBox(
                  height: tDefaultSize - 10.0,
                ),
                Obx(() => SizedBox(
                      width: Helper.screenWidth() * 0.9,
                      height: Helper.screenHeight() * 0.7,
                      child: hotelController.oneAdultSelected.value
                          ? oneAdultCard(context)
                          : hotelController.twoAdultsSelected.value
                              ? twoAdultsCard(context)
                              : threeAdultsCard(context),
                    ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget oneAdultCard(BuildContext context) => Column(
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
              child: hotelController.destination.value.isEmpty
                    ? Text(
                        tDestination,
                        style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: greyColor.withOpacity(0.9),
                            ),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tDestination,
                            style:
                                Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: greyColor.withOpacity(0.9),
                                    ),
                          ),
                          Text(
                            hotelController.destination.value,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.apply(
                                    //color: greyColor.withOpacity(0.9),
                                    ),
                          )
                        ],
                      ),

            ),
          ),
          GestureDetector(
            onTap: (){
             hotelController.show(context);
            },
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
                child: hotelController.checkIn.value.isEmpty
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tCheckIn,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_circle_right_rounded,
                          color: tPrimaryColor,
                        ),
                        Text(
                          tCheckOut,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                      ],
                    )
                  ],
                )
                    : Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tCheckIn,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            hotelController.checkIn.value,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.apply(
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
                      mainAxisSize: MainAxisSize.min,                      children: [
                        Text(
                          tCheckOut,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Text(
                            hotelController.checkOut.value,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.apply(
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
            onTap: () => hotelController.gotoHotelRooms(1),
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
                child:  hotelController.room1.value.isEmpty
                      ? Text(
                    tRoom1,
                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  )
                      : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tRoom1,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      Text(
                        hotelController.room1.value,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.apply(
                         //color: tDarkColor.withOpacity(0.5),
                          //fontFamily: 'Roboto',
                        ),
                      )
                    ],
                  ),
                ),
              ),
          ),

          const SizedBox(height: tDefaultSize,),

          GestureDetector(
            onTap: () => hotelController.switchTabs(2),

              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                color: Colors.transparent,

                child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  color: tWhiteColor,
                  dashPattern: const [8, 4],
                  
                  

                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: tDefaultPadding, vertical: tDefaultPadding),

                    child:  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      const   Icon(Icons.add, color: tWhiteColor,),
                        Text(tAddRoom, style: Theme.of(context).textTheme.titleLarge?.apply(
                          color: tWhiteColor,
                        ),),
                      ],
                    ),
                  ),
                ),
              ),
            ),

          const SizedBox(
            height: tDefaultHeight,
          ),
  InkWell(
  onTap: () => Get.to(() => const HotelResults()),

  child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
            decoration: BoxDecoration(
                color: tAccentColor, borderRadius: BorderRadius.circular(40)),
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0),
            child: Center(
              child: Text(
                tSearch,
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
              const SizedBox(
                width: tSmallWidth,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  tBestPriceGuarantee,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: tAccentColor),
                ),
              )
            ],
          )
        ],
      );


  Widget twoAdultsCard(BuildContext context) => Column(
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
              child: hotelController.destination.value.isEmpty
                  ? Text(
                tDestination,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: greyColor.withOpacity(0.9),
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tDestination,
                    style:
                    Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    hotelController.destination.value,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.apply(
                      //color: greyColor.withOpacity(0.9),
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
              child: hotelController.checkIn.value.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tCheckIn,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                        color: tPrimaryColor,
                      ),
                      Text(
                        tCheckOut,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  )
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        tCheckIn,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          hotelController.checkIn.value,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
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
                    mainAxisSize: MainAxisSize.min,                     children: [
                      Text(
                        tCheckOut,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          hotelController.checkOut.value,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
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
            onTap: () => hotelController.gotoHotelRooms(1),
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
                child:  hotelController.room1.value.isEmpty
                    ? Text(
                  tRoom1,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tRoom1,
                      style:
                      Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      hotelController.room1.value,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.apply(
                        //color: tDarkColor.withOpacity(0.5),
                        //fontFamily: 'Roboto',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () => hotelController.gotoHotelRooms(2),
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
                child:  hotelController.room2.value.isEmpty
                    ? Text(
                  tRoom2,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                )
                    : Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        Text(
                          tRoom2,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          hotelController.room2.value,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
                            //color: tDarkColor.withOpacity(0.5),
                            //fontFamily: 'Roboto',
                          ),
                        ),


                  ],
                ),

                    hotelController.twoAdultsSelected.value ?   InkWell(
                      onTap: () {
                        hotelController.switchTabs(1);
                        hotelController.clearValues(2);
                      },
                      child: const CircleAvatar(
                           backgroundColor: Colors.red,
                           radius: 13,

                           child:   Center(child: Icon(LineAwesomeIcons.minus,color: tWhiteColor,)),
                         ),
                    ) : const Text(""),
                      ],
                    ),
              ),
            ),
          ),

          const SizedBox(height: tDefaultSize,),

          GestureDetector(
            onTap: () => hotelController.switchTabs(3),

            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
              color: Colors.transparent,

              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: const Radius.circular(12),
                color: tWhiteColor,
                dashPattern: const [8, 4],



                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: tDefaultPadding, vertical: tDefaultPadding),

                  child:  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const   Icon(Icons.add, color: tWhiteColor,),
                      Text(tAddRoom, style: Theme.of(context).textTheme.titleLarge?.apply(
                        color: tWhiteColor,
                      ),),
                    ],
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(
            height: tDefaultHeight,
          ),
          InkWell(

              onTap: () => Get.to(() => const HotelResults()),


            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
              decoration: BoxDecoration(
                  color: tAccentColor, borderRadius: BorderRadius.circular(40)),
              padding: const EdgeInsets.symmetric(
                  horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0),
              child: Center(
                child: Text(
                  tSearch,
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
              const SizedBox(
                width: tSmallWidth,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  tBestPriceGuarantee,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: tAccentColor),
                ),
              )
            ],
          )
        ],
      );

  Widget threeAdultsCard(BuildContext context) => Column(
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
              child: hotelController.destination.value.isEmpty
                  ? Text(
                tDestination,
                style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: greyColor.withOpacity(0.9),
                ),
              )
                  : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tDestination,
                    style:
                    Theme.of(context).textTheme.bodyMedium?.apply(
                      color: greyColor.withOpacity(0.9),
                    ),
                  ),
                  Text(
                    hotelController.destination.value,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.apply(
                      //color: greyColor.withOpacity(0.9),
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
              child: hotelController.checkIn.value.isEmpty
                  ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        tCheckIn,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      const Icon(
                        Icons.arrow_circle_right_rounded,
                        color: tPrimaryColor,
                      ),
                      Text(
                        tCheckOut,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                    ],
                  )
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,                     children: [
                      Text(
                        tCheckIn,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          hotelController.checkIn.value,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
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
                   mainAxisSize: MainAxisSize.min,                     children: [
                      Text(
                        tCheckOut,
                        style:
                        Theme.of(context).textTheme.bodyMedium?.apply(
                          color: greyColor.withOpacity(0.9),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Text(
                          hotelController.checkOut.value,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
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
            onTap: () => hotelController.gotoHotelRooms(1),
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
                child:  hotelController.room1.value.isEmpty
                    ? Text(
                  tRoom1,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tRoom1,
                      style:
                      Theme.of(context).textTheme.bodyMedium?.apply(
                        color: greyColor.withOpacity(0.9),
                      ),
                    ),
                    Text(
                      hotelController.room1.value,
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.apply(
                        //color: tDarkColor.withOpacity(0.5),
                        //fontFamily: 'Roboto',
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () => hotelController.gotoHotelRooms(2),
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
                child:  hotelController.room2.value.isEmpty
                    ? Text(
                  tRoom2,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                )
                    : Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tRoom2,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          hotelController.room2.value,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
                            //color: tDarkColor.withOpacity(0.5),
                            //fontFamily: 'Roboto',
                          ),
                        ),


                      ],
                    ),

                    hotelController.twoAdultsSelected.value ?   InkWell(
                      onTap: (){
                        hotelController.switchTabs(1);
                        hotelController.clearValues(2);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 13,

                        child:   Center(child: Icon(LineAwesomeIcons.minus,color: tWhiteColor,)),
                      ),
                    ) : const Text(""),
                  ],
                ),
              ),
            ),
          ),

          GestureDetector(
            onTap: () => hotelController.gotoHotelRooms(3),
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
                child:  hotelController.room3.value.isEmpty
                    ? Text(
                  tRoom3,
                  style: Theme.of(context).textTheme.bodyMedium?.apply(
                    color: greyColor.withOpacity(0.9),
                  ),
                )
                    : Row(

                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tRoom3,
                          style:
                          Theme.of(context).textTheme.bodyMedium?.apply(
                            color: greyColor.withOpacity(0.9),
                          ),
                        ),
                        Text(
                          hotelController.room3.value,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(
                            //color: tDarkColor.withOpacity(0.5),
                            //fontFamily: 'Roboto',
                          ),
                        ),


                      ],
                    ),

                    hotelController.threeAdultsSelected.value ?   InkWell(
                      onTap: () {

                        hotelController.switchTabs(2);
                        hotelController.clearValues(3);
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 13,

                        child:   Center(child: Icon(LineAwesomeIcons.minus,color: tWhiteColor,)),
                      ),
                    ) : const Text(""),
                  ],
                ),
              ),
            ),
          ),
          

          const SizedBox(
            height: tDefaultHeight,
          ),
         InkWell(
           onTap: () => Get.to(() => const HotelResults()),
           child: Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                decoration: BoxDecoration(
                    color: tAccentColor, borderRadius: BorderRadius.circular(40)),
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0),
                child: Center(
                  child: Text(
                    tSearch + "fddf",
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
              const SizedBox(
                width: tSmallWidth,
              ),
              Expanded(
                flex: 1,
                child: Text(
                  tBestPriceGuarantee,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.apply(color: tAccentColor),
                ),
              )
            ],
          )
        ],
      );


}
