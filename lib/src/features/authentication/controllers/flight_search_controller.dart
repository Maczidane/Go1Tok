import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/passenger_class_controller.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FlightSearchController extends GetxController {
  static FlightSearchController get instance => Get.find();

  //PassengerClassController passengerClassController = Get.put(PassengerClassController());

  RxBool oneWaySelected = true.obs,
      roundTripSelected = false.obs,
      multiCitySelected = false.obs;

  RxString from = 'London'.obs, to = 'Paris'.obs, departureDate= '13 January'.obs, passenger= tClass.obs, returnDate= ''.obs;


  late DateTimeRange resultRange;
  late DateTime resultDate;






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


  ///Use this if you want to merge
///flight search controller and
/// passenger class controller as one controller
  /*
  RxBool economySelected = true.obs,
      premiumSelected = false.obs,
      firstSelected = false.obs,
      businessSelected = false.obs;

  RxString text =''.obs;


  switchClassTabs(int tab){




    if(tab == 4) {


      economySelected.value = false;
      premiumSelected.value = false;
      businessSelected.value = false;
      firstSelected.value = true;



    }
    else if(tab == 2){
      economySelected.value = false;
      premiumSelected.value = true;
      businessSelected.value = false;
      firstSelected.value = false;






    }
    else if(tab == 3){
      economySelected.value = false;
      premiumSelected.value = false;
      businessSelected.value = true;
      firstSelected.value = false;



    }
    else{

      //print("Switching tabs 1");
      economySelected.value = true;
      premiumSelected.value = false;
      businessSelected.value = false;
      firstSelected.value = false;

    }

  }

  apply(){
    if(economySelected.value){

      flightSearchController.passenger = tEconomyClass.obs;
      Get.back();
    }else if(premiumSelected.value){
      flightSearchController.passenger = tPremiumClass.obs;
      Get.back();
    }
    else if(businessSelected.value){

      flightSearchController.passenger = tBusinessClass.obs;
      Get.back();
    }
    else{
      flightSearchController.passenger = tFirstClass.obs;
      Get.back();
    }

  }


   */




  void show( BuildContext context) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      //firstDate: checkIn.value.isEmpty ? DateTime.now().subtract(const Duration(days: 4)) : resultStart,
      //lastDate: checkOut.value.isEmpty ? DateTime(2030, 12, 31) : resultEnd,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      initialDateRange: departureDate.value.isEmpty ? null :  resultRange ,
      saveText: tSave,





    );
    if (result != null) {
      // Rebuild the UI


      ///Setting start and end date to be used initially
      /// This will auto input the previously selected dates
      resultRange = result;


      DateTime tarihStart = result.start;
      DateTime tarihEnd = result.end;

      setCheckInAndCheckOutDate(tarihStart, tarihEnd);

    }




  }

  void setCheckInAndCheckOutDate(DateTime tarihStart, DateTime tarishEnd) {



    departureDate.value = DateFormat('EEE, d MMM').format(tarihStart);
    returnDate.value = DateFormat('EEE, d MMM').format(tarishEnd);

  }



  void showWithoutRange( BuildContext context) async {
    final DateTime? result = await showDatePicker(
      context: context,

      firstDate: DateTime.now(),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      initialDate: departureDate.value.isEmpty ? DateTime.now() :  resultDate,
      confirmText: tSave,






    );
    if (result != null) {
      // Rebuild the UI


      ///Setting start and end date to be used initially
      /// This will auto input the previously selected dates
      resultDate = result;




      setDepartureDate(result);

    }




  }

  void setDepartureDate(DateTime tarihStart) {



    departureDate.value = DateFormat('EEE, d MMM').format(tarihStart);
    //returnDate.value = DateFormat('EEE, d MMM').format(tarishEnd);

  }

}
