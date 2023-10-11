import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:flutter/material.dart';

class ButtonLoadingWidget extends StatelessWidget{
  const ButtonLoadingWidget({
    Key? key,
}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: tDefaultSize - 10.0,
          height: tDefaultSize - 10.0,
          child: CircularProgressIndicator(color: tWhiteColor),

        ),
        SizedBox(width: tDefaultSize - 10.0,),
        Text("Loading......")
      ],
    );
  }

}