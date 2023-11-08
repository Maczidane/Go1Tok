import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/size.dart';
import '../../../../../dialogues/message_dialogue.dart';
import '../../../../../repository/authentication_repository/authentication_repository.dart';
import '../../../../../utils/helper.dart';
import '../../../controllers/get_location_controller.dart';
import '../../../controllers/home_controller.dart';
import '../clip_path/CustomShapeClipper.dart';
import 'package:dialogs/dialogs.dart';

import '../clip_path/choice_clip.dart';

class HomeScreenTopContainer extends StatefulWidget {
  const HomeScreenTopContainer({super.key});

  @override
  State<HomeScreenTopContainer> createState() => _HomeScreenTopContainerState();
}

class _HomeScreenTopContainerState extends State<HomeScreenTopContainer> {
  final locationController = Get.put(GetLocationController());
  final homeController = Get.put(HomeController());

  final authController = Get.put(AuthenticationRepository());
  final messageDialogueController = Get.put(MessageDialogue());
  
  late List<String> location;
  String state = "", countryName = "";

  //String balance = "\$0.00";


  @override
  void initState() {
    //
    getCountry();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: Helper.screenHeight() * 0.5,
          decoration: const  BoxDecoration(
              gradient: LinearGradient(colors: [
                tPrimaryColor,
                secondPrimaryColor,
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
                child: GestureDetector(
                  onTap: () {
                    Helper.messageSnackBar(
                        title: "Location",
                        message: "Getting device location");
                    getCountry();
                  },
                  child: Row(
                    children: [
                      const  SizedBox(
                        height: tDefaultSize ,
                      ),

                      const Icon(
                        Icons.location_on_sharp,
                        color: tWhiteColor,
                      ),

                      const SizedBox(
                        width: tDefaultWidth - 10.00,
                      ),

                      state.isEmpty
                          ?  Container(
                        child: const CircularProgressIndicator(),
                      )
                          : Text(
                        "$state, $countryName",
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                            color: tWhiteColor,
                            // fontSize: tDefaultFontSize,
                           // fontWeight: FontWeight.bold
                        ),
                      ),
                      //SizedBox(width: tDefaultWidth,),

                      const Spacer(),

                      GestureDetector(
                        onTap: loadBalance,
                        child: Row(
                          children: [
                            const Icon(
                              Icons.account_balance_wallet,
                              color: tWhiteColor,
                            ),
                            const SizedBox(
                              width: tDefaultWidth,
                            ),
                            Text(
                              homeController.balance,
                              style: const TextStyle(color: tWhiteColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

               Text(
                "Where woul\'d you want to go?",
                style: Theme.of(context).textTheme.titleMedium?.apply(
                  color: tWhiteColor,

                ),
                textAlign: TextAlign.center,
              ),

              Padding(
                padding:
                const  EdgeInsets.symmetric(horizontal: tDefaultSize + 2.0),
                child: Material(
                  elevation: tDefaultElevation,
                  borderRadius:
                  const BorderRadius.all(Radius.circular(tDefaultSize)),
                  child: TextField(
                    controller:
                    TextEditingController(text: "$state, $countryName"),
                    style: Theme.of(context).textTheme.bodyLarge ,
                    cursorColor: tPrimaryColor,
                    decoration:  InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: tDefaultWidth + 2.0, vertical: 14.0),
                      suffixIcon: Material(
                        elevation: tDefaultElevation - 3.0,
                        borderRadius:
                        const BorderRadius.all(Radius.circular(tDefaultSize)),
                        child: IconButton(
                          icon: const Icon(Icons.search_rounded),
                         onPressed: () => homeController.gotoSearchScreen(),
                         // color: tDarkColor,
                        ),
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                   // onSubmitted: ()=>,
                  ),
                ),
              ),

              Obx(
                    () => Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(

                      child: ChoiceChips(
                          icon: Icons.flight_takeoff_outlined,
                          text: tFlights,
                          isSelected: homeController.isFlightSelected.value),
                      onTap: (){

                        homeController.switchTabs(tFlights);
                      },

                    ),


                    InkWell(
                      child: ChoiceChips(
                          icon: Icons.hotel,
                          text: tHotels,
                          isSelected: homeController.isHotelSelected.value),
                      onTap: (){

                        homeController.switchTabs(tHotels);

                      },
                    ),

                    InkWell(
                      child: ChoiceChips(
                          icon: Icons.local_taxi_outlined,
                          text: tTaxi,
                          isSelected: homeController.isTaxiSelected.value),
                      onTap: (){

                        homeController.switchTabs(tTaxi);

                      },
                    ),
                  ],
                ),
              ),
             const SizedBox(height: tDefaultHeight -10.0,),
            ],
          ),
        ),
      ),
    );
  }

  void getBalance() {}

  void getCountry() {




    if (locationController.checkValue == 1) {

      //print("Controller already initialized");



      locationController.getLocation().then((value) {

        location = locationController.currentAddress;


        setState(() {
          countryName = location.lastOrNull!;
          state = location.firstOrNull!;
        });


      });



    } else {
      locationController.getLocation().then((value) {
        location = locationController.currentAddress;

        ///print("Location is: ${location.lastOrNull!}");

        setState(() {
          countryName = location.lastOrNull!;
          state = location.firstOrNull!;
        });


        ///This two lines will clear the location controller and currentAddress since we will initialize it again
        locationController.currentAddress.clear();

        Get.delete<GetLocationController>();


      });
      //locationController.dispose();
    }
  }

 void loadBalance() {
    if (authController.firebaseUser == null) {
      // Helper.normalSnackBar(title: "Not Logged In" ,message: "Please login to continue");
      messageDialogueController.showMessageDialogue(
          "Login required",
          "You need to login to add credits to wallet",
          "Login",
          const Icon(Icons.login_outlined),
          context);
    }
  }

  
}


