import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/image_strings.dart';
import 'package:intl/intl.dart';
class HotelCard extends StatelessWidget {
  final String image, cityName,discount,  date, reviewNumber;

  final double price;
  const HotelCard(
      {super.key,
      required this.image,
      required this.discount,
      required this.cityName,
      required this.price,
      required this.date,
      required this.reviewNumber});



  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: tSmallPadding),
      child: Column(

        children: [

          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(tSmallRadius)),
            child: Stack(
              children: [
                Container(
                  height: Helper.screenHeight() * 0.25,
                  width: Helper.screenWidth() * 0.35,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topRight,
                        colors: [
                         // tPrimaryColor,
                         // tBlueColor
                          tDarkColor,
                          tDarkColor.withOpacity(0.1)


                        ],
                      )
                    ),
                  ),
                ),
                Positioned(
                  left: defaultPositionLeft,
                  bottom: defaultPositionBottom,
                  right: defaultPositionRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cityName,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headlineMedium?.apply(
                                color: tWhiteColor,
                              ),
                            ),

                            Text(date,style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: tWhiteColor,

                            ),),
                          ],
                        ),
                      ),

                      Container(
                        padding: EdgeInsets.symmetric(horizontal: tSmallPadding,vertical: tSmallPadding ),
                        decoration: BoxDecoration(
                          color: redAccentColor,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.all(
                            Radius.circular(tDefaultRadius)
                          )
                        ),
                        child: Text(
                          discount,
                          style: Theme.of(context).textTheme.titleMedium?.apply(
                            color: tWhiteColor,
                          ),
                        ),
                      )

                    ],
                  ),


                ),
              ],
            ),
          ),
         const  SizedBox(height: tDefaultSize - 20.0,),

           Expanded(
             child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    formatCurrency.format(price),

                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(width: tSmallWidth,),

                  Text(
                    "$reviewNumber review(s)",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
    softWrap: false,

                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                      color: tOnBoardColor3,
                    ),
                  )
                ],
              ),
           ),

        ],
      ),
    );
  }

  Widget numberOfStars(){
    return Container();
  }
}
