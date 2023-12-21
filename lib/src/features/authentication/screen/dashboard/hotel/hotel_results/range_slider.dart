import 'package:Go1Tok/src/constants/colors.dart';
import 'package:Go1Tok/src/constants/text_strings.dart';
import 'package:Go1Tok/src/features/authentication/controllers/filters_controller.dart';
import 'package:Go1Tok/src/features/authentication/controllers/hotel_result_controller.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/file_item_holder.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/location_item_holder.dart';
import 'package:Go1Tok/src/features/authentication/screen/dashboard/hotel/hotel_results/rating_item_holder.dart';
import 'package:cupertino_range_slider_improved/cupertino_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class RangeSliderRange extends StatefulWidget {
  final String title;
  final double initialMinValue;
  final double initialMaxValue;
  final ValueChanged<double> onMinValueChanged;
  final ValueChanged<double> onMaxValueChanged;
  final Icon? iconData;

  const RangeSliderRange(
      {Key? key,
        required this.title,
        required this.initialMinValue,
        required this.initialMaxValue,
        required this.onMinValueChanged,
        required this.onMaxValueChanged,
         required this.iconData})
      : super(key: key);

  @override
  _RangeSliderRangeState createState() => _RangeSliderRangeState();
}

class _RangeSliderRangeState extends State<RangeSliderRange> {
  late double minValue;
  late double maxValue;

  @override
  void initState() {
    super.initState();
    minValue = widget.initialMinValue;
    maxValue = widget.initialMaxValue;
  }


  final filtersController = Get.put(FiltersController());
  @override
  Widget build(BuildContext context) {
    return widget.iconData == null ? RatingItemHolder(
      title: widget.title,
      value: filtersController.ratingValue.value.toString().replaceAll(".", ","),
      child:  Slider(
        value: filtersController.ratingValue.value,
        min: filtersController.minSliderValueRating.value,
        max: filtersController.maxSliderValueRating.value,
        //divisions: 10,



        onChangeStart: (double value) {
          print('Start value is ' + value.toString());
          //filtersController.ratingValue.value = value;
        },
        onChangeEnd: (double value) {
          print('Finish value is ' + value.toString());
          //filtersController.ratingValue.value = value;
        },
        onChanged: (double newValue) {
          setState(() {
            ///toExactPrecision is defined below as an extension
            filtersController.ratingValue.value = newValue.toExactPrecision(1);

          });
          filtersController.changeRatingValue(tLocation,newValue.toExactPrecision(1));
        },
        activeColor: chromeGrey,
        inactiveColor: tPrimaryColor,
      ),
    ) : LocationItemHolder(
      title: widget.title,
      value: filtersController.locationValue.value.toString().replaceAll(".", ","),
      //icons: widget.iconData,
      child:  Slider(
        value: filtersController.locationValue.value,
        min: filtersController.minLocationSliderValue.value,
        max: filtersController.maxLocationSliderValue.value,
        //divisions: 10,



        onChangeStart: (double value) {
          print('Start value is ' + value.toString());
          //filtersController.ratingValue.value = value;
        },
        onChangeEnd: (double value) {
          print('Finish value is ' + value.toString());
          //filtersController.ratingValue.value = value;
        },
        onChanged: (double newValue) {
          setState(() {
            ///toExactPrecision is defined below as an extension
            filtersController.locationValue.value = newValue.toExactPrecision(1);

          });

          filtersController.changeRatingValue("",newValue.toExactPrecision(1));
        },
        activeColor: chromeGrey,
        inactiveColor: tPrimaryColor,
      ),
    );
  }


}

extension Ex on double {
  double toExactPrecision(int n) => double.parse(toStringAsFixed(n));
}