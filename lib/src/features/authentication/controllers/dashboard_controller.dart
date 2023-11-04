

import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController{

  static DashboardController get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;



  Future<void> logOut(BuildContext context) async {
    AuthenticationRepository.instance.logOut(context);
  }



}