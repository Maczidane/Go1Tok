import 'dart:io';

import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/dashboard.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/repository/user_repository/user_repository.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/options/completed.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class DrawerControllers extends GetxController {

  static DrawerControllers get instance => Get.find();

  late ProgressDialog  pd ;





  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  late String docID;

  late String drawerImage = "";

  FirebaseStorage storage = FirebaseStorage.instance;

  final fireStore = FirebaseFirestore.instance;




  getInfo() async{
    final email = _authRepo.firebaseUser?.email;

   // print("Email: $email");

    if (email != null) {
     return _userRepo.getUserDetails(email);
    }
    else {
      Get.snackbar(tErrorTitle, tLoginToContinue);
    }
  }

   pickImage(ImageSource imageSource, String? id, BuildContext context) async {

   try{
    final ImagePicker picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: imageSource);
    //Navigator.pop(context);

    if(file == null){
      Helper.errorSnackBar(title: tEmpty , message: tImageError);

    }
    else{

      docID = id!;
      //print("Document ID:$docID");

      Navigator.pop(context);

      //
      pd  = ProgressDialog(context: context);

     uploadImage(file);


    }
  } catch (e) {
      Helper.errorSnackBar(title: tErrorTitle , message: '$tErrorPickImage $e');
      if (kDebugMode) {
        print("Error: $e");
      }
      pd.close();
      return false;
   }

}


 uploadImage(XFile file) async{



   pd.show(
       max: 100,
       barrierDismissible: false,
       msg: tChangeProfilePic,

       hideValue: true,
       completed: Completed(
         completionDelay: 2500,
       )
   );

    try{
  File image  = File(file.path);
  Reference ref = storage.ref().child("profileImages/${_authRepo.getUserID}");
  UploadTask uploadTask = ref.putFile(image);
  TaskSnapshot snapshot = await uploadTask;
  String downloadUrl = await snapshot.ref.getDownloadURL();

  //pd.update()
  pd.update(value: 70, msg: tCompleting);

  saveData(downloadUrl);
    } catch (e) {
      Helper.errorSnackBar(title: tErrorTitle , message: '$tErrorGetImage $e');
      pd.close();
      return false;
    }



}


 Future<void>saveData( String url) async{

  // QuerySnapshot querySnapshot = await _db.collection("Users").where("Email", isEqualTo: _authRepo.getUserEmail).get();


    await fireStore.collection("Users").doc(docID).update({"ImageUrl" : url});

    //print("Image Saved: $url");
    drawerImage = url;


   // pd.close();



    Get.offAll(() => const Dashboard());
}


}

