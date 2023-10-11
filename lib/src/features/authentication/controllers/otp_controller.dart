import 'package:Go1Tok/src/features/authentication/screen/dashboard/dashboard.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController{

  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified =  await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll( Dashboard()) : Get.back();

  }
}