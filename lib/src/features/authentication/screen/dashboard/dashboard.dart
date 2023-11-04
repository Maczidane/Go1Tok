import 'package:Go1Tok/src/features/authentication/controllers/dashboard_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/drawer_screen/drawer_screen.dart';
import 'package:Go1Tok/src/features/authentication/screen/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
   const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {


    return const Stack(
        children: [
          DrawerScreen(),
          HomeScreen(),
        ],

    );
  }
}
