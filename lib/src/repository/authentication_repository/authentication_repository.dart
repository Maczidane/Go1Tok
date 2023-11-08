import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/dashboard.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:Go1Tok/src/features/authentication/screen/mail_verification/mail_verification.dart';
import 'package:Go1Tok/src/features/authentication/screen/on_boarding/on_boarding_screen.dart';
import 'package:Go1Tok/src/repository/exceptions/custom_exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///ALL Authentications are done here in the page

  // Variables

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> _firebaseUser;
   //final FacebookLogin facebookLoginPlugin = FacebookLogin();

  late final GoogleSignInAccount _googleUser;

  /// Getters
  User? get firebaseUser => _firebaseUser.value;

  String get getUserID => firebaseUser?.uid ?? '';

  String get getUserEmail => firebaseUser?.email ?? '';

  final phoneVerificationId = ''.obs;

  ///Will load when App launches. This func will be called and set firebaseUser state
  @override
  void onReady() {
    //
    _firebaseUser = Rx<User?>(_auth.currentUser);
    _firebaseUser.bindStream(_auth.userChanges());

    FlutterNativeSplash.remove();

    ///Ever method id used to make a method always run
   // ever(_firebaseUser, setInitialScreen);

    setInitialScreen(_firebaseUser.value);
  }

  ///Setting initial screen onLoad
  setInitialScreen(User? user) {
    if (kDebugMode) {
      print("setInitialScreen in Auth Repository called");
    }
   // Future.delayed(const Duration(seconds: 10));

    user == null
        ? Get.offAll(() => const OnBoarding())
        : user.emailVerified
            ? Get.offAll(() => const Dashboard())
            : Get.offAll(() => const MailVerification());
  }

  ///Function To send phone Number Authentication

  phoneAuthentication(String phoneNo) async {
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNo,
        verificationCompleted: (credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          if (e.code == 'invalid-phone-number') {
            Get.snackbar(
              "Phone Number error",
              "The phone number entered is invalid",
              backgroundColor: Colors.redAccent,
              colorText: Colors.white,
            );
          } else {
            Get.snackbar("Error", "Something went wrong!. Try again.");
            if (kDebugMode) {
              print("Phone number error ${e.code.toString()}");
            }
          }
        },
        codeSent: (verificationId, resendToken) {
          phoneVerificationId.value = verificationId;
        },
        codeAutoRetrievalTimeout: (verificationId) {
          phoneVerificationId.value = verificationId;
        });
  }

  ///Google Sign In
  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex  = TExceptions();
      throw ex.message;
    }
  }

  ///Function to send email verification

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      // TODO
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex = TExceptions();
      throw ex.message;
    }
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: phoneVerificationId.value, smsCode: otp));

    return credentials.user != null ? true : false;
  }

  /// Create user
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      //_firebaseUser.value != null ? Get.offAll(() => Dashboard()) : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {

      /// This function will display error code as snack bar
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex  = TExceptions();
      throw ex.message;
    }
  }

  /// Login user
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

    } on FirebaseAuthException catch (e) {




      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex  = TExceptions();
      throw ex.message;
    }
  }

  /// LogOut User

  Future<void> logOut(BuildContext context) async {

    ProgressDialog  pd = ProgressDialog(context: context);

   pd.show(
     barrierDismissible: false,
     msg: tLoggingOut,
     hideValue: true,

   );
    try {
      //Do google logout
      await GoogleSignIn().signOut();

      //Do facebook signOut later
      //await facebookLoginPlugin.logOut();

      await _auth.signOut();
      pd.close();
      Get.offAll(() => const OnBoarding());
    } on FirebaseAuthException catch (e) {
      pd.close();
      throw e.message!;
    } on FormatException catch (e) {
      pd.close();
      throw e.message;
    } catch (e) {
      pd.close();
      throw tUnableToLogOut + e.toString();
    }
  }

  /// Send reset user password link
  Future<void> resetUserPassword(
      String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);


      Get.offAll(() => const LoginScreen());
      //_firebaseUser.value != null ? Get.offAll(() => Dashboard()) : Get.offAll(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {

      /// This function will display error code as snack bar
      final ex = TExceptions.fromCode(e.code);
      throw ex.message;
    } catch (_) {
      const ex  = TExceptions();
      throw ex.message;
    }
  }

}
