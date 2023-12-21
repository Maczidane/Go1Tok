import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/Home2/home2.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/check_in.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/my_trip.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

import '../../controllers/dashboard_controller.dart';
import '../dashboard/Book.dart';
import '../dashboard/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xoffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  final controller = DashboardController();
  final navController = Get.put(NavigationController());


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Helper.isDarkMode(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      transform: Matrix4.translationValues(xoffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),

      width: Helper.screenWidth(),
      height: Helper.screenHeight(),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
        //borderRadius: BorderRadius.circular(50),
        color: tWhiteColor
      ),
      child: Scaffold(

        appBar: AppBar(
            elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(

                  colors: <Color>[tPrimaryColor,
                    secondPrimaryColor,]),
            ),
          ),
            centerTitle: true,
            title: const Text("Go1Tok Dashboard", textAlign: TextAlign.center, style: TextStyle(color: tWhiteColor),),
            leading: isDrawerOpen
                ? IconButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();

                      setState(() {
                        xoffset = 0;
                        yOffset = 0;
                        isDrawerOpen = false;
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: tWhiteColor,
                    ))
                : IconButton(
                    onPressed: () {
                      setState(() {

                        FocusScope.of(context).unfocus();

                        xoffset = 300;
                          yOffset = 50;
                          isDrawerOpen = true;

                      });
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: tWhiteColor,
                    )),
            ),
        bottomNavigationBar:  Obx(
          () => NavigationBar(
            height: tDefaultSize *3,
            elevation: 0,
            selectedIndex: navController.selectedIndex.value,

            onDestinationSelected: (index)=> navController.selectedIndex.value = index ,

            backgroundColor: isDarkMode ? tSecondaryColor : Colors.white,
            indicatorColor: isDarkMode ? tWhiteColor.withOpacity(0.1) : tDarkColor.withOpacity(0.1),
            destinations: const[
              NavigationDestination(icon: Icon(Icons.home), label: homeText),
              NavigationDestination(icon: Icon(Icons.search_rounded), label: bookText),
              NavigationDestination(icon: Icon(Icons.wallet_travel_rounded), label: myTripText),
              NavigationDestination(icon: Icon(Icons.check_circle_outline_rounded), label: checkInText),

            ],


          ),
        ),
        body: Obx(() => navController.screens[navController.selectedIndex.value])
      ),
    );
  }
}


class NavigationController extends GetxController{

  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    ///My client Preferred a more simple home
   //Home(),
    Home2(),
    Book(),
    MyTrip(),
    CheckIn(),

  ];
}
