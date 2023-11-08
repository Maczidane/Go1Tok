import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/flight/flight_list_top_part.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FlightSearch extends StatelessWidget {
  const FlightSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Flight Search"),
          centerTitle: true,
          elevation: 0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: <Color>[
                tPrimaryColor,
                secondPrimaryColor,
              ]),
            ),
          ),
          leading: InkWell(
              onTap: () => Get.back(),
              child: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
        body:   Column(
          children: [
            FlightListTopPart(),
          ],
        ),
      ),
    );
  }
}

