import 'package:Go1Tok/src/features/authentication/models/user_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/forgot_password/forgot_password_otp/forgot_password_otp.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  //TextField Controller to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final phoneNumber = TextEditingController();
  final cPassword = TextEditingController();

  final userRepo = Get.put(UserRepository());

  final showPassword = false.obs;
  final showPassword2 = false.obs;


  GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();


  ///loader

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;






  ///Call this function from Design & it will do the rest

  void registerUser(String email, String password, String firstName,
      String lastName, String phoneNumber) {

      String? error =     AuthenticationRepository.instance
          .createUserWithEmailAndPassword(email, password) as String?;

      if(error != null){

        Get.showSnackbar(GetSnackBar(message: error.toString(),));
      }
  }

  ///Get phoneNo from user and pass it to Auth Repository for Firebase Authentication

  Future<void> phoneAuthentication(String phoneNo) async{
    try{
    //  await AuthenticationRepository.instance.phoneAuthentication(phoneNo);

    } catch (e) {
      throw e.toString();
    }
  }

  Future <void> createUser() async{

    //await userRepo.createUserAuth(user);


    try{
      isLoading.value = true;
      if(!signUpFormKey.currentState!.validate()){
        isLoading.value = false;
      }

      /// We will verify phone number later in app
      //phoneAuthentication(user.phoneNumber);
      //String phone = user.phoneNumber.toString();

      //Get.to(() => OTPScreen(  details: phone,));

      // Get User and pass it to controller

      final user = UserModel(
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          password: password.text.trim(),
          //verifiedEmail: verifiedEmail,
         // verifiedPhone: verifiedPhone,
      );
      
      //Authenticate user first
      
      final auth  = AuthenticationRepository.instance;
      await auth.createUserWithEmailAndPassword(user.email, user.password);
      await UserRepository.instance.createUser(user);
      auth.setInitialScreen(auth.firebaseUser);

      


    } catch (e){
      isLoading.value = false;
      Get.snackbar("Error", e.toString(), snackPosition: SnackPosition.BOTTOM, duration: const Duration(seconds: 5));
    }



  }







}
