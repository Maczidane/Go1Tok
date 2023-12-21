
import 'package:get/get.dart';

class HotelResultController extends GetxController{
  static HotelResultController get instance => Get.find();


  RxInt minSliderValue = 67.obs, maxSliderValue = 6800.obs;
  RxDouble minSliderValueC = 1.0.obs, maxSliderValueC = 100000.0.obs;
  RxString currency = '\$'.obs;
  RxDouble lat = 19.018255973653343.obs, lng = 72.84793849278007.obs;



}