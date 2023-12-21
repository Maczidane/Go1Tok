import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/features/authentication/controllers/hotel_result_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/filters.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/hotel_range_slider.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/hotel_results_card.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../../../../constants/text_strings.dart';
import 'hotel_map.dart';

class HotelResults extends StatefulWidget {
  const HotelResults({super.key});

  @override
  State<HotelResults> createState() => _HotelResultsState();
}

class _HotelResultsState extends State<HotelResults> {


  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  bool showSelectedLabels = true;
  bool showUnselectedLabels = true;

  Color selectedColor = tWhiteColor;
  Color unselectedColor = Colors.blueGrey;

  Gradient selectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.amber]);
  Gradient unselectedGradient =
  const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

  Color? containerColor;
  List<Color> containerColors = [
    tPrimaryColor,
    secondPrimaryColor,
  ];


  @override
  Widget build(BuildContext context) {
    final hotelResultController = Get.put(HotelResultController());
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
      backgroundColor: chromeGrey,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.symmetric(horizontal: tSmallPadding + 2.0,vertical: tSmallPadding),
       width:  Helper.screenWidth() * 0.5,
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
                  onTap: () => Get.to(() => const Filters()),
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
                  onTap: () => Get.to(() => const HotelMap()),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                     const Icon(

                        LineAwesomeIcons.map,color: tWhiteColor,),


                      const SizedBox(width: tSmallWidth,),

                      Flexible(
                        flex: 1,
                        child: Text(
                          tMap,
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

            ],
          ),
        ),
      ),



      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: tSmallPadding),
        height: Helper.screenHeight(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              RangeSliderItem(
                title: tPrice,
                initialMinValue: hotelResultController.minSliderValue.value,
                initialMaxValue: hotelResultController.maxSliderValue.value,
                onMinValueChanged: (v) {},
                onMaxValueChanged: (v) {},
              ),
              resultItem(context)
            ],
          ),
        ),
      ),
    );


  }
  List<HotelResultsCard> hotelResultsCard = [
   HotelResultsCard(
      image: tHRoom1,
      price: 256,
      numberOfNights: 1,

      reviews: "8,5 - 885 reviews",
      distance: "4,8km",
      discountPrice: 0,
      discountPercentage: "",
      hotelName: "Smyth Tribeca",
      roomsLeft: 0,
      starNumber: 4,

      cityName: "Soho",
    ),
    HotelResultsCard(
      image: tHRoom2,
      price: 189,
      numberOfNights: 0,

      reviews: "8,9 - 3 917 reviews",
      distance: "4,5km",
      discountPrice: 160,
      discountPercentage: "-16%",
      hotelName: "The Tillary Hotel Brooklyn",
      roomsLeft: 1,
      starNumber: 4,

      cityName: "Las vegas",
    ),
    HotelResultsCard(
      image: tHRoom3,
      price: 103,
      numberOfNights: 0,

      reviews: "8,6 - 5 227 reviews",
      distance: "4,2km",
      discountPrice: 200,
      discountPercentage: "-49%",
      hotelName: "Holiday Inn Lower East Side, an I",
      roomsLeft: 0,
      starNumber: 4,

      cityName: "Lower East Side",
    ),
  ];
  Widget resultItem(BuildContext context) => Container(
    height: Helper.screenHeight(),

    padding: const EdgeInsets.symmetric(vertical: tDefaultPadding),

      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: hotelResultsCard,
      ),
  );
}
