import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // backgroundColor: Theme.of(context).primaryColor,
        title: Text(tMenu1,style: Theme.of(context).textTheme.bodyMedium,),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.to(() => const Dashboard());
          },
          child: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
    );
  }
}
