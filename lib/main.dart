import 'package:Go1Tok/firebase_options.dart';
import 'package:Go1Tok/src/features/authentication/screen/splash_screen/splash_screen.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';


Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();


  ///Await splash screen until other items load

 //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);


  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go1Tok',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme ,
      themeMode: ThemeMode.system,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),


     home: const SplashScreen(),
     //home: const Scaffold(body: Center(child: CircularProgressIndicator(),),),
    );
  }
}
