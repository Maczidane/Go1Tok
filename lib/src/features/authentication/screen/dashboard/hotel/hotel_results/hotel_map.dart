import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/hotel_result_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/filters.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/hotel_range_slider.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/size.dart';
class HotelMap extends StatefulWidget {
  const HotelMap({super.key});

  @override
  State<HotelMap> createState() => _HotelMapState();
}

class _HotelMapState extends State<HotelMap> {



  @override
  Widget build(BuildContext context) {

    final hotelResultController = Get.put(HotelResultController());
    final LatLng _kMapCenter =
    LatLng(hotelResultController.lat.value, hotelResultController.lng.value);

     final CameraPosition _kInitialPosition =
    CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          tSearchResults,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.apply(color: tWhiteColor),
        ),
        centerTitle: true,
        backgroundColor: tPrimaryColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: tWhiteColor,
        ),
      ),
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


            children: [


              GestureDetector(
                onTap: () => Get.to(() => const Filters()),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.filter_list_sharp,color: tWhiteColor,),


                    const SizedBox(width: tSmallWidth,),
                    Flexible(
                      flex: 0,
                      child: Text(
                        tFilters,
                        style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: tWhiteColor,
                        ),

                      ),
                    ),
                  ],
                ),
              ),

              VerticalDivider(
                color: tWhiteColor.withOpacity(0.3),
                thickness: 1,
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                   const Icon(

                       LineAwesomeIcons.list,
                  color: tWhiteColor,),


                    const SizedBox(width: tSmallWidth,),

                    Flexible(
                      flex: 0,
                      child: Text(
                        tList,
                        style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: tWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
      body:  Stack(
        children: [

          Positioned(
            top: 0,
            child: SizedBox(
              width: Helper.screenWidth(),
              height: Helper.screenHeight(),
              child: GoogleMap(
                initialCameraPosition: _kInitialPosition,
                mapType: MapType.normal,
                compassEnabled: true,
                myLocationEnabled: true,


              ),
            ),
          ),

          Positioned(
            top: 5,
            left: 10,
            right: 10,
            child:
              Container(
                width: Helper.screenWidth(),
               // padding: EdgeInsets.symmetric(horizontal: tDefaultPadding),
                //height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tSmallRadius),
                  color: tWhiteColor,
                ),
                child: RangeSliderItem(
                    title: tPrice,
                    initialMinValue: hotelResultController.minSliderValue.value,
                    initialMaxValue: hotelResultController.maxSliderValue.value,
                    onMinValueChanged: (v) {},
                    onMaxValueChanged: (v) {},
                  ),
              ),
              ),




        ],
      ),
    );
  }
}
