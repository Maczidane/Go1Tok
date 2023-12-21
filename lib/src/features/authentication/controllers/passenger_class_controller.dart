

import 'package:Go1Tok/src/features/authentication/controllers/flight_search_controller.dart';
import 'package:get/get.dart';

import '../../../constants/text_strings.dart';

class PassengerClassController extends GetxController{
  static PassengerClassController get instance => Get.find();

  FlightSearchController flightSearchController = Get.put(FlightSearchController());

  RxBool economySelected = true.obs,
      premiumSelected = false.obs,
      firstSelected = false.obs,
      businessSelected = false.obs;

  RxString text =''.obs;


  @override
  void onReady() {
    ///This will check the selected field in
    /// the the flight search and auto select the
    /// same field in the passenger class page
    ///
    ///
    String passenger = flightSearchController.passenger.value;

    if(passenger.substring(0,passenger.indexOf(",")).contains(tEconomyClass)){

      switchClassTabs(1);

    }
    else if(passenger.substring(0,passenger.indexOf(",")).contains(tPremium)){

      switchClassTabs(2);

    }
    else if(passenger.contains(tBusinessClass)){

      switchClassTabs(3);

    }
    else{

      switchClassTabs(4);

    }


  }

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

    flightSearchController.passenger.value = tEconomyClass;
    Get.back();
    }else if(premiumSelected.value){
      flightSearchController.passenger.value = tPremiumClass;
      Get.back();
    }
    else if(businessSelected.value){

      flightSearchController.passenger.value = tBusinessClass;
      Get.back();
    }
    else{
      flightSearchController.passenger.value = tFirstClass;
      Get.back();
    }

  }

}