import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/dialogues/message_dialogue.dart';
import 'package:Go1Tok/src/features/authentication/controllers/get_location_controller.dart';
import 'package:Go1Tok/src/features/authentication/controllers/home_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/Home/home_buttom_container.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_search.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_search.dart';
import 'package:Go1Tok/src/repository/authentication_repository/authentication_repository.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: tGoogleForegroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
             const  SizedBox(height: tDefaultSize - 10.0,),
              GestureDetector(
                onTap: () {
                  Helper.messageSnackBar(
                      title: "Location", message: "Getting device location");
                  getCountry();
                },
                child: Row(
                  children: [
                    const SizedBox(
                      height: tDefaultSize,
                    ),

                    const Icon(
                      Icons.location_on_sharp,
                      //color: tWhiteColor,
                    ),

                    const SizedBox(
                      width: tDefaultWidth - 10.00,
                    ),

                    state.isEmpty
                        ? Container(
                            child: const CircularProgressIndicator(),
                          )
                        : Text(
                            "$state, $countryName",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                    //SizedBox(width: tDefaultWidth,),

                    const Spacer(),

                    GestureDetector(
                      onTap: loadBalance,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            //color: tWhiteColor,
                          ),
                          const SizedBox(
                            width: tDefaultWidth,
                          ),
                          Text(
                            homeController.balance,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const  SizedBox(height: tDefaultSize,),
              Center(
                child: Text(
                  tEnjoy,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
              ),
              const  SizedBox(height: tDefaultSize,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Expanded(
                      flex: 0,
                      child:   GestureDetector(
                        onTap: () => Get.to(()=> const FlightSearch()),

                        child: Card(
                        elevation: tDefaultElevation,
                        color: tGoogleForegroundColor,
                        child: Container(
                          width: Helper.screenWidth() * 0.40,
                          height: Helper.screenHeight() * 0.25,
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: Helper.screenWidth() * 0.37,
                                  height: Helper.screenHeight() * 0.20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    tFlight1,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              )),

                              Text(
                                tFlights,
                                style: Theme.of(context).textTheme.headlineMedium?.apply(
                                  color: tDarkColor.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 0,
                      child:GestureDetector(
                        onTap: () => Get.to(() => const HotelSearch()),
                        child:  Card(
                        elevation: tDefaultElevation,
                        color: tGoogleForegroundColor,
                        child: Container(
                          width: Helper.screenWidth() * 0.40,
                          height: Helper.screenHeight() * 0.25,
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: Helper.screenWidth() * 0.37,
                                  height: Helper.screenHeight() * 0.20,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                image: const DecorationImage(
                                  image: AssetImage(
                                    tHotel2,
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              )),

                              Text(
                                tHotels,
                                style: Theme.of(context).textTheme.headlineMedium?.apply(
                                  color: tDarkColor.withOpacity(0.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              const  SizedBox(height: tDefaultSize - 20.0,),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Expanded(
                    flex: 0,
                    child: Card(
                      elevation: tDefaultElevation,
                      color: tGoogleForegroundColor,
                      child: Container(
                        width: Helper.screenWidth() * 0.40,
                        height: Helper.screenHeight() * 0.25,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: Helper.screenWidth() * 0.37,
                                height: Helper.screenHeight() * 0.20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage(
                                  tTaxi1,
                                ),
                                fit: BoxFit.cover,
                              ),
                            )),

                            Text(
                              tTaxi,
                              style: Theme.of(context).textTheme.headlineMedium?.apply(
                                color: tDarkColor.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: Card(
                      elevation: tDefaultElevation,
                      color: tGoogleForegroundColor,
                      child: Container(
                        width: Helper.screenWidth() * 0.40,
                        height: Helper.screenHeight() * 0.25,
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: Helper.screenWidth() * 0.37,
                                height: Helper.screenHeight() * 0.20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                              image: const DecorationImage(
                                image: AssetImage(
                                  tDeals,
                                ),
                                fit: BoxFit.cover,
                              ),
                            )),

                            Text(
                              tDealsText,
                              style: Theme.of(context).textTheme.headlineMedium?.apply(
                                color: tDarkColor.withOpacity(0.5),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            const  HomeButtomContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
