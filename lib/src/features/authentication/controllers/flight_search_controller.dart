import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

class FlightSearchController extends GetxController {
  static FlightSearchController get instance => Get.find();

  RxBool oneWaySelected = true.obs,
      roundTripSelected = false.obs,
      multiCitySelected = false.obs;

  RxString from = ''.obs, to = ''.obs, departureDate= ''.obs, passenger= tClass.obs, returnDate= ''.obs;


  switchTabs(int tab){


    if(tab == 1) {
      oneWaySelected.value = true;
      roundTripSelected.value = false;
      multiCitySelected.value = false;



    }
    else if(tab == 2){
      oneWaySelected.value = false;
      roundTripSelected.value = true;
     multiCitySelected.value = false;





    }
    else{
      oneWaySelected.value = false;
      roundTripSelected.value = false;
      multiCitySelected.value = true;


    }

  }
}
