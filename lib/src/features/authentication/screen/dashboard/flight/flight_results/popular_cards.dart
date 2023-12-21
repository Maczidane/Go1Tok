
import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';

class PopularCards extends StatelessWidget {
 final String popularFlightTime ,  popularPrice , popularLogo ;
 final  String popularType , popularTravelTime , popularFrom , popularTo ;
 final bool isLastItem;


  const PopularCards({super.key, required this.popularFlightTime, required this.popularPrice, required this.popularLogo, required this.popularType, required this.popularTravelTime, required this.popularFrom, required this.popularTo, required this.isLastItem});

  @override
  Widget build(BuildContext context) {

   // final FlightResultController flightResultController = Get.put(FlightResultController());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [


        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Text(
              popularPrice,
              style: Theme.of(context).textTheme.displayMedium?.apply(
                color: tPrimaryColor,
              ),
            ),

            SizedBox(
                width: 50,
                height: 50,
                child:  Image(image: AssetImage(popularLogo,) , )),

          ],
        ),

        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Row(
              children: [

                Text(
                  popularFlightTime,
                  style: Theme.of(context).textTheme.headlineMedium?.apply(

                  ),
                ),

                const SizedBox(width: tDefaultWidth,),

                Text(
                  popularType,
                  style: Theme.of(context).textTheme.headlineMedium?.apply(

                  ),
                ),


              ],
            ),

            Text(
              "$tTravelTime $popularTravelTime",
              style: Theme.of(context).textTheme.headlineMedium?.apply(

              ),
            ),
          ],
        ),

        const  SizedBox(height: tDefaultHeight - 10,),

        Row(
          children: [
            Text(
              popularFrom,
              style: Theme.of(context).textTheme.bodyMedium?.apply(

                  color: tDarkColor.withOpacity(0.8)
              ),
            ),
            const SizedBox(width: tDefaultWidth + 20,),

            Text(
              popularTo,
              style: Theme.of(context).textTheme.bodyLarge?.apply(
                  color: tDarkColor.withOpacity(0.8)

              ),
            ),
          ],
        ),


        !isLastItem ? const Column(
         children: [
           SizedBox(height: tDefaultSize - 15 ,),

           Divider(height: 3,color: chromeGrey,),

         ],
        ): const Text(""),


        const  SizedBox(height: tDefaultHeight,),

      ],
    );
  }
}
