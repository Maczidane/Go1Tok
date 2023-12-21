import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HotelResultsCard extends StatelessWidget {
  final String image,
      cityName,
      reviews,
      hotelName,
      distance,
      discountPercentage;

  final double price, discountPrice, starNumber; final int numberOfNights;
  final int roomsLeft;
 HotelResultsCard(
      {super.key,
      required this.image,
      required this.cityName,
      required this.price,
      required this.reviews,
      required this.roomsLeft,
      required this.hotelName,
      required this.starNumber,
      required this.distance,
      required this.discountPrice,
      required this.discountPercentage,
      required this.numberOfNights});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency();

    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: tSmallPadding, vertical: tSmallPadding),
      child: Container(
         height: Helper.screenHeight() * 0.3,
        padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tDefaultPadding),


        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(tSmallRadius)),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(tSmallRadius)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: tDefaultPadding),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        hotelName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headlineMedium?.apply(
                              color: tWhiteColor,
                            ),
                      ),
                    ),
           Flexible(
                        child: RatingBar.builder(
                          initialRating: starNumber,
                          minRating: 1,
                          direction: Axis.horizontal,
                          itemSize: tDefaultSize - 10,
                          allowHalfRating: true,
                          itemCount: starNumber.toInt(),
                          itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: tDefaultSize,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ),

                  ],
                ),
              ),

              Container(
                padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tSmallPadding),
                decoration: BoxDecoration(
                  color: tPrimaryColor,
                  borderRadius: BorderRadius.circular(tSmallRadius),

                ),
                child: Text(
                  reviews,
                  style: Theme.of(context).textTheme.titleMedium?.apply(
                    color: tWhiteColor
                  )

                ),
              ),
             const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Container(
                   padding: const EdgeInsets.symmetric(horizontal: tSmallPadding - 3.0),
                         decoration: BoxDecoration(
                           color: tDarkColor.withOpacity(0.7),
                         ),
                       child: Row(
                         children: [
                          const Icon(
                             Icons.location_on_sharp,
                             color: tWhiteColor,
                           ),
                           const SizedBox(width: tSmallWidth - 3.0,),
                           Flexible(
                             flex: 0,
                             child:
                                Text(
                                 distance + tToCityCenter,
                                  overflow: TextOverflow.ellipsis,
                                 maxLines: 1,
                                 style: Theme.of(context).textTheme.bodyMedium?.apply(
                                   color: tWhiteColor,
                                 ),
                               ),
                             ),

                         ],
                       ),
                     ),
                      const SizedBox(height: tDefaultSize - 20,),
                      Flexible(
                        flex: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: tSmallPadding - 3.0),

                          decoration: BoxDecoration(
                            color: tDarkColor.withOpacity(0.7),
                          ),
                          child: Text(
                            cityName,

                            style: Theme.of(context).textTheme.bodyMedium?.apply(
                              color: tWhiteColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                 numberOfNights > 0  ? buildPrice(context) : buildRoomsLeft(context) ,

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
  final formatCurrency = NumberFormat.simpleCurrency();

  Widget buildPrice(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tSmallPadding),
    decoration: BoxDecoration(
      color: chromeGrey,
      borderRadius: BorderRadius.circular(tSmallRadius),
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children:[
        Column(
          children: [
            Text(
              formatCurrency.format(price).replaceAll(".00", ""),
              style: Theme.of(context).textTheme.headlineMedium,
            ),

           const SizedBox(height: tDefaultHeight - 15.0,),
            Text(
              tForNight + numberOfNights.toString() + tNight,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
        const SizedBox(width: tSmallWidth,),
        Icon(
          Icons.arrow_forward_ios_outlined,
          color: tDarkColor.withOpacity(0.8),
          size: tDefaultSize - 20.0,
        ),


      ],
    ),
  );


  Widget buildRoomsLeft(BuildContext context) => Flexible(
    flex: 0,
    child: Container(
      padding: const EdgeInsets.symmetric(vertical: tSmallPadding,horizontal: tSmallPadding),

      child:  Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            color: roomsLeft > 0 ? oxBlood : tBlueColor,
            //padding: const EdgeInsets.symmetric(horizontal: tSmallPadding - 2.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: tSmallPadding - 2.0),
              //padding: const EdgeInsets.all(8.0),
              child: Text(

                roomsLeft > 0 ? roomsLeft.toString() + tRoomLeft : tDiscount,
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                  color: tWhiteColor,
                ),

              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: tSmallPadding ,vertical: tSmallPadding),
            decoration: const BoxDecoration(
              color: chromeGrey,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(tSmallRadius),
                bottomRight: Radius.circular(tSmallRadius),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                ClipPath(
                  clipper: CustomPath(),

                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: tSmallPadding- 2.0,horizontal: tSmallPadding-2.0),

                  decoration: const BoxDecoration(
                    color: tBlueColor,

                  ),
                    width: 50,
                    height: 30,
                  child: Center(
                    child: Text(
                      discountPercentage,
                      style: Theme.of(context).textTheme.bodySmall?.apply(
                        color: tWhiteColor,
                      ),
                    ),
                  ),
                  ),
                ),
                const SizedBox(width: tSmallWidth,),

                Column(
                  children: [
                    Text(
                      formatCurrency.format(discountPrice).replaceAll(".00", ""),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),

                    const SizedBox(height: tDefaultHeight - 15.0,),
                    Text(
                      formatCurrency.format(price).replaceAll(".00", ""),
                      style: Theme.of(context).textTheme.labelMedium?.apply(
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: tSmallWidth,),
                Column(

                  children: [
                    const SizedBox(height: tDefaultHeight - 5.0,),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: tDarkColor.withOpacity(0.8),
                      size: tDefaultSize - 20.0,
                    ),
                  ],
                ),


              ],
            ),
          ),
        ],
      ),
    ),
  );

  
  

}

class CustomPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path =  Path();
    path.lineTo(size.width - 20, 0);
    path.lineTo(size.width/1.2     , size.height/2 );

    path.lineTo(size.width , 0);
    path.lineTo(size.width / 1.5  , size.height );
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
