
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FlightResultController extends GetxController {
  static FlightResultController get instance => Get.find();

  RxString cheapestFlightTime = "14:34 - 16:45".obs ,  cheapestPrice =  "\$64".obs, cheapestLogo = iEasyJet.obs;
  RxString cheapestType = tDirect.obs , cheapestTravelTime = "1h".obs, cheapestFrom= "SEN".obs , cheapestTo = "CDG".obs;





}