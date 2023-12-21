import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/passenger_class_controller.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';

class PassengerAndClass extends StatelessWidget {
  PassengerAndClass({super.key});

  final passengerClassController = Get.put(PassengerClassController());

  @override
  Widget build(BuildContext context) {
    final passengerClassController = Get.put(PassengerClassController());

    return Scaffold(
      appBar: AppBar(
        title: const Text(tClass),
        centerTitle: true,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: tWhiteColor,
          ),
        ),
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: <Color>[
              tPrimaryColor,
              secondPrimaryColor,
            ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => SizedBox(
                height: Helper.screenHeight() * 0.4, child: classTop(context))),

          /*  Obx(
              () => SizedBox(
                  height: Helper.screenHeight() * 0.4,
                  child: classBottom(context)),
            ),


           */

            InkWell(
              onTap: () => passengerClassController.apply(),
              child: Container(
                width: Helper.screenWidth() * 0.7,
                margin: const EdgeInsets.symmetric(horizontal: tDefaultPadding),

                decoration: BoxDecoration(
                    color: tAccentColor,
                    borderRadius: BorderRadius.circular(40)
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding - 6.0 ),
                child:  Center(
                  child: Text(
                    tApply,
                    style: Theme.of(context).textTheme.headlineSmall?.apply(
                      color: tWhiteColor,
                    ),
                  ),
                ),
              ),
            ),

            //classBottom(context),
          ],
        ),
      ),
    );
  }

  Widget classTop(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              "SELECT CABIN",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(1),
            child: Container(
              color: passengerClassController.economySelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              //width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tEconomyClass,
                      style: passengerClassController.economySelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      passengerClassController.economySelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(2),
            child: Container(
              color: passengerClassController.premiumSelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              //width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tPremiumClass,
                      style: passengerClassController.premiumSelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      passengerClassController.premiumSelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(3),
            child: Container(
              color: passengerClassController.businessSelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              // width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tBusinessClass,
                      style: passengerClassController.businessSelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      passengerClassController.businessSelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(4),
            child: Container(
              color: passengerClassController.firstSelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              //width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tFirstClass,
                      style: passengerClassController.firstSelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      passengerClassController.firstSelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );

  Widget classBottom(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: tDefaultPadding, vertical: tDefaultPadding),
            child: Text(
              "SELECT CABIN",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(1),
            child: Container(
              color: passengerClassController.economySelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              //width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tEconomyClass,
                      style: passengerClassController.economySelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.bodyMedium,
                    ),
                    Icon(
                      passengerClassController.economySelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(2),
            child: Container(
              color: passengerClassController.premiumSelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              //width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tPremiumClass,
                      style: passengerClassController.premiumSelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      passengerClassController.premiumSelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(3),
            child: Container(
              color: passengerClassController.businessSelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              // width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tBusinessClass,
                      style: passengerClassController.businessSelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      passengerClassController.businessSelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    )
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => passengerClassController.switchClassTabs(4),
            child: Container(
              color: passengerClassController.firstSelected.value
                  ? tLightPurpleColor
                  : Colors.transparent,
              //width: Helper.screenWidth(),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: tDefaultPadding, vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tFirstClass,
                      style: passengerClassController.firstSelected.value
                          ? Theme.of(context).textTheme.headlineMedium?.apply(
                                color: secondPrimaryColor,
                              )
                          : Theme.of(context).textTheme.titleMedium,
                    ),
                    Icon(
                      passengerClassController.firstSelected.value
                          ? Icons.check
                          : null,
                      color: secondPrimaryColor,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
