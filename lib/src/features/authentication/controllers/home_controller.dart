import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../dialogues/message_dialogue.dart';
import '../../../repository/authentication_repository/authentication_repository.dart';


class HomeController extends GetxController{

  static HomeController  get instance => Get.find();

  String balance = "\$0.00";

  RxInt numberOfSearches = 0.obs;

  RxBool isFlightSelected = true.obs, isHotelSelected = false.obs, isTaxiSelected = false.obs;



  switchTabs(String text){


    if(text.contains(tFlights)) {
      isFlightSelected.value = true;
      isHotelSelected.value = false;
      isTaxiSelected.value = false;



      //TODO: Do number of searches for flights
    }
    else if(text.contains(tHotels)){
      isFlightSelected.value = false;
      isHotelSelected.value = true;
      isTaxiSelected.value = false;



      //TODO: Do number of searches for hotels

    }
    else{
     isFlightSelected.value = false;
     isHotelSelected.value = false;
     isTaxiSelected.value = true;
     print("In here Taxi");

      //TODO: Do number of searches for taxi
    }

  }






}