import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/image_strings.dart';
import 'package:Go1Tok/src/constants/size.dart';
import 'package:Go1Tok/src/utils/helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_drawing/path_drawing.dart';

class FlightCards extends StatelessWidget {
  final Color cardColor;
  final String destinationCity,
      destinationCityShortName,
      arrivalCity,
      arrivalCityShortName;
  final String flightDuration,
      departureTime,
      arrivalTime,
      searchDate,
      airlineLogo;
     final double price;

  FlightCards(
      {super.key,
      required this.cardColor,
      required this.destinationCity,
      required this.destinationCityShortName,
      required this.arrivalCity,
      required this.arrivalCityShortName,
      required this.flightDuration,
      required this.departureTime,
      required this.arrivalTime,
      required this.searchDate,
      required this.airlineLogo,
      required this.price});

  final formatCurrency = NumberFormat.simpleCurrency();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultHorizontalPadding,
                vertical: defaultVerticalPadding),
            child: Stack(
              children: [
                Container(
                  height: Helper.screenHeight() * 0.30,
                  width: Helper.screenWidth(),
                  margin: const EdgeInsets.only(bottom: defaultBottomMargin),
                  decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(tDefaultRadius)),
                  child: Column(
                    children: [
                      Expanded(
                        child: destinationTimeDetails(context),
                      ),
                      Expanded(
                        child: departureDetails(context),
                      ),
                      Expanded(
                        child: dateAndTimeDetails(context),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 70,
                  left: -10,
                  child: CircleAvatar(
                    radius: tMediumRadius,
                    backgroundColor:
                        Helper.isDarkMode(context) ? tDarkColor : tWhiteColor,
                  ),
                ),
                Positioned(
                  bottom: 80.0,
                  child: SizedBox(
                    width: Helper.screenWidth(),
                    child: customDottedLine(),
                  ),
                ),
                Positioned(
                  bottom: 70,
                  right: -10,
                  child: CircleAvatar(
                    radius: tMediumRadius,
                    backgroundColor:
                        Helper.isDarkMode(context) ? tDarkColor : tWhiteColor,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget customDottedLine() => Row(
        children: List.generate(
          550 ~/ 10,
          (index) => Expanded(
            child: Container(
              color: index % 2 == 0 ? Colors.transparent : Colors.black45,
              height: 1.5,
            ),
          ),
        ),
      );

  Widget destinationTimeDetails(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    destinationCity,
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: tPrimaryColor,
                        ),
                  ),
                  Text(
                    destinationCityShortName,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: tPrimaryColor,
                        ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CustomPaint(
                              painter: CurvePainter(),
                              child: SizedBox(
                                height: Helper.screenHeight() * 0.05,
                                width: Helper.screenWidth() * 0.35,
                              ),
                            ),
                            const Positioned(
                              top: 0,
                              left: 65,
                              child: RotatedBox(
                                  quarterTurns: 1,
                                  child: Icon(
                                    Icons.flight_outlined,
                                    color: tPrimaryColor,
                                    size: tDefaultSize + 5,
                                  )),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.deepPurpleAccent,
                              radius: 7,
                              child: CircleAvatar(
                                backgroundColor: tPrimaryColor,
                                radius: 4,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: tAccentColor,
                              radius: 7,
                              child: CircleAvatar(
                                backgroundColor: redAccentColor,
                                radius: 4,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 15,
                    left: 85,
                    child: Text(
                      flightDuration,
                      style: Theme.of(context).textTheme.labelMedium?.apply(
                            color: Colors.black54,
                          ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    arrivalCity,
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: redAccentColor,
                        ),
                  ),
                  Text(
                    arrivalCityShortName,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: Colors.redAccent,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget departureDetails(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: tDefaultPadding),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Depart",
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                            color: tDarkColor.withOpacity(0.4),
                          ),
                    ),
                    Text(
                      departureTime,
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: tDarkColor,
                          ),
                    ),
                  ],
                )),
            Expanded(
                flex: 2,
                child: Image.asset(
                  airlineLogo,
                  height: 35,
                )),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Arrival",
                      style: Theme.of(context).textTheme.titleMedium?.apply(
                            color: tDarkColor.withOpacity(0.4),
                          ),
                    ),
                    Text(
                      arrivalTime,
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: tDarkColor,
                          ),
                    ),
                  ],
                )),
          ],
        ),
      );

  Widget dateAndTimeDetails(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(15, 18, 0, 10),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Date",
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          color: tDarkColor.withOpacity(0.4),
                        ),
                  ),
                  Flexible(
                    child: Text(
                      searchDate,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: tDarkColor,
                          ),
                    ),
                  ),
                  //SizedBox(height: 5.0,),
                ],
              ),
            ),
            Container(
              height: 35,
              width: 120,
              decoration: const BoxDecoration(
                  color: tAccentColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  )),
              child: Text(
                formatCurrency.format(897),
                style: Theme.of(context).textTheme.displayMedium?.apply(
                      color: tWhiteColor,
                    ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      );
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint

    Paint paint = Paint();
    double h = size.height;
    double w = size.width;

    paint.color = Colors.black54;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var startPoint = Offset(0, h);
    var controlPoint = Offset(w / 4, h / 4);
    var controlPoint2 = Offset(3 * w / 4, h / 4);
    var endPoint = Offset(w, h);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.cubicTo(controlPoint.dx, controlPoint.dy, controlPoint2.dx,
        controlPoint2.dy, endPoint.dx, endPoint.dy);

    var curePath = dashPath(path,
        dashArray: CircularIntervalList([5, 5])); //Need path drawing package

    canvas.drawPath(curePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
