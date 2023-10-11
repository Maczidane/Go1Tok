
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  static LoginController  get instance => Get.find();

  /// TextField Controller to get data from TextField

  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();


  ///loader

  final isLoading = false.obs;
  final isGoogleLoading = false.obs;
  final isFacebookLoading = false.obs;


  ///[Email and Password Login]

  Future<void> login() async{
    try{
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()){
        isLoading.value = false;
        return;

      }

      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      auth.setInitialScreen(auth.firebaseUser);
    } catch (e){
      isLoading.value = false;
      Helper.errorSnackBar(title: tOhSnap, message: e.toString());

    }
  }


  /// Google sign In

Future<void> googleSignIn() async{
    try{
      isGoogleLoading.value = true;
      final auth = AuthenticationRepository.instance;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value = false;
      
      AuthenticationRepository.instance.setInitialScreen(auth.firebaseUser);


    }catch(e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title:tOhSnap, message: e.toString());

    }
}


/// Facebook Sign In
  Future<void> facebookSignIn() async{
    try{

      //TODO: Implement facebook SignIn
      //isGoogleLoading.value = true;
     // await AuthenticationRepository.instance.signInWithGoogle();
      //isGoogleLoading.value = false;

    }catch(e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title:tOhSnap, message: e.toString());

    }
  }

}