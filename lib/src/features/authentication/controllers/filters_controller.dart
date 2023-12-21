

import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:get/get.dart';

class FiltersController extends GetxController{
  static FiltersController get instance => Get.find();

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

  RxBool breakfast = false.obs, payNow = false.obs, freeCancellation = false.obs, payAtHotel = false.obs;
  RxBool hotel = false.obs, hostels = false.obs, apartments = false.obs;

  RxInt hotelNumberAfterFilter = 410.obs;

  changeRatingValue(String type, val){

    if(type.contains(tLocation)){
      ratingValue.value = val;
    }{
      locationValue.value = val;
      //print("Value: ${locationValue.value.toString()}");

    }
  }



}