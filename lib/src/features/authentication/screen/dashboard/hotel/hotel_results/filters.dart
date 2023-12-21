import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/filters_controller.dart';
import 'package:Go1Tok/src/features/authentication/controllers/hotel_result_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/hotel_range_slider.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/range_slider.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class Filters extends StatelessWidget {
  const Filters({super.key});

  @override
  Widget build(BuildContext context) {

    final filterController = Get.put(FiltersController());
    final hotelResultController = Get.put(HotelResultController());


    return Scaffold(
      appBar: AppBar(
        elevation: 5,

        title: Text(tFilters,
        style: Theme.of(context).textTheme.headlineMedium?.apply(
          color: tDarkColor,
        ),),
        backgroundColor: tWhiteColor,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.cancel_outlined, color: tDarkColor,),
        ),

        actions: [
          TextButton(onPressed: (){},
              child: Text(
                tReset,
                style: Theme.of(context).textTheme.headlineSmall?.apply(
                  color: tPrimaryColor,
                ),
              ),)
        ],

      ),
      backgroundColor: chromeGrey,
      bottomNavigationBar: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: tDefaultPadding,horizontal: tDefaultPadding),
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
              const SizedBox(width: 5,),
              Text(
                filterController.hotelNumberAfterFilter.toString().toUpperCase(),
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                  color: tWhiteColor,
                ),
              ),
              const SizedBox(width: 5,),
              Text(
                tHotels.toUpperCase(),
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
            const SizedBox(height: tDefaultSize - 10.0,),
            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tDefaultPadding + 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tSortBy,
                          style: Theme.of(context).textTheme.headlineSmall?.apply(
                            color: tDarkColor,
                          ),
                        ),

                        Row(
                          children: [
                            Container(


                              decoration:  BoxDecoration(
                                color: chromeGrey,
                                borderRadius: BorderRadius.circular(tDefaultRadius),

                              ),
                              padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tSmallPadding),

                              child: Text(
                                filterController.sortBy.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),

                            ),
                            const SizedBox(width: tSmallWidth,),

                            Icon(Icons.arrow_forward_ios, color: greyColor.withOpacity(0.5),size: tDefaultSize - 10.0,)
                          ],
                        )

                      ],
                    ),
                  ),
                 const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: tDefaultPadding + 10.0),
                    child: Divider(color: chromeGrey,thickness: 2.0,),
                  ),

                  RangeSliderItem(
                    title: tPrice,
                    initialMinValue: hotelResultController.minSliderValue.value,
                    initialMaxValue: hotelResultController.maxSliderValue.value,

                    onMinValueChanged: (v) {},
                    onMaxValueChanged: (v) {},

                  ),

                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: tDefaultPadding + 10.0),
                    child: Divider(color: chromeGrey,thickness: 2.0,),
                  ),

                  RangeSliderRange(
                    title: tRating,
                    initialMinValue: filterController.minSliderValueRating.value,
                    initialMaxValue: filterController.maxSliderValueRating.value,
                    iconData: null,

                    onMinValueChanged: (v) {},
                    onMaxValueChanged: (v) {},
                  ),



                ],
              ),
            ),
            const SizedBox(height: tDefaultSize - 10.0,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tDefaultPadding + 1.0),

              child: Text(
                tLocation,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(height: tDefaultSize - 20.0,),
            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Column(
                children: [
                 

             

                  RangeSliderRange(
                    title: tCityCenter,
                    initialMinValue: filterController.minLocationSliderValue.value,
                    initialMaxValue: filterController.maxLocationSliderValue.value,
                    iconData: const Icon(Icons.location_on_sharp,color: tPrimaryColor,),

                    onMinValueChanged: (v) {},
                    onMaxValueChanged: (v) {},
                  ),

                  const Padding(
                    padding:  EdgeInsets.symmetric(horizontal: tDefaultPadding + 10.0),
                    child: Divider(color: chromeGrey,thickness: 2.0,),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tDefaultPadding + 1.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          tChooseOnMap,
                          style: Theme.of(context).textTheme.headlineSmall?.apply(
                            color: tDarkColor,
                          ),
                        ),

                        Icon(Icons.arrow_forward_ios, color: greyColor.withOpacity(0.5),size: tDefaultSize - 10.0,),

                      ],
                    ),
                  ),
              



                ],
              ),
            ),

            const SizedBox(height: tDefaultSize - 10.0,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tDefaultPadding + 1.0),

              child: Text(
                tMeals,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(height: tDefaultSize - 20.0,),

            /// Meals and Payment
            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: tDefaultPadding,horizontal: tDefaultPadding),
                child: Row(
                  children: [

                    Obx(
                    () => Column(
                        children: [
                          InkWell(
                            onTap: () => filterController.breakfast.value ? filterController.breakfast.value = false : filterController.breakfast.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(tDefaultRadius),
                                color: filterController.breakfast.value ? tPrimaryColor : null,
                                border: Border.all(
                                    color: filterController.breakfast.value ? tWhiteColor : chromeGrey,
                                  width: 2.0
                                )
                              ),
                              child: Text(
                                tBreakfast,
                                style: Theme.of(context).textTheme.bodyMedium?.apply(
                                  color: filterController.breakfast.value ? tWhiteColor : null,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: tDefaultHeight - 10.0,),
                          InkWell(
                            onTap: () => filterController.payNow.value ? filterController.payNow.value = false : filterController.payNow.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(tDefaultRadius),
                                  color: filterController.payNow.value ? tPrimaryColor : null,
                                  border: Border.all(
                                      color: filterController.payNow.value ? tWhiteColor : chromeGrey,
                                      width: 2.0
                                  )
                              ),
                              child: Text(
                                tPayNow,
                                style: Theme.of(context).textTheme.bodyMedium?.apply(
                                  color: filterController.payNow.value ? tWhiteColor : null,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: tDefaultWidth - 10.0,),
                    Obx(
                        () =>  Column(
                        children: [

                          InkWell(
                            onTap: () => filterController.freeCancellation.value ? filterController.freeCancellation.value = false : filterController.freeCancellation.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(tDefaultRadius),
                                  color: filterController.freeCancellation.value ? tPrimaryColor : null,
                                  border: Border.all(
                                      color: filterController.freeCancellation.value ? tWhiteColor : chromeGrey,
                                      width: 2.0
                                  )
                              ),
                              child: Text(
                                tFreeCancellation,
                                style: Theme.of(context).textTheme.bodyMedium?.apply(
                                  color: filterController.freeCancellation.value ? tWhiteColor : null,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: tDefaultHeight - 10.0,),
                          InkWell(
                            onTap: () => filterController.payAtHotel.value ? filterController.payAtHotel.value = false : filterController.payAtHotel.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(tDefaultRadius),
                                  color: filterController.payAtHotel.value ? tPrimaryColor : null,
                                border: Border.all(
                                  color: filterController.payAtHotel.value ? tWhiteColor : chromeGrey,
                                  width: 2.0
                                )
                              ),
                              child: Text(
                                tPayAtHotel,
                                style: Theme.of(context).textTheme.bodyMedium?.apply(
                                  color: filterController.payAtHotel.value ? tWhiteColor : null,
                                ),
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

            const SizedBox(height: tDefaultSize - 10.0,),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tDefaultPadding + 1.0),

              child: Text(
                tPropertyType,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),

            const SizedBox(height: tDefaultSize - 20.0,),

            /// Property type
            Container(
              color: tWhiteColor,
              width: double.infinity,
              //height: Helper.screenHeight() * 0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: tDefaultPadding,horizontal: tDefaultPadding),
                child: Column(
                  children: [

                    Obx(
                          () => Row(
                        children: [
                          InkWell(
                            onTap: () => filterController.hotel.value ? filterController.hotel.value = false : filterController.hotel.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(tDefaultRadius),
                                  color: filterController.hotel.value ? tPrimaryColor : null,
                                  border: Border.all(
                                      color: filterController.hotel.value ? tWhiteColor : chromeGrey,
                                      width: 2.0
                                  )
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.hotel,
                                    color: filterController.hotel.value ? tWhiteColor : null,

                                  ),
                                  const SizedBox(width: tDefaultWidth - 10.0,),

                                  Text(
                                    tHotel,
                                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: filterController.hotel.value ? tWhiteColor : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: tDefaultWidth - 10.0,),
                          InkWell(
                            onTap: () => filterController.hostels.value ? filterController.hostels.value = false : filterController.hostels.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(tDefaultRadius),
                                  color: filterController.hostels.value ? tPrimaryColor : null,
                                  border: Border.all(
                                      color: filterController.hostels.value ? tWhiteColor : chromeGrey,
                                      width: 2.0
                                  )
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    LineAwesomeIcons.bed,
                                    color: filterController.hostels.value ? tWhiteColor : null,

                                  ),
                                  const SizedBox(width: tDefaultWidth - 10.0,),

                                  Text(
                                    tHostels,
                                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: filterController.hostels.value ? tWhiteColor : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: tDefaultHeight - 10.0,),
                    Obx(
                          () =>  Column(
                        children: [

                          InkWell(
                            onTap: () => filterController.apartments.value ? filterController.apartments.value = false : filterController.apartments.value = true,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: tDefaultPadding - 5.0 ,horizontal: tDefaultPadding),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(tDefaultRadius),
                                  color: filterController.apartments.value ? tPrimaryColor : null,
                                  border: Border.all(
                                      color: filterController.apartments.value ? tWhiteColor : chromeGrey,
                                      width: 2.0
                                  )
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.apartment_outlined,
                                    color: filterController.apartments.value ? tWhiteColor : null,

                                  ),
                                  const SizedBox(width: tDefaultWidth - 10.0,),

                                  Text(
                                    tApartments,
                                    style: Theme.of(context).textTheme.bodyMedium?.apply(
                                      color: filterController.apartments.value ? tWhiteColor : null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: tDefaultHeight - 10.0,),

                        ],
                      ),
                    ),








                  ],
                ),
              ),
            ),

            const SizedBox(height: tDefaultSize - 10.0,),

          ],
        ),
      ),
    );
  }
}
