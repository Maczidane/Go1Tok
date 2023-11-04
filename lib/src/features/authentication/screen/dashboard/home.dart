
import 'package:Go1Tok/src/features/authentication/screen/dashboard/Home/home_buttom_container.dart';
import 'package:flutter/material.dart';
import 'Home/home_screen_container.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeScreenTopContainer(),
            HomeButtomContainer(),

          ],
        ),
      ),
    );
  }
}

