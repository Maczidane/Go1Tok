import 'package:Go1Tok/src/features/authentication/models/user_model.dart';
import 'package:Go1Tok/src/features/authentication/screen/on_boarding/on_boarding_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();


  /// All firebase codes to create, signIn, SignOut, reset password are done here
  ///
  final _db = FirebaseFirestore.instance;

  final auth = FirebaseAuth.instance;

  createUser(UserModel user) async{
   await _db.collection("Users").add(user.toJson())
       .then((value) {

      Get.offAll(() => const OnBoarding());

   }


   ).catchError((error , stackTrace){
          Get.snackbar("Error", "Something went wrong. Try again.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.redAccent.withOpacity(0.1),
            colorText: Colors.red,
          );

          if (kDebugMode) {
            print("Create firestore user error :${error.toString()}");
          }
   });
  }

  void showBar(){

    SnackBar(

      //duration: const Duration(seconds: 5),
      backgroundColor: Colors.green.withOpacity(0.1),

        content: const Text("Success. Your account has been created successfully."),

    );
   /* Get.snackbar(
      "Success",
      "Your account has been created successfully.",
      snackPosition: SnackPosition.BOTTOM,
      //duration: const Duration(seconds: 5),
      backgroundColor: Colors.green.withOpacity(0.1),
      colorText: Colors.green,
    );

    */
  }

  createUserAuth(UserModel user) async{

    await auth.createUserWithEmailAndPassword(email: user.email, password: user.password).then((value){

      createUser(user);




    }).catchError((error, stackTrace){

      ///Validate errors if user account couldnot be created
      if(error.toString().contains("The email address is already in use by another account")) {
        Get.snackbar("Error", "Email address already exist. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );
      }else{

        Get.snackbar("Error", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red,
        );

      }



        if (kDebugMode) {
          print("Create user error :${error.toString()}");
        }
    });
  }

  /// Fetch User details

  //This will fetch a single record

  Future<UserModel> getUserDetails(String email) async{

    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();


    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;


    return userData;

  }

  Future<List<UserModel>> allUsers() async{

    final snapshot = await _db.collection("Users").get();

    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();

    return userData;

  }

}
