import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/passenger_class_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_rooms.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class HotelController extends GetxController {
  static HotelController get instance => Get.find();

  //PassengerClassController passengerClassController = Get.put(PassengerClassController());
///Bool for number of rooms
  RxBool oneAdultSelected = true.obs,
      twoAdultsSelected = false.obs,
      threeAdultsSelected = false.obs;

 /// Bool to know which room has been clicked
  RxInt whichRoom = 1.obs;

  RxString destination = ''.obs, checkIn = ''.obs, checkOut= ''.obs, room1= t1Adult.obs, room2= t1Adult.obs, room3= t1Adult.obs;

late DateTimeRange resultRange;










  switchTabs(int tab){


    if(tab == 1) {
      oneAdultSelected.value = true;
      twoAdultsSelected.value = false;
      threeAdultsSelected.value = false;



    }
    else if(tab == 2){
      oneAdultSelected.value = false;
      twoAdultsSelected.value = true;
      threeAdultsSelected.value = false;





    }
    else{
      oneAdultSelected.value = false;
      twoAdultsSelected.value = false;
      threeAdultsSelected.value = true;


    }

  }


  ///Clear the values of the rooms to initial value
  clearValues(int value){
    if(value == 1){
      room1.value = t1Adult;
    }
    else if(value == 2){
      room2.value = t1Adult;
    }
    else{
      room3.value = t1Adult;
    }
  }



  ///This will move to next page and set initial ie if room1 was clicked or room2 or  room 3
  gotoHotelRooms(int value){
    whichRoom.value = value;
    Get.to(() => HotelRooms());

  }




  void show( BuildContext context) async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      //firstDate: checkIn.value.isEmpty ? DateTime.now().subtract(const Duration(days: 4)) : resultStart,
      //lastDate: checkOut.value.isEmpty ? DateTime(2030, 12, 31) : resultEnd,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      initialDateRange: checkIn.value.isEmpty ? null :  resultRange ,
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



      checkIn.value = DateFormat('EEE, d MMM').format(tarihStart);
      checkOut.value = DateFormat('EEE, d MMM').format(tarishEnd);

  }
}
