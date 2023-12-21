import 'package:Go1Tok/src/features/authentication/controllers/hotel_controller.dart';
import 'package:get/get.dart';

import '../../../constants/text_strings.dart';

class HotelRoomsController extends GetxController{
  static HotelRoomsController get instance => Get.find();

  HotelController hotelController = Get.put(HotelController());

  late int hotelRoom;
 late RxString room ;


  RxBool oneAdultSelected = true.obs,
      twoAdultsSelected = false.obs,
      threeAdultsSelected = false.obs;


  RxString text =''.obs;

  RxInt adult1 = 1.obs;
  RxInt child = 0.obs;
  RxInt child1 = 0.obs;
  RxInt child2 = 0.obs;
  RxInt child3 = 0.obs;
  RxInt child4 = 0.obs;

  @override
  void onReady() {
    ///This will check the selected field in
    /// the the flight search and auto select the
    /// same field in the passenger class page


    /*if(passenger.substring(0,passenger.indexOf(",")).contains(tEconomyClass)){

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

    }*/

    getHotelRoom();

  }

getHotelRoom(){
    hotelRoom = hotelController.whichRoom.value;
    if(hotelRoom == 1){
       room = hotelController.room1;
       print("First");

    }
    else if(hotelRoom == 2){
      room = hotelController.room2;
      print("Second");
    }
    else{
      room = hotelController.room3;
      print("Third");
    }
}

  apply(){



    if(adult1.value == 1 && child.value == 0){
      room.value = "${adult1.value} $tAdult";

    }
    else if(adult1.value == 1 && child.value == 1){
      room.value = "${adult1.value} $tAdult, ${child.value} $tChild";
    }
    else if(adult1.value == 1 && child.value > 1){
      room.value = "${adult1.value} $tAdult, ${child.value} $tChildrens";
    }
    else{
      room.value = "${adult1.value} $tAdults, ${child.value} $tChildrens";
    }
    Get.back();
  }

  setAdultNumber(int value){

    adult1.value = value;
  }

  setChildrenNumber(int value){

    child.value = value;

    /// This will reset all values of the children
    if(value == 0){
      child1.value = value;
      child2.value = value;
      child3.value = value;
      child4.value = value;
    }
  }

  setChild(int value){

    child1.value = value;
  }
  setChild2(int value){

    child2.value = value;
  }
  setChild3(int value){

    child3.value = value;
  }
  setChild4(int value){

    child4.value = value;
  }
}