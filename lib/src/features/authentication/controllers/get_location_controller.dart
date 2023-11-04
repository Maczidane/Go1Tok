
import 'dart:convert';

import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:geocode/geocode.dart';
import 'package:http/http.dart' as http;

class GetLocationController extends GetxController {
  static GetLocationController get instance => Get.find();
  Location location = Location();
  GeoCode geoCode = GeoCode();

  late bool _serviceEnabled;
   late PermissionStatus _permissionGranted;
  late LocationData locationData ;
  late final currentAddress, country,code,city;


  ///Dummy int to check if all values have been initialized
  int checkValue = 0;


  ///Function to get User lat n lng and convert it to actual state and country
  Future<void> getLocation() async{

    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        Helper.errorSnackBar(title: "Location Service not enabled");
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        Helper.errorSnackBar(title: "Location Error" , message: "Location permission not granted. This permission is needed");
        getLocation();

        return;
      }
    }

     locationData = await location.getLocation();

    var lat = locationData.latitude;
    var lng = locationData.longitude;
    String mapApiKey = googleApiKey;

    String _host = 'https://maps.google.com/maps/api/geocode/json';

    final url = '$_host?key=$mapApiKey&language=en&latlng=$lat,$lng';

    var response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      Map data = jsonDecode(response.body);


      /// Getting data from the map
      Map formattedAddress = data["plus_code"];


      String s = formattedAddress["compound_code"].toString();


      String s1 = s.toString().replaceAll(",", "");

      ///Converting it to a list
     List<String> s2 = s1.split(' ');

     /// Remove first element of the list


      final List<String> s3 = s2..removeAt(0);



      if (kDebugMode) {
       print("response1 ==== $s3");

      }

      checkValue = 1;
      currentAddress = s3;
      //currentAddress = "{full-location: $formattedAddress, country: $country , city: $city, code: $code";

    } else {
      Helper.errorSnackBar(title: "Address Error", message: "Couldn't get address. Please try again");
      return;
    }





  }



  getCurrentAddress() async{






  }
}