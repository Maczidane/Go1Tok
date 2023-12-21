

import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:get/get.dart';

class FlightFiltersController extends GetxController{
  static FlightFiltersController get instance => Get.find();

  RxString sortBy = "Recommended".obs;

  ///Range Slider
  RxDouble minSliderValueRange = 0.0.obs, maxSliderValueRange = 10.0.obs;
  // RxDouble minSliderValueC = 1.0.obs, maxSliderValueC = 100000.0.obs;

  RxDouble ratingValue = 0.0.obs;

  ///Rating Slider
  RxDouble minSliderValueRating = 0.0.obs, maxSliderValueRating = 10.0.obs;


  /// Location Slider
  RxDouble minLocationSliderValue = 0.0.obs, maxLocationSliderValue = 176.1.obs;
  //RxDouble minSliderValueC = 1.0.obs, maxSliderValueC = 100000.0.obs;
  RxDouble locationValue = 0.0.obs;

  RxBool baggageIncluded = false.obs, directFlight = false.obs, noInterline = false.obs, noOvernight = false.obs;
  RxBool noAirportChanges = false.obs, hostels = false.obs, apartments = false.obs;

  RxInt flightNumberAfterFilter = 350.obs, numberOfLayOvers = 2.obs;

  changeRatingValue(String type, val){

    if(type.contains(tLocation)){
      ratingValue.value = val;
    }{
      locationValue.value = val;
      //print("Value: ${locationValue.value.toString()}");

    }
  }



}